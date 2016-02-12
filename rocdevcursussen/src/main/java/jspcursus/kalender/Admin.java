package jspcursus.kalender;

import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.google.appengine.api.datastore.EntityNotFoundException;

public class Admin {
	private final String EMAIL_OWNER = "pdevries@roc-dev.com";
	private final String NAME_OWNER = "Piet de Vries";
	DataBaseIO io;
	
	public Admin() {
		io = new DataBaseIO();
		
	}
	
	public Kamer getKamer(String sleutel) {
		Kamer kamer = null;
		try {
			kamer = io.getKamer(sleutel);
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kamer;
	}
	
	public ArrayList<Datum> getGereserveerdeData(Kamer kamer) {
		return io.getReserveringenVanKamer(kamer);
	}
	
	public ArrayList<Datum> getGereserveerdeData(Kamer kamer, int maand, int jaar) {
		return io.getReserveringenVanKamer(kamer, maand, jaar);
	}
	
	public boolean checkBeschikbaar(Kamer kamer, Datum datum) {
		boolean beschikbaar = true;
		ArrayList<Datum> reserveringen = this.getGereserveerdeData(kamer, 
				datum.getMaand(), 
				datum.getJaar());
		for (Datum d: reserveringen) {
			if (d.getDag() == datum.getDag() && 
					d.getMaand() == datum.getMaand() && 
					d.getJaar() == datum.getJaar()) {
				beschikbaar = false;
			}
		}
		return beschikbaar;
	}
	
	public ArrayList<String> getKamerNamenLijst() {
		ArrayList<Kamer> kamerLijst = io.getKamerLijst();
		ArrayList<String> namenlijst = new ArrayList<String>();
		for (Kamer kamer: kamerLijst) {
			namenlijst.add(kamer.getNaam());
		}
		return namenlijst;
	}
	
	public void voegKamerToe(Kamer kamer) {
		io.voegKamerToe(kamer);
	}
	
	public String maakReservering(Reservering reservering) {
		Kamer kamer = reservering.getKamer();
		Datum datum = reservering.getDatum();
		String emailUser = reservering.getEmailUser();
		String reserveringsBoodschap;
		boolean beschikbaar = this.checkBeschikbaar(kamer, datum);
		if (beschikbaar) {
			io.bewaarReservering(reservering);
			reserveringsBoodschap = "Reservering &quot;" + kamer.getNaam()
					+ "&quot; voor datum: " + datum.getDatumNLFormat()
					+ " is geslaagd. Er is een email naar " + emailUser + " gestuurd. "
					+ " De kans is vrij groot dat de mail in je spam box is beland.";
		} else {
			reserveringsBoodschap = "Helaas is " + kamer.getNaam() + " niet beschikbaar op "
					+ datum.getDatumNLFormat()
					+ ". Probeer een andere kamer. Er is een email naar " + emailUser + " gestuurd. "
							+ "De kans is vrij groot dat de mail in je spam box is beland.";
		}
		if (!emailUser.equals(this.EMAIL_OWNER)) {
			this.stuurEmail(reservering, beschikbaar);
		}
		return reserveringsBoodschap;
	}
	
	private void stuurEmail(Reservering reservering, boolean beschikbaar) {
		Kamer kamer = reservering.getKamer();
		Datum datum = reservering.getDatum();
		String emailUser = reservering.getEmailUser();
		String msgBody = "Reservering " + kamer.getNaam() + ".\r\n";
		if(beschikbaar) {
			msgBody += emailUser
					+ " heeft de volgende reservering gemaakt:\r\n";
			msgBody += "- " + kamer.getNaam() + "\r\n";
			msgBody += "- " + datum.getDatumNLFormat() + "\r\n";
			msgBody += "Reservering is gelukt!";

			try {
				Message msg = new MimeMessage(Session.getDefaultInstance(new Properties(), null));
				msg.setFrom(new InternetAddress(this.EMAIL_OWNER,
						NAME_OWNER));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						this.EMAIL_OWNER, NAME_OWNER));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						emailUser));
				
				msg.setSubject("Reservering: " + kamer.getNaam() + " d.d. "
						+ datum.getDatumNLFormat());
				msg.setText(msgBody);
				Transport.send(msg);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			msgBody += emailUser
					+ " heeft geprobeerd de volgende reservering te maken:\r\n";
			msgBody += "- " + kamer.getNaam() + "\r\n";
			msgBody += "- " + datum.getDatumNLFormat() + "\r\n";
			msgBody += "Reservering is mislukt. Reden: kamer is bezet.\r\n";
			try {
				Message msg = new MimeMessage(Session.getDefaultInstance(new Properties(), null));
				msg.setFrom(new InternetAddress(this.EMAIL_OWNER,
						NAME_OWNER));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						this.EMAIL_OWNER, NAME_OWNER));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						emailUser));
				msg.setSubject("Reservering: " + kamer.getNaam() + " d.d. "
						+ datum.getDatumNLFormat());
				msg.setText(msgBody);
				Transport.send(msg);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}


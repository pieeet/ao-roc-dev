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
	
	public String maakReservering(Reservering reservering, boolean beschikbaar) {
		Kamer kamer = reservering.getKamer();
		Datum datum = reservering.getDatum();
		String emailUser = reservering.getEmailUser();
		String reserveringsBoodschap;
		if (beschikbaar) {
			io.bewaarReservering(reservering);
			reserveringsBoodschap = "Reservering &quot;" + kamer.getNaam()
					+ "&quot; voor datum: " + datum.getDatumNLFormat()
					+ " is geslaagd.";

			if (!reservering.getEmailUser().equals("pdevries@roc-dev.com")) {
				String msgBody = "Dit is een automatisch gegenereerde testboodschap.\r\n";
				msgBody += emailUser
						+ " heeft de volgende reservering gemaakt:\r\n";
				msgBody += "- " + kamer.getNaam() + "\r\n";
				msgBody += "- " + datum.getDatumNLFormat() + "\r\n";
				msgBody += "Reservering is gelukt!";

				try {
					Message msg = new MimeMessage(Session.getDefaultInstance(new Properties(), null));
					msg.setFrom(new InternetAddress("pdevries@roc-dev.com",
							"Admin roc-dev"));
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
							"pdevries@roc-dev.com", "Mr. User"));
					msg.setSubject("Reservering: " + kamer.getNaam() + " d.d. "
							+ datum.getDatumNLFormat());
					msg.setText(msgBody);
					Transport.send(msg);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else {
			reserveringsBoodschap = "Helaas is " + kamer.getNaam() + " niet beschikbaar op "
					+ datum.getDatumNLFormat()
					+ ". Probeer een andere kamer.";

			if (!emailUser.equals("pdevries@roc-dev.com")) {
				String msgBody = "Dit is een automatisch gegenereerde testboodschap.\r\n";
				msgBody += emailUser
						+ " heeft geprobeerd de volgende reservering te maken:\r\n";
				msgBody += "- " + kamer.getNaam() + "\r\n";
				msgBody += "- " + datum.getDatumNLFormat() + "\r\n";
				msgBody += "Reservering is mislukt. Reden: kamer is bezet.";
				try {
					Message msg = new MimeMessage(Session.getDefaultInstance(new Properties(), null));
					msg.setFrom(new InternetAddress("pdevries@roc-dev.com",
							"Admin roc-dev"));
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
							"pdevries@roc-dev.com", "Mr. User"));
					msg.setSubject("Reservering: " + kamer.getNaam() + " d.d. "
							+ datum.getDatumNLFormat());
					msg.setText(msgBody);
					Transport.send(msg);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return reserveringsBoodschap;
		
	}
}


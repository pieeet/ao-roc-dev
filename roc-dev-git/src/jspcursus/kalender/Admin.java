package jspcursus.kalender;

import java.util.ArrayList;


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
	
	
	public void maakReservering(Reservering reservering) {
		io.bewaarReservering(reservering);
		
	}
	
	
	//maak html tabel
	public String kalNaarHtml(Kalender kal, Kamer kamer) {
		int aantalDagenDezeMaand = kal.getAantalDagenMaand();
		int aantalDagenVorigeMaand = kal.getLaatsteDagVorigeMaand();
		int hoeveelheidRestVorigeMaand = kal.getAantalRestVorigeMaand();
		int startDatumVorigeMaand = kal.getStartVorigeMaand();
		ArrayList<Datum> resLijst = this.getGereserveerdeData(kamer, 
				kal.getMaand(), kal.getJaar());
		String html = "<table class=\"kalender\">";
		html += "<tr>";
		html += "<th>ma</th><th>di</th><th>wo</th><th>do</th><th>vr</th><th>za</th><th>zo</th>";
		html += "</tr>";
		int aantalRijen = 5;
		if (aantalDagenDezeMaand + hoeveelheidRestVorigeMaand > 35) {
			aantalRijen = 6;
		} else if (aantalDagenDezeMaand + hoeveelheidRestVorigeMaand == 28) {
			aantalRijen = 4;
		}
		int datumDezeMaand = 1;
		int datumVorigeMaand = startDatumVorigeMaand;
		int datumVolgendeMaand = 1;
		for (int rij = 0; rij < aantalRijen; rij++) {
			int kolomteller = 1;
			html += "<tr>";
			for (int cel = 0; cel < 7; cel++) {
				while  ( datumVorigeMaand <= aantalDagenVorigeMaand) {
					html += "<td class=\"rest\">" + datumVorigeMaand + "</td>";
					datumVorigeMaand++;
					kolomteller++;
				}
				while (kolomteller <= 7 && datumDezeMaand <= aantalDagenDezeMaand ) {
					boolean bezet = false;
					for (Datum d: resLijst) {
						if (d.getDag() == datumDezeMaand) {
							bezet = true;
						} 
					}
					if (bezet) {
						html += "<td class=\"data_bezet\">" + datumDezeMaand + "</td>";
					} else {
						html += "<td class=\"vrij\">" + datumDezeMaand + "</td>";
					}
					datumDezeMaand++;
					kolomteller++;
				}
				while (kolomteller <= 7) {
					html += "<td class=\"rest\">" + datumVolgendeMaand + "</td>";
					datumVolgendeMaand++;
					kolomteller++;
				}
			} 
			html += "</tr>";
			
		}
		html += "</table>";
		return html;
	}
	
	
	
}


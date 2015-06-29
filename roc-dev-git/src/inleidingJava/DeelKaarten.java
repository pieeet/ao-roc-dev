package inleidingJava;

import java.util.Random;

public class DeelKaarten {
	private String[] kleuren = {"Ruiten", "Klaver", "Harten", "Schoppen"};
	private String[] kaarten = {"twee", "drie", "vier", "vijf", "zes", "zeven", 
			"acht", "negen", "tien", "boer", "vrouw", "heer", "aas"};
	private String[] deck = new String[52];
	private String[] speler1 = new String[13];
	private String[] speler2 = new String[13];
	private String[] speler3 = new String[13];
	private String[] speler4 = new String[13];
	
	
	public DeelKaarten() {
		int index = 0;
		//vul deck met kaarten
		for (int i = 0; i < kleuren.length; i++) {
			String kleur = kleuren[i];
			for (int j = 0; j < kaarten.length; j++) {
				String kaart = kaarten[j];
				deck[index] = kleur + " " + kaart;
				index++;
			}
		}
		for (int i = 0; i < 13; i++ ) {
			speler1[i] = deelKaart();
			speler2[i] = deelKaart();
			speler3[i] = deelKaart();
			speler4[i] = deelKaart();
		}
	}

	private String deelKaart() {
		int random = new Random().nextInt(deck.length);
		String kaart = deck[random];
		String[] hulpLijst = new String[deck.length - 1];
		int hulpindex = 0;
		for (int i = 0; i < deck.length; i++) {
			if (i != random) {
				hulpLijst[hulpindex] = deck[i];
				hulpindex++;
			}
		}
		deck = hulpLijst;
		return kaart;
	}
	
	public String maakTabel() {
		
		String tabel = "<table id=\"kaart_tabel\">" +
				"<tr><th>Speler 1</th><th>Speler 2</th><th>Speler 3</th><th>Speler 4</th></tr>";
		for (int i = 0; i < 13; i++) {
			tabel += "<tr>";
			tabel += "<td>" + speler1[i] + "</td>";
			tabel += "<td>" + speler2[i] + "</td>";
			tabel += "<td>" + speler3[i] + "</td>";
			tabel += "<td>" + speler4[i] + "</td>";
			tabel += "</tr>";
		}
		tabel += "</table>";
		return tabel;
	}
}




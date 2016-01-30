package jspcursus.kalender.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspcursus.kalender.Admin;
import jspcursus.kalender.Datum;
import jspcursus.kalender.Kalender;
import jspcursus.kalender.Kamer;
import jspcursus.kalender.Reservering;

@SuppressWarnings("serial")
public class KalenderTabelServlet extends HttpServlet {
	private Admin admin;
	private Kamer kamer;
	private Datum kalenderMaand, reserveringsDatum;
	private String emailUser, reserveringsBoodschap;
	private Kalender kalender;
	private boolean isBeschikbaar;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		admin = new Admin();
		String sleutel = req.getParameter("sleutel");
		kamer = admin.getKamer(sleutel);
		kalenderMaand = new Datum();
		int jaar;
		int maand;

		if (req.getParameter("maand") != null
				&& !req.getParameter("maand").equals("")) {
			jaar = Integer.parseInt(req.getParameter("jaar"));
			maand = Integer.parseInt(req.getParameter("maand"));
			kalenderMaand = new Datum(jaar, maand);
		} else {
			jaar = kalenderMaand.getJaar();
			maand = kalenderMaand.getMaand();
		}

		// Gebruiker gaat maand terug
		if (req.getParameter("vorige") != null) {
			maand -= 1;
			if (maand < 0) {
				maand += 12;
				jaar -= 1;
			}
			kalenderMaand = new Datum(jaar, maand);
		}

		// Gebruiker gaat maand vooruit
		else if (req.getParameter("volgende") != null) {
			maand += 1;
			if (maand > 11) {
				maand -= 12;
				jaar += 1;
			}
			kalenderMaand = new Datum(jaar, maand);

			// Handle reservering
		} else if (req.getParameter("reservering_knop") != null) {
			
			reserveringsDatum = new Datum(req.getParameter("datum"));
			isBeschikbaar = admin.checkBeschikbaar(kamer, reserveringsDatum);
			emailUser = req.getUserPrincipal().toString();
			Reservering reservering = new Reservering(kamer, reserveringsDatum,
					emailUser);
			reserveringsBoodschap = admin.maakReservering(reservering);
		}
		kalender = new Kalender(kalenderMaand);
		PrintWriter out = resp.getWriter();
		// de maandkiezer div
		out.println(this.maakMaandKiezerHTML());
		// de kalender div
		out.println(this.maakKalenderHTML());
		// reserveer datum div
		out.println(this.maakReserveringDatumHTML());
		// boodschap reservering
		if (reserveringsBoodschap != null) {
			out.println(this
					.maakReserveringsBoodschapHTML(reserveringsBoodschap));
		}
		out.close();
	}

	private String maakMaandKiezerHTML() {
		String div = "<div id=\"kalender_maandkiezer\">";
		div += "<h3>" + kamer.getNaam() + "</h3>";
		div += "<button type=\"button\" id=\"vorige\" value=\"&lt;\">&lt;</button>";
		div += "<label id=\"maandkiezer_maand\">" + kalenderMaand.getMaandString() + " ";
		div += kalenderMaand.getJaar() +"</label>";
		div += "<button type=\"button\" id=\"volgende\" value=\"&gt;\">&gt;</button>";
		div += "<input type=\"hidden\" id=\"maand_verborgen\" value=\""
				+ kalenderMaand.getMaand() + "\">";
		div += "<input type=\"hidden\" id=\"jaar_verborgen\" value=\""
				+ kalenderMaand.getJaar() + "\">";
		div += "<input type=\"hidden\" id=\"kamer_verborgen\" value=\""
				+ kamer.getNaam() + "\">";
		div += "</div>";

		return div;
	}

	private String maakKalenderHTML() {
		String div = "";
		div += "<div id=\"kalender_tabel\">";
		div += this.maakKalenderTabel(kalender, kamer);
		div += "</div>";

		return div;
	}

	private String maakReserveringDatumHTML() {
		String div = "";
		div += "<div id=\"kalender_reserveer_datum\">\n";
		div += "<h3>Reserveren</h3>\n";

		div += "<div class=\"formulier\">\n";

		div += "<div class=\"formulier_regel\">\n";
		div += "<label "
				+ "class=\"formulier_label\">Voer een datum in</label>\n "
				+ "<input class=\"formulier_input\" " + "type=\"date\" "
				+ "id=\"reservering_datum\" " + "value=\""
				+ kalenderMaand.getDatumStandaardFormat() + "\">\n</div>\n "
				+ "<div class=\"formulier_regel\">\n "
				+ "<button  type=\"button\" " + "id=\"reservering_knop\" "
				+ "class=\"formulier_input\" "
				+ "value=\"reserveer datum\">reserveer datum</button>\n";
		div += "</div></div></div>";

		return div;
	}

	private String maakReserveringsBoodschapHTML(String reserveringsBoodschap) {
		String div = "";
		if (reserveringsBoodschap != null) {
			if (!isBeschikbaar) {
				div += "<div class=\"bs-callout bs-callout-danger\">";
				div += "<h4 class=\"danger\">Reservering mislukt</h4>";
			} else {
				div += "<div class=\"bs-callout bs-callout-succes\">";
				div += "<h4 class=\"succes\">Reservering geslaagd</h4>";
			}
			div += "<p>" + reserveringsBoodschap + "</p></div>";
		}
		return div;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}

	// maak html tabel
	private String maakKalenderTabel(Kalender kal, Kamer kamer) {
		int aantalDagenDezeMaand = kal.getAantalDagenMaand();
		int aantalDagenVorigeMaand = kal.getLaatsteDagVorigeMaand();
		int hoeveelheidRestVorigeMaand = kal.getAantalRestVorigeMaand();
		int startDatumVorigeMaand = kal.getStartVorigeMaand();
		ArrayList<Datum> resLijst = admin.getGereserveerdeData(kamer,
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
				while (datumVorigeMaand <= aantalDagenVorigeMaand) {
					html += "<td class=\"rest\">" + datumVorigeMaand + "</td>";
					datumVorigeMaand++;
					kolomteller++;
				}
				while (kolomteller <= 7
						&& datumDezeMaand <= aantalDagenDezeMaand) {
					boolean bezet = false;
					for (Datum d : resLijst) {
						if (d.getDag() == datumDezeMaand) {
							bezet = true;
						}
					}
					if (bezet) {
						html += "<td class=\"data_bezet\">" + datumDezeMaand
								+ "</td>";
					} else {
						html += "<td class=\"vrij\">" + datumDezeMaand
								+ "</td>";
					}
					datumDezeMaand++;
					kolomteller++;
				}
				while (kolomteller <= 7) {
					html += "<td class=\"rest\">" + datumVolgendeMaand
							+ "</td>";
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

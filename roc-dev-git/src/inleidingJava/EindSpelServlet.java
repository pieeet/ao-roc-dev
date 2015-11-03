package inleidingJava;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class EindSpelServlet extends HttpServlet {
	String boodschap = "";
	int aantalLucifers = 0;
	String eindeSpelImage = "";
	boolean gewonnen = false;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		if (req.getParameter("nieuw_spel") != null) {
			eindeSpelImage = "";
			aantalLucifers = 23;
			boodschap = "<p>Aantal lucifers: " + aantalLucifers + ". Jouw beurt.</p>";
			gewonnen = false;
			this.printHtml(resp);	
		} else {
			aantalLucifers = Integer.parseInt(req.getParameter("aantal_lucifers"));
			try {
				int aantalVerminderen = Integer.parseInt(req.getParameter("aantal_verminderen"));
				if (aantalVerminderen < 1 || aantalVerminderen > 3) {
					boodschap = "<p class=\"spel_foutmelding\">Onjuiste invoer</p>";
					this.printHtml(resp);
				} else {
					aantalLucifers -= aantalVerminderen;
					//mens heeft gewonnen
					if (aantalLucifers == 1) {
						boodschap = "<p>Hmmm... je hebt gewonnen</p>";
						aantalLucifers = 0;
						eindeSpelImage = "<img src=\"sad_face.png\" id=\"einde_spel\">";
						this.printHtml(resp);
					//computer heeft gewonnen	
					} else if (aantalLucifers <= 0) {
						boodschap = "<p>Ha!!! Je hebt verloren.</p>";
						eindeSpelImage = "<img src=\"evil-smiley-face.png\" id=\"einde_spel\">";
						this.printHtml(resp);
					// computer	aan zet
					} else {
						int beurtComputer;
						int modulo = aantalLucifers % 4;
						if (modulo == 0) {
							beurtComputer = 3;
							gewonnen = true;
						} else if (modulo == 1) {
							beurtComputer = new Random().nextInt(3) + 1;
							gewonnen = false;
						} else if (modulo == 2) {
							beurtComputer = 1;
							gewonnen = true;
						} else {
							beurtComputer = 2;
							gewonnen = true;
						}
						aantalLucifers -= beurtComputer;
						boodschap = "<p>De computer heeft " + beurtComputer + " plaatjes weggehaald. "
								+ "Aantal plaatjes: " + aantalLucifers + ". Jouw beurt</p>";
						this.printHtml(resp);
					}
				}
			} catch (NumberFormatException e) {
				boodschap = "<p class=\"spel_foutmelding\">Voer een geheel getal in</p>";
				this.printHtml(resp);
			}
		}
	}

	private void printHtml(HttpServletResponse resp) {
		PrintWriter out = null;
		try {
			out = resp.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (eindeSpelImage.equals("")) {
			out.println("<label>Hoeveel potloden neem je (&eacute;&eacute;n, twee of drie)?</label>");
			out.println("<input type=\"number\" id=\"invoer_spel\">");
			out.println("<button type=\"button\" id=\"speel_knop\">Speel</button>");
			out.println(boodschap);
			out.println("<input type=\"hidden\" id=\"aantal_lucifers\" value=\"" + aantalLucifers + "\">");
			out.println("<div id=\"inl_java_spel_plaatjes\">");
			for (int i = 0; i < aantalLucifers; i++) {
				if (gewonnen) {
					out.println("<img src=\"surely_winning_40px.png\" class=\"lucifer\">");
				} else {
					out.println("<img src=\"basic1-119_smiley_neutral-512_40px.png\" class=\"lucifer\">");
				}
			}
			out.println("</div>");
		} else {
			out.println(boodschap);
			out.println(eindeSpelImage);
			out.println("<button type=\"button\" id=\"nieuw_spel_knop\">Nieuw spel</button>");
		}
		out.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}

package jspcursus.kalender.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
	Admin admin;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		admin = new Admin();
		if (req.getParameter("kiesKamerKnop") != null || 
				req.getParameter("vorige") != null || 
				req.getParameter("volgende") != null || 
				req.getParameter("reservering_knop") != null) {
			
			
			String sleutel = req.getParameter("sleutel");
			Kamer kamer = admin.getKamer(sleutel);
			Datum datum = null;
			String boodschap = null;
			boolean beschikbaar = true;
			
			
			if (req.getParameter("kiesKamerKnop") != null)  {
				//blijf op de geselecteerde maand
				if (req.getParameter("maand") != null  && !req.getParameter("maand").equals("")) {
					int jaar = Integer.parseInt(req.getParameter("jaar"));
					int maand = Integer.parseInt(req.getParameter("maand"));
					datum = new Datum(jaar, maand);
					
				} else {
					//ga naar deze maand
					datum = new Datum();
				}
			}
			
			//ga naar vorige maand
			else if (req.getParameter("vorige") != null) {
				int maand = Integer.parseInt(req.getParameter("maand"));
				maand -= 1;
				int jaar = Integer.parseInt(req.getParameter("jaar"));
				if (maand < 0) {
					maand += 12;
					jaar -= 1;
				}
				
				datum = new Datum(jaar, maand);
				
			}
			
			//ga naar volgende maand
			else if (req.getParameter("volgende") != null) {
				
				int maand = Integer.parseInt(req.getParameter("maand"));
				maand += 1;
				int jaar = Integer.parseInt(req.getParameter("jaar"));
				if (maand > 11) {
					maand -= 12;
					jaar += 1;
				}
				//volgende maand
				datum = new Datum(jaar, maand);
				
			} else if (req.getParameter("reservering_knop") != null ) {
				
				Principal user = req.getUserPrincipal();
				String emailUser = user.toString();
				Properties props = new Properties();
				Session session = Session.getDefaultInstance(props, null);
				Datum resDatum = new Datum(req.getParameter("datum"));
				beschikbaar = admin.checkBeschikbaar(kamer, resDatum);
				if (!beschikbaar) {
					boodschap = "Helaas is " + kamer.getNaam() + " niet beschikbaar op " + 
							resDatum.getDatumNLFormat() + ". Probeer een andere kamer.";
					
					if (!emailUser.equals("pdevries@roc-dev.com")) {
						String msgBody = "Dit is een automatisch gegenereerde testboodschap.\r\n";
				        msgBody += user.getName() + " heeft geprobeerd de volgende reservering te maken:\r\n";
				        msgBody += "- " + kamer.getNaam() + "\r\n";
				        msgBody += "- " + resDatum.getDatumNLFormat() + "\r\n";
				        msgBody += "Reservering is mislukt. Reden: kamer is bezet.";
				        try {
				            Message msg = new MimeMessage(session);
				            msg.setFrom(new InternetAddress("pdevries@roc-dev.com", "Admin roc-dev"));
				            msg.addRecipient(Message.RecipientType.TO,
				                             new InternetAddress("pdevries@roc-dev.com", "Mr. User"));
				            msg.setSubject("Reservering: " + kamer.getNaam() + " d.d. " + resDatum.getDatumNLFormat());
				            msg.setText(msgBody);
				            Transport.send(msg);

				        } catch (AddressException e) {
				            // ...
				        } catch (MessagingException e) {
				            // ...
				        }
					}
					
				} else {
					Reservering reservering = new Reservering(kamer, resDatum);
					admin.maakReservering(reservering);
					boodschap = "Reservering &quot;" + kamer.getNaam() + 
							"&quot; voor datum: " + 
							resDatum.getDatumNLFormat() + " is geslaagd.";
					
					if (!emailUser.equals("pdevries@roc-dev.com")) {
						String msgBody = "Dit is een automatisch gegenereerde testboodschap.\r\n";
				        msgBody += user.getName() + " heeft de volgende reservering gemaakt:\r\n";
				        msgBody += "- " + kamer.getNaam() + "\r\n";
				        msgBody += "- " + resDatum.getDatumNLFormat() + "\r\n";
				        msgBody += "Reservering is gelukt!";

				        try {
				            Message msg = new MimeMessage(session);
				            msg.setFrom(new InternetAddress("pdevries@roc-dev.com", "Admin roc-dev"));
				            msg.addRecipient(Message.RecipientType.TO,
				                             new InternetAddress("pdevries@roc-dev.com", "Mr. User"));
				            msg.setSubject("Reservering: " + kamer.getNaam() + " d.d. " + resDatum.getDatumNLFormat());
				            msg.setText(msgBody);
				            Transport.send(msg);

				        } catch (AddressException e) {
				            // ...
				        } catch (MessagingException e) {
				            // ...
				        }
					}
			        
				}
				
				//maand obv parameters
				int maand = Integer.parseInt(req.getParameter("maand"));
				int jaar = Integer.parseInt(req.getParameter("jaar"));
				datum = new Datum(jaar, maand);
				
			}
			Kalender kal = new Kalender(datum);
			String tabel = admin.kalNaarHtml(kal, kamer);
			PrintWriter out = resp.getWriter();
			
			//de maandkiezer div
			out.println("<div id=\"kalender_maandkiezer\">");
			out.println("<h3>" + kamer.getNaam() + "</h3>");
			out.println("<button type=\"button\" id=\"vorige\" value=\"&lt;\">&lt;</button>");
			out.println("<label>" + datum.getMaandString() + "</label>");
			out.println("<label>" + datum.getJaar() + "</label>");
			out.println("<button type=\"button\" id=\"volgende\" value=\"&gt;\">&gt;</button>");
			out.println("<input type=\"hidden\" id=\"maand_verborgen\" value=\"" + datum.getMaand() + "\">");
			out.println("<input type=\"hidden\" id=\"jaar_verborgen\" value=\"" + datum.getJaar() + "\">");
			out.println("<input type=\"hidden\" id=\"kamer_verborgen\" value=\"" + kamer.getNaam() + "\">");
			out.println("</div>");
			
			//de kalender div
			out.println("<div id=\"kalender_tabel\">");
			out.println(tabel);
			out.println("</div>");
			
			//reserveer datum div
			out.println("<div id=\"kalender_reserveer_datum\">");
			out.println("<h3>Reserveren</h3>");
			
			out.println("<div class=\"formulier\">");
			
			out.println("<div class=\"formulier_regel\">");
				out.println("<label "
						+ "class=\"formulier_label\">Voer een datum in</label>");
				out.println("<input "
						+ "class=\"formulier_input\" "
						+ "type=\"date\" "
						+ "id=\"reservering_datum\" "
						+ "value=\"" + datum.getDatumStandaardFormat() +"\">");
					
			out.println("</div>");
			
			out.println("<div class=\"formulier_regel\">");
				out.println("<button "
						+ "type=\"button\" "
						+ "id=\"reservering_knop\" "
						+ "class=\"formulier_input\" "
						+ "value=\"reserveer datum\">reserveer datum</button>");
			out.println("</div>");
			
			out.println("</div>"); //.formulier
				
			
		
			
			
			
			
//			out.println("<table>");
//			out.println("<tr>");
//			out.println("<td>Voer een datum in</td>");
//			out.println("<td><input type=\"date\" id=\"reservering_datum\" value=\"" + 
//					datum.getDatumStandaardFormat() +"\" autofocus></td>" );
//			out.println("<td><button type=\"button\" id=\"reservering_knop\" value=\"reserveer "
//					+ "datum\">reserveer datum</button></tr></table>");
//			out.println("</div>");
			out.println("</div>");
			
			//boodschap reservering
			if (boodschap != null) {
				if (!beschikbaar) {
					out.println("<div class=\"bs-callout bs-callout-danger\">");
					out.println("<h4 class=\"danger\">Reservering mislukt</h4>");
				} else {
					out.println("<div class=\"bs-callout bs-callout-succes\">");
					out.println("<h4 class=\"succes\">Reservering geslaagd</h4>");
				}
				out.println("<p>" + boodschap + "</p></div>");
			}
			
			out.close();

		}
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
	
	

}

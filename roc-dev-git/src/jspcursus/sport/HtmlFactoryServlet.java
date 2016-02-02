package jspcursus.sport;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.images.Image;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;

import jspcursus.sport.vereniging.Administratie;
import jspcursus.sport.vereniging.Lid;
import jspcursus.sport.vereniging.Team;

@SuppressWarnings("serial")
public class HtmlFactoryServlet extends HttpServlet {
	PrintWriter out;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		out = resp.getWriter();
		if (req.getParameter("nieuw_lid_scherm") != null) {
			this.openNieuwLidScherm();
		}
		else if (req.getParameter("leden_overzicht") != null) {
			this.maakLedenOverzicht(req);
		}
		else if (req.getParameter("haal_speler_gegevens") != null) {
			Administratie admin = new Administratie();
			Lid lid = admin.getLid(req.getParameter("spelerscode"));
			this.openBestaandLidScherm(lid);
		}
		else if (req.getParameter("nieuw_team_scherm") != null) {
			this.openNieuwTeamScherm();
		}
		else if (req.getParameter("teams_overzicht") != null) {
			this.maakTeamsOverzicht(req);
		}
		else if (req.getParameter("haal_team_gegevens") != null) {
			Administratie admin = new Administratie();
			Team team = admin.getTeam(req.getParameter("teamcode"));
			this.openBestaandTeamScherm(team);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
	
	private void maakLedenOverzicht(HttpServletRequest req) {
		Administratie admin = new Administratie();
		ArrayList<Lid> leden = admin.getLedenlijst();
		out.println("<div "
				+ "class=\"voegtoeknop\">");
		out.println("<button "
				+ "type=\"button\" "
				+ "id=\"open_nieuw_lid\">Lid toevoegen</button></div>");	
		if (leden.isEmpty()) {
			out.println("<p>Er zijn nog geen leden ingevoerd</p>");
			out.close();
		} else {
			out.println("<div "
					+ "class=\"scrolltabel\">");
//			out.println("<div class=\"table_wrapper\">");
			out.println("<table "
					+ "id=\"ledentabel\">");
			
			for (Lid lid: leden) {
				String url = this.maakThumbServingUrl(lid.getBlobkey());
				out.println("<tr>");
				out.println("<td><img src=\"" + url +"\" class=\"thumb_lid\" width=\"32px\">");
				out.println("<td><b>" + lid.getNaamEsc() + "</b><br>");
				out.println(lid.getAdresEsc() + "<br>");
				out.println(lid.getPostcodeEsc() + " " + lid.getWoonplaatsEsc() + "</td>");
				out.println("<td><button type=\"button\" class=\"lid_data\" data-spelerscode=\"" + 
						lid.getSpelerscode() + "\">info/wijzig</button></td>\n");
				out.println("</tr>");
			}
			out.println("</table></div>");
			out.close();
		}
	}

	private void openNieuwLidScherm() {
		BlobstoreService blobstore = BlobstoreServiceFactory.getBlobstoreService();
		String url = blobstore.createUploadUrl("/AO/jsp/sport");
		out.println("<form"
				+ "  action=\"" + url + "\" id=\"nieuw_lid_form\" "
				+ "method=\"post\" "
				+ "enctype=\"multipart/form-data\">");
		
		out.println("<div class=\"formulier\">");
	      out.println("<div class=\"formulier_regel\">");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	  		  + "class=\"formulier_label\">roepnaam</label>");
	        out.println("<input "
		  		+ "type=\"text\" "
		  		+ "id=\"roepnaam\" "
		  		+ "class=\"formulier_input\" "
		  		+ "value=\"\">");
	      out.println("</div>");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	        		+ "class=\"formulier_label\">tussenvoegsels</label>");
	        out.println("<input "
	        		+ "type=\"text\" "
	        		+ "id=\"tussenvoegsels\" "
	        		+ "class=\"formulier_input\" "
	        		+ "value=\"\">");
	      out.println("</div>");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	  		+ "class=\"formulier_label\">achternaam</label>");
	        out.println("<input "
	  		+ "type=\"text\" "
	  		+ "id=\"achternaam\" "
	  		+ "class=\"formulier_input\" "
	  		+ "value=\"\">");
	      out.println("</div>");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	  		+ "class=\"formulier_label\">adres</label>");
	        out.println("<input "
	  		+ "type=\"text\" "
	  		+ "id=\"adres\" "
	  		+ "class=\"formulier_input\" "
	  		+ "value=\"\">");
	      out.println("</div>");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	  		+ "class=\"formulier_label\">postcode</label>");
	        out.println("<input "
	  		+ "type=\"text\" "
	  		+ "id=\"postcode\" "
	  		+ "class=\"formulier_input\" "
	  		+ "value=\"\">");
	      out.println("</div>");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	  		+ "class=\"formulier_label\">woonplaats</label>");
	        out.println("<input "
	  		+ "type=\"text\" "
	  		+ "id=\"woonplaats\" "
	  		+ "class=\"formulier_input\" "
	  		+ "value=\"\">");
	      out.println("</div>");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	  		+ "class=\"formulier_label\">telefoon</label>");
	        out.println("<input "
	  		+ "type=\"text\" "
	  		+ "id=\"telefoon\" "
	  		+ "class=\"formulier_input\" "
	  		+ "value=\"\">");
	      out.println("</div>");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	  		+ "class=\"formulier_label\">e-mail (verplicht)</label>");
	        out.println("<input "
	  		+ "type=\"text\" "
	  		+ "id=\"email\" "
	  		+ "class=\"formulier_input\" "
	  		+ "value=\"\">");
	      out.println("</div>");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	  		+ "class=\"formulier_label\">geboortedatum<br>(jjjj-mm-dd)</label>");
	        out.println("<input "
	  		+ "type=\"date\" "
	  		+ "id=\"gebDatum\" "
	  		+ "class=\"formulier_input\" "
	  		+ "value=\"\">");
	      out.println("</div>");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	  		+ "class=\"formulier_label\">geslacht</label>");
	        out.println("<select "
	  		+ "id=\"geslacht\" "
	  		+ "class=\"formulier_input formulier_input_marge\">");
      	out.println("<option "
      			+ "value=\"man\">man</option>");
          out.println("<option "
          		+ "value=\"vrouw\">vrouw</option>");
      	 
           out.println("</select>");
	       out.println("</div>");
	       out.println("<div class=\"formulier_regel\">");
	         out.println("<label "
	        		 + "class=\"formulier_label\">upload foto</label>");
	         out.println("<input "
		  		+ "type=\"file\" "
		  		+ "id=\"sport_foto_lid\" "
		  		+ "class=\"formulier_input\" "
		  		+ "name=\"sport_foto_lid\">");
	        out.println("</div>");
	      out.println("</div>"); //formulier div
	      out.println("<button "
	        		+ "type=\"button\" "
	        		+ "id=\"verzend_nieuw_lid\" "
	        		+ "name=\"verzend_nieuw_lid\">Voer gegevens in</button>");
	        out.println("<button "
	        		+ "type=\"button\" "
	        		+ "id=\"annuleer_nieuw_lid_button\">Annuleer</button></form>");

        out.close();
	}
	
	
	private void openBestaandLidScherm(Lid lid) {
		
		BlobstoreService blobstore = BlobstoreServiceFactory.getBlobstoreService();
		String url = blobstore.createUploadUrl("/AO/jsp/sport");
		
		//div tabel links
		out.println("<div id=\"sport_lid_info\" class=\"sport_info\">");
		  out.println("<h3>" + lid.getNaamEsc() + "</h3>");
		out.println("</div>");
		
		//div tabel  overzicht teams en foto
		out.println("<div "
				+ "id=\"sport_lid_teams\" "
				+ "class=\"sport_info\">");
		
		//foto van lid
		out.println("<img "
				+ "src=\"" + this.maakServingUrl(lid.getBlobkey()) + "\" "
				+ "class=\"sport_foto_lid\">");
		out.println("<h4>Teams</h4>");
		ArrayList<Team> teamsLid = new Administratie().getSpelerteams(lid);
		if (teamsLid != null) {
			if (teamsLid.isEmpty()) {
				out.println("<p>" + lid.getNaamEsc() + " zit in geen enkel team</p>");
			} else {
				out.println("<ul>");
				for (Team team: teamsLid) {
					out.println("<li><a "
							+ "href=\"\" "
							+ "class=\"speler_team_shortcut\" "
							+ "data-teamcode=\"" + team.getTeamcodeEsc() + "\">" + 
							team.getOmschrijvingEsc() + "</a></li>");
				}
				out.println("</ul>");
			}
		}
		
		out.println("</div>");
		  
		out.println("<div id=\"sport_lid_info\" class=\"sport_info\">");
		out.println("<h4>Gegevens lid</h4>");
		  out.println("<form  "
				+ "action=\"" + url + "\" "
						+ "id=\"nieuw_lid_form\" "
						+ "method=\"post\" "
						+ "enctype=\"multipart/form-data\">");
		  out.println("<div id=\"lid_scherm\">");
		    out.println("<button "
				+ "type=\"button\" "
				+ "id=\"wijzig_lid\" "
				+ "data-spelerscode=\"" +lid.getSpelerscode() + "\" "
				+ "value=\"Wijzig\">Wijzig</button>");
		    out.println("<button "
				+ "type=\"button\" "
				+ "id=\"verwijder_lid\" "
				+ "data-spelerscode=\"" +lid.getSpelerscode() + "\" "
				+ "value=\"Verwijder\">Verwijder</button>");
		    out.println("<button "
				+ "type=\"button\" "
				+ "id=\"annuleer_nieuw_lid_button\" "
				+ "value=\"Terug\">Terug</button>");
			
		    out.println("<div class=\"formulier\">");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label "
		        	
		        	+ "class=\"formulier_label\">spelerscode</label>");
		        out.println("<label "
		        	+ "class=\"formulier_input\" "
		        	+ "id=\"spelerscode\">" + lid.getSpelerscodeEsc() + "</label>");
		      out.println("</div>");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label class=\"formulier_label\">spelersnr.</label>");
		        out.println("<label class=\"formulier_input formulier_input_marge\">" + lid.getNr() + "</label>");
		      out.println("</div>");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label "
		  		  + "class=\"formulier_label\">roepnaam</label>");
		        out.println("<input "
			  		+ "type=\"text\" "
			  		+ "id=\"roepnaam\" "
			  		+ "class=\"formulier_input\" "
			  		+ "value=\"" + lid.getRoepnaamEsc() + "\">");
		      out.println("</div>");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label "
		        		+ "class=\"formulier_label\">tussenvoegsels</label>");
		        out.println("<input "
		        		+ "type=\"text\" "
		        		+ "id=\"tussenvoegsels\" "
		        		+ "class=\"formulier_input\" "
		        		+ "value=\"" + lid.getTussenvoegselsEsc() + "\">");
		      out.println("</div>");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label "
		  		+ "class=\"formulier_label\">achternaam</label>");
		        out.println("<input "
		  		+ "type=\"text\" "
		  		+ "id=\"achternaam\" "
		  		+ "class=\"formulier_input\" "
		  		+ "value=\"" + lid.getAchternaamEsc() + "\">");
		      out.println("</div>");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label "
		  		+ "class=\"formulier_label\">adres</label>");
		        out.println("<input "
		  		+ "type=\"text\" "
		  		+ "id=\"adres\" "
		  		+ "class=\"formulier_input\" "
		  		+ "value=\"" + lid.getAdresEsc() + "\">");
		      out.println("</div>");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label "
		  		+ "class=\"formulier_label\">postcode</label>");
		        out.println("<input "
		  		+ "type=\"text\" "
		  		+ "id=\"postcode\" "
		  		+ "class=\"formulier_input\" "
		  		+ "value=\"" + lid.getPostcodeEsc() + "\">");
		      out.println("</div>");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label "
		  		+ "class=\"formulier_label\">woonplaats</label>");
		        out.println("<input "
		  		+ "type=\"text\" "
		  		+ "id=\"woonplaats\" "
		  		+ "class=\"formulier_input\" "
		  		+ "value=\"" + lid.getWoonplaatsEsc() + "\">");
		      out.println("</div>");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label "
		  		+ "class=\"formulier_label\">telefoon</label>");
		        out.println("<input "
		  		+ "type=\"text\" "
		  		+ "id=\"telefoon\" "
		  		+ "class=\"formulier_input\" "
		  		+ "value=\"" + lid.getTelefoonEsc() + "\">");
		      out.println("</div>");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label "
		  		+ "class=\"formulier_label\">e-mail</label>");
		        out.println("<input "
		  		+ "type=\"text\" "
		  		+ "id=\"email\" "
		  		+ "class=\"formulier_input\" "
		  		+ "value=\"" + lid.getEmailEsc() + "\">");
		      out.println("</div>");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label "
		  		+ "class=\"formulier_label\">geboortedatum<br>(jjjj-mm-dd)</label>");
		        out.println("<input "
		  		+ "type=\"date\" "
		  		+ "id=\"gebDatum\" "
		  		+ "class=\"formulier_input\" "
		  		+ "value=\"" + lid.getGeboortedatumEsc() + "\">");
		      out.println("</div>");
		      out.println("<div class=\"formulier_regel\">");
		        out.println("<label "
		  		+ "class=\"formulier_label\">geslacht</label>");
		        out.println("<select "
		  		+ "id=\"geslacht\" "
		  		+ "class=\"formulier_input formulier_input_marge\">");
		  if (lid.getGeslacht().equals("man") || lid.getGeslacht() == null) {
	        	out.println("<option "
	        			+ "value=\"man\" "
	        			+ "selected>man</option>");
	            out.println("<option "
	            		+ "value=\"vrouw\">vrouw</option>");
	        } else {
	        	 out.println("<option "
	        	 		+ "value=\"man\">man</option>");
	             out.println("<option "
	             		+ "value=\"vrouw\" "
	             		+ "selected>vrouw</option>");
	        }
	             out.println("</select>");
		       out.println("</div>");
		       out.println("<div class=\"formulier_regel\">");
		         out.println("<label "
		        		 + "class=\"formulier_label\">upload foto</label>");
		         out.println("<input "
			  		+ "type=\"file\" "
			  		+ "id=\"sport_foto_lid\" "
			  		+ "class=\"formulier_input\" "
			  		+ "name=\"sport_foto_lid\">");
		        out.println("</div>");
		      out.println("</div>"); //formulier div
		out.println("<button "
				+ "type=\"button\" "
				+ "id=\"wijzig_lid\" "
				+ "data-spelerscode=\"" + lid.getSpelerscode() + "\" "
				+ "value=\"Wijzig\">Wijzig</button>");
		out.println("<button "
				+ "type=\"button\" "
				+ "id=\"verwijder_lid\" "
				+ "data-spelerscode=\"" + lid.getSpelerscode() + "\" "
				+ "value=\"Verwijder\">Verwijder</button>");
		out.println("<button "
				+ "type=\"button\" "
				+ "id=\"annuleer_nieuw_lid_button\" "
				+ "value=\"Terug\">Terug</button>");
		
		out.println("</div>"); // einde #lid_scherm
		out.println("</form>");
		out.println("</div>"); //einde #sport_lid_info

        out.close();
	}
	
	private String maakServingUrl(BlobKey blobkey) {
		String fotoUrl = "/AO/JSP_Java_DB/images/geen_foto.jpg";
		if (blobkey != null) {
			ImagesService imagesService = ImagesServiceFactory.getImagesService();
			fotoUrl = imagesService
					.getServingUrl(ServingUrlOptions
					.Builder
					.withBlobKey(blobkey));
			BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
			byte[] imgData = blobstoreService.fetchData(blobkey, 0, BlobstoreService.MAX_BLOB_FETCH_SIZE-1);
			Image img =  ImagesServiceFactory.makeImage(imgData);
			int breedte = img.getWidth();
			int hoogte = img.getHeight();
			
			if (breedte >= hoogte) {
				if (breedte > 300) {
					fotoUrl += "=s290";
				} else {
					fotoUrl += "=s" + breedte;
				}
			} else {
				if (hoogte > 290) {
					double ratio = (double) hoogte/breedte;
					hoogte = (int) (290 * ratio);
					if (hoogte > 450) {
						hoogte = 440;
					}
					fotoUrl += "=s" + hoogte;
				}
			}
		}
		return fotoUrl;
	}
	
	private String maakThumbServingUrl(BlobKey blobkey) {
		String fotoUrl;
		if (blobkey == null) {
			fotoUrl = "/AO/JSP_Java_DB/images/geen_foto_thumb.jpg";
		} else {
			ImagesService imagesService = ImagesServiceFactory.getImagesService();
			fotoUrl = imagesService
					.getServingUrl(ServingUrlOptions
					.Builder
					.withBlobKey(blobkey)
					.imageSize(32)
					.crop(true));
		}	
		return fotoUrl;
	}
	
	private void maakTeamsOverzicht(HttpServletRequest req) {
		Administratie admin = new Administratie();
		ArrayList<Team> teams = admin.getTeamlijst();
		out.println("<div class=\"voegtoeknop\">");
		out.println("<button "
				+ "type=\"button\" "
				+ "id=\"open_nieuw_team\">Team toevoegen</button></div>");
		if (teams.isEmpty()) {
			out.println("<p>Er zijn nog geen teams ingevoerd</p>");
		} else {
			out.println("<div "
					+ "class=\"scrolltabel\">");
//			out.println("<div class=\"table_wrapper\">");
			out.println("<table "
					+ "id=\"ledentabel\">");
			out.println("<tr><th>Teamcode</th>"
					+ "<th>Omschrijving</th>"
					+ "<th>Beheer</th></tr>");
			for (Team team: teams) {
				out.println("<tr>");
				out.println("<td>" + team.getTeamcodeEsc() + "</td>\n");
				out.println("<td>" + team.getOmschrijvingEsc() + "</td>\n");
				out.println("<td><button "
						+ "type=\"button\" "
						+ "class=\"team_data\" "
						+ "data-teamcode=\"" + team.getTeamcodeEsc() + "\">info/wijzig</button></td>\n");
				out.println("</tr>");
			}
			out.println("</table></div>");
		}
		out.close();
	}
	
	private void openNieuwTeamScherm() {

		out.println("<div class=\"formulier\">");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	        	+ "class=\"formulier_label\">teamcode</label>");
	        out.println("<input "
	        		+ "type=\"text\" "
	        	+ "class=\"formulier_input\" "
	        	+ "id=\"teamcode\">");
	      out.println("</div>");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label class=\"formulier_label\">omschrijving</label>");
	        out.println("<input "
	        		+ "type=\"text\" "
	        		+ "id=\"teamomschrijving\" "
	        		+ "class=\"formulier_input\" "
	        		+ "value=\"\">");
	      out.println("</div>");
	      out.println("</div>");//.formulier
        out.println("<button "
        		+ "type=\"button\" "
        		+ "id=\"verzend_nieuw_team\" "
        		+ "value=\"Voer gegevens in\">Voer gegevens in</button>");
        out.println("<button type=\"button\" id=\"annuleer_nieuw_team_button\" value=\"Annuleer\">Annuleer</button>");
        out.close();
	}
	
	private void openBestaandTeamScherm(Team team) {
		out.println("<div "
				+ "id=\"sport_team_info\" "
				+ "class=\"sport_info\">");
		out.println("<h3>" + team.getOmschrijvingEsc() + "</h3>");
		out.println("<div class=\"formulier\">");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label "
	        	+ "class=\"formulier_label\">teamcode</label>");
	        out.println("<label "
	        	+ "class=\"formulier_input formulier_input_marge\" "
	        	+ "id=\"teamcode\">" + team.getTeamcode() + "</label>");
	      out.println("</div>");
	      out.println("<div class=\"formulier_regel\">");
	        out.println("<label class=\"formulier_label\">omschrijving</label>");
	        out.println("<input "
	        		+ "type=\"text\" "
	        		+ "id=\"teamomschrijving\" "
	        		+ "class=\"formulier_input\" "
	        		+ "value=\"" + team.getOmschrijvingEsc() + "\">");
	      out.println("</div>");
	      out.println("</div>");//.formulier
	      out.println("<button "
	        		+ "type=\"button\" "
	        		+ "id=\"wijzig_team\" "
	        		+ "data-teamcode=\"" + team.getTeamcodeEsc() + "\" "
	        		+ "value=\"Wijzig\">Wijzig</button>");
	        out.println("<button "
	        		+ "type=\"button\" "
	        		+ "id=\"verwijder_team\" "
	        		+ "data-teamcode=\"" + team.getTeamcodeEsc() + "\" "
	        		+ "value=\"Verwijder\">Verwijder</button>");
	        out.println("<button "
	        		+ "type=\"button\" "
	        		+ "id=\"annuleer_nieuw_team_button\" "
	        		+ "value=\"Terug\">Terug</button>");
	      
	      
	      out.println("</div>"); //#sport_team_info
        
	    out.println("<div "
        		+ "id=\"sport_team_spelers\" class=\"sport_info\">");
        out.println("<h3>Spelers</h3>");
        Administratie admin = new Administratie();
        ArrayList<Lid> teamspelers = admin.getTeamspelers(team);
		if (teamspelers.isEmpty()) {
			out.println(team.getOmschrijvingEsc() + " heeft nog geen spelers<br>");
		} else {
			out.println("<table "
					+ "id=\"team_leden\">");
			for (Lid lid: teamspelers) {
				out.println("<tr><td><a "
						+ "href=\"\" "
						+ "class=\"team_speler_shortcut\" "
						+ "data-spelerscode=\"" + lid.getSpelerscode() + "\">" + lid.getNaamEsc() + "</a></td>");
				out.println("<td><button "
						+ "type=\"button\" "
						+ "class=\"verwijder_teamspeler\""
						+ "data-spelerscode=\"" + lid.getSpelerscode() + "\" "
						+ "data-teamcode=\"" + team.getTeamcodeEsc() +"\" "
						+ "value=\"verwijder\">verwijder</button></td></tr>");
			}
			out.println("</table>");
		}
		ArrayList<Lid> geenTeamSpelers = new ArrayList<Lid>();;
		geenTeamSpelers.clear();
		ArrayList<Lid> alleLeden = admin.getLedenlijst();
		
		for (Lid l1: alleLeden) {
			boolean ts = false;
			for (Lid l2: teamspelers) {
				if (l1.getSpelerscode().equals(l2.getSpelerscode())) {
					ts = true;
				}
			}
			if (ts == false) {
				geenTeamSpelers.add(l1);
			}
		}
		if (geenTeamSpelers.isEmpty()) {
			out.println("<p>Alle leden zitten in team " + team.getOmschrijvingEsc() + " </p>");
		} else {
			out.println("<label>voeg speler toe</label>");
			out.println("<select id=\"select_teamspeler\">");
			for (Lid lid: geenTeamSpelers) {
				out.println("<option "
						+ "value=\"" + lid.getSpelerscode() +  "\">" + lid.getNaamEsc() + "</option>");
			}
			
			out.println("</select>");
			out.println("<button "
					+ "type=\"button\" "
					+ "id=\"voeg_teamspeler_toe\" value=\"Ok\" data-teamcode=\"" 
					+ team.getTeamcodeEsc() +"\">Ok</button>");
		}
		
		out.println("</div>");
        out.close();
	}

}

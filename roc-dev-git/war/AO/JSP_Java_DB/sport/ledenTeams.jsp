<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jspcursus.sport.vereniging.*" %>
    
    <%
    String ledentabel = "";
    String teamtabel = "";
    
    
    if (request.getAttribute("leden") != null) {
    	ArrayList<Lid> leden = (ArrayList<Lid>) request.getAttribute("leden");
    	ArrayList<Team> teams = (ArrayList<Team>) request.getAttribute("teams");

    	if (leden.isEmpty()) {
 			ledentabel = "<p>Er zijn nog geen leden ingevoerd</p>";
 		}
 		
 		else {
 			ledentabel = "<table id=\"ledentabel\"\n"
 					+ "<tr>\n"
	 				+ "<th>Spelerscode</th>\n"
	 				+ "<th>Spelersnr</th>\n"
 					+ "<th>Naam</th>\n"
 					+ "<th>Adres</th>\n"
 					+ "<th>Postcode</th>\n"
 					+ "<th>Woonplaats</th>\n"
 					+ "<th>Telefoon</th>\n"
 					+ "<th>Geboortedatum</th>\n"
 					+ "<th>Geslacht</th>\n"
 					+ "</tr>";
 		    for (Lid lid: leden) { 
 		    	ledentabel += "<tr>\n"
 		    		+ "<td>" + lid.getSpelerscode() + "</td>\n"
 		    		+ "<td>" + lid.getNr() + "</td>\n"
 		    		+ "<td>" + lid.getNaam() + "</td>\n"
 		    		+ "<td>" + lid.getAdres() + "</td>\n"
 		    		+ "<td>" + lid.getPostcode() + "</td>\n"
 		    		+ "<td>" + lid.getWoonplaats() + "</td>\n"
 		    		+ "<td>" + lid.getTelefoon() + "</td>\n";
 		        
 		        if (lid.getGeboortedatum().equals("01-01-1900")) {
 		        	ledentabel += "<td>niet (correct) ingevoerd</td>\n";
 		        }
  		        else {
 		        	ledentabel += "<td>" + lid.getGeboortedatum() + "</td>\n";
 		        }
 		        
 		        ledentabel += "<td>" + lid.getGeslacht() + "</td>\n"
 		        	+ "<td><a href=\"/sport?spelerscode=" + lid.getSpelerscode() + "&amp;lidwijzig=+\">wijzig<a/></td>\n"
 		        	+ "<td><a href=\"/sport?spelerscode=" + lid.getSpelerscode() + "&amp;lidverwijder=+\">verwijder<a/></td>\n"
 		        	+ "<td><a href=\"/sport?spelerscode=" + lid.getSpelerscode() + "&amp;lidteams=+\">Teams<a/></td>\n"
 		        	+ "</tr>\n";
 		    }
 		    ledentabel += "</table>\n";
 		}
    	
    	if (teams.isEmpty()) {
			teamtabel = "<p>Er zijn nog geen teams ingevoerd</p>";
		}
		
		else {
			teamtabel = "<table id=\"teamlijst\">\n"
					+ "<tr>\n"
					+ "<th>Teamcode</th>\n"
					+ "<th>Teamomschrijving</th>\n"
					+ "</tr>\n";
			
			for (Team team: teams) {
				teamtabel += "<tr>\n"
						+ "<td>" +  team.getTeamcode() + "</td>\n"
						+ "<td>" + team.getOmschrijving() + "</td>\n"
						+ "<td><a href=\"/sport?teamcode=" + team.getTeamcode() + "&amp;teamwijzig=+\">wijzig</a></td>\n"
						+ "<td><a href=\"/sport?teamcode=" + team.getTeamcode() + "&amp;teamverwijder=+\">verwijder<a/></td>\n"
						+ "<td><a href=\"/sport?teamcode=" + team.getTeamcode() + "&amp;teamleden=+\">leden<a/></td>\n"
						+ "</tr>";
			}
			teamtabel += "</table>";
		}
    }

 	else {
 		response.sendRedirect("/sport");
 	}
    
     
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>leden+teams</title>
</head>
<body>
	<h2>Leden</h2>
	<%= ledentabel %>

	<form action="invoerlid.jsp" method="post">
	    <input type="submit" value="Lid toevoegen">
	</form>
	
	<h2>Teams</h2>
	<%= teamtabel %>
	<form action="invoerteam.jsp" method="post">
	    <input type="submit" value="Team toevoegen">
	</form>

</body>
</html>
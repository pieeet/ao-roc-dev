<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<%@ page import="jspcursus.sport.vereniging.*" %>   
    
    <%
    
    Team team = (Team) request.getAttribute("team");
    ArrayList<Lid> teamleden = (ArrayList<Lid>) request.getAttribute("teamleden");
    ArrayList<Lid> leden = (ArrayList<Lid>) request.getAttribute("leden");
    String ledentabel = "";
    for (Lid l: leden) { 
    	ledentabel += "<tr>\n"
    		+ "<td>" + l.getNaam() + "</td>\n"
    		+ "<td><a href=\"/sport?spelerscode=" + l.getSpelerscode() 
    		+ "&amp;teamcode=" + team.getTeamcode() 
    		+ "&amp;voegteamspelertoe=+\">voeg toe</a></td>"
    		+ "</tr>";
    }
    String teamspelertabel = "";
    for (Lid l: teamleden) {
    	teamspelertabel += "<tr>\n"
 			+ "<td>" + l.getNaam() + "</td>\n"
     		+ "<td><a href=\"/sport?spelerscode=" + l.getSpelerscode() 
     		+ "&amp;teamcode=" + team.getTeamcode() 
     		+ "&amp;verwijderteamspeler=+\">verwijder</a></td>"
     		+ "</tr>";
    }
    
    %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/AO/JSP_Java_DB/includes/jsp.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>Leden van team: <%= team.getOmschrijving() %></h1>
	<% if (teamleden.isEmpty()) { %>
	<p><%= team.getTeamcode() %> heeft nog geen leden</p>
	<% } else { %>	
		
		<table id="teamspelers">
			<tr>
				<th>teamspeler<th>
				
			</tr>
			<%= teamspelertabel %>
			
		</table>
		<% } %>
		
		<h2>Voeg leden toe</h2>
		<table id="ledentabel">
			<%= ledentabel %>
			
		</table>
		
		
		
	
</body>
</html>
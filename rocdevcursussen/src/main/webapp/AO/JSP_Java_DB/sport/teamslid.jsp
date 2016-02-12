<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
	<%@ page import="jspcursus.sport.vereniging.*" %>
    
<%
	Lid lid = (Lid) request.getAttribute("lid");
	ArrayList<Team> teamsLid = (ArrayList<Team>) request.getAttribute("teams");

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>teams lid</title>
</head>
<body>
	<h1>Teams van <%= lid.getNaam() %></h1>
	<% if (teamsLid.isEmpty())  { %>
	<p>Lid <%= lid.getNaam() %> zit in geen enkel team</p>
	<% } else { %>
	<ul>
	<% for (Team team: teamsLid) { %>
		<li><%= team.getOmschrijving()  %></li>
	<% } } %>
	</ul>
	
</body>
</html>
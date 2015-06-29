<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="jspcursus.sport.vereniging.*" %>
    
<%
	Team team = (Team) request.getAttribute("team");
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/AO/JSP_Java_DB/includes/jsp.js" type="text/javascript"></script>
<script>window.onunload = refreshParent;</script>
<title>wijzig team</title>
</head>
<body>
	<form action="/sport" id="wijzigteamform">
		<table id="wijzigteam">
		
			<tr>
				<th>Teamcode</th>
				<th>Teamomschrijving</th>
			</tr>
			<tr>
				<td><label for="teamomschrijving" ><%= team.getTeamcode()  %></label>
				<td><input type="text" name="teamomschrijving" value="<%= team.getOmschrijving() %>" maxlength="10"></td>
				<input type="hidden" name ="teamcode" value="<%= team.getTeamcode() %>">
				<input type="hidden" name ="wijzigteam" value="+">
			</tr>

		</table>
		<input type="button" onclick="verzendWijzigTeam()" value="Wijzig">
	
	
	
	</form>

</body>
</html>
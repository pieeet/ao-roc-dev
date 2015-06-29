<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="jspcursus.sport.vereniging.*" %>

<% 
		
	Lid lid = (Lid) request.getAttribute("lid");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/AO/JSP_Java_DB/includes/jsp.js" type="text/javascript"></script>
<script>window.onunload = refreshParent;</script>

<title>wijzig lid</title>
</head>
<body>
	<form action="/sport" id="wijziglidform" method="post">
		<table id="wijziglid">
			
			
			<tr>
				<td>Roepnaam</td>
				<td><input type="text" name="roepnaam" value="<%= lid.getRoepnaam() %>" maxlength="12"></td>
			</tr>
			<tr>
				<td>Tussenvoegsels</td>
				<td><input type="text" name="tussenvoegsels" value="<%= lid.getTussenvoegsels() %>" maxlength="10"></td>
			</tr>
			<tr>
				<td>Achternaam</td>
				<td><input type="text" name="achternaam" value="<%= lid.getAchternaam() %>" maxlength="15"></td>
			</tr>
			<tr>
				<td>Adres</td>
				<td><input type="text" name="adres" value="<%= lid.getAdres() %>" maxlength="25"></td>
			</tr>
			<tr>
				<td>Postcode</td>
				<td><input type="text" name="postcode" value="<%= lid.getPostcode() %>" maxlength="7"></td>
			</tr>
			<tr>
				<td>Woonplaats</td>
				<td><input type="text" name="woonplaats" value="<%= lid.getWoonplaats() %>" maxlength="25"></td>
			</tr>
			<tr>
				<td>Telefoon</td>
				<td><input type="text" name="telefoon" value="<%= lid.getTelefoon() %>" maxlength="13"></td>
			</tr>
			<tr>
				<td>Geboortedatum</td>
				<td><input type="date" name="geboortedatum" value="<%= lid.getGeboortedatum() %>"></td>
			</tr>
			<tr>
				<td>Geslacht</td>
				<% if (lid.getGeslacht().equals("man") || lid.getGeslacht() == null) { %>
					<td><input type="radio" name="geslacht" value="man" checked>Man<br>
					<input type="radio" name="geslacht" value="vrouw">Vrouw</td>
				<% } 
				else { %>
					<td><input type="radio" name="geslacht" value="man">Man<br>
					<input type="radio" name="geslacht" value="vrouw" checked>Vrouw</td>
				<% } %>
			</tr>
			
		</table>
		<input type="hidden" name="spelerscode" value="<%= lid.getSpelerscode() %>">
		<input type="hidden" name="wijziglid" value="+">
		<input type="button" name="wijziglidknop" onclick="verzendWijzigLid()" value="wijzig">
	
	
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/AO/JSP_Java_DB/includes/jsp.js" type="text/javascript"></script>
<script>window.onunload = refreshParent;</script>
<title>nieuw team</title>
</head>
<body>
	<form action="/sport" id="nieuwTeam" method="post">
		<table id="nieuwteam">
		<tr>
			<td><label for="teamcode">Teamcode</label></td>
			<td><input type="text" name="teamcode" maxlength="2"></td>
		</tr>
		<tr>
			<td><label for="teamomschrijving">Teamomschrijving</label></td>
			<td><input type="text" name="teamomschrijving" maxlength="10"></td>
		</tr>
		<tr>
			<td><input type="hidden" name="nieuwteamform" value=""></td>
			<td><input type="button" name="nieuwteam" onclick="verzendNieuwTeam()" value="Voeg Toe">
		</tr>
		</table>
	
	
	
	</form>
</body>
</html>
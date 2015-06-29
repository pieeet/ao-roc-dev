<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Voeg kamer toe</title>
</head>
<body>
<form action="/kalender" method="get">
	<label for="kamernaam">Kamernaam</label>
	<input type="text" name="kamernaam">
	<label for="prijs">Prijs per nacht</label>
	<input type="number" name="prijs">
	<input type="submit" name="nieuwe_kamer_knop" value="voeg toe">
</form>
<p>Ga naar <a href="overzicht.jsp">overzicht</a></p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="/AO/JSP_Java_DB/includes/jsp.js" type="text/javascript"></script>
<script>window.onunload = refreshParent;</script>

<title>nieuw lid</title>
</head>
<body>
	<body>
        <h1>Nieuw lid</h1>
        <form action="/sport"  id="nieuwLid" method="post">
            <table id="nieuwlidform">
                
                <tr>
                    <td><label for="roepnaam">roepnaam:</label></td>
                    <td><input type="text" name="roepnaam" id="roepnaam" maxlength="12"></td>
                </tr>
                <tr>
                    <td><label for="tussenvoegsels">tussenvoegsels</label></td>
                    <td><input type="text" name="tussenvoegsels" id="tussenvoegsels" maxlength="10"></td>
                </tr>
                <tr>
                    <td><label for="achternaam">achternaam</label></td>
                    <td><input type="text" name="achternaam" id="achternaam" maxlength="15"></td>
                </tr>
                <tr>
                    <td><label for="adres">adres</label></td>
                    <td><input type="text" name="adres" id="adres" maxlength="25"></td>
                </tr>
                <tr>
                    <td><label for="postcode">postcode</label></td>
                    <td><input type="text" name="postcode" id="postcode" maxlength="7"></td>
                </tr>
                <tr>
                    <td><label for="woonplaats">woonplaats</label></td>
                    <td><input type="text" name="woonplaats" id="woonplaats" maxlength="25"></td>
                </tr>
                <tr>
                    <td><label for="telefoon">telefoon</label></td>
                    <td><input type="text" name="telefoon" id="telefoon" maxlength="13"></td>
                </tr>
                <tr>
                    <td><label for="gebDatum">geboortedatum<br>(jjjj-mm-dd*)</label></td>
                    <td><input type="date" name="gebDatum" id="gebDatum"></td>
            
                </tr>
                <tr>
                	<td><label for="geslacht">Geslacht</label></td>
                	<td><select name="geslacht" id="geslacht">
                		<option value="man">Man</option>
                		<option value="vrouw">Vrouw</option>
                		</select>
                	</td>
                	
                </tr>
                <tr>
                	<td><input type="hidden" name="nieuwlidform" value="nlf"></td>
                    <td><input type="button" name="knopNieuwLid" onclick="verzendNieuwLid()" value="Voer gegevens in">
                    
                </tr>
                
                
            </table>
            <p>* Indien u gebruik maakt van Internet Explorer of Firefox browser</p>
            
        </form>
</body>
</html>
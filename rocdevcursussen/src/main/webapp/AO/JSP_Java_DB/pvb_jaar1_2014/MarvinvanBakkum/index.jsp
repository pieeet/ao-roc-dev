<%-- 
    Document   : index
    Created on : 23-May-2014, 12:55:26
    Author     : Xyliosius
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="jspcursus.eindtoets.marvinvanbakkum.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AutoOverzicht overzicht = new AutoOverzicht();
    overzicht.voegAutoToe(new Auto("audi", "a1", 23000));
    overzicht.voegAutoToe(new Auto("audi", "a3", 23000));
    overzicht.voegAutoToe(new Auto("audi", "r8", 123000));
    overzicht.voegAutoToe(new Auto("ferrari", "enzo", 200000));
    overzicht.voegAutoToe(new Auto("ferrari", "testarossa", 209000));
    overzicht.voegAutoToe(new Auto("fiat", "500", 12000));
    overzicht.voegAutoToe(new Auto("fiat", "bravo", 23000));
    overzicht.voegAutoToe(new Auto("fiat", "punto", 16000));
    overzicht.voegAutoToe(new Auto("ford", "fiesta", 14000));
    overzicht.voegAutoToe(new Auto("ford", "focus", 25000));
    overzicht.voegAutoToe(new Auto("ford", "mondeo", 28000));
    overzicht.voegAutoToe(new Auto("maserati", "ghibli", 120000));
    overzicht.voegAutoToe(new Auto("maserati", "quattroporte", 160000));
    overzicht.voegAutoToe(new Auto("opel", "astra", 22000));
    overzicht.voegAutoToe(new Auto("opel", "corsa", 14000));
    overzicht.voegAutoToe(new Auto("opel", "mokka", 11000));
    overzicht.voegAutoToe(new Auto("porsche", "cayenne", 85000));
    overzicht.voegAutoToe(new Auto("porsche", "panamera", 120000));
    overzicht.voegAutoToe(new Auto("porsche", "911", 126000));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="default.css">
    </head>
    <body>
        <h2>Zoeken op prijs</h2>
        <form action="zoekresultaat.jsp">
            <p>Vul de minimale en maximale prijs in</p>
            <label>Minimale prijs in &euro;
                <input type="text" name="min">
            </label><br>
            <label>Maximale prijs in &euro;
                <input type="text" name="max">
            </label>
            <br><br>
            <input type="hidden" name="zoekmethode" value="prijs">
            <input type="submit" value="Zoeken op prijs">
        </form>
        <h2>Zoeken op merk</h2>
        <form action="zoekresultaat.jsp">
            <p>Type de naam van een merk zodat alle auto's van dat merk worden weergegeven</p>
            <label>Merk
            <select name="merk">
                <option value="">Alle</option>
                <%
                    for( String merk : overzicht.getMerken() ) {
                        out.print("<option value=" + merk + " >" +  Character.toUpperCase(merk.charAt(0)) + merk.substring(1)  + "</option>");
                    }
                %>
            </select>
            </label>
            <br><br>
            <input type="hidden" name="zoekmethode" value="merk">
            <input type="submit" value="Zoeken op merk">
        </form>
    </body>
</html>

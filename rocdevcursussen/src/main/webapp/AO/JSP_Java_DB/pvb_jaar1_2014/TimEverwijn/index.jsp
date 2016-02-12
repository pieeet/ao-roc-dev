<%-- 
    Document   : index
    Created on : 28-mei-2014, 11:14:22
    Author     : Tim Everwijn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcursus.eindtoets.timeverwijn.*" %>
<%  
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top Gear</title>
        <link type="text/css" rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="box">
            <h1 class="header">Zoeken op prijs</h1>
        </div>
        <p>Vul de minimale en maximale prijs in</p>
        <form action="resultaat.jsp" method="get">
            <label>Minimale prijs</label>
            <input type="text" name="minimaal"><br>
            <label>Maximale prijs</label>
            <input type="text" name="maximaal"><br>
            <input class="zoek" type="submit" name="zoekprijs" value="Zoek op prijs">
        </form>
        <div class="box">
            <h1 class="header">Zoeken op merk</h1>
        </div>
        <p>Selecteer de naam van een merk zodat alle auto's van dat merk worden weergegeven</p>
        <form action="resultaat.jsp" method="get">
            <label>Merk</label>
            <select name="merk">
                <option value="audi">audi</option>
                <option value="ferr">ferrari</option>
                <option value="fiat">fiat</option>
                <option value="ford">ford</option>
                <option value="mase">maserati</option>
                <option value="opel">opel</option>
                <option value="pors">porsche</option>
            </select><br>
            <input class="zoek" type="submit" name="zoekmerk" value="Zoeken op merk">
        </form>
    </body>
</html>

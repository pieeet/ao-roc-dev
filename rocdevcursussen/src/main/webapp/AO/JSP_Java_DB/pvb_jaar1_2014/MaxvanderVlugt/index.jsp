<%-- 
    Document   : HtmlFormulier
    Created on : 28-mei-2014, 13:19:27
    Author     : max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3 style='background-color: lightgreen'>Zoeken op prijs</h3>
        
        <p> vul de minimale en maximale prijs in</p>
        minimale prijs<input type="text" name="fname"><br>
        maximale prijs<input type="text" name="fname"><br>
        <br>
        <br>
        <button type="button">Zoek op prijs</button>
        
        <h3 style='background-color: lightgreen'>Zoeken op merk</h3>
        
        <p> Type de naam van een merk zodat alle auto's van dat <br> merk worden weergegeven </p>
        
        Merk <form action="">
    <select name="Auto's">
    <option value="Audi">Audi</option>
    <option value="Ferrari">Ferrari</option>
    <option value="fiat">Fiat</option>
    <option value="Ford">Ford</option>
    <option value="Porsche">Porsche</option>
    <option value="Opel">Opel</option> 
    <option value="Maserati">Maserati</option>
    </select>
        </form>
        <br>
        <br>
        <button type="button">Zoek op Merk</button>
        
    </body>
</html>

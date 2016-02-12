<%-- 
    Document   : form
    Created on : 28-May-2014, 09:56:14
    Author     : Levi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="jspcursus.eindtoets.leviboon.*" %>
<!DOCTYPE html>
<%

%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/master.css">
        <title>zoeken</title>
    </head>
    <body>
        
        <form action="proefvbkwm.jsp" method="get">
            <table style='width:300px'>
                <tr><th id="theading1"> Zoeken op prijs </th></tr>
                <tr><td>Vul de minimale en maximale prijs in.</td></tr>
                <tr><td><input type="text" name="minimum"></td></tr>
                <tr><td><input type="text" name="maximum"></td></tr>
                <tr><td><input type="submit" name="btn1" value="Zoek op prijs"></td></tr>
            </table>
        </form>
        
        <form action="proefvbkwm.jsp" method="get">
            <table style='width:300px'>
                <tr>
            <th id="theading2">Zoeken op merk</th>
                </tr>
                <tr><td>Kies de naam van uw merk zodat alle auto's van dat merk worden weergeven.</td></tr>
                <tr><td>Merk
                <select name="drop1">
                        <option value="audi">Audi</option>
                        <option value="ferrari">Ferrari</option>
                        <option value="fiat">Fiat</option>
                        <option value="ford">Ford</option>
                        <option value="maserati">Maserati</option>
                        <option value="opel">Opel</option>
                        <option value="porsche">Porsche</option>
                </select>
                    </td></tr><tr><td>
                <input type="submit" name="btn" value="Zoek op merk">
                    </td></tr>
            </table>    
        </form>
    </body>
</html>

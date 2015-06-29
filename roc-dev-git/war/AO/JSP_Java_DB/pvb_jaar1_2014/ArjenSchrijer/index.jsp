<%-- 
    Document   : opdracht_14
    Created on : 24-apr-2014, 10:16:04
    Author     : LAPTOP
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="eindopdracht.css" rel="stylesheet" type="text/css">
        <title>Eindopdracht Programmeren</title>
    </head>
    <body>
        <h1> Auto's </h1>
        <table>
            <thead>
                <th> Model </th>
                <th> Prijs </th>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <p> <img src="AudiA1small.jpeg" alt=""/> </p>
                        <p> Merk en model: audi a1 </p>
                    </td>
                    <td> €23000 </td>
                </tr>
                <tr>
                    <td>
                        <p> <img src="AudiA3small.jpg" alt=""/> </p>
                        <p> Merk en model: audi a3 </p>
                    </td>
                    <td> €23000 </td>
                </tr>
                <tr>
                    <td>
                        <p> <img src="AudiR8small.jpg" alt=""/> </p>
                        <p> Merk en model: audi r8 </p>
                    </td>
                    <td> €123000 </td>
                </tr>
            </tbody>
        </table>
        
        <h3> Zoeken op prijs </h3>
        <p>Vul de minimale en maximale prijs in</p>
        <form>
            Minimale prijs: <input type="int" name="minprijs"><br>
            Maximale prijs: <input type="int" name="maxprijs"><br>
            <input type="Button" value="Zoek op prijs">
        </form>
        
        <h3> Zoeken op merk </h3>
        <p>Type de naam van een merk zodat alle auto's van dat merk worden weergegeven</p>
        <form action="">
            <select name="merk">
                Merk: <option value="audi">Audi</option>
            </select><br>
            <input type="Button" value="Zoeken op merk">
        </form>
        
    </body>
</html>

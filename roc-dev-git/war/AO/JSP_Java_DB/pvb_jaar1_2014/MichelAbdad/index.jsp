<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overgangstoets (Michel Abdad, AO3A</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    
    <body id="alles">
        
        <div id="formulier">
        <h3 id="zoekprijs">Zoeken op prijs</h3>
        <form method="get" action="overzicht.jsp" >
        <table>            
        <tr>
            <td>Vul de minimale en maximale prijs in</td>
        </tr>
        <tr>
            <td>Minimale prijs</td>
            <td><input type="number" name="min"/></td>
        </tr>
        <tr>
            <td>Maximale prijs</td>
            <td><input type="number" name="max"/></td>
        </tr>
        <tr>
            <td><input type="Submit" name="prijs" value="Zoek op prijs"/></td>        
        </tr>
        </table>
        </form>
        
        <h3 id="zoekprijs">Zoeken op merk</h3>
        <table>
            <tr>
                <td>Type de naam van een merk zodat alle auto's van dat merk<br> 
                    worden weergegeven</td>
            </tr>           
        </table>
        
        <form method="get" action="overzicht.jsp" >
        <table>
            <tr>
                <td>Merk</td>
                <td><select name="merk">
                    <option value="all">Alle Merken</option>
                    <option value="Au">Audi</option>
                    <option value="Fer">Ferrari</option>
                    <option value="Fia">Fiat</option>
                    <option value="For">Ford</option>
                    <option value="Mas">Maserati</option>
                    <option value="Op">Opel</option>
                    <option value="Por">Porsche</option>
                    </select></td>
            </tr>
            <tr>
                <td><input type="Submit" name="Zmerk" value="Zoek op merk"></td>
            </tr>
        </table>
        </form>
        </div>
        
    </body>
</html>

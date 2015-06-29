<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulier</title>
        <style type="text/css">
            h1{
                background-color: black;
                color: white;
            }
        </style>
    </head>
    <body>
        <h1>Zoeken op prijs</h1>
        <form action="Autos.jsp" method="get">
            <p>Vul de minimale en maximale prijs in.</p>
            <table>
                <tr>
                    <td>Minimale prijs</td>
                    <td><input type="text" name="minimaal"></td>
                </tr>
                <tr>
                    <td>Maximale prijs</td>
                    <td><input type="text" name="maximaal"></td>
                </tr>
            </table>
            <input type="submit" name="zoekprijs" value="zoek op prijs">
        </form>
        <h1>Zoeken op merk</h1>
        <form action="Autos.jsp" method="get">
            <p>Type de naam van een merk in zodat alle auto's van dat merk worden weergegeven.</p>
            Merk
            <select name="merk">
                <option value="audi">audi</option>
                <option value="ferrari">ferrari</option>
                <option value="fiat">fiat</option>
                <option value="ford">ford</option>
                <option value="maserati">maserati</option>
                <option value="opel">opel</option>
                <option value="porsche">porsche</option>                
            </select>
            <br>
            <input type="submit" name="zoekmerk" value="Zoek op merk">
        </form>
    </body>
</html>

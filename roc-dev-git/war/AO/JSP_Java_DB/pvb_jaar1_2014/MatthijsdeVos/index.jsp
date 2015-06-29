<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Formulier</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="Fprijs">
            <h1 class="h1">Zoeken op prijs</h1>
            Vul de minimale en maximale prijs in<br />
            <br />            
            <form method="get" action="auto.jsp">
                <table>
                    <tr>
                        <td>Minimale prijs: </td>
                        <td><input type="number" name="min"/></td>
                    </tr>
                    <tr>
                        <td>Maximale prijs: </td>
                        <td><input type="number" name="max" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Zoek op prijs" name="prijs" />
                    </tr>
                </table>
            </form>

        </div>
        
        <div id="Fmerk">
            <h1 class="h1">Zoeken op merk</h1>
            Kies een naam van een merk zodat alle auto's van dat merk worden weergegeven<br />
            <br />
            <form method="get" action="auto.jsp" >
                <table>
                    <tr>
                        <td>Merk: </td>
                        <td><select name="merk">
                                <option value="audi">Audi</option>
                                <option value="ferrari">Ferrari</option>
                                <option value="fiat">Fiat</option>
                                <option value="ford">Ford</option>
                                <option value="maserati">Maserati</option>
                                <option value="opel">Opel</option>
                                <option value="porsche">Porsche</option>
                            </select>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Zoek op merk" name="Zmerk" /></td>
                    </tr>
                </table>
            </form>
            
        </div>
        
    </body>
</html>

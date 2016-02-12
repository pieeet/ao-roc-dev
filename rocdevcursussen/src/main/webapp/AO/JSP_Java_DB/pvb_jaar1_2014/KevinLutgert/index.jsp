<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
         <link href="Style.css" rel="stylesheet" type="text/css">
        <title>Formulier</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
            <table>
        <tr>
            <th class="th">
                Zoek op prijs
            </th>
        </tr>
    
    </table>
        Vul de minimale en maximale prijs in </br><br>
        
        <form method="get" action="overzicht.jsp" >
      Minimaleprijs  <input type="text" name="min"/></br>
      Maximale prijs  <input type="text" name="max"/></br>
      <input type="submit" value="Zoek op prijs" name="Zoek"/>
      
        </form>
               <table>
        <tr>
            <th class="th">
                Zoek op merk
            </th>
        </tr>
   
    </table>
        Typ de naam van een merk zodat alle auto's van dat merk word weer gegeven </br></br>
        <form method="get" action="overzicht.jsp">
                    <select name="auto">
                        
                        <option value="audi">audi</option>
                        <option value="ferrari">ferrar</option>
                        <option value="fiat">fiaty</option>
                        <option value="ford">ford</option>
                        <option value="maserati">maserati</option>
                        <option value="opel">opel</option>
                        <option value="porsche">porsche</option>
                    </select></br>
                    <input type="submit" value="Zoeken op merk" name="Zoek1" >


                </form>
    </body>
</html>

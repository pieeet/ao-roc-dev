<%-- 
    Document   : index
    Created on : 28-mei-2014, 8:46:47
    Author     : Jeffrey
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Auto Lijst</title>
        <link rel="stylesheet" type="text/css" href="style.css" />

    </head>
    <body>
        <div class="autoprijs">
            <form action="auto.jsp" method="get">
                <h3>Zoeken op Prijs!</h3>
            Vul een minimale en maximale prijs in
            <br>
            Minimale prijs:
            <input type="number" name="miniprijs">
            <br>
            Maximale prijs:
            <input type="numbers" name="maxiprijs">
            <br><br>
            <input type="submit" name="zoekprijs" value="Zoek op prijs">
            <br>
            </form></div>       
        <form action="auto.jsp" method="get">    
        <div class="automerk">    
            <h3>Zoeken op merk</h3>
            Type de naam van een merk zodat alle auto's van<br> dat merk worden weergegeven</td> <!-- geen td!! -->
            <br><br>
            Merk: <select name="autos">
                        <option value="Audi">Audi</option>
                        <option value="Ferrari">Ferrari</option>
                        <option value="Fiat">Fiat</option>
                        <option value="Ford">Ford</option>
                        <option value="Maserati">Maserati</option>
                        <option value="Opel">Opel</option>
                        <option value="Porsche">Porsche</option>
                    </select>
            <br><br>
                <input type="submit" name="zoekmerk" value="Zoeken op merk">
                </form> </div>   
                
    </body>
</html>

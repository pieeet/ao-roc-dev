<%-- 
    Document   : index
    Created on : 28-mei-2014, 14:28:01
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="index2.css" rel="stylesheet" type="type/css" media="screen">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="wrapper">
                <div class="box2">
                    <div class="merk">
                        <h2>Zoeken op prijs</h2>
                    </div>
                    <div class="menu1">
            <form action="result.jsp" method="get">
                Minimale prijs: <input type="text" name="minprijs"><br>
                Maximale prijs: <input type="text" name="maxprijs"><br>
                <input type="submit" name="submit" value="Zoeken op prijs"><br>
            </form>
         </div>
            </div>
          <div class="box1">
        <div class="prijs">
            <h2>Zoeken op merk</h2>
        </div>
        <div class="menu">
            <p>Type de naam van een merk zodat alle auto's van dat merk worden weergegeven</p>
            <form action="result.jsp" method="get">
        <select name = "select">
            <option value ="0" selected disabled="">Selecteer een merk</option>
            <option value="0">Audi</option>
            <option value="1">Ferrari</option>
            <option value="2">Fiat</option>
            <option value="3">Ford</option>
            <option value="4">Maserati</option>
            <option value="5">Opel</option>
            <option value="5">Porsche</option>
        </select> <br>        
            <input type="submit" name="submit" value="Zoeken op merk"><br>
            </form>
        </div>

        </div>
        </div>
    </body>
</html>

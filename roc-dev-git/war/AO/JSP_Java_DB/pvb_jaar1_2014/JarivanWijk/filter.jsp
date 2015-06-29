<%-- 
    Document   : filter
    Created on : 28-May-2014, 13:42:50
    Author     : Legendgreat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel='stylesheet' type='text/css' href='style.css'>
    </head>
    <body>
        <div id='everything'>
        <div id='filterHeader'>
            Zoeken op prijs
        </div></br>
        <div id='filterContent'>
            <form action='index.jsp'> 
                <label id=description>Vul de minimale en maximale prijs in</label></br></br>
                <label>Minimale prijs: </label><input type='text' name='minPrijs'></br>
                <label>Maximale prijs: </label><input type='text' name='maxPrijs'></br>
                <button type='submit' name='prijsFilter' value='true'>Zoek op prijs</button>
            </form>
        </div></br>
        <div id='filterHeader'>
            Zoeken op merk
        </div></br>
        <div id='filterContent'>
            <form action='index.jsp'> 
                <label>Merk</label>
                <select name='merk'>
                    <option>audi</option>
                    <option>ferrari</option>
                    <option>fiat</option>
                    <option>ford</option>
                    <option>lexus</option>
                    <option>maserati</option>
                    <option>mercedes</option>
                    <option>opel</option>
                    <option>porsche</option>
                </select></br>
                <button type='submit' name='merkFilter' value='true'>Zoek op merk</button>
            </form>
        </div>
        </div>
    </body>
</html>

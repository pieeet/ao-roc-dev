<%-- 
    Document   : TopgearZoek
    Created on : 28-May-2014, 11:06:58
    Author     : Raïd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Topgear</title>
    </head>
    <body> 
        
         <table class="table table-hover">
             <tr style="background-color: lightsteelblue" >
                 <th witdh="100%">Zoeken op prijs</th>
             </tr>
         </table>
        
        <form action="Topgear.jsp" method="get">
                 Minimale prijs:<input type="text" name="min">
                <br>
                Maximale prijs:<input type="text" name="max">
                <br>
                <input type="submit" value="Zoek op prijs" name="zoek"> 
        </form>
        
        
        <table class="table table-bordered">
             <tr style="background-color: lightsteelblue" >
                 <th witdh="100%">Zoeken op merk</th>
             </tr>
        </table>
        
        <label> Merk:</label>  
 
    <form action="Topgear.jsp" method="get">
        <select name="zoekmerk">
            <option value="merk"></option>
            <option value="Audi">Audi</option>
            <option value="Ferrari">Ferrari</option>
            <option value="Fiat">Fiat</option>
            <option value="Ford">Ford</option>
            <option value="Masserati">Masserati</option>
            <option value="Opel">Opel</option>
            <option value="Porsche">Porsche</option>
        </select>
        <br>
        <input type="submit" value="Zoek" name="zoekknop">
    </form>
    </body>
</html>

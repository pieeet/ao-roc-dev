
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@page import='jspcursus.eindtoets.jeshakuizenga.*'%>
        <title>JSP Page</title>
        <%
    AutoOverzicht overzicht = new AutoOverzicht();
    overzicht.voegAutoToe(new Auto("images/audi_a1.jpg","audi", "a1", 23000));
    overzicht.voegAutoToe(new Auto("images/audi_a3.jpg","audi", "a3", 23000));
    overzicht.voegAutoToe(new Auto("images/audi_r8.jpg","audi", "r8", 123000));
    overzicht.voegAutoToe(new Auto("images/ferrari_enzo.jpg","ferrari", "enzo", 200000));
    overzicht.voegAutoToe(new Auto("images/ferrari_testarossa.jpg","ferrari", "testarossa", 209000));
    overzicht.voegAutoToe(new Auto("images/fiat_500.jpg","fiat", "500", 12000));
    overzicht.voegAutoToe(new Auto("images/fiat_bravo.jpg","fiat", "bravo", 23000));
    overzicht.voegAutoToe(new Auto("images/afiat_punto.jpg","fiat", "punto", 16000));
    overzicht.voegAutoToe(new Auto("images/ford_fiesta.jpg","ford", "fiesta", 14000));
    overzicht.voegAutoToe(new Auto("images/ford_focus.jpg","ford", "focus", 25000));
    overzicht.voegAutoToe(new Auto("images/for_mondeo.jpg","ford", "mondeo", 28000));
    overzicht.voegAutoToe(new Auto("images/maserati_ghibli.jpg","maserati", "ghibli", 120000));
    overzicht.voegAutoToe(new Auto("images/maserati_quattroporte.jpg","maserati", "quattroporte", 160000));
    overzicht.voegAutoToe(new Auto("images/opel_astra.jpg","opel", "astra", 22000));
    overzicht.voegAutoToe(new Auto("images/opel_corsa.jpg","opel", "corsa", 14000));
    overzicht.voegAutoToe(new Auto("images/opel_mokka.jpg","opel", "mokka", 11000));
    overzicht.voegAutoToe(new Auto("images/porsche_cayenne.jpg","porsche", "cayenne", 85000));
    overzicht.voegAutoToe(new Auto("images/porsche_panamera.jpg","porsche", "panamera", 120000));
    overzicht.voegAutoToe(new Auto("images/porsche_911.jpg","porsche", "911", 126000));
%>
    </head>
    <body>


<form action= "uitkomst.jsp" method= "get" name="prijszoek">
      minimale prijs:
      <input type="text" name="minprijs"><br>
      maximaleprijs:
      <input type="text" name="maxprijs" ><br>
            <br>
            <input type="submit" name="zoekprijs" value="Zoek op prijs">
</form><br>
    <form action= "uitkomst.jsp" method= "get"name="merkzoek">
            
           merk: <select name="merk">
                 <option value="audi">audi</option>
                 <option value="ferrari">ferrari</option>
                 <option value="fiat">fiat</option>
                 <option value="maserati">maserati</option>
                 <option value="opel">opel</option>
                 <option value="porsche">porsche</option>
                 
            </select><br><br>
            <input type="submit" name="zoekmerk" value="Zoek op merk">
        </form>

    </body>
</html>

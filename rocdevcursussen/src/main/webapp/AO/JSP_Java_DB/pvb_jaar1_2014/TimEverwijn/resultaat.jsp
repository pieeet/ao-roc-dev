<%-- 
    Document   : resultaat
    Created on : 28-mei-2014, 11:43:02
    Author     : Tim Everwijn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcursus.eindtoets.timeverwijn.*" %>
<%  AutoOverzicht overzicht = new AutoOverzicht();
    
    if(request.getParameter("zoekprijs") != null){
        int minimaal = Integer.parseInt(request.getParameter("minimaal"));
        int maximaal = Integer.parseInt(request.getParameter("maximaal"));
        overzicht.zoekAutoOpPrijs(minimaal, maximaal);
    }
    if(request.getParameter("zoekmerk") != null){
        if(request.getParameter("merk").equals("audi")){
            overzicht.voegAutoToe(new Auto("audi", "a1", 23000));
            overzicht.voegAutoToe(new Auto("audi", "a3", 23000));
            overzicht.voegAutoToe(new Auto("audi", "r8", 123000));
        }
        if(request.getParameter("merk").equals("ferr")){
            overzicht.voegAutoToe(new Auto("ferrari", "enzo", 200000));
            overzicht.voegAutoToe(new Auto("ferrari", "testarossa", 209000));
        }
        if(request.getParameter("merk").equals("fiat")){
            overzicht.voegAutoToe(new Auto("fiat", "500", 12000));
            overzicht.voegAutoToe(new Auto("fiat", "bravo", 23000));
            overzicht.voegAutoToe(new Auto("fiat", "punto", 16000));
        }
        if(request.getParameter("merk").equals("ford")){
            overzicht.voegAutoToe(new Auto("ford", "fiesta", 14000));
            overzicht.voegAutoToe(new Auto("ford", "focus", 25000));
            overzicht.voegAutoToe(new Auto("ford", "mondeo", 28000));
        }
        if(request.getParameter("merk").equals("mase")){
            overzicht.voegAutoToe(new Auto("maserati", "ghibli", 120000));
            overzicht.voegAutoToe(new Auto("maserati", "quattroporte", 160000));
        }
        if(request.getParameter("merk").equals("opel")){
            overzicht.voegAutoToe(new Auto("opel", "astra", 22000));
            overzicht.voegAutoToe(new Auto("opel", "corsa", 14000));
            overzicht.voegAutoToe(new Auto("opel", "mokka", 11000));
        }
        if(request.getParameter("merk").equals("pors")){
            overzicht.voegAutoToe(new Auto("porsche", "cayenne", 85000));
            overzicht.voegAutoToe(new Auto("porsche", "panamera", 120000));
            overzicht.voegAutoToe(new Auto("porsche", "911", 126000));
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Zoekresultaten</title>
        <link type="text/css" rel="stylesheet" href="style.css">
    </head>
    <body>
        <%= overzicht.print() %>
    </body>
</html>

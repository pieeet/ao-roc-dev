<%-- 
    Document   : toets2
    Created on : 28-mei-2014, 12:48:25
    Author     : Jochem Tan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcursus.eindtoets.jochemtan.*" %>


   <%
    AutoOverzicht overzicht = new AutoOverzicht();
    overzicht.voegAutoToe(new Auto("audi", "a1", 23000));
    overzicht.voegAutoToe(new Auto("audi", "r8", 123000));
    overzicht.voegAutoToe(new Auto("ferrari", "enzo", 200000));
    overzicht.voegAutoToe(new Auto("ferrari", "testarossa", 209000));
    overzicht.voegAutoToe(new Auto("fiat", "500", 12000));
    overzicht.voegAutoToe(new Auto("fiat", "bravo", 23000));
    overzicht.voegAutoToe(new Auto("fiat", "punto", 16000));
    overzicht.voegAutoToe(new Auto("ford", "fiesta", 14000));
    overzicht.voegAutoToe(new Auto("ford", "focus", 25000));
    overzicht.voegAutoToe(new Auto("ford", "mondeo", 28000));
    overzicht.voegAutoToe(new Auto("maserati", "ghibli", 120000));
    overzicht.voegAutoToe(new Auto("maserati", "quattroporte", 160000));
    overzicht.voegAutoToe(new Auto("opel", "astra", 22000));
    overzicht.voegAutoToe(new Auto("opel", "corsa", 14000));
    overzicht.voegAutoToe(new Auto("opel", "mokka", 11000));
    overzicht.voegAutoToe(new Auto("porsche", "cayenne", 85000));
    overzicht.voegAutoToe(new Auto("porsche", "panamera", 120000));
    overzicht.voegAutoToe(new Auto("porsche", "911", 126000));
  
   %>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link type="text/css" rel="stylesheet" href="style.css">
      <title>JSP Page</title>
   </head>
   <body>
      
      <%= overzicht.zoekAutoOpMerk()  %>
  
     
     
   </body>
</html>

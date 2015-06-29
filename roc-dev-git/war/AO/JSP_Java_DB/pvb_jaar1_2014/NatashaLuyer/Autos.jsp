<%-- 
    Document   : Autos.jsp
    Created on : 28-mei-2014, 9:44:53
    Author     : Natasha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcursus.eindtoets.natashaluyer.*"%>
<%
    AutoOverzicht autos = new AutoOverzicht();
    String gevondenPrijs = "";
    String gevondenMerk = "";
    Boolean merk = false;
    Boolean prijs = false;
    if(request.getParameter("zoekprijs") != null){
        try{
            double minimaal = Double.parseDouble(request.getParameter("minimaal"));
            double maximaal = Double.parseDouble(request.getParameter("maximaal"));
            gevondenPrijs = autos.zoekAutoOpPrijs(minimaal, maximaal);
            prijs = true;
        }
        catch(NumberFormatException n){
            
        }
    }
    if(request.getParameter("zoekmerk") != null){
        gevondenMerk = autos.zoekAutoOpMerk(request.getParameter("merk"));
        merk = true;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Auto's</title>
        <style type="text/css">
            h1{
                background-color: black;
                color: white;
            }
        </style>
    </head>
    <body>
        <h1>Auto's</h1>
        <% if(prijs){%>
            <%= gevondenPrijs%>
        <% } else if(merk){%>
            <%= gevondenMerk%>
        <% } %>
        <br>
        <a href="index.jsp">Formulier</a>
    </body>
</html>

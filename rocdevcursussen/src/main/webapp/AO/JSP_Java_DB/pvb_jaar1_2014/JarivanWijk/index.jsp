<%-- 
    Document   : newjsp
    Created on : 28-May-2014, 12:51:00
    Author     : Legendgreat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@page import="jspcursus.eindtoets.jarivanwijk.*"%>
        <%@page import="java.util.ArrayList"%>
        <%
        AutoOverzicht overzicht = new AutoOverzicht();
        overzicht.voegAutoToe(new Auto("audi", "a1", 23000, "images/audi_a1.jpg"));
        overzicht.voegAutoToe(new Auto("audi", "a3", 23000, "images/audi_a3.jpg"));
        overzicht.voegAutoToe(new Auto("audi", "r8", 123000, "images/audi_r8.jpg"));
        overzicht.voegAutoToe(new Auto("ferrari", "enzo", 200000, "images/ferrari_enzo.jpg"));
        overzicht.voegAutoToe(new Auto("ferrari", "testarossa", 209000, "images/ferrari_testarossa.jpg"));
        overzicht.voegAutoToe(new Auto("fiat", "500", 12000, "images/fiat_500.jpg"));
        overzicht.voegAutoToe(new Auto("fiat", "bravo", 23000, "images/fiat_bravo.jpg"));
        overzicht.voegAutoToe(new Auto("fiat", "punto", 16000, "images/fiat_punto.jpg"));
        overzicht.voegAutoToe(new Auto("ford", "fiesta", 14000, "images/ford_fiesta.jpg"));
        overzicht.voegAutoToe(new Auto("ford", "focus", 25000, "images/ford_focus.jpg"));
        overzicht.voegAutoToe(new Auto("ford", "mondeo", 28000, "images/ford_mondeo.jpg"));
        overzicht.voegAutoToe(new Auto("maserati", "ghibli", 120000, "images/maserati_ghibli.jpg"));
        overzicht.voegAutoToe(new Auto("maserati", "quattroporte", 160000, "images/maserati_quattroporte.jpg"));
        overzicht.voegAutoToe(new Auto("opel", "astra", 22000, "images/opel_astra.jpg"));
        overzicht.voegAutoToe(new Auto("opel", "corsa", 14000, "images/opel_corsa.jpg"));
        overzicht.voegAutoToe(new Auto("opel", "mokka", 11000, "images/opel_mokka.jpg"));
        overzicht.voegAutoToe(new Auto("porsche", "cayenne", 85000, "images/porsche_cayenne.jpg"));
        overzicht.voegAutoToe(new Auto("porsche", "panamera", 120000, "images/porsche_panamera.jpg"));
        overzicht.voegAutoToe(new Auto("porsche", "911", 126000, "images/porsche_911.jpg"));
        %>
        
    </head>
    <body>
        <div id='everything'>
        <div id="content">
            <div id="header">
                Auto's
            </div>
            <div id='table'>
                <%
                    if(request.getParameter("prijsFilter") == null &&
                            request.getParameter("merkFilter") == null){
                        out.println("<table><tr id=header>"  //aanhalingstekens vergeten maar werkt wel
                                  + "<td id=header>Model</td>"
                                  + "<td id=header>Prijs</td></tr>");
                        for(Auto a : overzicht.getAutolijst()){
                            out.println("<tr id=content>"
                                      + "<td><img src='"+ a.getImg() +"'></img></br>Merk en model: "+ a.getMerk() + " " + a.getType() +"</td>"
                                      + "<td>€" + a.getPrijs() + "<td><tr>");
                        }
                        out.println("</table>");
                    }
                    if(request.getParameter("prijsFilter") != null){
                        int minPrijs = Integer.parseInt(request.getParameter("minPrijs"));
                        int maxPrijs = Integer.parseInt(request.getParameter("maxPrijs"));
                        ArrayList<Auto> autolijst = overzicht.zoekAutoOpPrijs(minPrijs, maxPrijs);
                        
                        out.println("<table><tr id=header>"
                                  + "<td id=header>Model</td>"
                                  + "<td id=header>Prijs</td></tr>");
                        for(Auto a : autolijst){
                            out.println("<tr id=content>"
                                      + "<td><img src='"+ a.getImg() +"'></img></br>Merk en model: "+ a.getMerk() + " " + a.getType() +"<td>"
                                      + "<td>€" + a.getPrijs() + "<td><tr>");
                        }
                        out.println("</table>");
                    }
                    if(request.getParameter("merkFilter") != null){
                        String merk = request.getParameter("merk");
                        ArrayList<Auto> autolijst = overzicht.zoekAutoOpMerk(merk);
                        
                        out.println("<table><tr id=header>"
                                  + "<td id=header>Model</td>"
                                  + "<td id=header>Prijs</td></tr>");
                        for(Auto a : autolijst){
                            out.println("<tr id=content>"
                                      + "<td><img src='"+ a.getImg() +"'></img></br>Merk en model: "+ a.getMerk() + " " + a.getType() +"<td>"
                                      + "<td>€" + a.getPrijs() + "<td><tr>");
                        }
                        out.println("</table>");
                    }
                %>
            </div>
            <div id='href'>
                <%if(request.getParameter("prijsFilter") != null ||
                     request.getParameter("merkFilter") != null){
                %><a href='index.jsp'>Haal filters weg</a><br><%    
                }%>
                <a href='filter.jsp'>Filter resultaten</a>
            </div>
        </div>
        </div>
    </body>
</html>

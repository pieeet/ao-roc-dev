<%-- 
    Document   : index
    Created on : 23-May-2014, 12:55:26
    Author     : Xyliosius
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="jspcursus.eindtoets.marvinvanbakkum.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AutoOverzicht overzicht = new AutoOverzicht();
    overzicht.voegAutoToe(new Auto("audi", "a1", 23000));
    overzicht.voegAutoToe(new Auto("audi", "a3", 23000));
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
<%
    ArrayList<Auto> resultaat = new ArrayList<Auto>();
    resultaat = overzicht.getAutolijst();
    String foutcode = "";
    
    if ( request.getParameter("zoekmethode") != null && !request.getParameter("zoekmethode").isEmpty()) {
        if ( request.getParameter("zoekmethode").equals("prijs") ) {
            boolean min = false, max = false;
            
            if( request.getParameter("min") != null && !request.getParameter("min").isEmpty() ) {
                min = true;
            }
            if( request.getParameter("max") != null && !request.getParameter("max").isEmpty() ) {
                max = true;
            }
            
            if ( min || max ) {
                int min_prijs = 0, max_prijs = 0;
                boolean invoerfout = false;

                if( min ) {
                    try {
                        min_prijs  = Integer.parseInt(request.getParameter("min"));
                    } catch (NumberFormatException e2) {
                        invoerfout = true;
                        foutcode = "Minimumprijs is geen geldig getal";
                    }
                }
                
                if( max ) {
                    try {
                        max_prijs  = Integer.parseInt(request.getParameter("max"));
                    } catch (NumberFormatException e2) {
                        invoerfout = true;
                        foutcode = "Maximumprijs is geen geldig getal";
                    }
                }
                
                if(!invoerfout) {
                    if(min && max) {
                        if (min_prijs <= max_prijs) {
                            resultaat = overzicht.zoekAutoOpPrijs(min_prijs, max_prijs);
                        } else {
                           foutcode = "Minimale prijs kan niet meer zijn dan de maximale prijs";
                        }
                    } else if (min) {
                        resultaat = overzicht.zoekAutoOpMinPrijs(min_prijs);
                    } else if (max) {
                        resultaat = overzicht.zoekAutoOpMaxPrijs(max_prijs); 
                    }
                    
                    if(resultaat.isEmpty()) {
                        foutcode = "Geen auto's tussen &euro;" + min_prijs + " en &euro;" + max_prijs;
                    }
                }
            } else {
                foutcode="Geen minimale of maximale prijs ingevuld";
            }
        }
        else if (request.getParameter("zoekmethode").equals("merk")) {
            if(request.getParameter("merk") != null && !request.getParameter("merk").isEmpty()) {
                resultaat = overzicht.zoekAutoOpMerk(request.getParameter("merk"));
                if(resultaat.isEmpty()) {
                    foutcode = "Geen auto's van het merk " + request.getParameter("merk");
                }
            } /* else {
                foutcode = "Geen merk ingevuld";
            } */
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="default.css">
    </head>
    <body>
        <h1>Auto's</h1>
        <% if( foutcode.isEmpty() ) { %>
            <table>
                <tr>
                    <th class="modelkolom">Model</th>
                    <th class="prijskolom">Prijs</th>
                </tr>
                <%
                    for( Auto auto : resultaat ) {
                        out.print("<tr><td class=\"modelkolom\">" + auto.getAfbeelding() + "<br>Merk en model: " + auto.getMerkEnModel() + "</td><td class=\"prijskolom\">&euro;" + auto.getPrijs() + "</td></tr>");
                    }
                %>
            </table>
        <% } else { %>
            <%=foutcode%>
        <% } %>
        <br><br>
        <a href="index.jsp">Formulier</a>
    </body>
</html>

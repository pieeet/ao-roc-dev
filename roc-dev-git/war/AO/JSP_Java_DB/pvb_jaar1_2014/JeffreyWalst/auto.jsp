<%-- 
    Document   : auto
    Created on : 28-mei-2014, 9:49:07
    Author     : Jeffrey
--%>
<%@page import="jspcursus.eindtoets.jeffreywalst.*"%>


<%
    AutoOverzicht overzicht = new AutoOverzicht();
    
    String cellen = "",warning = "";  
    
    
    try{
      if (request.getParameter("zoekmerk") != null) {
      String s=""+request.getParameter("autos");  //lege string overbodig
      cellen = overzicht.zoekAutoOpMerk(s);
      }
      if (request.getParameter("zoekprijs") != null) {
      int min_prijs, max_prijs;
      min_prijs= Integer.parseInt(request.getParameter("miniprijs"));
      max_prijs =Integer.parseInt(request.getParameter("maxiprijs"));
      cellen = overzicht.zoekAutoOpPrijs(min_prijs,max_prijs);
      }
    }
    catch(NumberFormatException e){
     warning = "Geen Auto of prijs geselecteerd";  //wordt niet gebruikt
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" />

    </head>
    <body>
        <h1>Auto's</h1>
        <table class="autolijstje">
            
            <tr>
                <th>Model</th>
                <th>Prijs</th>
            </tr>    
        
        <%= cellen %>
        <tr>
            <td><a href="index.jsp" target="_self">Formulier</a></td>
        </tr></table>
        
    </body>
</html>

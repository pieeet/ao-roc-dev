<%-- 
    Document   : auto
    Created on : 28-mei-2014, 9:11:16
    Author     : matthijs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcursus.eindtoets.matthijsdevos.*" %>

<%
    AutoOverzicht o = new AutoOverzicht();
    String cellen="";
    
    try{
        if(request.getParameter("prijs") != null){
            int min= Integer.parseInt(request.getParameter("min"));
            int max= Integer.parseInt(request.getParameter("max"));
            
            cellen = o.zoekPrijs(min, max);
        }
        
        if(request.getParameter("Zmerk") != null){
            String merk = ""+request.getParameter("merk");
            
            cellen = o.zoekMerk(merk);
        }
        
    }
    catch (NumberFormatException e){
        
    }
    
%>
    
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <h1 class="h11">Auto's</h1>
        
        <table>
            <tr>
                <th class='th'>Model</th>
                <th class='th'>Prijs</th>
            </tr>
            <%= cellen %>
        </table>
        <br />
        <a href='index.jsp'>Formulier</a>
    </body>
</html>

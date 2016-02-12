<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="jspcursus.eindtoets.michelabdad.*" %>
<!DOCTYPE html>
<%
    autolijst o = new autolijst();
    String cellen="";
    int min = 0;
    int max = Integer.MAX_VALUE;
    
    try{
        if(request.getParameter("prijs") != null){            
            if(!(request.getParameter("min") == "")){
                min= Integer.parseInt(request.getParameter("min"));
            }
            if(!(request.getParameter("max") == "")){
                max= Integer.parseInt(request.getParameter("max"));
            }           
            cellen = o.zoekPrijs(min, max);
        }        
        
        if(request.getParameter("Zmerk") != null){
            String merk =request.getParameter("merk");           
            cellen = o.zoekMerk(merk);
        }        
    }
    catch (NumberFormatException e){
        
    } 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overgangstoets (Michel Abdad, AO3A</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>     
        <h3>Auto's</h3>
        <table id="balk">
            <tr>
                <td>Model</td>
                <td>Prijs</td>
            </tr>
        </table>
        <table>
            <tr>
                <td><%=cellen%></td>
            </tr>           
        </table>
        <table id="balk">
            <tr>                
                <td><a id="terug" href="index.jsp">Terug naar formulier</a></td>
            </tr>
        </table>
        
    </body>
</html>

<%-- 
    Document   : index.jsp
    Created on : May 28, 2014, 11:38:52 AM
    Author     : ajay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="index.css" rel="stylesheet" type="css/type" media="screen">
        <%
            String min = "";
            String max = "";
            
            if(request.getParameter("submit1") != null)
            {
                min = request.getParameter("min");
                max = request.getParameter("max");
            }
            if(request.getParameter("submit2") != null)
            {
                min = request.getParameter("min");
                max = request.getParameter("max");
            }
        %>
        <title>JSP Page</title>
    </head>
    <body>
        <form action="result.jsp" method="get">
            
        <h1>Zoeken op prijs</h1>
            <label>Minimale prijs: </label><input type="textbox" name="min" value='<%= min %>'><br>
            <label>Maximale prijs: </label><input type="textbox" name="max" value='<%= max %>'><br>
            <input type="submit" name="submit1" value="Zoek op prijs">
        </form>
        
        
        <form action="result2.jsp" method="get">
            <h1>Zoeken op merk</h1>
            <p>
                Type de naam van een merk zodat alle auto's van dat merk worden weergegeven
            </p>
            
            <select value='merk' name='merk'>
                <option value='audi'>Audi</option>
                <option value='ferarri'>Ferarri</option>
                <option value='fiat'>Fiat</option>
                <option value='ford'>Ford</option>
                <option value='maserati'>Maserati</option>
                <option value='opel'>Opel</option>
                <option value='porche'>Porche</option>
            </select>
            <input type="submit" name="submit2" value="zoek op prijs">
        </form>
    </body>
</html>

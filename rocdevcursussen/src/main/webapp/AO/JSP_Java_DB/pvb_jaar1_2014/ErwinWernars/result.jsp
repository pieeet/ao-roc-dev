<%-- 
    Document   : newjsp
    Created on : May 28, 2014, 12:32:30 PM
    Author     : Erwin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "jspcursus.eindtoets.erwinwernars.*" %>
<%
   AutoOverzicht autos;
    
    autos = new AutoOverzicht();
    autos.voegToe();
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="style.css">
    </head>
    <body>
        <div id="wrapper">
        <%= autos.print() %>
        </br>
        <a href="index.jsp">Formulier</a>
        <p>
        </div>
    </body>
</html>

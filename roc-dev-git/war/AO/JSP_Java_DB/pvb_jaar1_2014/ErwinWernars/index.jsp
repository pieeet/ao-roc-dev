<%-- 
    Document   : index
    Created on : May 28, 2014, 2:11:42 PM
    Author     : Erwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "jspcursus.eindtoets.erwinwernars.*" %>
<% 
    
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
            <div id="content">
                <div id="zoek-balk">
                 Zoeken op prijs
                </div>
                     <p>Vul de minimale en maximale prijs in</p>
               
                    <form methode="POST" action="result.jsp">  
                       minimale prijs
                       <input type="text" name="min-prijs"></input></br>
                       maximale prijs
                       <input type="text" name="max-prijs"></input></br>
                       <button type="submit" id="verzenden" name="verzenden">Verzenden</button>
                    </form>  
                    <div id="zoek-balk">
                      Zoeken op merk
                    </div>
                     <p>Selecteer de naam van een merk zodat alle auto's van dat merk worden weergegeven</p>
                    <form methode="POST" action="result.jsp">  
                      Merk
                      <select name="auto-lijst"> 
                        <option value="0">audi</option>
                        <option value="1">ferrari</option>
                        <option value="2">fiat</option>
                        <option value="3">ford</option>
                        <option value="4">maserati</option>
                        <option value="5">opel</option>
                        <option value="6">prosche</option>
                      </select></p>
                    <button type="submit" id="verzenden" name="verzenden">Zoeken op prijs</button>
                    </form>   
            </div>
        </div>
    </body>
</html>

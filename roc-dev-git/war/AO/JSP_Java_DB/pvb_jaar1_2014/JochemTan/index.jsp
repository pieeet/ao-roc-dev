<%-- 
    Document   : toets
    Created on : 28-mei-2014, 11:15:33
    Author     : Jochem Tan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link type="text/css" rel="stylesheet" href="style.css">
      <title>JSP Page</title>
   </head>
   <body>
      <form action="toets2.jsp" method="get">
      <div id="zoeken">
      <h2>Zoeken op prijs</h2>
      <p>Vul de minimale en maximale prijs in</p>
      Minimale prijs<input type="text" name="min"><br>
      maximale prijs<input type="text" name="max">
      </form>
      
      <div id="merk">
         <h2>Zoeken op merk</h2>
         <p>Type de naam van een merk zodat alle auto's van dat merk worden weergegeven</p>
        <select>
           <option>audi</option> 
           
        </select><br>
        
         <input type="submit" name="submit" value="Zoeken op merk">
      </div>
   </body>
</html>

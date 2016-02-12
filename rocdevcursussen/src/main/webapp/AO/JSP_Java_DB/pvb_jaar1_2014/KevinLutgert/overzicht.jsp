<%-- 
    Document   : overzicht
    Created on : 28-mei-2014, 9:20:44
    Author     : Kevin
--%>
<%@page import="jspcursus.eindtoets.kevinlutgert.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AutoOverzicht auto= new AutoOverzicht();
    String print ="";
    String auto1 ="";
    int max = 0;
    int min = 0;

    try{
        if(request.getParameter("Zoek")!= null){
          max = Integer.parseInt(request.getParameter("max"));
          min = Integer.parseInt(request.getParameter("min"));
           print = auto.GetMax(min,max);
           
    }
     if(request.getParameter("Zoek1")!= null){
          auto1 = request.getParameter("auto");
          print = auto.GetMerk(auto1);
   }  }
        
  catch(NumberFormatException e){
      
   }
    %>
<!DOCTYPE html>
<html>
    <head>
       <link href="Style.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Zoeken</title>
 
    </head>
    <body>
        <h1> Auto's </h1>
        <table class="table">
            <tr>
                <th class="th">Model</th>
                <th class="th">Prijs</th>
            </tr>
         <%=print%>  
        </table>
        <a href="index.jsp">Formulier</a>
    </body>
</html>

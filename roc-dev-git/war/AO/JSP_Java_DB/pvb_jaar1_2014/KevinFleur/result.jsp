<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "jspcursus.eindtoets.kevinfleur.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="index1.css" rel="stylesheet" type="type/css" media="screen">
        <title>Marktplaats</title>
        
        <%
            //hernoem AutoOverzicht AO, omdat het simpler en korter is - optioneel
            AutoOverzicht AO;
            
            //start de constructor van AutoOverzicht, de constructor in AutoOverzicht maakt de array aan
            AO = new AutoOverzicht();
            
            //deze methode zet waarde in de array, en verstuurt het naar de Auto klasse waar elk auto array een object wordt gemaakt
            AO.voegToe();
        %>
    </head>
    <body>
        <div class="wrapper">
 
            <div id ='content'>
                <%= AO.genereerPagina() %>
            </div>
                    <a href="index.jsp" target="_blank">Formulier</a>
        </div>
    </body>
</html>

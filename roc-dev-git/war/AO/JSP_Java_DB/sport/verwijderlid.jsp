<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="jspcursus.sport.vereniging.*" %>
<% 
   
    Lid lid = (Lid) request.getAttribute("lid");
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verwijder lid</title>
        <script src="/AO/JSP_Java_DB/includes/jsp.js" type="text/javascript"></script>
        <script>window.onunload = refreshParent;</script>
    </head>
    <body>
        <h1>Verwijder lid: <%= lid.getNaam() %></h1>
        <p>Het lid: <%= lid.getNaam() %> wordt permanent verwijderd. Dit kan niet ongedaan worden gemaakt. Is dat wat u wilt?</p>
        <form action="/sport" id="verwijderlidform" method="post">
            <input type="hidden" name="spelerscode" value="<%= lid.getSpelerscode() %>">
            <input type="hidden" name="verwijderlid" value="+">
            <input type="button" name="verwijderlidknop" onclick="verzendVerwijderLid()" value="Verwijder permanent">
            
            
        </form>
        
        
    </body>
</html>
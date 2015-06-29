<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="jspcursus.sport.vereniging.*" %>
    
<%
	Team team = (Team) request.getAttribute("team");
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="/AO/JSP_Java_DB/includes/jsp.js" type="text/javascript"></script>
        <script>window.onunload = refreshParent;</script>
        <title>verwijder team</title>
    </head>
    <body>
        <h1>Verwijder Team: <%= team.getTeamcode() %></h1>
        <p>Het team: <%= team.getOmschrijving() %> wordt permanent verwijderd. Dit kan niet ongedaan worden gemaakt. Is dat wat u wilt?</p>
        <form action="/sport" id="verwijderteamform" method="post">
            
            <input type="hidden" name="teamcode" value="<%= team.getTeamcode() %>">
            <input type="hidden" name="verwijderteam" value="+">
            <input type="button" onclick="verzendVerwijderTeam()" value="Verwijder permanent">
            
        </form>
        
        
    </body>
</html>
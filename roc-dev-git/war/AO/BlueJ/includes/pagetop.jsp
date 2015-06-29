<!DOCTYPE html>
<html>
<head>
<title>BlueJ</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta name="description" content="Opleiding Applicatieontwikkelaar en Mediavormgever ROC Flevoland" >
<link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Roboto' rel='stylesheet' type='text/css'>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<link href="/styles/stijl_3.css" type="text/css" rel="stylesheet">
<script src="/AO/InlJava/includes/inlJava.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="keywords" content="HTML,CSS,Javascript,Make your own 2048,Play 2048">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta name="viewport" content="width=device-width, target-densitydpi=160dpi, initial-scale=1.0, maximum-scale=1, user-scalable=no, minimal-ui">
<meta name="format-detection" content="telephone=no" />
</head>


<body>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%


	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();
	
	
	if (user == null) { %>
		<h2>Hallo, voor deze site moet je zijn ingelogd</h2>
		<p>Log in met een <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">roc-dev Account</a> voor toegang tot de site</p>
		
	<% } else {
		pageContext.setAttribute("user", user); } %>


	<!-- als gebruiker ingelogd is...-->
	<% if (user != null) { %>
		
		<!--Titelbalk pagina -->
<div id="header">
  <div class="container">
    <div class="col-md-4">
      <div id="logo"> <a href="/Welkom.jsp"><img id="rocdevlogo"src="/images/roc-dev-googlefont.png"></a> </div>
    </div>
    
    
    <!-- Titel -->
    <div class="col-md-6">
      <div id="heading">
        <h1>BlueJ</h1>
      </div>
    </div>
    
    
    <div class="col-md-2"> 
      <!-- gebruikersnaam en log uit -->
      <p class="loguit">${fn:escapeXml(user.nickname)}: <a href="http://ao.roc-dev.com/_ah/logout?continue=https://www.google.com/accounts/Logout%3Fcontinue%3Dhttps://appengine.google.com/_ah/logout%253Fcontinue%253Dhttp://ao.roc-dev.com/Welkom.jsp%26service%3Dah">afmelden</a></p>
    </div>
  </div>
  
  <!-- Navigatie -->
  <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container">
      <div class="container-fluid"> 
        <!-- Brand and toggle get grouped for better mobile display -->
        
       <!--  Navigatie -->
        
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="/Welkom.jsp">Home</a> </div>
        
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
          	<!-- <li class="active"><a href="/Welkom.jsp">Home<span class="sr-only">(current)</span></a></li> -->
            <li><a href="/AO/InlJava/H1/H1.jsp">Inleiding Java</a></li>
            <li><a href="/AO/HtmlCss/H1/H1.jsp">HTML/CSS</a></li>
            <li class="active"><a href="/AO/BlueJ/BlueJ.jsp">BlueJ<span class="sr-only">(current)</span></a></li>
            <li><a href="/AO/JSP_Java_DB/Opdrachten.jsp">JSP/Databases</a></li>
            <li><a href="/jquery">JQuery</a></li>
            <li><a href="/AO/android/H1/H1.jsp">Android</a></li>
            <li><a href="/AO/Examen/Jemeppe.jsp">Examen</a></li>
          </ul>
        </div>
        <!-- /.navbar-collapse --> 
      </div>
      <!-- /.container-fluid --> 
    </div>
  </nav>
  
  
  
  
  <div class="container"> 
    <!--Main sectie == alles onder titelbalk -->
    
    <div id="main">
    
      <div class="col-md-2"> 
        <!--Zijmenu -->
        <div id="menu">
          <h3>Inhoud</h3>
          <ol>
			<li><a href="/AO/BlueJ/BlueJ.jsp">Introductie</a></li>
				<li><a href="/AO/BlueJ/H1.jsp">Objecten</a></li>
				<li><a href="/AO/BlueJ/H2.jsp">De Schildpad</a></li>
				<li><a href="/AO/BlueJ/H3.jsp">Klassen</a></li>
				<li><a href="/AO/BlueJ/H4.jsp">Objecten met objecten</a></li>
				<li><a href="/AO/BlueJ/H5.jsp">Collecties</a></li>
		</ol>

		<h3>Web Links</h3>
			<ul>
				<li><a href="/AO/BlueJ/CDRom/Voorbeelden.zip">Voorbeelden.zip</a></li>
				<li><a href="http://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank">Java Development Kit (JDK)</a></li>
				<li><a href="http://bluej.org/" target="_blank">BlueJ</a></li>
				<li><a href="http://docs.oracle.com/javase/7/docs/api/" target="_blank">Java klassen bibliotheek (API)</a></li>
				
			</ul>
        </div>
      </div>
      
      <% } %>
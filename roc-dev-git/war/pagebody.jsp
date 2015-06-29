
<!DOCTYPE html>
<html>
<head>
<title>AO</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta name="description" content="Opleiding Applicatieontwikkelaar en Mediavormgever ROC Flevoland" >
<link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Roboto' rel='stylesheet' type='text/css'>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<link href="/styles/stijl_3.css" type="text/css" rel="stylesheet">
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
	
	
	if (user != null) {
		pageContext.setAttribute("user", user);
%>

	<!-- als gebruiker ingelogd is...-->
	
		
		<!--Titelbalk pagina -->
<div id="header">
  <div class="container">
    <div class="col-md-4">
      <div id="logo"> <a href="/Welkom.jsp"><img id="rocdevlogo"src="/images/roc-dev-googlefont.png"></a> </div>
    </div>
    
    
    <!-- Titel -->
    <div class="col-md-6">
      <div id="heading">
        <h1>Naam cursus</h1>
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
            <li><a href="/AO/BlueJ/BlueJ.jsp">BlueJ</a></li>
            <li><a href="/AO/JSP_Java_DB/Opdrachten.jsp">JSP / Java / Databases</a></li>
            <li><a href="/MV/PHP_SQL/opdrachten1.jsp">PHP/MySQL</a></li>
            <li><a href="/AO/android/H1/H1.jsp">Android apps</a></li>
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
          <h2></h2>
          <ul>
            <li></li>
          </ul>
        </div>
      </div>
      
      <div class="col-md-10">
        
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	        <h3>Leerdoelen</h3>
	        <p></p>
	          
        </div>
        
        
        <!-- Studeeraanwijzingen -->  
        <div class="bs-callout bs-callout-info">
	        <h3>Studeeraanwijzingen</h3>
	        <p> </p>
        </div>
       
        <div id="artikel">
     
        </div>
      </div>
      
      
      
      
    </div>
  </div>
</div>

<!-- Voetbalk -->


<% 
	}
	
	
else { %>
<h2>Hallo, voor deze site moet je zijn ingelogd</h2>
<p>Log in met een <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">roc-dev Account</a> voor toegang tot de site</p>


<% } %>

<!-- Latest compiled and minified JavaScript --> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>


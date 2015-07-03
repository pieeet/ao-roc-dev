<%@ include file="/includes/top.html" %>
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
        <h1>Inleiding Java</h1>
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
            <li class="active"><a href="/AO/InlJava/H1/H1.jsp">Inleiding Java<span class="sr-only">(current)</span></a></li>
            <li><a href="/AO/HtmlCss/H1/H1.jsp">HTML/CSS</a></li>
            <li><a href="/AO/BlueJ/BlueJ.jsp">BlueJ</a></li>
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
			<li><a href="/AO/InlJava/H1/H1.jsp">Introductie</a></li>
			<li><a href="/AO/InlJava/H2/H2.jsp">Applets</a></li>
			<li><a href="/AO/InlJava/H3/H3.jsp">Theorie</a></li>
			<li><a href="/AO/InlJava/H4/H4.jsp">Tekenen</a></li>
			<li><a href="/AO/InlJava/H5/H5.jsp">Variabelen</a></li>
			<li><a href="/AO/InlJava/H6/H6.jsp">Getallen</a></li>
			<li><a href="/AO/InlJava/H7/H7.jsp">Vensters 1</a></li>
			<li><a href="/AO/InlJava/H8/H8.jsp">Knoppen en tekstvakken</a></li>
			<li><a href="/AO/InlJava/H9/H9.jsp">Vensters 2</a></li>
			<li><a href="/AO/InlJava/H10/H10.jsp">Beslissingen</a></li>
			<li><a href="/AO/InlJava/H11/H11.jsp">Herhaling</a></li>
			<li><a href="/AO/InlJava/H12/H12.jsp">Tabellen</a></li>
			<li><a href="/AO/InlJava/H13/H13.jsp">Methodes</a></li>
			<li><a href="/AO/InlJava/H14/H14.jsp">Multimedia</a></li>
		</ol>

		<h3>Bijlagen</h3>
		<ul>
			<li><a href="/AO/InlJava/Bijlage1.jsp">Kleuren</a></li>
			<li><a href="/AO/InlJava/Bijlage2.jsp">Primitieve typen</a></li>
			<li><a href="/AO/InlJava/Bijlage4.jsp">Logische operatoren</a></li>
		</ul>
		
		<h3>Web Links</h3>
		<ul>
			<li><a href="https://drive.google.com/open?id=0B3XneerL-ZIcUnVoUVd0alR2N2s&authuser=0" target="_blank">Werkboek (pdf)</a></li>
			<li><a href="https://groups.google.com/a/roc-dev.com/forum/?hl=nl#!forum/inleiding-java" target="_blank">Cursus forum</a></li>
			<li><a href="http://docs.oracle.com/javase/7/docs/api/" target="_blank">Java API</a></li>
			<li><a href="http://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank">Java JDK</a></li>
			<li><a href="http://nl.wikipedia.org/wiki/Java_(programmeertaal)" target="_blank">Java Wikipedia</a></li>
		</ul>
        </div>
      </div>
      
      <% } %>
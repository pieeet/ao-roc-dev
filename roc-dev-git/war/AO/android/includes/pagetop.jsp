<%@ include file="/includes/top.html" %>
</head>

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
<body>
		<!--Titelbalk pagina -->
<div id="header">
  <div class="container">
    <div class="col-md-4">
      <div id="logo"> <a href="/Welkom.jsp"><img id="rocdevlogo"src="/images/roc-dev-googlefont.png"></a> </div>
    </div>
    
    
    <!-- Titel -->
    <div class="col-md-5">
      <div id="heading">
        <h1>Android</h1>
      </div>
    </div>
    
    
    <div class="col-md-3"> 
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
            <li><a href="/AO/InlJava/H1/H1.jsp">Inleiding Java</a></li>
            <li><a href="/AO/HtmlCss/H1/H1.jsp">HTML/CSS</a></li>
            <li><a href="/AO/BlueJ/BlueJ.jsp">BlueJ</a></li>
            <li class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">WebApps <span class="caret"></span></a><ul class="dropdown-menu">
            		 <li><a href="/AO/JSP_Java_DB/Opdrachten.jsp">JSP/Databases</a></li>
            		 <li><a href="/AO/PHP/php.jsp">PHP</a></li>
            	</ul>
			</li>
            <li><a href="/jquery">JQuery</a></li>
            <li class="active"><a href="/AO/android/H1/H1.jsp">Android</a></li>
           <li><a href="/AO/Examen/Jemeppe.jsp">Examen</a></li> 
          </ul>
        </div>        </div>
        <!-- /.navbar-collapse --> 
      </div>
      <!-- /.container-fluid --> 
    </div>
  </nav>
  
  
  
  
  <div class="container"> 
    <!--Main sectie == alles onder titelbalk -->
    
    <div id="main">
    
      <div class="col-md-3"> 
        <!--Zijmenu -->
        <div id="menu">
          <h3>Inhoud</h3>
				<ol>
					<li><a href="/AO/android/H1/H1.jsp">Ontwikkel-omgeving</a></li>
					<li><a href="/AO/android/H2/H2.jsp">Fooi Calculator</a></li>
					<li><a href="/AO/android/H3/H3.jsp">Layouts &amp; widgets</a></li>
					<li><a href="/AO/android/H4/H4.jsp">Thema&#39;s en stijlen</a></li>
					<li><a href="/AO/android/H5/H5.jsp">Menu&#39;s en instellingen</a></li>
					<li><a href="/AO/android/H6/H6.jsp">RSS Reader</a></li>
					<li><a href="/AO/android/H7/H7.jsp">Services en notificaties</a></li>
				</ol>
				
				
				<h3>Web Links</h3>
				<ul>
					<li><a href="https://developer.android.com/sdk/installing/studio.html" target="_blank">Android Studio</a></li>
					<li><a href="http://developer.android.com/index.html" target="_blank">Android developers</a></li>
					<li><a href="http://developer.android.com/reference/packages.html" target="_blank">Android API</a></li>
					<li><a href="https://developer.android.com/design/downloads/index.html" target="_blank">Iconen downloads</a></li>
				</ul>
        </div>
      </div>
      
      <% } %>
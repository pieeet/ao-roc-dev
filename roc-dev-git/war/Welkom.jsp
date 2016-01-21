
<%@ include file="/includes/top.html" %>


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
	}
%>

	<!-- als gebruiker ingelogd is...-->
	
		
		<!--Titelbalk pagina -->
<div id="header">
  <div class="container">
    <div class="col-md-3">
      <div id="logo"> <a href="/Welkom.jsp"><img id="rocdevlogo"src="images/roc-dev-googlefont.png"></a> </div>
    </div>
    
    
    <div class="col-md-6">
      <div id="heading">
        <h1>ApplicatieOntwikkelaar</h1>
      </div>
    </div>
    
    
  </div>
  
  <!-- Navigatie -->
  <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container">
      <div class="container-fluid"> 
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="/Welkom.jsp">Home</a> </div>
        
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
            	aria-haspopup="true" aria-expanded="false">Java <span class="caret"></span></a>
            	<ul class="dropdown-menu">
            		 <li><a href="/AO/InlJava/H1/H1.jsp">Inleiding Java</a></li>
            		 <li><a href="/AO/Greenfoot/greenfoot1.jsp">Greenfoot</a></li>
            		 <li><a href="/AO/BlueJ/BlueJ.jsp">BlueJ</a></li>
            	</ul>
			</li>
            <li><a href="/AO/HtmlCss/H1/H1.jsp">HTML/CSS</a></li>
            <li class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">WebApps <span class="caret"></span></a><ul class="dropdown-menu">
            		 <li><a href="/AO/JSP_Java_DB/Opdrachten.jsp">JSP</a></li>
            		 <li><a href="/AO/PHP/php.jsp">PHP</a></li>
            		 <li><a href="/jquery">JQuery</a></li>
            	</ul>
			</li>
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
      <div class="col-md-3"> 
        <!--Zijmenu -->
        <div id="menu">
          <h3>Cursussen</h3>
          <ul>
            <li><a href="/AO/InlJava/H1/H1.jsp">Inleiding Java</a></li>
            <li><a href="/AO/HtmlCss/H1/H1.jsp">HTML/CSS</a></li>
            <li><a href="/AO/BlueJ/BlueJ.jsp">BlueJ</a></li>
            <li><a href="/AO/JSP_Java_DB/Opdrachten.jsp">JSP/Databases</a></li>
            <li><a href="/jquery">JQuery</a></li>
            <li><a href="/AO/android/H1/H1.jsp">Android</a></li>
            <li><a href="/AO/Examen/Jemeppe.jsp">Examen</a></li> 
          </ul>
          <h3>Studenten</h3>
          <ul>
          	<li><a href="/studenten">Portfolio&#39;s</a></li>
          </ul>
        </div>
      </div>
      
      <div class="col-md-9">
        
        <h2>Welkom ${fn:escapeXml(user.nickname)}!</h2>
        <div class="bs-callout bs-callout-warning">
	        <h3>Leerdoelen</h3>
	        <p>Het doel van deze website is om je te helpen met de vakken van AO. Per cursus vind je hier de leerdoelen 
	          studeeraanwijzingen, de opgaven en uitwerkingen van de opgaven. De studie AO stoomt je klaar  
	          voor het vak Applicatie-ontwikkelaar en geeft je toeganng tot een HBO vervolgstudie. Wat je precies aan het eind van de studie 
	          moet kennen en kunnen wordt uitgebreid beschreven in de landelijk vastgestelde <a href="/AO/kd_ao.pdf" target="_blank">kwalificatiebeschrijving</a> Applicatie- en 
	          mediaontwikkeling.</p>
	          <div class="embed-responsive embed-responsive-16by9">
	            <iframe width="480" height="360" src="//www.youtube.com/embed/EAkQejGAMoo" frameborder="0" allowfullscreen></iframe>
        	  </div>
        </div>
          
        <div class="bs-callout bs-callout-info">
	        <h3>Studeeraanwijzingen</h3>
	        <p>Het leren van programmeertalen en het schrijven van code lijkt wel een beetje op het leren van autorijden. Deels heb je 
	          theorie nodig, maar je leert het vooral door het veel in de praktijk te doen.
	          Tijdens de cursussen &quot;programmeren&quot; 
	          zul je daarom heel veel opdrachten krijgen die je uit moet werken. Om je een beetje op weg te helpen vind je op deze site 
	          uitwerkingen. Probeer eerst zelf de opgaven te maken, maar blijf niet te lang ploeteren. Kom je er niet uit: kijk dan 
	          naar de uitwerkingen en probeer het dan nogmaals. </p>
        </div>
       
        <div id="artikel">
     
        </div>
      </div>
    </div>
  </div>
</div>


<!-- Voetbalk -->

<!-- Latest compiled and minified JavaScript --> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>

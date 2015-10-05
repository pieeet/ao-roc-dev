<%@ include file="/includes/top.html" %>
</head>

<body>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="mvsite.student.*" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%


	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();
	Student student = null;
	
	if (user != null) {
		pageContext.setAttribute("user", user);
		ArrayList<Student> studenten = (ArrayList<Student>) request.getAttribute("studentlijst");
		
		for (Student s: studenten) {
			if (s.getEmail().equals(user.getEmail())) {
				student = s;
				break;
			}
		}
	}	
		
%>

	<!-- als gebruiker is ingelogd...-->
	
		
		<!--Titelbalk pagina -->
<div id="header">
  <div class="container">
    <div class="col-md-3">
      <div id="logo"> <a href="/Welkom.jsp"><img id="rocdevlogo"src="images/roc-dev-googlefont.png"></a> </div>
    </div>
    
    
    <div class="col-md-6">
      <div id="heading">
        <h1>Portfolio&#39;s studenten</h1>
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
          	<!-- <li class="active"><a href="/Welkom.jsp">Home<span class="sr-only">(current)</span></a></li> -->
            <li class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
            	aria-haspopup="true" aria-expanded="false">Java <span class="caret"></span></a>
            	<ul class="dropdown-menu">
            		 <li><a href="/AO/InlJava/H1/H1.jsp">Inleiding Java</a></li>
            		 <li><a href="/AO/BlueJ/BlueJ.jsp">BlueJ</a></li>
            	</ul>
			</li>
            <li><a href="/AO/HtmlCss/H1/H1.jsp">HTML/CSS</a></li>
            <li class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
            	aria-haspopup="true" aria-expanded="false">WebApps <span class="caret"></span></a>
            	<ul class="dropdown-menu">
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
     
       <div class="bs-callout bs-callout-info">
       	<h2>Code-Ninja levels</h2>
				<p>Aan het einde van het eerste jaar - voordat je op stage gaat - maak je met 
				behulp van HTML, CSS, Java, Java Server Pages (JSP), een 
				database en eventueel JavaScript een interactieve website. 
				Je eindprodukt wordt beoordeeld aan de hand van vooraf vastgestelde criteria resulterend 
				in een Code-Ninja level: wit, groen, zwart en goud.</p>
				<div id="ninja_pics">
					<div class="ninja_paar">
						<img src="/images/white_belt.png" class="ninja_img_uitleg">
						<img src="/images/green_belt.png" class="ninja_img_uitleg">
					</div>
					<div class="ninja_paar">
						<img src="/images/black_belt.png" class="ninja_img_uitleg">
						<img src="/images/master.png" class="ninja_img_uitleg">
					</div>
				</div>
				<ul>
					<li>wit: (nog) niet gehaald</li>
					<li>groen: voldoende</li>
					<li>zwart: goed</li>
					<li>goud: briljant</li>
				</ul>
				<p>De ervaring leert dat studenten met een goed online portfolio gemakkelijker een goede stageplek 
				weten te bemachtigen. Het maken van een goed portfolio is een flinke klus. We raden je dan ook aan 
				hier zo snel mogelijk mee te beginnen.</p>
       </div>
       <% if (user == null)  { %>
       	<p>Log in met een <a href="<%= userService.createLoginURL("http://ao.roc-dev.com/studenten") %>">roc-dev Account</a> om je
       	portfolio te publiceren.</p>
       <% } %>
       <div id="portfolios">
       		${portfolios }
       </div>
       
       
       
        <% if (student == null && user != null)  { %>
        <div class="bs-callout bs-callout-warning">
        	
	    	<h2>Publiceer je portfolio</h2>
	    	
			
				<p>Meld je aan om je portfolio op deze pagina te publiceren</p>
				<form action="/studenten" method="post">
					<div class="formulier">
						<div class="formulier_regel">
							<label class="formulier_label">Voornaam</label>
							<input type="text" name="nieuwe_student_voornaam" class="formulier_input">
						</div>
						<div class=formulier_regel>
							<label class="formulier_label">Tussenvoegsels</label>
							<input type="text" name="nieuwe_student_tussenvoegsels" class="formulier_input">
						</div>
						<div class="formulier_regel">
							<label class="formulier_label">Achternaam</label>
							<input type="text" name="nieuwe_student_achternaam" class="formulier_input">
						</div>
						<div class="formulier_regel">
							<label class="formulier_label">Cohort</label>
							<select name="cohort" class="formulier_input formulier_input_marge">
								<option value="2013">2013</option>
								<option value="2014">2014</option>
								<option value="2015">2015</option>
							</select>
						</div>
						<div class="formulier_regel">
							<label class="formulier_label">URL portfolio</label>
							<input type="url" name="nieuwe_student_portfolio" class="formulier_input" value="http://">
						</div>
						<div class="formulier_regel">
							<input type="submit" class="formulier_input formulier_input_marge" name="nieuwe_student_knop">
						</div>
					</div>
					<input type="hidden" name="nieuwe_student_email" value="${user.email }">
				</form>
				<% if (request.getAttribute("boodschap") != null) { %>
				<p>${boodschap }</p>
			<%}  %>
			
			<% } else if (student != null){ %>
			<div class="bs-callout bs-callout-warning">
			<h2>Beheer je portfolio</h2>
				<form action="/studenten" method="post">
					<div class="formulier">
						<div class="formulier_regel">
							<label class="formulier_label">URL portfolio</label>
							<input type="url" name="nieuwe_student_portfolio" class="formulier_input" value="<%=student.getWebpage() %>">
						</div>
						<div class="formulier_regel">
							<input type="submit" class="formulier_input formulier_input_marge" name="wijzig_url_knop" value="wijzig portfolio">
						</div>
					<input type="hidden" name="nieuwe_student_email" value="${user.email }">
				</div>
				</form>
				<% if (request.getAttribute("boodschap") != null) { %>
					<p>${boodschap }</p>
					
				<% }  %>
        </div>
        
        <% } %>
		
		
		</div>
		
		


	
    </div>
  </div>
</div>
<!-- Latest compiled and minified JavaScript --> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>



      
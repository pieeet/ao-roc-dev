<%@ include file="/includes/top.html"%>
</head>

<body>

	<%@ page contentType="text/html;charset=UTF-8" language="java"%>
	<%@ page import="java.util.ArrayList"%>
	<%@ page import="com.google.appengine.api.users.User"%>
	<%@ page import="com.google.appengine.api.users.UserService"%>
	<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
	<%@ page import="mvsite.student.*"%>

	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		Student student = null;

		if (user != null) {
			pageContext.setAttribute("user", user);

		}
	%>

	<!-- als gebruiker is ingelogd...-->


	<!--Titelbalk pagina -->
	<div id="header">
		<div class="container">
			<div class="col-md-3">
				<div id="logo">
					<a href="/Welkom.jsp"><img id="rocdevlogo"
						src="images/roc-dev-googlefont.png"></a>
				</div>
			</div>


			<div class="col-md-8">
				<div id="heading">
					<h1>Stages en projecten</h1>
				</div>
			</div>



		</div>

		<!-- Navigatie -->
		<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
			<div class="container">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="/Welkom.jsp">Home</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<!-- <li class="active"><a href="/Welkom.jsp">Home<span class="sr-only">(current)</span></a></li> -->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Java <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/AO/InlJava/H1/H1.jsp">Inleiding Java</a></li>
									<li><a href="/AO/Greenfoot/greenfoot1.jsp">Greenfoot</a></li>
									<li><a href="/AO/BlueJ/BlueJ.jsp">BlueJ</a></li>
								</ul></li>
							<li><a href="/AO/HtmlCss/H1/H1.jsp">HTML/CSS</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">WebApps <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/AO/JSP_Java_DB/Opdrachten.jsp">JSP</a></li>
									<li><a href="/AO/PHP/php.jsp">PHP</a></li>
									<li><a href="/jquery">JQuery</a></li>
								</ul></li>
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
				<div class="col-md-8">
				<h2>Marktplaats stages en projecten</h2>
				<p>Bent u op zoek naar een ambitieuze student
					applicatieontwikkeling, dan kunt u hier uw project of stage
					publiceren. Onze studenten zijn altijd op zoek naar
					praktijkopdrachten waarmee ze in de praktijk kunnen laten zien wat
					ze waard zijn. Om een project of stage te publiceren dient u ingelogd 
					zijn.  <a href="inlog-bedrijven.jsp">Log in/registreer</a></p>
					
					
					
					

				
				
				
				
				












			</div>
		</div>
	</div>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
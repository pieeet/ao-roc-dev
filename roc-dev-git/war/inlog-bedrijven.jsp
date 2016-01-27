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
				<div class="col-md-6">
				<h2>Marktplaats stages en projecten</h2>
				

				<h3>Inloggen</h3>
				<p>Als u zich geregistreerd hebt kunt u hier inloggen</p>
				<form role="form" id="inlog-bedrijf">
					<fieldset>
						<div class="form-group">
							<label for="naam">E-mail:</label> <input
								class="form-control" type="email" name="naam"
								id="email" required>
							<!-- <p class="contact-warning" id="naam-warning">Vul je email in</p> -->
						</div>
						<div class="form-group">
							<label for="email">Wachtwoord:</label> <input
								class="form-control" type="password" name="password"
								id="contactform-email" required>
							<!-- <p class="contact-warning" id="email-warning">Vul uw wachtwoord
								in</p> -->
						</div>
						
					</fieldset>
				</form>
				
				
				<h3>Registreren</h3>
				<p>Om een project of stage te publiceren hebben we de volgende gegevens nodig:</p>
				<form role="form" id="inlog-bedrijf">
					<fieldset>
						<div class="form-group">
							<label for="naam">E-mail:</label> <input
								class="form-control" type="text" name="naam"
								id="contactform-naam" required>
							<p class="contact-warning" id="naam-warning">Vul je email in</p>
						</div>
						<div class="form-group">
							<label for="email">E-mail (verplicht):</label> <input
								class="form-control" type="email" name="email"
								id="contactform-email" placeholder="je e-mail" required>
							<p class="contact-warning" id="email-warning">Vul een email
								in</p>
						</div>
						<div class="form-group">
							<label for="telefoon">Telefoon:</label> <input
								class="form-control" type="text" name="telefoon"
								id="contactform-telefoon" placeholder="je telefoonnummer">
						</div>
						<div class="form-group">
							<label for="vraag">Vraag (verplicht):</label>
							<textarea class="form-control" name="vraag" form="contact-form"
								id="contactform-vraag" rows="5" placeholder="stel hier je vraag"
								required></textarea>
							<p class="contact-warning" id="vraag-warning">Stel een vraag</p>
						</div>
						<div class="form-group">
							<label for="tijden">Hoe en wanneer kan ik je het best
								bereiken :</label> <input class="form-control" type="text"
								name="bereiken" id="contactform-bereiken"
								placeholder="hoe en waneer kan ik je het beste bereiken">
						</div>
						<input type="submit" value="Verzenden"
							class="btn btn-danger btn-lg verstuur-gegevens"
							id="verzend-contact-form-btn" name="verzend-contact-form-btn">
					</fieldset>
				</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
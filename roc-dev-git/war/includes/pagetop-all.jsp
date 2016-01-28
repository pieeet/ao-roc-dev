<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>AO</title>

<meta name="description"
	content="Opleiding Applicatieontwikkelaar en Mediavormgever ROC Flevoland">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta name="viewport"
	content="width=device-width, target-densitydpi=160dpi, initial-scale=1.0, maximum-scale=1, user-scalable=no, minimal-ui">
<meta name="format-detection" content="telephone=no" />
<link
	href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Roboto|Cabin:700|Lato'
	rel='stylesheet' type='text/css'>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	type='text/css'>
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css"
	type='text/css'>
<link href="/styles/stijl_3.css" type="text/css" rel="stylesheet">
<style>
.navbar-header a.active {
	color: #fff;
	background-color: #080808;
}
</style>
</head>

<body>


	<%@ page import="java.util.List"%>
	<%@ page import="com.google.appengine.api.users.User"%>
	<%@ page import="com.google.appengine.api.users.UserService"%>
	<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



	<!--Titelbalk pagina -->
	<div id="header">
		<div class="container">
			<div class="col-md-3">
				<div id="logo">
					<a href="/Welkom.jsp"><img id="rocdevlogo"
						src="/images/roc-dev-googlefont.png"></a>
				</div>
			</div>


			<!-- Titel -->
			<div class="col-md-6">
				<div id="heading">
					<h1 id="page-title-heading"></h1>
				</div>
			</div>

			<!-- als gebruiker ingelogd is...-->
			<%
				UserService userService = UserServiceFactory.getUserService();
				User user = userService.getCurrentUser();

				if (user != null) {
					pageContext.setAttribute("user", user);
			%>

			<div class="col-md-3">
				<!-- gebruikersnaam en log uit -->
				<p class="loguit">${fn:escapeXml(user.nickname)}:
					<a
						href="http://ao.roc-dev.com/_ah/logout?continue=https://www.google.com/accounts/Logout%3Fcontinue%3Dhttps://appengine.google.com/_ah/logout%253Fcontinue%253Dhttp://ao.roc-dev.com/Welkom.jsp%26service%3Dah">afmelden</a>
				</p>
			</div>
			<%
				}
			%>


		</div>

		<!-- Navigatie -->
		<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
			<div class="container">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->

					<!--  Navigatie -->

					<div class="navbar-header">
						<button id="home-button" type="button"
							class="navbar-toggle collapsed" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span> 
						</button>
						<a id="home-link" class="navbar-brand" href="/">Home</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="dropdown menu-item" id="menu-item-java"><a
								href="#" class="dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Java
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li class="menu-item menu-sub-item"
										id="menu-item-inleiding-java"><a
										href="/AO/inleiding-java/h1">Inleiding Java</a></li>
									<li class="menu-item menu-sub-item" id="menu-item-greenfoot"><a
										href="/AO/greenfoot/greenfoot">Greenfoot</a></li>
									<li class="menu-item menu-sub-item" id="menu-item-bluej"><a
										href="/AO/BlueJ/intro">BlueJ</a></li>
								</ul></li>
							<li class="menu-item" id="menu-item-html-css"><a
								href="/AO/htmlcss/h1">HTML/CSS</a></li>
							<li class="dropdown menu-item" id="menu-item-web-apps"><a
								href="#" class="dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">WebApps
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li class="menu-item menu-sub-item" id="menu-item-jsp"><a
										href="/AO/jsp/deel1">JSP</a></li>
									<li class="menu-item menu-sub-item" id="menu-item-php"><a
										href="/AO/php/php1">PHP</a></li>
									<li class="menu-item menu-sub-item" id="menu-item-jquery"><a
										href="/AO/jquery/jquery1">JQuery</a></li>
								</ul></li>
							<li class="menu-item" id="menu-item-android"><a
								href="/AO/android/h1">Android</a></li>
							<li class="menu-item" id="menu-item-examen"><a
								href="/AO/examen/jemeppe">Examen</a></li>
						</ul>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</div>
			</div>

		</nav>
	</div>
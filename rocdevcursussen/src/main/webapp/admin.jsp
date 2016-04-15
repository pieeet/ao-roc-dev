<!DOCTYPE html>
<html>
<head>
    <title>AO</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="Opleiding Applicatieontwikkelaar en Mediavormgever ROC Flevoland">
    <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Roboto' rel='stylesheet' type='text/css'>
    <link href="styles/stijl_3.css" type="text/css" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
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
	boolean admin = false;
	if (request.getAttribute("admins") == null) {
		response.sendRedirect("/_admin");
	} else {
		if (user != null) {
			String[] admins = (String[]) request.getAttribute("admins");
			
			for (String s: admins) {
				if (s.equals(user.getEmail())) {
					admin = true;
				}
			}
		}
		
		if (user != null && admin) {
			pageContext.setAttribute("user", user);
			ArrayList<Student> studenten = (ArrayList<Student>) request.getAttribute("studentlijst");
			Student student = null;
			if (request.getAttribute("student") != null) {
				student = (Student) request.getAttribute("student");
			}
			
			
	%>

<!-- als gebruiker is geregistreerd als admin...-->


<!--Titelbalk pagina -->
<div id="header">
    <div class="container">
        <div class="col-md-4">
            <div id="logo"><a href="/Welkom.jsp"><img id="rocdevlogo" src="images/roc-dev-googlefont.png"></a></div>
        </div>


        <div class="col-md-6">
            <div id="heading">
                <h1>Admin roc-dev</h1>
            </div>
        </div>


        <div class="col-md-2">
            <!-- gebruikersnaam en log uit -->
            <p class="loguit">${fn:escapeXml(user.nickname)}: <a
                    href="http://ao.roc-dev.com/_ah/logout?continue=https://www.google.com/accounts/Logout%3Fcontinue%3Dhttps://appengine.google.com/_ah/logout%253Fcontinue%253Dhttp://ao.roc-dev.com/Welkom.jsp%26service%3Dah">afmelden</a>
            </p>
        </div>
    </div>

    <!-- Navigatie -->
    <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
        <div class="container">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1"><span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/Welkom.jsp">Home</a></div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <!-- <li class="active"><a href="/Welkom.jsp">Home<span class="sr-only">(current)</span></a></li> -->
                        <li><a href="/AO/InlJava/H1/H1.jsp">Inleiding Java</a></li>
                        <li><a href="/AO/HtmlCss/H1/H1.jsp">HTML/CSS</a></li>
                        <li><a href="/AO/BlueJ/BlueJ.jsp">BlueJ</a></li>
                        <li><a href="/AO/JSP_Java_DB/Opdrachten.jsp">JSP/Databases</a></li>
                        <li><a href="/MV/PHP_SQL/opdrachten1.jsp">PHP/MySQL</a></li>
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
                    <h3>Cursussen</h3>
                    <ul>
                        <li><a href="/AO/InlJava/H1/H1.jsp">Inleiding Java</a></li>
                        <li><a href="/AO/HtmlCss/H1/H1.jsp">HTML/CSS</a></li>
                        <li><a href="/AO/BlueJ/BlueJ.jsp">BlueJ</a></li>
                        <li><a href="/AO/JSP_Java_DB/Opdrachten.jsp">JSP/Databases</a></li>
                        <li><a href="/MV/PHP_SQL/opdrachten1.jsp">PHP/MySQL</a></li>
                        <li><a href="/AO/android/H1/H1.jsp">Android</a></li>
                        <li><a href="/studenten">Portfolio&#39;s van studenten</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-10">

                <h2>Beheer omgeving</h2>
                <div class="bs-callout bs-callout-warning">
                    <% if (student == null) {%>
                    <p>Voer het exacte roc-dev.com e-mail adres in van de gebruiker die je wilt bewerken</p>
                    <form action="/_admin" method="post">
                        <input type="email" name="email_gebruiker" value="...@roc-dev.com">
                        <input type="submit" name="zoek_gebruiker_knop" value="zoek gebruiker">
                    </form>
                    <% } else { %>
                    <form action="/_admin" method="post">
                        <table>
                            <tr>
                                <td><label>Voornaam</label></td>
                                <td><input type="text" name="wijzig_student_voornaam" size="20"
                                           value="<%= student.getVoornaam() %>"></td>
                            </tr>
                            <tr>
                                <td><label>Tussenvoegsels</label></td>
                                <td><input type="text" name="wijzig_student_tussenvoegsels" size="12"
                                           value="<%= student.getTussenvoegsels() %>"></td>
                            </tr>
                            <tr>
                                <td><label>Achternaam</label></td>
                                <td><input type="text" name="wijzig_student_achternaam" size="20"
                                           value="<%= student.getAchternaam() %>"></td>
                            </tr>
                            <tr>
                                <td><label>Cohort</label></td>
                                <td><input type="number" name="wijzig_student_cohort"
                                           value="<%= student.getCohort() %>">
                            </tr>
                            <tr>
                                <td><label>URL portfolio</label></td>
                                <td><input type="text" name="wijzig_student_portfolio"
                                           value="<%= student.getWebpage() %>"></td>
                            </tr>
                            <tr>
                                <td><label>Level</label></td>
                                <td><input type="number" name="wijzig_student_level" value="<%= student.getLevel() %>">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" name="wijzig_student_knop" value="wijzig"></td>
                            </tr>
                        </table>
                        <input type="hidden" name="wijzig_student_email" value="<%= student.getEmail() %>">
                    </form>
                    <% } %>
                </div>

                <div class="bs-callout bs-callout-info">
                    <table id="studentenoverzicht">
                        <tr>
                            <th>naam</th>
                            <th>cohort</th>
                            <th>level</th>
                            <th>email</th>
                        </tr>
                        <%for (Student s : studenten) { %>
                        <tr>
                            <td>
                                <%= s.getHeleNaam() %>
                            </td>

                            <td>
                                <%= s.getCohort() %>
                            </td>

                            <td>
                                <%= s.getLevel() %>
                            </td>
                            <td>
                                <%= s.getEmail() %>
                            </td>
                        </tr>
                        <% } %>
                    </table>
                </div>


                <div id="artikel">

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Voetbalk -->


    <%
		} else { %>
<h2>Sorry, alleen moderators hebben toegang tot deze pagina </h2>
<p>Log in met een <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">roc-dev moderator account</a>
    voor toegang tot de site</p>


    <% }
	%>

<!-- Latest compiled and minified JavaScript -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>


    <% } %>
	



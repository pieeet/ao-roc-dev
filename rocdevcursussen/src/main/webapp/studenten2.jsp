

<%@ page import="java.util.ArrayList" %>
<%@ page import="mvsite.student.*" %>
<%@ include file="/includes/pagetop-all.jsp"%>

<%
	Student student = null;
	if (user != null) {
		ArrayList<Student> studenten = (ArrayList<Student>) request.getAttribute("studentlijst");
		for (Student s: studenten) {
			if (s.getEmail().equals(user.getEmail())) {
				student = s;
				break;
			}
		}
	}	
%>

	
      
      <div class="container">
	  <%@ include file="/includes/zijmenu.jsp"%>
      
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
						<img src="<c:url value="/images/white_belt.png"/>" class="ninja_img_uitleg">
						<img src="<c:url value="/images/green_belt.png"/>" class="ninja_img_uitleg">
					</div>
					<div class="ninja_paar">
						<img src="<c:url value="/images/black_belt.png"/>" class="ninja_img_uitleg">
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
       <div class="clear"></div>
       
       
        <% if (student == null && user != null)  { %>
        <div class="bs-callout bs-callout-warning">
        	
	    	<h2 id="portfolio-form">Publiceer je portfolio</h2>
	    	
			
				<p>Meld je aan om je portfolio op deze pagina te publiceren</p>
				<form action="/studenten" method="post">
					<div class="formulier">
						<div class="formulier_regel">
							<label class="formulier_label">Voornaam</label>
							<input type="text" name="nieuwe_student_voornaam" class="formulier_input" maxlength="20">
						</div>
						<div class=formulier_regel>
							<label class="formulier_label">Tussenvoegsels</label>
							<input type="text" name="nieuwe_student_tussenvoegsels" class="formulier_input" maxlength="15">
						</div>
						<div class="formulier_regel">
							<label class="formulier_label">Achternaam</label>
							<input type="text" name="nieuwe_student_achternaam" class="formulier_input" maxlength="20">
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
<%@ include file="/includes/bottom-portfolios.html"%>	
</html>



      
<%@ include file="/AO/JSP_Java_DB/includes/pagetop.jsp" %>
<%@ page import="jspcursus.autoshop.Auto" %>
<%@ page import="jspcursus.autoshop.AutoLijst" %>
<%@ page import="java.util.ArrayList" %>


<%	if (user != null) { %>

<%
AutoLijst al = new AutoLijst();
ArrayList<Auto> autos = al.getLijst();
ArrayList<Auto> selectie = new ArrayList<Auto>();
ArrayList<String> merken = al.getMerken();



if (request.getParameter("kies_knop") != null) {
	int minPrijs = 0;
	int maxPrijs = Integer.MAX_VALUE;
	String merk = request.getParameter("merk");
	if (!request.getParameter("min_prijs").equals("")) {
		minPrijs = Integer.parseInt(request.getParameter("min_prijs"));
	}
	if (!request.getParameter("max_prijs").equals("")) {
		maxPrijs = Integer.parseInt(request.getParameter("max_prijs"));
	}
	for (Auto a: autos) {
		if (merk.equals("alle merken")) {
			if (a.getPrijs() <= maxPrijs && a.getPrijs() >= minPrijs) {
				selectie.add(a);
			}
		} else {
			if (a.getMerk().equals(merk) && a.getPrijs() <= maxPrijs && a.getPrijs() >= minPrijs) {
				selectie.add(a);
			}
		}
	}
} else {
	selectie = autos;
}

%>

      <!-- inhoud -->
      <div class="col-md-10">
 
        <!-- oranje border links -->
        <div class="bs-callout bs-callout-warning">
        
     		<form action="demo.jsp" method="get">
	      		<label>Kies Merk</label>
	      		<select name="merk">
					<option value="alle merken">alle merken</option>
	 <%				for (String merk: merken) { %>
	 					<option value="<%= merk %>"><%= merk %></option>
	<% 				}
	 %>     		
	      		</select><br>
	      		<label>Minimum prijs</label>
	      		<input type="number" name="min_prijs">
	      		<label>Maximum prijs</label>
	      		<input type="number" name="max_prijs"><br>
	      		<input type="submit" name="kies_knop" value="Ok">

      		</form>
        </div>
   <%
   		for (Auto auto: selectie) { %>
   			<div class="autokader">
   				<p class="merktype"><%= auto.getMerk() %> <%= auto.getType() %></p>
   				<img src="<%= auto.getFoto() %>">
   				<p class="prijs"><%=auto.getPrijs() %></p>
   			
   			</div>
   <%	}
   %>
        
        
        <!-- blauwe border links -->
        <div class="bs-callout bs-callout-info">

        </div>

				
		</div>


	<!-- 3 afsluitdivs uit include file -->
    </div>
  </div>
</div>
</body>	

<!-- <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Roboto' rel='stylesheet' type='text/css'>
Latest compiled and minified Bootstrap CSS
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"> -->
<!-- Optional theme -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<link href="/styles/stijl_3.css" type="text/css" rel="stylesheet"> -->
<script src="/AO/InlJava/includes/inlJava.js" type="text/javascript"></script>
<script src="/AO/JSP_Java_DB/includes/jsp.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>


<% } %>

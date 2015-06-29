<%@ include file="/AO/JSP_Java_DB/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-10">
      <h2>Conversie van Celsius naar Fahrenheit</h2>
  		<%
				int celsius;
				int fahr;
				String tekst = "";
				try {
					celsius = Integer.parseInt(request.getParameter("celsius"));
					fahr = Math.round(celsius * 1.8f + 32);
					//alternatief
					//fahr = (int) Math.round(celsius * 1.8 + 32);
					tekst = celsius + " graden Celsius is " + fahr + " graden Fahrenheit";
				}
				catch(NumberFormatException e) {
					tekst = "Foute invoer, u moet een geheel getal invoeren";
				}
				finally {
					
				}
				%>
				<p><%= tekst %></p>
				
				<p>Ga <a href="Opdrachten_2.jsp#opg10">terug</a> naar de cursus pagina.</p>
       
        
        
        
        <!-- inhoud -->
        
		
				
		</div>


	
    </div>
  </div>
</div>

<!-- <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Roboto' rel='stylesheet' type='text/css'>
Latest compiled and minified Bootstrap CSS
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
Optional theme
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<link href="/styles/stijl_3.css" type="text/css" rel="stylesheet"> -->
<script src="/AO/InlJava/includes/inlJava.js" type="text/javascript"></script>
<script src="/AO/JSP_Java_DB/includes/jsp.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	
<% } %>

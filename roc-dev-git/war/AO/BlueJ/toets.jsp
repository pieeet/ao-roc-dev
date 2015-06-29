<%@ include file="/AO/BlueJ/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-10">
      
      	
      	<h2>Toets BlueJ</h2>
      	<div id="blueJ_toets">
      	
      	
      	<%if (request.getAttribute("toets") == null) { %>
      		<form action="/bluejtoets" method="post">
	      		<input type="hidden" name="user" value="<%= user.getNickname() %>">
	      		<input type="submit" name="toets_knop" value="ga naar toets">
	      	</form>
      	<% }  else { %>
      		
      		<p>${ toets }</p>
      		<p>Succes!</p>
      	<% } %>
      		
      	
	      	
      	</div>

					
	  </div>


	
    </div>
  </div>
</div>
	
<% } %>

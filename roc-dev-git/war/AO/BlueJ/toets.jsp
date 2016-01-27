<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

<%@ include file="/AO/BlueJ/includes/zijmenu.jsp" %>

      
      <div class="col-md-9">
      
      	
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
<%@ include file="/AO/BlueJ/includes/bottom.html" %>
	


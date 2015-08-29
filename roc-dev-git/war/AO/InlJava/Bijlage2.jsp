<%@ include file="/AO/InlJava/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-9">
        
       <h2>Bijlage 2 Primitieve typen</h2>
					
					<table>
						<tr>
							<th>Type</th><th>Aantal cellen</th><th>Waardebereik</th>
						<tr>
							<td>boolean</td><td>1</td><td>true of false</td>
						</tr>
						<tr>
							<td>byte</td><td>1</td><td>-128 tot en met +127</td>
						</tr>
						<tr>
							<td>char</td><td>1</td><td>0 t/m 255</td>
						</tr>
						<tr>
							<td>short</td><td>2</td><td>-32.768 tot en met 32.767</td>
						</tr>
						<tr>
							<td>int</td><td>4</td><td>-2.147.483.648 tot en met 2.147.483.647</td>
						</tr>
						<tr>
							<td>float</td><td>4</td><td>3.4<sup>e</sup> - 38 tot en met 3.4<sup>e</sup> + 38
							
						</tr>
						<tr>
							<td>long</td><td>8</td><td>-9223372036854775808 tot en met 9223372036854775807</td>
							
						</tr>
						<tr>
							<td>double</td><td>8</td><td>1.7<sup>e</sup> - 308 tot en met 1.7<sup>e</sup> + 308</td>
						</tr>
						
					</table>
					
					<p>Van deze primitieve typen zijn alleen float en double geschikt voor gebroken getallen. Float heeft een 
					precisie van 7 en double van 15. Daarom wordt aangeraden zo veel mogelijk double te gebruiken en alleen als 
					een methode erom vraagt het type float te gebruiken voor gebroken getallen.</p>
					
					<p>Voor de duidelijkheid: Een string is geen primitief type.</p>
				
		</div>


	
    </div>
  </div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="/AO/InlJava/includes/inlJava.js" type="text/javascript"></script>	
<% } %>

<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

<%@ include file="/AO/InlJava/includes/zijmenu.jsp" %>
      
      <div class="col-md-9">
     	<h2>Bijlage 3 Tabellen logische operatoren</h2>
					<p> de en-tabel</p>
					<table>
						<tr>
							<th>Eerste voorwaarde</th><th>Tweede voorwaarde</th><th>Resultaat van &amp;&amp;</th>
						<tr>
							<td>true</td><td>true</td><td>true</td>
						</tr>
						<tr>
							<td>true</td><td>false</td><td>false</td>
						</tr>
						<tr>
							<td>false</td><td>false</td><td>false</td>
						</tr>
						<tr>
							<td>false</td><td>true</td><td>false</td>
						</tr>
					</table>
					<p>de of-tabel</p>
					<table>
						<tr>
							<th>Eerste voorwaarde</th><th>Tweede voorwaarde</th><th>Resultaat van ||</th>
						<tr>
							<td>true</td><td>true</td><td>true</td>
						</tr>
						<tr>
							<td>true</td><td>false</td><td>true</td>
						</tr>
						<tr>
							<td>false</td><td>false</td><td>false</td>
						</tr>
						<tr>
							<td>false</td><td>true</td><td>true</td>
						</tr>
					</table>
					<p>de niet-tabel</p>
					<table>
						<tr>
							<th>voorwaarde</th><th>resultaat van !</th>
						<tr>
							<td>true</td><td>false</td>
						</tr>
						<tr>
							<td>false</td><td>true</td>
						</tr>
						
					</table>
				
		</div>


	
    </div>
  </div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="/AO/InlJava/includes/inlJava.js" type="text/javascript"></script>	


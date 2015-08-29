<%@ include file="/AO/BlueJ/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-9">
	       <h2>De Schildpad</h2>
	        <!-- Leerdoelen -->
	        <div class="bs-callout bs-callout-warning">
		       <h2>Leerdoelen</h2>
					<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je de volgende begrippen kent en kunt gebruiken:</p>
					<ul>
						
						<li>argumenten of parameters </li>
						<li>retour- of terugkeerwaarde &amp; void</li>
						<li>public</span></li>
						<li>body  van klasse/methode</li>
						<li>statement</li>
						<li>compile</li>
						<li>overloading</li>
						<li>javadoc</li>
						
					</ul>
		          
	        </div>
	
			<p>In dit hoofdstuk ga je aan de slag met de <i>klasse</i> Schildpad. Deze kun je vinden in de voorbeelden. 
			De klasse Schildpad is gebaseerd op het programma Logo dat in 1967 werd ontwikkeld door Seymour Papert. Hiermee raak je 
			spelenderwijs vertrouwd met de begrippen die in de leerdoelen worden benoemd</p>
			<p>De opdracht waarmee het hoofdstuk eindigt is om met behulp van de schildpad een dorpje met huisjes van verschillende afmetingen
			te maken met een methode tekenDorp() die je zelf schrijft. De methode tekenDorp() maakt gebruik van een methode tekenHuis( int zijde ) die op
			zijn beurt gebruik maakt van de methoden tekenVierkant(int zijde) en tekenDriehoek(int zijde). Het eindresultaat zou er bijvoorbeeld
			als volgt uit kunnen zien.</p>
			<img class="imgfullwidth" src="/AO/BlueJ/images/tekendorp.jpg" alt="resultaat dorp">
					
	</div>
<%@ include file="/includes/bottom.html" %>
	
<% } %>

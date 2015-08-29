<%@ include file="/AO/InlJava/includes/pagetop.jsp" %>



<%	if (user != null) { %>



      <!-- inhoud -->
		<div class="col-md-10">
<%
		
%>      
  
<style>
div#lijst_wereldtijden {
    visibility: hidden
}
</style>
	        
	        <div class="opdrachten">
	        	<h2>Toets wereldtijden</h2>
	        	<p>Schrijf een applet waarin gebruiker het uur van de dag (tussen 0 en 23) 
	        	kan invoeren. Als hij op de knop drukt, verschijnen de tijden in London, 
	        	New York, Tokyo en Sydney op het scherm.</p>
	        	<img src="wereldtijden.png" alt="schermafbeelding wereldtijden" width="300">
	        	<h3>Aanwijzingen</h3>
	        	<ul>
	        		<li>Maak de applet geheel zelfstandig. Deel je code niet met je medestudenten, want dit 
	        		kan je een onvoldoende opleveren. Vragen mag je aan de aanwezige 
	        		docenten stellen.</li>
	        		<li>Declareer en initialiseer de benodigde variabelen. Zie hoofdstuk 5 &amp; 6.</li>
	        		<li>Maak eerst het applet venster mbv een label, een tekstvak en een knop. 
	        		Zie hoofdstuk 7 &amp; 8</li>
	        		<li>Maak  een binnenklasse van het type  ActionListener die er voor zorgt dat 
	        		het cijfer dat is ingevoerd wordt gebruikt om de tijden in de 4 wereldsteden 
	        		te bepalen. Let op dat de conversie kan resulteren in getallen &lt; 0 of &gt; 23. 
	        		Hoe kun je dat oplossen? Zie hoofdstuk 8 &amp; 10.</li>
	        		<li>Zorg ervoor dat de tijden in strings op het scherm worden vertoond. 
	        		Het mooist is natuurlijk als er pas strings op het scherm verschijnen <em>nadat</em> 
	        		de gebruiker een <em>geldig</em> getal heeft ingevoerd en op de knop heeft gedrukt. 
	        		Zie hoofdstuk 10.</li>
	        		<li>Schrijf leesbare code. Gebruik betekenisvolle namen. Let op gebruik van 
	        		commentaar, hoofdletters, kleine letters, witregels etc. en laat je code correct 
	        		inspringen (na een openingsaccolade).</li>
	        	</ul>
	        	<p>Push je code naar een repository op GitHub. Lever de opdracht in Classroom in met een 
	        	link naar je repo.</p>
	        	<h2>Voorbeeld uitwerking</h2>
	        	<p>Test onderstaande uitwerking door zowel geldige als niet geldige getallen in te 
	        	voeren.</p>
	        	<div id="uitwerking_wereldsteden">
	        		<label for="invoer_tijd">Voer een geldig uur in (&gt;= 0 &amp;&amp; &lt;= 23)</label>
	        		<input type="text" id="invoer_tijd_input">
	        		<button type ="button" id="knop_toon_wereldsteden">Toon tijden</button>
	        		<div id="vertoning_wereldtijden">
	        			<p id="foute_invoer_boodschap"><p>
	        			<div id="lijst_wereldtijden">
	        				<ul>
		        				<li>Tijd in London: <span id="london_tijd"></span></li>
		        				<li>Tijd in New York: <span id="newyork_tijd"></span></li>
		        				<li>Tijd in Tokyo: <span id="tokyo_tijd"></span></li>
		        				<li>Tijd in Sydney: <span id="sydney_tijd"></span></li>
		        			</ul>
	        			</div>
	        			
	        		</div>
	        	</div>
        
	        </div>

				
		</div>


<%@ include file="/includes/bottom.html" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){function n(n){var t=n-1;return 0>t&&(t+=24),t}function 
	t(n){var t=n-5;return 0>t&&(t+=24),t}function i(n){var t=n+9;return t>23&&(t-=24),t}
	function e(n){var t=n+12;return t>23&&(t-=24),t}$("#knop_toon_wereldsteden").on("click",
			function(){var r=parseInt($("#invoer_tijd_input").val());
			r>=0&&23>=r?($("#london_tijd")
			.html(n(r)+":00 uur"),$("#newyork_tijd")
			.html(t(r)+":00 uur"),$("#tokyo_tijd")
			.html(i(r)+":00 uur"),$("#sydney_tijd")
			.html(e(r)+":00 uur"),$("#foute_invoer_boodschap")
			.html(""),$("#lijst_wereldtijden")
			.css("visibility","visible")):($("#foute_invoer_boodschap")
			.html("Ongeldige invoer"),$("#lijst_wereldtijden")
			.css("visibility","hidden"))})});
</script>
<% } %>
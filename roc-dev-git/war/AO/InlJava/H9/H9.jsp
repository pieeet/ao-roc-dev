<%@ include file="/AO/InlJava/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-9">
        <h2>H9 Nogmaals Vensters</h2>

        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	       <h2>Leerdoelen</h2>
					
			
					<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
					<ul>
						<li>begrijpt hoe een programma samenwerkt met een besturingssysteem</li>
						<li>begrijpt hoe gebeurtenissen worden afgehandeld (<dfn>event-handling</dfn>)</li>
						
					</ul>
	          
        </div>
        
        
					<h4>Theorie</h4>
					<img src="matrix_2.gif">
        
       
       <p>Hoe vindt de communicatie plaats tussen besturingssysteem (OS) en de applet uit <a href="/AO/InlJava/H8/H8.jsp#voorbeeld8_7">voorbeeld 8.7</a>?</p>
					<img src="appletOs_v2.png" width=750>
					<p>Als het programma start, wordt allereerst init() aangeroepen. Daarin kunnen bijvoorbeeld de venstereigenschappen staan van het 
					hoofdvenster zoals de achtergrondkleur. Verder wordt aan Windows doorgegeven welke <dfn>&quot;kindvensters&quot;</dfn> er getekend moeten worden, 
					bijvoorbeeld de knoppen en tekstvakken met labels. Als de vensters door Windows getekend zijn kan de inhoud door het programma 
					worden weergegeven.	</p>				
					<p>Dan kan Windows wachten totdat de gebruiker iets doet. In dit geval drukt de gebruiker op de entertoets. Hij had ook op een knop 
					kunnen klikken. Windows geeft de gebeurtenis door aan het programma die daar vervolgens iets mee doet. Vervolgens vertelt <dfn>repaint()</dfn> 
					aan Windows dat de vensters opnieuw getekend moeten worden en vertelt Windows, zodra de vensters getekend zijn, dat de inhoud in de 
					vensters kan worden weergegeven. Tot slot wordt er gewacht op de volgende gebeurtenis.</p>
				
		</div>
<%@ include file="/includes/bottom.html" %>
<% } %>

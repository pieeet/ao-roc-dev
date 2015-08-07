
<%@ include file="/AO/InlJava/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      <div class="col-md-10">
        <h2>H1 Introductie</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	        <h3>Leerdoelen</h3>
	        <p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
			<ul>
				<li>De benodigde software hebt ge&iuml;nstalleerd om Java programma's
				te ontwikkelen en uit te voeren</li>
				<li>Een &quot;Integrated Development Environment&quot; (IDE) hebt ge&iuml;nstalleerd</li>
			</ul>
        </div>
        
        
        <!-- Studeeraanwijzingen -->  
        <div class="bs-callout bs-callout-info">
	        <h3>Studeeraanwijzingen</h3>
	        <p>Leren programmeren is vooral een kwestie van <em>veel doen</em>. We raden je aan alle opdrachten
			in deze cursus zo zelfstandig mogelijk uit te werken om zodoende "vlieguren" te maken.</p>
			<p>Maak een logische bestandsstructuur voor je projecten en geef betekenisvolle namen zodat je later gemakkelijk
			een opdracht terug kunt vinden</p>
        </div>
       
        <div id="artikel">
			<h4>Theorie</h4>
			<p>Java is als programmeertaal sinds de introductie in de  jaren '90 onverminderd populair. Het is een 
			objectgeorienteerde taal (vaak afgekort met OO - "Object Oriented"). Dit betekent dat verschillende onderdelen
			van een programmeertaak worden uitgevoerd door verschillende objecten.
			 Bekijk onderstaande video om een idee te krijgen wat objectgeori&euml;nteerd programmeren 
			 betekent. Je hoeft het nog niet allemaal te begrijpen!<br><br>
			<iframe width="640" height="360" src="https://www.youtube.com/embed/SS-9y0H3Si8" 
			frameborder="0" allowfullscreen></iframe>
						
			<!-- <img src="images/animalObjects.png" alt="Objecten"><br> -->
						
			<p>Een computer doet niets uit zichzelf. Voor iedere taak die uitgevoerd moet worden moet de computer
			instructies krijgen. Het hart van een computer is de processor die eenvoudige opdrachten kan 
			uitvoeren, zoals twee getallen in het werkgeheugen plaatsen en deze vervolgens bij elkaar optellen.</p>
								
<pre class="code">
a = 5;
b = 6;
c = a + b; 
</pre>
					
				
			<h2>Wat heb je nodig om een programma te maken?</h2>
						
			<P>Allereerst heb je een tekstverwerker nodig om de broncode in te schrijven. 
			De broncode is geschreven in een programmeertaal. In ons geval is dat de programmeertaal Java. Er zijn 
			verschillende gespecialiseerde editors om code mee te schrijven, maar je kunt ook een simpel 
			kladblok gebruiken.</p>
						
			<p>Toen computers pas bestonden werden programma's direct in machinetaal geschreven. Inmiddels hoeven we als 
			programmeur niet meer te weten hoe de machinetaal eruitziet van de computer die we gebruiken. 
			Om code om te zetten in machinetaal heb je een compiler nodig. De meeste programmeertalen bestaan uit een 
			combinatie van Engelse woorden en tekens die speciale betekenis hebben. Dat begrijpt een computer niet. De broncode 
			die je hebt ingetikt, moet vertaald worden in machinetaal. Machinetaal is een reeks opdrachten in enen en 
			nullen die de processor begrijpt. De compiler vertaalt de broncode in machinetaal.</p>
			
			<p>Ten derde heb je een linker nodig. Je hoeft gelukkig niet alles te schrijven in je broncode. Als 
			je bijvoorbeeld een tekst op het scherm wil zetten, gebruik je daarvoor in Java de opdracht drawString. Hoe dan 
			precies tekens en letters op het scherm komen, hoef je niet te weten. Dat staat in de zogenaamde klassenbibliotheek. Om je 
			een indruk te geven van de standaard Java bibliotheek vind je in de Web Links een verwijzing naar de Java API 
			(Application Programming Interface). De linker haalt uit de klassenbibliotheek de benodigde code. De linker leent als het 
			ware een stukje code uit de bibliotheek en zet dat in jouw programma. Het gaat per klasse om ongeveer 1500 definities en het is heel 
			moeilijk. To link in het Engels betekent letterlijk verbinden.</p>
						
			<p>Vroeger had de programmeur inderdaad drie verschillende programma&lsquo;s nodig. 
			Nu zijn deze drie onderdelen gebundeld in een zogenaamde Integrated Development Environment en werken 
			daardoor beter samen. Jcreator, Jbuilder, NetBeans en Eclipse zijn voorbeelden van dergelijke IDE&lsquo;s.</p>
			<h3 id="fouten">Fouten</h3>
			<p>Iedere programmeur maakt fouten. Het testen van applicaties en het opsporen van fouten (debuggen) is zelfs 
			een specialisme binnen 
			het vak.</p>
			
			<img class="gewoon_plaatje" src="images/vacature_test_specialist.png">
			
			<p>Als er tijdens het compileren een foutmelding wordt gegeven, dan ga je terug naar de broncode om de 
			fout te verhelpen. Je applet zal dan niet uitgevoerd worden. Dat gebeurt alleen maar als de broncode 
			helemaal goed is. Als de compiler een foutmelding geeft, dan zal  ook het nummer van de regel worden 
			getoond waarin de fout is opgetreden. </p>
			
			<p>Een foutmelding van de compiler is altijd een fout tegen de regels van de taal. Dergelijke fouten worden meestal al door je code editor 
			opgemerkt en zijn vaak vrij gemakkelijk op te sporen. Een logische fout is wat lastiger. Het is een fout waardoor het programma niet 
			doet wat het moet doen. Je hebt waarschijnlijk ergens een denkfout gemaakt.</p>
			
			<img src="images/fouten.png" class="gewoon_plaatje" alt="programmeerfouten" id="programmeerfouten">

			<div class="opdrachten">
				<h2>Opdracht 1.1 Installeer Java JDK</h2>
				<p>Om een java programma op een computer te compileren en uit te voeren moet de nodige software ge&iuml;nstalleerd
				zijn. Check in je program-files of er een recente versie van de Java Development Kit (jdk) ge&iuml;nstalleerd is. Als 
				dat niet het geval is, download en installeer deze (zie web links).</p>
				<img src="images/java_install.jpg" alt="screenshot"><br>
			</div>

			<div class="opdrachten">	
				<h2>Opdracht 1.2 Installeer Eclipse IDE</h2>
				<p>Installeer een zogenaamde Integrated Development Environment (IDE) waarmee je Java code kunt schrijven. Een IDE is een 
				programma waarmee je code kunt schrijven. In deze cursus gebruiken we het veelgebruikte 
				<a href="http://www.eclipse.org/downloads/" target="_blank">Eclipse</a>. Nadat je Eclipese hebt 
				gedownload kun je de map eventueel naar een andere lokatie verplaatsen, 
				de map openen en eclipse starten door op het toepassingsbestand met het Eclipse icoon te dubbelklikken.</p>
			</div>
			
			<div class="opdrachten">
				<h2>Opdracht 1.3 Maak een project</h2>
				<p>Open Eclipse en klik eventueel het welkom scherm weg. Klik op File en 
				kies new &#8594; Project... In het New Project scherm kies je Java Project.</p>
				<p>Standaard staat Use default location aangevinkt. Dit zorgt er voor dat Eclipse het project opslaat in de 
				huidige workspace map. Dit kun je eventueel veranderen als je je project op een andere 
				lokatie (Bijvoorbeeld Google Drive of Dropbox) wilt opslaan.</p>
				
			</div>
				
		</div>
	</div>
		
<%@ include file="/includes/bottom.html" %>
</body>

<% } %>

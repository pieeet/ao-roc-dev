
<%@ include file="/AO/InlJava/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      <div class="col-md-9">
        <h2>H1 installeren ontwikkelomgeving</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	        <h3>Leerdoelen</h3>
	        <p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
			<ul>
				<li>de benodigde software hebt ge&iuml;nstalleerd om Java programma&#39;s
				te ontwikkelen en uit te voeren</li>
				<li>een &quot;Integrated Development Environment&quot; (IDE) hebt ge&iuml;nstalleerd en 
				een java project kunt maken</li>
				<li>een GitHub project kunt forken en clonen naar je computer</li>
				<li>wijzigingen in een repository kunt committen en synchroniseren naar GitHub of 
				naar je lokale repository</li>
				
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
					
				
			<h2>Wat heb je nodig?</h2>
						
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
						
			<p>Vroeger had de programmeur inderdaad drie verschillende programma&#39;s nodig. 
			Nu zijn deze drie onderdelen gebundeld in een zogenaamde Integrated Development Environment en werken 
			daardoor beter samen. IntelliJ, NetBeans en Eclipse zijn voorbeelden van dergelijke IDE&#39;s.</p>
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
				<p>De JDK is de java development kit. Om een java programma op een computer te compileren en uit te voeren moet de nodige software 
				ge&iuml;nstalleerd
				zijn. In andere cursussen gaan we met Google App Engine werken. App Engine werkt 
				met <a href="http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html" 
				target="_blank">java versie 7</a>, dus het is wel zo handig om deze meteen te installeren. Installeer 
				een voor jouw computer geschikte versie. Voor de meeste computers kun je de 64 bits versie kiezen.</p>
				
				<img src="images/java_install.jpg" alt="screenshot"><br>
				<h3>Systeem-variabelen (Windows)</h3>
				<p>Als je op een Windows machine werkt, is het raadzaam om een systeem variabele aan te maken 
				die het systeem vertelt waar java zich bevindt. 
				Dit doe je als volgt:</p>
				<ul>
					<li>Ga naar je systeem instellingen (bijvoorbeeld met <code>windows-toets</code> + x &#8594; 
					<code>Systeem</code>), en klik in het linker zijmenu op <code>geavanceerde systeeminstellingen</code>. 
					Klik onderin het 
					scherm op <code>Omgevingsvariabelen</code>. Klik onder <code>Systeemvariabelen</code> op nieuw. Geef 
					de variabele de naam JAVA_HOME en voer als waarde het pad in naar je java installatie (bijvoorbeeld 
					C:\Program Files\Java\jdk1.7.0_51).</li>
					<li>Zorg er voor dat java vanuit iedere directory te benaderen is. Dit doe je door de JAVA_HOME 
					variabele aan de PATH variabele toe te voegen. Check in je omgevingsvariabelen of er een variable met 
					de naam PATH (met hoofdletters) bestaat, zo niet maak een nieuwe variable aan. Open het invoerscherm door op de 
					variabele te dubbelklikken. Voeg nu de lokatie van java toe met: %JAVA_HOME%\bin. Als er al waardes 
					in PATH stonden kun je het voor of achter de bestaande waardes invoegen. Let wel op dat je dan een 
					scheiding tussen de waardes aan moet brengen met een puntkomma (;).</li>
					<li>Als je later een andere jdk wilt installeren, dan kun je volstaan met het aanpassen van de 
					JAVA_HOME variabele.</li>
				
				</ul>
			</div>

			<div class="opdrachten">	
				<h2>Opdracht 1.2 Installeer Eclipse IDE</h2>
				<p>Installeer een zogenaamde Integrated Development Environment (IDE) waarmee je Java code kunt schrijven. 
				In deze cursus gebruiken we  
				<a href="http://www.eclipse.org/downloads/" target="_blank">Eclipse</a>. Kies <code>Eclipse IDE 
				for java EE developers</code>. Let op dat als je een 64 bit jdk hebt ge&iuml;nstalleerd, je ook 
				een 64 bit versie van Eclipse moet installeren. Nadat je Eclipse hebt 
				gedownload kun je de map eventueel naar een andere lokatie verplaatsen/uitpakken, 
				de map openen en eclipse starten door op het toepassingsbestand (met het Eclipse icoontje) te dubbelklikken.</p>
			</div>
			
			<div class="opdrachten">
				<h2>Opdracht 1.3 Maak een project</h2>
				<p>Open Eclipse en klik eventueel het welkom scherm weg. Klik op <code>File</code> en 
				kies <code>New</code> &#8594; <code>Project...</code> In het New Project scherm kies je Java Project.</p>
				<p>Standaard staat <code>Use default location</code> aangevinkt. Dit zorgt er voor dat Eclipse het project opslaat in de 
				huidige <em>workspace</em> map. Dit kun je eventueel veranderen als je je project op een andere 
				lokatie (Bijvoorbeeld Google Drive of Dropbox) wilt opslaan.</p>
				<p>Open het project in de explorer en klik met je rechtse muisknop op de src map, kies <code>New</code> &#8594; 
				<code>Class</code>. Geef 
				je klasse een naam die begint met een hoofdletter. Je mag geen leestekens of spaties gebruiken. Een nieuw woord in de naam 
				begin je met een hoofdletter. Je zou  bijvoorbeeld de naam MijnEersteJavaKlasse kunnen gebruiken. Kopieer 
				de volgende (gearceerde) code in je klasse en klik op het <code>Run</code> icoontje in de menubalk:<br>
<pre class="code">
public class MijnEersteJavaKlasse {
	
    <span class="codeplus">public static void main(String[] args) {</span>
        <span class="codeplus">System.out.println(&quot;Dit is mijn eerste java klasse!&quot;);</span>
    <span class="codeplus">}</span>
}
</pre>				
				<p>Als het goed is zie je tekst <code>Dit is mijn eerste java klasse!</code> in je console verschijnen.</p>
				<img class="gewoon_plaatje" src="images/console.png">
				
			</div>
			<div class="opdrachten">
				<h2>Opdracht 1.4 Git(Hub)</h2>
				<p>We gaan onze projecten voor deze en volgende cursussen met elkaar delen via 
				<a href="https://github.com/" target="_blank">GitHub</a>, de grootste online 
				<a href="https://nl.wikipedia.org/wiki/Open_source" target="_blank">Open 
				Source</a> community waar sofware ontwikkelaars hun code met elkaar delen en samenwerken aan 
				projecten met behulp van het <a href="https://nl.wikipedia.org/wiki/Git_(software)" target="_blank">
				git</a> versiebeheersysteem. Maak een account aan als je dat nog niet hebt.</p>
				<h3> Installeer git</h3>
				<p><a href="https://git-scm.com/book/en/v2/Getting-Started-Installing-Git" target="_blank">Installeer</a> 
				<em>git</em> op je computer. Open een <em>terminal</em> venster en typ het volgende commando om te testen 
				of het werkt:</p>
<pre class="code">
git version
</pre>
				<p>Als git goed ge&iuml;nstalleerd is, wordt het huidige versienummer weergegeven. Als het commando in 
				Windows niet wordt 
				herkend moet je waarschijnlijk een omgevingsvariabele toevoegen (zie installatie JDK) 
				Voeg in dat geval het volgende pad toe <em>achter</em> de waarde van je PATH. 
				Check of git daadwerkelijk in deze map is ge&iuml;nstalleerd en let op de puntkomma!</p>
<pre class="code">
<span class="codeplus">;</span>C:\Program Files (x86)\Git\cmd
</pre>				
				<h3>Forken en clonen</h3>
				<p>Om je op weg te helpen hebben we op GitHub een repository voor je gemaakt die je kunt gebruiken 
				voor de uitwerking van de opdrachten die je in deze cursus gaat maken. Ga als volgt te werk:
				<ol>
					<li>ga naar de <a href="https://github.com/ROC-DEV/inleiding-java" 
					target="_blank">repository</a> en <code>fork</code> hem. Hiermee maak je een eigen kopie van de repo die je 
					kunt gaan gebruiken</li>
					<li>open de terminal en ga met cd (change directory) naar de map waar je het project lokaal wilt 
					opslaan. Kopieer op GitHub de https link naar je repo. Als je de repo opent vind je de link in het 
					rechter zij-menu. (<code>https://github.com/</code>je gebruikersnaam<code>/inleiding-java.git</code>)</li>
					<li>voer in je terminal het volgend commando uit:<br>
<pre class="code">
git clone https://github.com/[je gebruikersnaam]/inleiding-java.git
</pre>				
					De repo wordt naar je computer gekopieerd en is automatisch gelinkt met je online (remote) 
					repository op GitHub. 
					</li>
					<li>in Eclipse kun je het project nu importeren met <code>File</code> &#8594; <code>Import...</code> &#8594; 
					<code>Existing project 
					into workspace</code>. Browse naar de map waar het project zich bevindt (de map direct boven de src map) 
					en importeer het project. Als het goed is ziet Eclipse automatisch dat het een git repo is; achter 
					de projectnaam staat [inleiding-java master].</li>
					<li>Open de src map in de explorer. Hierin zie je een <em>package</em>. Java klassen zitten altijd in 
					packages. In de package h01 vind je een java klasse. Open deze en klik op het 
					groene pijltje in 
					de menu balk om het programma uit te voeren. Als het goed is zie je in de Eclipse <em>console</em> 
					de uitvoer:<br>
<pre class="code">
Hallo roc-dev!
</pre>				
					</li>
					<li>De uitvoer wordt gemaakt met de regel:<br>
<pre class="code">
System.out.println(&quot;Hallo roc-dev!&quot;);
</pre>						
					</li>
					<li>wijzig nu de tekst van de uitvoer en test of het werkt. Sla de wijzigingen op (ctrl/cmd + s). In de Eclipse 
					explorer (links) zie je nu als het goed is een &gt; teken voor de projectnaam verschijnen. Dit 
					betekent dat er wijzigingen zijn die nog niet in git zijn verwerkt. Om de wijzigingen in git op  
					te slaan moet je ze <em>committen</em>. Klik met je rechtse muisknop op je project en kies <code>Team</code> 
					&#8594; <code>Commit...</code> Er verschijnt nu een scherm waarin je een commit message moet maken. Dit is er 
					voor bedoeld om veranderingen gemakkelijk te kunnen terugvinden. De eerste regel is een 
					korte beschrijving. Volgende regels zijn voor een eventueel uitgebreider beschrijving. Nadat je 
					je wijzigingen hebt doorgevoerd is je <em>lokale</em> repo up to date.</li>
					<li>de volgende stap is om je repo te synchroniseren met je online repo op GitHub. Ga opnieuw naar 
					<code>Team</code> en kies nu <code>Push to upstream</code>. Als het goed is worden je wijzigingen nu naar GitHub 
					ge&uuml;pload. Open je project op GitHub en check of de wijzigingen zijn doorgevoerd.</li>
					<li>je kunt ook op GitHub zelf online wijzigingen in je code aanbrengen en committen. Open het java bestand 
					online en klik op het <code>edit</code> icoontje, 
					wijzig iets aan de tekst en commit de wijziging. Om de wijziging met je lokale repo te synchroniseren ga 
					je in Eclipse weer naar Team, kies <code>Fetch from upstream</code>. Dit haalt de evt wijzigingen die aangebracht zijn in 
					je online repo op. Om 
					de wijzigingen in je lokale git repo op te nemen ga je nogmaals naar <code>Team</code> en kies je voor <code>Pull</code>.</li>
					
				</ol>
				<p>Je kunt de repository gebruiken voor de opdrachten van deze cursus. Om het overzichtelijk te houden 
				kun je per hoofdstuk een package maken. Als je in je repository een nieuw bestand maakt, moet die eerst 
				aan de index worden toegevoegd met <code>Team</code> &#8594; <code>Add to index</code> voor je de wijzigingen 
				kunt committen.</p>
			</div>
		</div>
	</div>
		
<%@ include file="/includes/bottom.html" %>
</body>

<% } %>

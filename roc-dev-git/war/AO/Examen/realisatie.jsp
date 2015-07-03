<%@ include file="includes/pagetop.jsp" %>
<%	if (user != null) { %>

      <!-- inhoud -->
		<div class="col-md-10">
     
      		<h2>Kerntaak 2: Realisatie</h2>
      		<h3>Situatie</h3>
      		<p>Van je projectleider heb je de startdocumenten gekregen. Daarin vind je de behoefteanalyse, 
		    het plan van aanpak, het functioneel en het technisch ontwerp.</p>
      		
      		
      		<div class="opdrachten">
      		<h2>Opdracht 1: Gegevensverzameling</h2>
      		
      			 <div class="bs-callout bs-callout-warning">
	     			<p>Aan de hand van het technisch 
		      		ontwerp maak je de documentatie over de structuur van de gegevensverzameling (datadictionary). 
		      		Aan de hand van de rapportages bepaal je welke gegevens je gaat gebruiken bij de realisatie 
      				van de applicatie.</p>
	        	</div>
	        	<p>Leg een gegevensverzameling aan. Doe dat met de volgende stappen.</p>
	        	<ul>
		        	<li>Maak een datadictionary aan de hand van het 
		        	Entiteiten Relatie Diagram.</li>
					<li>Leg een lijst gegevens aan die je bij de realisatie en de test gaat 
					gebruiken. De gegevens 
					die je gebruikt, baseer je op de rapportages en schermafbeeldingen die bij 
					de behoefteanalyse 
					zijn meegeleverd</li>
					<li>Onderzoek of de software die je voor de gegevensverzameling gaat 
					gebruiken, geschikt is en of er nog modules nodig zijn voor de gegevensverzameling.</li>
					<li>Bespreek de bovengenoemde punten met je projectleider.</li>
					<li>Maak een (SQL-)script waarmee de gegevensverzameling wordt aangemaakt.</li>
					<li>Test het (SQL-)script.</li>
					<li>Realiseer de gegevensverzameling.</li>
					<li>Zorg voor een, volgens onderstaande vormeisen, actuele en complete documentatie in 
					het rapport Documentatie Gegevensverzameling.</li>
	        	</ul>
	        	
	        	<h3>Resultaten</h3>
	        	<p>Het resultaat van deze opdracht is het volgende.</p>
	        	
	        	<ul>
		        	<li>Een gegevensverzameling waarmee de applicatie gerealiseerd en getest kan worden.</li>
					<li>Een actuele en complete documentatie</li>
	        	</ul>
	        	
	        	<h3>Vormeisen</h3>
	        	<p>Het resultaat moet aan de volgende punten voldoen.</p>
	        	<ul>
		        	<li>De documentatie Gegevensverzameling heeft een voorblad. Het voorblad bevat 
		        	de volgende elementen.
			        	<ul>
				        	<li>De naam van het project</li>
							<li>De naam van het product: Gegevensverzameling</li>
							<li>De datum, waarop het product is ingeleverd.</li>
							<li>De naam of namen van de personen die aan het product hebben meegewerkt.</li>
							<li>Het versienummer</li>
							<li>Eventueel een logo</li>
			        	</ul>
		        	</li>
		        	<li>De documentatie bevat een inhoudsopgave.</li>
					<li>Het taalgebruik is zakelijk.</li>
					<li>Er wordt vaktaal gebruikt.</li>
					<li>De lay-out van het (SQL-)script voldoet aan de standaard van FastDevelopment.</li>
					<li>Het (SQL-)script is van voldoende commentaar voorzien.</li>
	        	</ul>
	        	<h3>Inhoudseisen</h3>
	        	<p>Het resultaat moet aan de volgende punten voldoen:</p>
	        	<ol>
	        		<li>Documentatie Gegevensverzameling
	        		<ol>
	        			<li>Datadictionary</li>
						<li>Gegevens</li>
						<li>Software</li>
	        		</ol>
	        		</li>
	        		<li>(SQL-)script</li>
	        		<li>Gerealiseerde gegevensverzameling</li>
	        	</ol>
	        	
	        	<h3>Uitwerking op onderdelen</h3>
	        	<ol>
	        		<li><h4>Datadictionary</h4>
		        		<p>Een datadictionary is een beschrijving van de entiteiten met de velden en de 
		        		relaties op databaseniveau. Bovendien wordt er op de verschillende onderdelen 
		        		een toelichting gegeven. Zie het volgende voorbeeld:</p>
		        		<div class="table_wrapper">
		        		<table>
		        			<tr><th style="width: 30%">Entiteit</th><td colspan="2"  style="width: 70%">Bestelling</td><tr>
		        			<tr><th style="width: 30%">Definitie</th><td colspan="2" style="width: 70%">Algemene factuurgegevens bij 
		        			een bestelling door een klant</td></tr>
		        			<tr><th style="width: 30%">Attribuutnaam</th><th style="width: 30%">Datatype</th>
		        			<th style="width: 40%">Toelichting</th></tr>
		        			<tr><td style="width: 30%">Datum</td><td style="width: 30%">Date</td><td style="width: 40%">De datum waarop de bestelling is gedaan</td></tr>
		        			<tr><td style="width: 30%">Factuurnummer</td><td style="width: 30%">Varchar(15)</td><td style="width: 40%">Factuurnummer bestaat uit de datum 
		        			en klantnummer</td></tr>
		        			<tr><th style="width: 30%">Relatie</th><th colspan="2">Toelichting</th></tr>
		        			<tr><td style="width: 30%">R1</td><td colspan="2" style="width: 70%">Een bestelling wordt altijd door een klant gedaan.</td></tr>
		        			<tr><td style="width: 30%">R2</td><td colspan="2" style="width: 70%">Een bestelling bevat altijd een of meer bestelregels.</td></tr>
		        		</table>
		        		</div>
		        		<p>Voor elke entiteit wordt een dergelijke tabel gemaakt.</p>
	        		</li>
	        		<li><h4>Gegevens</h4>
		        		<p>Per tabel wordt de inhoud weergegeven zoals deze wordt opgeslagen.</p>
		        		<div class="table_wrapper">
		        		<table>
		        			<tr><th colspan="2" style="width: 100%">Bestelling</th></tr>
		        			<tr><th style="width: 50%">Datum</th><th style="width: 50%">Factuurnummer</th></tr>
		        			<tr><td style="width: 50%">2012-12-20</td><td style="width: 50%">20121220156</td></tr>
		        			<tr><td style="width: 50%">....</td><td style="width: 50%">....</td></tr>
		        			<tr><td style="width: 50%">....</td><td style="width: 50%">....</td></tr>
		        			<tr><td style="width: 50%">2012-12-21</td><td style="width: 50%">20121221367</td></tr>
		        		</table></div>
		        		<p>Zorg ervoor dat onderlinge verwijzingen tussen tabellen juist zijn!</p>
	        		</li>
	        		<li><h4>Software</h4>
		        		<p>Geef een korte beschrijving van de software die gebruikt wordt om de gegevensverzameling 
		        		te beheren. Beschrijf eventueel aanvullende modules die nodig zijn om de gegevensverzameling 
		        		te kunnen beheren.</p>
	        		</li>
	        		<li><h4>(SQL) script</h4>
		        		<p>Het (SQL-)script maakt de structuur van de gegevensverzameling aan en zet de gegevens 
		        		klaar die gebruikt worden bij het realiseren en testen van de applicatie.
		        		Het script moet leesbaar en te onderhouden zijn. Dat betekent dat er voldoende 
		        		commentaar in je code moet staan en dat de lay-out van de code volgens de standaard 
		        		moet zijn zoals je die gewend bent. Als niet duidelijk is volgens welke standaard 
		        		je moet coderen, vraag dat dan aan je projectleider. Of gebruik de standaard van 
		        		onderstaande voorbeelden.</p>
	        		
	        		
<pre class="code">
<span class="comment">--Maak tabel bestelling aan</span>
create table bestelling (
    datum date, 
    factuurnummer varchar(11),
    primary key(factuurnummer)
);
</pre>
	        	
<pre class="code">
<span class="comment">--Voer gegevens in de tabel bestelling in</span>
insert into bestelling(datum, factuurnummer)
    values(&#39;2012-12-20&#39;, &#39;20121220156&#39;);
...
...
insert into bestelling(datum, factuurnummer)
    values(&#39;2012-12-21&#39;, &#39;20121221367&#39;);
</pre>	        	
	        		</li>
	        		
	        		
	        	</ol>

      		</div>
      		
			<div class="opdrachten">
      			<h2>Opdracht 2: Realisatie</h2>
      			
      			 <div class="bs-callout bs-callout-warning">
	     			<p>Aan de hand van het plan van aanpak en het functioneel en technisch ontwerp 
	     			maak je eerst het kwaliteitshandboek in orde om daarna de applicatie of een 
	     			gedeelte ervan te realiseren.</p>
	        	</div>
      			<p>Realiseer de applicatie of een gedeelte ervan. Doe dat in de volgende stappen:</p>
      			<ul>
      				<li>Stel het kwaliteitshandboek op volgens de gegeven vormeisen.</li>
					<li>Maak een planning voor de realisatie.</li>
					<li>Leg de planning van de realisatie voor aan de projectleider.</li>
					<li>Realiseer de applicatie.</li>
					<li>Vul tijdens de realisatie van de applicatie het kwaliteitshandboek verder in.</li>
					<li>Voer het technisch gesprek met je projectleider.</li>
      			</ul>
      			<h3>Resultaten</h3>
      			<p>Het resultaat is (een gedeelte van) de applicatie, met alle onderliggende codes, 
      			die goed functioneert en volgens het ontwerp gerealiseerd is. Het kwaliteitshandboek 
      			is volledig ingevuld. Je hebt een technisch gesprek gevoerd.</p>
      			
      			<h3>Vormeisen</h3>
      			<p>Het resultaat moet aan de volgende punten voldoen.</p>
      			<h4>Kwaliteitshandboek</h4>
      			<ul>
      				<li>Het kwaliteitshandboek heeft een voorblad. Het voorblad bevat de volgende elementen:
      				<ul>
      					<li>De naam van het project</li>
						<li>De naam van het product: Gegevensverzameling</li>
						<li>De datum waarop het product is ingeleverd.</li>
						<li>De naam of namen van degenen die aan het product hebben meegewerkt.</li>
						<li>Het versienummer</li>
						<li>Eventueel een logo</li>
      				</ul>
      				<li>De documentatie bevat een inhoudsopgave.</li>
					<li>Het taalgebruik is zakelijk.</li>
					<li>Er wordt vaktaal gebruikt.</li>
      			</ul>
      			
      			<h4>Applicatie</h4>
      			<ul>
      				<li>De applicatie of delen ervan zijn gerealiseerd volgens het kwaliteitshandboek.</li>
					<li>De code van de applicatie is volgens de standaard van FastDevelopment geschreven.</li>
					<li>De applicatie is zuinig geprogrammeerd.</li>
					<li>De code is voorzien van voldoende commentaar. Tenminste elke functie, 
					methode en klasse is voorzien van commentaar.</li>
					<li>De opbouw van de applicatie is logisch.</li>
					<li>De code van de applicatie is te onderhouden.</li>
      			</ul>
      		
      		
	  			<h3>Inhoudseisen</h3>
	  			<ul>
	  				<li>In het kwaliteitshandboek zijn de tabellen volledig ingevuld.</li>
					<li>De applicatie of delen ervan zijn gerealiseerd volgens het Functioneel 
					ontwerp en het Technisch ontwerp.</li>
					<li>De applicatie of delen ervan zijn in het kwaliteitshandboek vastgelegd.</li>
					<li>In het technisch gesprek wordt het verloop van het project, de problemen 
					die zijn voorgekomen en de techniek van de applicatie besproken.</li>
	  			</ul>
	  			
	  			
	  			<h3>Uitwerking op onderdelen</h3>
	  			<h4>Kwaliteitshandboek</h4>
	  			<p>Het kwaliteitshandboek bestaat uit drie onderdelen: 1 planning van de realisatie, 
	  			2 de realisatie en 3 wijzigingen na de realisatie.</p>
	  			<p>In de planning staat een lijst met alle pagina&#39;s van de applicatie met daarachter 
	  			de naam van de persoon die de pagina gaat maken en wanneer hij dat gaat doen. Deze 
	  			lijst met pagina&#39;s is dezelfde als die in het functioneel ontwerp.</p>
	  			<div class="table_wrapper">
	  			<table>
	  				<tr><th colspan="4" style="width: 100%">Planning van de realisatie</th></tr>
	  				<tr><th style="width: 25%">Pagina</th><th style="width: 25%">
	  				Programmeur</th><th style="width: 25%">Van</th><th style="width: 25%">Tot</th></tr>
	  				<tr><td style="width: 25%"></td><td style="width: 25%"></td><td style="width: 25%"></td><td style="width: 25%"></td></tr>
	  				<tr><td style="width: 25%"></td><td style="width: 25%"></td><td style="width: 25%"></td><td style="width: 25%"></td></tr>
	  				<tr><td style="width: 25%"></td><td style="width: 25%"></td><td style="width: 25%"></td><td style="width: 25%"></td></tr>
	  			</table></div>
	  			<p>Deze tabel moet helemaal ingevuld zijn voor het kwaliteitshandboek gebruikt kan 
	  			worden tijdens de realisatie.</p>
	  			<p>Daarna volgt de werkelijke realisatie.</p>
	  			<div class="table_wrapper">
	  			<table>
	  				<tr><th colspan="3" style="width: 100%">Realisatie</th></tr>
	  				<tr><th style="width: 40%">Pagina</th><th style="width: 40%">
	  				Programmeur</th><th style="width: 20%">Klaar op</th></tr>
	  				<tr><td style="width: 40%"></td><td style="width: 40%"></td><td style="width: 20%"></td></tr>
	  				<tr><td style="width: 40%"></td><td style="width: 40%"></td><td style="width: 20%"></td></tr>
	  				<tr><td style="width: 40%"></td><td style="width: 40%"></td><td style="width: 20%"></td></tr>
	  			</table></div>
	  			<p>In de kolom pagina staan de namen van alle pagina&#39;s. Als dat niet zo 
	  			is, dan kan het kwaliteitshandboek niet tijdens de realisatie gebruikt worden.</p>
	  			<p>Tot slot volgt een overzicht van de wijzigingen die zijn aangebracht nadat de 
	  			pagina klaar was. Dit kan zijn naar aanleiding van de uitkomsten van de test. 
	  			Een pagina kan diverse keren genoemd worden als er meer wijzigingen zijn aangebracht. 
	  			Een ongewijzigde pagina zal in deze lijst niet voorkomen. Deze tabel vul je in 
	  			tijdens het uitvoeren van opdracht 3.</p>
	  			<div class="table_wrapper">
	  			<table>
	  				<tr><th colspan="5" style="width: 100%">Wijzigingen</th></tr>
	  				<tr><th style="width: 20%">Naam bestand</th><th style="width: 20%">
	  				Programmeur</th><th style="width: 20%">Van</th><th style="width: 20%">Tot</th>
	  				<th style="width: 20%">Wijziging</th></tr>
	  				<tr><td style="width: 20%"></td><td style="width: 20%"></td><td style="width: 20%"></td><td style="width: 20%"></td><td style="width: 20%"></td></tr>
	  				<tr><td style="width: 20%"></td><td style="width: 20%"></td><td style="width: 20%"></td><td style="width: 20%"></td><td style="width: 20%"></td></tr>
	  				<tr><td style="width: 20%"></td><td style="width: 20%"></td><td style="width: 20%"></td><td style="width: 20%"></td><td style="width: 20%"></td></tr>
	  			</table></div>
	  			<h4>Technisch gesprek</h4>
	  			<p>Dit gesprek gaat over de techniek achter de applicatie. Tijdens dit gesprek is 
	  			het de bedoeling dat je laat zien wat jouw kennis van programmeren is. Dit gesprek 
	  			is bestemd voor vakgenoten. Met name voor de projectleider, zodat hij op de hoogte 
	  			is van de gang van zaken en de gebruikte technieken tijdens het project. In dit deel 
	  			gebruik je vaktaal.</p>
	  			<p>In het technisch gesprek vertel je hoe het project is verlopen. Wat ging er goed? 
	  			Welke problemen ben je tegengekomen? Welke oplossingen heb je gevonden? Ook kun je 
	  			de technische werking uitleggen van die delen van de applicatie waaraan je gewerkt hebt. 
	  			De projectleider zal vragen stellen naar aanleiding van de code die hij ziet of aan je 
	  			vragen iets te laten zien.</p>
	  			<p>De applicatie is of delen ervan zijn nog niet getest. Het kan dus voorkomen dat er 
	  			fouten optreden tijdens het technisch gesprek. Dat is op zich niet erg, want de applicatie 
	  			of delen ervan worden nog niet beoordeeld. Het gaat namelijk om je technische kennis. 
	  			Bij een optredende fout moet je wel kunnen verklaren, aan de hand van de foutmelding, 
	  			wat er fout gaat en hoe je het eventueel kunt oplossen. Ook dat heeft met je 
	  			programmeerkennis en programmeervaardigheid te maken.</p>
	  			
			</div>
			
			<div class="opdrachten">
				<h2>Opdracht 3: Test</h2>
				<div class="bs-callout bs-callout-warning">
	     			<p>De applicatie is gerealiseerd en wordt nu getest aan de hand van de gegevens 
	     			die bij opdracht 1 Gegevensverzameling zijn opgesteld.</p>
	        	</div>
	        	<h3>Opdracht</h3>
	        	<p>Test de applicatie en breng eventueel verbeteringen aan. Doe dat in de volgende stappen:</p>
	        	<ul>
	        		<li>Maak een testplan.</li>
					<li>Voer de test uit en documenteer de resultaten van de test.</li>
					<li>Breng in overleg met de projectleider verbeteringen aan in de applicatie 
					of in delen ervan op basis van de testlog.</li>
					<li>Documenteer deze verbeteringen in het kwaliteitshandboek in de tabel Wijzigingen.</li>
	        	</ul>
	        	<h3>Resultaten</h3>
	        	<p>De resultaten van deze opdracht zijn de volgende:</p>
	        	<ul>
	        		<li>Uitgevoerde tests</li>
					<li>Ingevulde testrapportage</li>
					<li>Aangevulde tabel Wijzigingen in het kwaliteitshandboek</li>
	        	</ul>
	        	<h3>Vormeisen</h3>
	        	<p>Het resultaat moet aan de volgende punten voldoen:</p>
	        	<ul>
	        		<li>Het testrapport heeft een voorblad. Het voorblad bevat de volgende elementen.
	        		<ul>
						<li>De naam van het project</li>
						<li>De naam van het product: Gegevensverzameling</li>
						<li>De datum waarop het product is ingeleverd.</li>
						<li>De naam of namen van de personen die aan het product hebben meegewerkt.</li>
						<li>Het versienummer</li>
						<li>Eventueel een logo</li>
					</ul></li>
					<li>De documentatie bevat een inhoudsopgave.</li>
					<li>Het taalgebruik is zakelijk.</li>
					<li>Er wordt vaktaal gebruikt.</li>
					<li>De code van de applicatie is volgens de standaard van FastDevelopment geschreven.</li>
					<li>De code is voorzien van voldoende commentaar.</li>
	        	</ul>
	        	<h3>Inhoudseisen</h3>
	        	<ul>
	        		<li>In het kwaliteitshandboek zijn alle wijzigingen aan de applicatie opgenomen 
	        		in de tabel Wijzigingen.</li>
					<li>Er is een testrapport met daarin een testplan en testlog.</li>
					<li>Er is een goed functionerend applicatie of een deel ervan.</li>
	        	</ul>
	        	
	        	<h3>Uitwerking op onderdelen</h3>
	        	<h4>Testrapport</h4>
	        	<p>Het testrapport bestaat uit een testplan en testlog.</p>
	        	<p>Het testplan bestaat uit een gegevensset en een lijst met te testen pagina&#39;s 
	        	van de applicatie. De gegevensset bestaat uit de gegevens of een gedeelte ervan uit 
	        	opdracht 1.</p>
	        	<div class="table_wrapper">
	        	<table>
	        		<tr><th colspan="2" style="width: 100%">Bestelling</th></tr>
	        		<tr><th style="width: 50%">Datum</th><th style="width: 50%">Factuurnummer</th></tr>
	        		<tr><td style="width: 50%">2012-12-20</td><td style="width: 50%">20121220156</td></tr>
	        		<tr><td style="width: 50%">...</td><td style="width: 50%">...</td></tr>
	        		<tr><td style="width: 50%">...</td><td style="width: 50%">...</td></tr>
	        		<tr><td style="width: 50%">2012-12-21</td><td style="width: 50%">20121221367</td></tr>
	        	</table></div>
	        	<p>De gegevens van de pagina&#39;s die getest worden, worden overgenomen uit het functioneel ontwerp.</p>
	        	<div class="table_wrapper">
	        	<table>
        			<tr><th style="width: 20%">Naam pagina</th><th style="width: 20%">Formulier</th>
        			<th style="width: 40%">Functie</th><th style="width: 20%">Afwijkend pagina ontwerp</th></tr>
        			<tr><td style="width: 20%">Hoofdpagina</td><td style="width: 20%">Nee</td><td style="width: 40%">Belangstelling voor de website en voor 
        			de producten opwekken</td><td style="width: 20%">Nee</td></tr>
        			<tr><td style="width: 20%">Productenpagina</td><td style="width: 20%">Nee</td><td style="width: 40%">Lijst met producten tonen waaruit de klant 
        			een keuze kan maken.</td><td style="width: 20%">Nee</td></tr>
        			<tr><td style="width: 20%">...</td><td style="width: 20%">...</td><td style="width: 40%">....</td><td style="width: 20%">...</td></tr>
        			<tr><td style="width: 20%">...</td><td style="width: 20%">...</td><td style="width: 40%">....</td><td style="width: 20%">...</td></tr>
        			<tr><td style="width: 20%">Bestelpagina</td><td style="width: 20%">Ja</td><td style="width: 40%">Klant kan product bestellen.</td><td style="width: 20%">Nee</td></tr>
        		</table></div>
        		
        		<p>Het tweede deel van het testrapport bestaat uit een testlog.</p>
        		<div class="table_wrapper">
        		<table>
        			<tr><th colspan="8">Testlog</th></tr>
        			<tr><th>Pagina</th><th>Datum test</th><th>Tester</th><th>Defect</th><th>Prioriteit</th>
        			<th>Verbeter actie</th><th>Datum actie</th><th>Afhandelaar</th></tr>
        			<tr><td>Hoofdpagina</td><td>2-12-2012</td><td>Koos</td><td>-</td>
        			<td>0</td><td></td><td></td><td></td></tr>
        			<tr><td>Producten pagina</td><td>3-12-2012</td><td>Koos</td><td>Pagina wordt te lang</td>
        			<td>2</td><td>Minder items op pagina</td><td>20-12-2012</td><td>Joke</td></tr>
        			<tr><td>Bestel pagina</td><td>3-12-2012</td><td>Joke</td><td>Naam van klant wordt niet zichtbaar</td>
        			<td>3</td><td>Selectie query moet naar db gestuurd worden</td><td>19-12-2012</td><td>Peter</td></tr>
        		</table></div>
        		<p>De prioriteit van problemen wordt door middel van een getal aangeduid.<br>
				0 = Geen prioriteit<br>
				1 = Lage prioriteit voor een probleem waar niet meteen een oplossing voor hoeft te worden gevonden.<br>
				2 = Prioriteit voor een probleem dat opgelost dient te worden, maar waar voorlopig mee gewerkt kan worden.<br>
				3 = Hoogste prioriteit voor een probleem dat onmiddellijk opgelost dient te worden.</p>

				<p>Aan de hand van deze indeling kun je bepalen welke problemen het eerst opgelost moeten worden.</p>
        		<p>Op elke regel waar in de kolom Prioriteit een 0 staat, hoeft geen verbeteractie ondernomen te 
        		worden. Waar op een regel een 1 staat, betekent dat er niet meteen een verbeteractie ondernomen 
        		hoeft te worden. Waar een 2 of 3 staat, dienen wel verbeteracties ondernomen te worden.</p>
			
			</div>

		</div>

<%@ include file="/includes/bottom.html" %>
<% } %>

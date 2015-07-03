<%@ include file="/AO/htmlCss/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-10">
      	<h2>H3 Pagina layout</h2>
  
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
		    <h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je: </p>
			<ul>
				<li>weet hoe je elementen kunt laten floaten </li>
				<li>snapt hoe het HTML/CSS box-model werkt</li>
				<li>op verschillende manieren een pagina layout met kolommen kunt maken</li>
				<li>weet hoe je elementen absoluut kunt positioneren op een pagina</li>
	
			</ul>
	    </div>
	       
	          
       
        
        
        
        <!-- Studeeraanwijzingen -->
        <div class="bs-callout bs-callout-info">
	        <h2>Studeeraanwijzingen</h2>
			<p>Wen je aan om netjes te werken met een juiste indentatie. HTML documenten kunnen anders al heel snel 
			heel onoverzichtelijk worden.</p>
			<p>Als je iets hebt veranderd aan je layout, onderwerp je pagina dan aan een stress-test door je venster bijvoorbeeld
			heel klein te maken of door in je browservenster in en uit te zoomen (ctrl+ / ctrl-) en goed te kijken wat er gebeurt.</p>
	        
	        
	        
        </div>
       
				
				
				
        
        
        <!-- inhoud -->
         <div class="table_wrapper">
		<iframe src="https://docs.google.com/presentation/d/1-pTxoUG7UUOVuvJfoL6un7PM8AgWUeXWxA-ZmVc_tls/embed?start=false&loop=false&delayms=3000" 
		frameborder="0" width="480" height="299" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
		</div>
		
					<div class="opdrachten">
						<h2>Opdracht 3.1</h2>
						<h3>Opzet 1: zwevende DIVs</h3>
						<p>Je gaat in deze opdracht een web pagina maken met drie kolommen, een header en een footer. Je begint met
						in html vijf blokken te maken met behulp van DIVs.</p>
						<img class="imgfullwidth" src="images/boxmodel.png" alt="box model html">
						
<pre class="code">
&lt;div id=&quot;header&quot;&gt;
    &lt;h1&gt;Header&lt;/h1&gt;
&lt;/div&gt;

div id=&quot;menu1&quot;&gt;
    &lt;h2&gt;menu 1&lt;/h2&gt;
&lt;/div&gt;

&lt;div id=&quot;content&quot;&gt;
    &lt;h2&gt;Content&lt;/h2&gt;
&lt;&lt;/div&gt;

&lt;div id=&quot;menu2&quot;&gt;
    &lt;h2&gt;menu 2&lt;/h2&gt;
&lt;/div&gt;

&lt;div id=&quot;footer&quot;&gt;
    &lt;h3&gt;footer&lt;h3&gt;
&lt;/div&gt;	
</pre>
						<p>Nu gaan we CSS toepassen om de 5 elementen goed op het scherm te zetten. We beginnen met de body. Deze beslaat
						het hele scherm. Sommige browsers voegen ongevraagd wat marge en padding toe en dat willen we niet. De header en 
						footer laten we op 100% (default) en geven we een kleurtje. Om ze alvast wat meer hoogte te geven gebruiken we de property
						line-height.</p>
						
<pre class="code">
body {
    margin: 0;
    padding: 0;
}
#header {
    color: white;
    background-color: red;
    height: 3em;
}
#footer {
    color: white;
    background-color: blue;
    line-height: 3em;
    clear: both;
}
</pre>
							<div class="textmetfoto">
							<div class="fotointext">
								<img src="images/firebugbox.jpg" alt="css box model" height="250">
								<p>boxmodel in Firebug</p>
							</div>
							<div class="fotointext">
								<img src="images/box_model.png" alt="css box model" height="250">
								<p>opbouw boxmodel</p>
							</div>
							<p >Om elementen netjes naast elkaar te plaatsen hebben we het vorige hoofdstuk gewerkt met float. Dat kunnen we
							hier ook toepassen. Je wilt natuurlijk dat je website op verschillende schermen goed wordt weergegeven, daarom werken
							we met percentages zodat de pagina altijd goed schaalt. De totale breedte van een element is de optelsom van margin + 
							padding + border + width. Als je op deze manier met percentages werkt moet je er dus voor zorgen dat het totaal precies 
							100% wordt.</p>
							</div>
						
<pre class="code">
#menu1, #content, #menu2 {
    float: left;
}

#menu1, #menu2 {
    width: 15%;
    background-color: #F28500;
}

#content {
    width: 64%;
    background-color: white;
    padding-left: 3%;
    padding-right: 3%;
}
</pre>					 

						<p>Geef de achtergronden van de gebruikte elementen verschillende kleuren om goed te zien hoe de elementen zich ten opzichte
						van elkaar verhouden. Als het goed is krijg je de volgende pagina:</p>
						<iframe id="frame31" src="oef1/Opzet1.html" seamless></iframe>
						<p>Experimenteer met dit model bijvoorbeeld door verschillende soorten inhoud binnen de divs te plaatsen en te kijken hoe
						de pagina zich gedraagt. Maak bijvoorbeeld de inhoud van een van de menu's groter dan de inhoud van de content. Kun je een
						manier bedenken om de inhoud van de menu's door te laten lopen tot de footer?</p>
						
						<div class="toonknopcontainer">
						<button class="toonknop" id="toon3.1" onclick="toon('uitw3_1')">Toon uitwerking</button>
						</div>
						
						<div class="uitwerking" id="uitw3_1">
							<h2>Uitwerking opdracht 3.1</h2>
							<div class="bijlage">
								<h3>Bijlage: de gebruikte bestanden bij opdracht 3.1</h3>
								<p>Open in browser of klik met rechtse muisknop om te downloaden</p>
								<p>Downloads:<br>
								<a href="oef1/Opzet1.html">HTML bestand</a>
								<a href="oef1/opzet1.css">CSS bestand</a>
							</div>
						
						</div>
						
							
					</div>
					
					<div class="opdrachten">
						<h2>Opdracht 3.2</h2>
						<h3>Opzet 2: Absolute positionering</h3>
						<p>Het model met de zwevende divs uit de vorige opdracht had een aantal nadelen: als je met het model hebt
						geexperimenteerd zul je gemerkt hebben dat de elementen zich onvoorspelbaar kunnen gedragen. Voor je het weet staat 
						menu 2 onder menu 1 en ben je veel tijd kwijt om dit weer in goede banen te leiden. Dit komt omdat de elementen vrij 
						zweven (floaten) en niet erg vast verankerd zijn op de pagina.<br>
						In de praktijk kun je dit soort problemen meestal wel oplossen met het nodige gepuzzel, maar je kunt ook van start
						gaan met een wat robuustere pagina-opzet. In deze opdracht ga je met een iets ander box-model experimenteren, waarbij 
						de zij-menu's niet langer zweven, maar een <em>absolute positionering</em> krijgen.</p>
						<img class="imgfullwidth" src="images/boxmodel2.jpg" width="776px" alt="boxmodel 2 met main div">
						

						<p>Begin met een &lt;div&gt; genaamd main om de de drie elementen te zetten volgens bovenstaand model. <span class="letop">
						Let op</span> dat je de drie oude elementen extra laat inspringen in je code, anders zie je later gegarandeerd
						door de bomen het bos niet meer.</p>
						
<pre class="code">

&lt;div id=&quot;header&quot;&gt;
    &lt;h1&gt;Header&lt;/h1&gt;
&lt;/div&gt;

&lt;div id=&quot;main&quot;&gt;	
    div id=&quot;menu1&quot;&gt;
        &lt;h2&gt;menu 1&lt;/h2&gt;
&lt;/div&gt;
	
    &lt;div id=&quot;content&quot;&gt;
        &lt;h2&gt;Content&lt;/h2&gt;
    &lt;&lt;/div&gt;
	
    &lt;div id=&quot;menu2&quot;&gt;
        &lt;h2&gt;menu 2&lt;/h2&gt;
    &lt;/div&gt;
&lt;/div&gt;

&lt;div id=&quot;footer&quot;&gt;
    &lt;h3&gt;footer&lt;h3&gt;
&lt;/div&gt;	

</pre>			
					
						<p>Verander nu de volgende zaken in je CSS code:</p>
						
<pre class="code">
#main {
    position: relative;
}

#menu1, #content, #menu2 {
    margin: 0;
}

#menu1, #menu2 {
    position: absolute;
    width: 200px;
    top: 0;
    height: 100%;
    background-color: #F28500;
}

#menu1 {
    left: 0;
}

#menu2 {
    right: 0;
}

#content {
    margin-left: 200px;
    margin-right: 200px;
}
</pre>
						<p>De rest van de code kun je laten zoals het was.<p>
						<h3>Uitleg</h3>
						<h4>#main:</h4>
						<p>De absolute positie van een kind-element is altijd ten opzichte van de positie van zijn "ouder". 
						Om als ouder-element te kunnen dienen moet deze zelf ook relatief of absoluut gepositioneerd zijn.
						Als er geen geschikte ouder is, wordt &lt;html&gt; automatisch het ouder-element. Voor meer 
						gedetailleerde informatie kun je bijvoorbeeld <a href="http://www.w3schools.com/css/css_positioning.asp">
						hier</a> te rade gaan.<br>
						Als ouder-element hebben we "main" gecreeerd, dus die geef je een relatieve positie met de code <em>position: relative;</em>.</p>
						
						<h4>#menu1, #content, #menu2:</h4>
						<p>Je laat deze niet langer floaten. In plaats daarvan haal je evt. ongewenste marges weg</p>
						<h4>#menu1, #menu2</h4>
						<p>De twee menu's krijgen <em>position: absolute;</em> (ten opzichte van "main"). Voor nu geef je ze een vaste
						breedte. Met <em>top: 0;</em> geef je aan dat ze vanaf de bovenkant 0 pixels vanaf het ouder-element moeten beginnen. 
						Met <em>height: 100%;</em> geef je aan dat de menu's tot onder moeten doorlopen. </p>
						<h4>#menu1:</h4>
						<p>wil je links positioneren. Dit doe je met <em>left: 0;</em></p>
						<h4>#menu2:</h4>
						<p>Zelfde als menu 1 maar dan rechts: <em>right: 0;</em>.</p>
						<h4>#content:</h4>
						<p>Moet links en rechts een marge krijgen om ruimte te maken voor de menu's. Deze marge moet uiteraard 
						minstens even groot zijn als de breedte van de menu's (in dit geval 200px).</p>
						<div class="table_wrapper">
						<iframe id="frame32" src="oef1/Opzet2.html" seamless></iframe>
						</div>
						<p>Met deze basale pagina layout kun je vervolgens inhoud en vorm gaan geven aan de pagina elementen die je zojuist hebt
						gemaakt.</p> 
						
						
						<div class="toonknopcontainer">
						<button class="toonknop" id="toon3.2" onclick="toon('uitw3_2')">Toon uitwerking</button>
						</div>
						
						<div class="uitwerking" id="uitw3_2">
							<h2>Uitwerking opdracht 3.2</h2>
							<div class="bijlage">
								<h3>Bijlage: de gebruikte bestanden bij opdracht 3.2</h3>
								<p>Open in browser of klik met rechtse muisknop om te downloaden</p>
								<p>Downloads:<br>
								<a href="oef1/Opzet2.html">HTML bestand</a>
								<a href="oef1/opzet2.css">CSS bestand</a>
							</div>
						
						</div>
						
					</div>
					
					<div class="opdrachten">
						<h2>Opdracht 3.3</h2>
						<p>Ga je pagina nu vullen met inhoud zodat hij er zoveel mogelijk als de volgende afbeelding uitziet. De inhoud van je
						content sectie hoef je niet zelf te maken, die kun je importeren middels een 
						<a href="http://www.w3schools.com/tags/tag_iframe.asp">&lt;iframe&gt;</a>, een zogenaamd inline frame waar je de 
						inhoud van een andere bron zoals een HTML bestand of een webpagina in kunt importeren</p>
						<img class="imgfullwidth" src="images/scr_eu.jpg" alt="afbeelding webpagina">
						
						<div class="toonknopcontainer">
						<button class="toonknop" id="toon3.3" onclick="toon('uitw3_3')">Toon uitwerking</button>
						</div>
						
						<div class="uitwerking" id="uitw3_3">
							<h2>Uitwerking opdracht 3.3</h2>
							
							
							<div class="bijlage">
								<h3>Bijlage: Uitwerking opdracht 3.3</h3>
								<p>Hieronder de uitwerking in een &lt;iframe&gt;. Klik <a href="oef1/Opzet3.html">hier</a> voor de eigenlijke
								pagina.</p>
								<div class="table_wrapper">
								<iframe id="frame33" src="oef1/Opzet3.html" height="1200px" seamless></iframe>
								</div>
							</div>

							
						
						</div>

					
					</div>
					
					
					<div class="bijlage">
					<h3>Bijlage: Overzicht behandelde HTML tags</h3>
					<div class="table_wrapper">
					<table border="1">
						<tr>
							<th>Naam</th>
							<th>Beschrijving</th>
							<th>Code</th>
						</tr>
						<tr>
							<td>HTML tag</td>
							<td>start/einde HTML document</td>
							<td>&lt;<span class="html">html</span>&gt;document&lt;/<span class="html">html</span>&gt;</td>
						</tr>
						<tr>
							<td>Head tag</td>
							<td>meta informatie</td>
							<td>&lt;<span class="html">head</span>&gt;meta tags&lt;/<span class="html">head</span>&gt;</td>
						</tr>
						<tr>
							<td>Body tag</td>
							<td>start en einde zichtbare gedeelte</td>
							<td>&lt;<span class="html">body</span>&gt;pagina elementen&lt;/<span class="html">body</span>&gt;</td>
						</tr>
						<tr>
							<td>Header tag</td>
							<td>tekst boven pagina</td>
							<td>&lt;<span class="html">header</span>&gt;tekst&lt;/<span class="html">header</span>&gt;</td>
						</tr>
						<tr>
							<td>H1...H6 Heading tags</td>
							<td>titels en koppen</td>
							<td>&lt;<span class="html">h1</span>&gt;tekst&lt;/<span class="html">h1</span>&gt;</td>
						</tr>
						<tr>
							<td>Titel tag</td>
							<td>Tekst in browser tab</td>
							<td>&lt;<span class="html">title</span>&gt;tekst&lt;/<span class="html">title</span>&gt;</td>
						</tr>
						<tr>
							<td>Stijl tag</td>
							<td>CSS code <b>in</b> html document</td>
							<td>&lt;<span class="html">style</span>&gt;CSS code&lt;/<span class="html">style</span>&gt;</td>
						</tr>
						<tr>
							<td>Marquee tag</td>
							<td>loopkrant </td>
							<td>&lt;<span class="html">marquee</span>&gt;tekst&lt;/<span class="html">marquee</span>&gt;</td>
						</tr>
						<tr>
							<td>Sup tag</td>
							<td>superscript </td>
							<td>&lt;<span class="html">sup</span>&gt;tekst&lt;/<span class="html">sup</span>&gt;</td>
						</tr>
						<tr>
							<td>Navigatie tag</td>
							<td>Menu elementen</td>
							<td>&lt;<span class="html">nav</span>&gt;tekst&lt;/<span class="html">nav</span>&gt;</td>
						</tr>
						<tr>
							<td>Divisie tag</td>
							<td>scheidings element</td>
							<td>&lt;<span class="html">div</span>&gt;&lt;/<span class="html">div</span>&gt;</td>
						</tr>
						<tr>
							<td>Paragraaf tag</td>
							<td>blok tekst</td>
							<td>&lt;<span class="html">p</span>&gt;tekst&lt;/<span class="html">p</span>&gt;</td>
						</tr>
						<tr>
							<td>Anker tag</td>
							<td>link naar web pagina</td>
							<td>&lt;<span class="html">a href=&quot;www.google.com</span>&quot;&gt;Link tekst&lt;/<span class="html">a</span>&gt;
						</tr>
						<tr>
							<td>Plaatje met link</td>
							<td>als plaatje in anker staat wordt het plaatje een link</td>
							<td>&lt;<span class="html">a href=&quot;http://sponsor01.nl&quot;</span>&gt;<br>
							&lt;<span class="html">img src=&quot;/images/image1&quot;</span>&gt;&lt;/<span class="html">a </span>&gt;
						</tr>
						<tr>
							<td>Footer tag</td>
							<td>tekst onder pagina</td>
							<td>&lt;<span class="html">footer</span>&gt;tekst&lt;/<span class="html">footer</span>&gt;
						</tr>
						<tr>
							<td>Regel einde</td>
							<td>ga naar volgende regel</td>
							<td>&lt;<span class="html">br</span>&gt;
						</tr>
						<tr>
							<td>Inline Frame</td>
							<td>inhoud van een andere web pagina</td>
							<td>&lt;<span class="html">iframe</span>&gt;alt tekst&lt;/<span class="html">iframe</span>&gt;
						</tr>
							
					</table>
					</div>
					
				</div>	
				
		</div>
<%@ include file="/includes/bottom.html" %>
<% } %>

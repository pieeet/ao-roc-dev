<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

<%@ include file="/AO/HtmlCss/includes/zijmenu.jsp" %>


      
      <div class="col-md-9">
      	<h2>H2 Tour de Junior</h2>
  
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	    	<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je: </p>
			<ul>
				<li> weet hoe je tekst in blokken kunt verdelen met de &lt;<span class="html">p</span>&gt; (paragraaf) tag</li>
				<li>het element &lt;<span class="html">table</span>&gt; snapt en kunt gebruiken</li>
				<li>geoefend hebt met het &lt;<span class="html">div</span>&gt; element en zijn functionaliteit</li>
				<li>weet hoe je een link met de &lt;<span class="html">a href=&quot;..&quot;</span>&gt; tag maakt</li>
				<li>weet hoe je een plaatje met de &lt;<span class="html">img src=&quot;..&quot;</span>&gt; tag maakt</li>
				<li>weet hoe je van een plaatje een link maakt</li>
				<li>de stijl eigenschappen <span class="html">margin:</span>, <span class="html">text-align:</span>, 
				 <span class="html">font-size:</span>, <span class="html">height:</span>, <span class="html">width:</span> 
				 kunt toepassen</li>
				 <li>weet hoe je elementen naast elkaar kunt positioneren met <span class="html">float: left</span>; of 
				 	<span class="html">float: right;</span></li>
			</ul>
   
	       
	          
        </div>
        
        
        
        
        
        
        
        <!-- inhoud -->
        <div class="table_wrapper">
		<iframe src="https://docs.google.com/presentation/d/1cx7UmUTRCacu3sow68OXwDdyFG5lLPvLTPATUcY3Yvs/embed?start=false&loop=false&delayms=3000" 
		frameborder="0" width="480" height="299" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
		</div>
		
		<!-- Opdrachten -->	
					<div class="opdrachten" id="opdr2.1">
					
						<h2>Opdracht 2.1</h2>
						
						<p>In deze opdracht ga je de opzet voor een web-pagina maken waar de logo's van ploeg-sponsors van het evenement 
						"Tour de Junior" moeten worden getoond. Het is de bedoeling dat je 16 
						logo's in hetzelfde formaat netjes naast en onder elkaar op de pagina toont. Boven de logo's moeten de ploegnamen komen.<br>
						Als je op een plaatje klikt ga je naar de web site van de sponsor.  </p>
						
						<ol>
							<li>Zet een logische bestandsstructuur met betekenisvolle namen op bijvoorbeeld: <br>
							<img src="images/Scr_dir.jpg" alt="mappen structuur"></li>
							<li>Maak een .html document volgens de indeling uit het vorige hoofdstuk</li>
							<li>Download de logo's van de sponsors <a href="https://drive.google.com/folderview?id=0B_plfM9Z75S4dEJDWmJzSjAxcjA&usp=sharing"> 
							 hier</a> en plaats ze in de daarvoor bestemde map </li>
							<li>Maak een element &lt;<span class="html"><a href="http://www.w3schools.com/html/html_tables.asp">
								table</a></span>&gt; waar je de teksten, plaatjes en ankers (links) in plaatst.</li>
							<li>maak gebruik van CSS om de tabel te stylen. Referenties:</li>
								<ul>
									<li><a href="http://www.w3schools.com/cssref/pr_text_text-align.asp">text-align</a></li>
									<li><a href="http://www.w3schools.com/cssref/pr_font_font-size.asp">font-size</a></li>
									<li><a href="http://www.w3schools.com/css/css_margin.asp">margin</a></li>
									<li><a href="http://www.w3schools.com/css/css_align.asp">horizontaal uitlijnen</a></li>
									<li><a href="http://www.w3schools.com/cssref/pr_dim_height.asp">height &amp; width</a></li>
								</ul>
						</ol>
						
						<p>Open je HTML bestand in je browser. Als het goed is ziet het er ongeveer uit als hieronder.<p>
		
						<div class="table_wrapper">
						<iframe src="tweede-opdracht.htm" id="frame21"></iframe>
						</div>
		
						<!-- Knop om uitwerking te tonen -->
						<div class="toonknopcontainer">
							<button class="toonknop" id="toon1.1" onclick="toon('uitw1.1')">Toon uitwerking</button>
						</div>
						
					</div>
					
					
					<!-- Uitwerking opdracht -->
						<div class="uitwerking" id="uitw1.1">
							<h2>Uitwerking opdracht 2.1  </h2>
							<p>Om de foto's netjes naast en onder elkaar te zetten heeft deze - ongetwijfeld onervaren - web-designer gebruik
							gemaakt van een tabel (&lt;<span class="html"><a href="http://www.w3schools.com/html/html_tables.asp">
							table</a></span>&gt;). De HTML code van de eerste twee plaatjes ziet er als volgt uit:</p>
							
<pre class="code">
&lt;table id=&quot;team-sponsors"&quot;&gt;  <span class="comment">&lt;!-- begin tabel --&gt;</span>
    &lt;tr&gt;  <span class="comment">&lt;!-- table row, de tabel begint met een rij --&gt;</span>
        &lt;th&gt;Ploegnr 1&lt;/th&gt;  <span class="comment">&lt;!-- table header, kolomnaam --&gt;</span>
        &lt;th&gt;Ploegnr 2&lt;/th&gt;  <span class="comment">&lt;!-- table header, kolomnaam --&gt;</span>		
    &lt;/tr&gt;
    &lt;tr&gt;
        &lt;td&gt;  <span class="comment">&lt;!-- table data, de inhoud van een cel --&gt;</span>
        &lt;a href=&quot;http://sponsor01.nl&quot; target=&quot;_blank&quot;&gt;
              &lt;img src=&quot;./logos/arkel.gif&quot; alt=&quot;Arkel&quot;&gt;&lt;/img&gt;
            &lt;/a&gt;
        &lt;/td&gt;
        &lt;td&gt;  <span class="comment">&lt;!-- table data, de inhoud van een cel --&gt;</span>
            &lt;a href=&quot;http://sponsor02.nl&quot; target=&quot;_blank&quot;&gt;
              &lt;img src=&quot;./logos/biermann.jpg&quot; alt=&quot;Biermann&quot;&gt;&lt;/img&gt;
            &lt;/a&gt;
        &lt;/td&gt;
		
    &lt;/tr&gt;
    .....
	.....
&lt;/table&gt;
</pre>
							
							<p>Een tabel wordt vaak door beginnende web-designers gebruikt om er voor te zorgen dat inhoud netjes in een grid-layout 
							komt te staan. Door er stijl aan toe te voegen, kun je bepalen hoe de tabel en de inhoud er precies uit moeten komen te zien.
							In de volgende opdracht leer je hoe je een dergelijke pagina op een andere - meer professionele - manier maakt.</p>
							
<pre class="code">
&lt;style type = &quot;text/css&quot;&gt;
    table#team-sponsors {
        text-align: center;
        font-size: 15px;
        margin-left: auto;
        margin-right: auto;       
    }
        table#team-sponsors img {
        height: 100px;
        width:  150px;
        margin: 0px 15px 5px 10px;
    } 
</pre>
							
							<p>De  code-regel <em>table#team-sponsors {</em> vertelt de browser om welk element het gaat.
							In dit geval zegt de code tegen de browser dat de tabel met id "team-sponsors" z'n tekst moet centreren en 
							dat de letters 15 pixels groot moeten worden. Door de marge van de tabel links en rechts op "auto" te zetten zorg je er voor dat de 
							tabel als geheel gecentreerd op de pagina verschijnt.</p>
							<p>De code regel <em>table#team-sponsors img {</em> vertelt de browser dat het element &lt;img&gt; binnen de tabel met
							id "team-sponsors" 100 pixels hoog en 150 pixels breed moet zijn. Om te zorgen dat er wat ruimte tussen de plaatjes
							komt, wordt er achtereenvolgens boven, rechts, onder en links een marge (<a href="http://www.w3schools.com/cssref/pr_margin.asp">
							margin</a>) aan de plaatjes toegevoegd.</p>
							
							<div class="bijlage">
								<h3>Bijlage opdracht 2.1</h3>
								<p><a href="tweede-opdracht.htm">html bestand</a></p>
								<p><a href="tweede-opdracht.txt">html bestand in txt formaaat</a>
								
								<p><a href="https://drive.google.com/folderview?id=0B_plfM9Z75S4dEJDWmJzSjAxcjA&usp=sharing">
								De map met logo's </a></p>
							</div>
							
							
							
							
							<!--  Knop op uitwerking te verbergen -->
						<div class="toonknopcontainer">
							<button class="toonknop" id="toon1.1" onclick="verberg('uitw1.1')">Verberg uitwerking</button>
						</div>
		
					</div>
					
					<div class="opdrachten">
					<h2>Opdracht 2.2</h2>
					
					<ol>
						<li>Maak nu dezelfde pagina als vorige opdracht maar dit keer maak je uitsluitend 
						gebruik van het element &lt;div&gt; en dus <span class="letop">geen</span> &lt;table&gt; gebruiken.</li>
						<li>Maak een header die zich als 
						een <a href="http://www.w3schools.com/cssref/default.asp?utm_source=twitterfeed&utm_medium=twitter#marquee">
						loopkrant</a> gedraagt<br>
						<b>LET OP!! </b>(de e van 51<sup>e</sup> is in <a href="http://www.w3schools.com/tags/tag_sup.asp"> superscript</a>
					 	weergegeven).</li>
						<li>Maak 2 stukjes ondersteunende tekst die gescheiden zijn door een wit-regel, en de tweede 
						regel heeft een verwijzig naar de link Secretatiaat.
						<li>¸ Maak m.b.v. div’s de logos van de sponsoren zichtbaar en zet van elke 
						sponsor de ploegnaam als een “header” er boven.<br>
						Geef het logo een hoogte van +/- 100 pixels en een <b>breedte</b> van +/- 150pixels
						<b>LET OP!!</b> (Regel tussen de logo’s enige wit-ruimte, maar geen wit-ruimte 
						tussen het logo en de bijbehoordende ploegnaam header.)</li>
						<li>Zorg er voor dat de gebruiker van de sponsorpagina door gelinkt wordt naar de 
						site van de sponsor. (in dit geval <a href="http://sponsor01.nl">http://sponsor01.nl</a>, 
						<a href="http://sponsor02.nl">http://sponsor02.nl</a> enz.) als op het sponsorlogo wordt geklikt.</li>
						<li>Suit de pagina af met de sluit tekst in een <b>tekst blok</b>.</li>
					</ol>
					</div>
					
				
					
					<div class="toonknopcontainer">
							<button class="toonknop" id="toon1.1" onclick="toon('uitw2.2')">Toon uitwerking</button>
						</div>
						
						
						<div class="uitwerking" id="uitw2.2">
							<h2>Uitwerking opdracht 2.2  </h2>
		
							
							<div class="bijlage">
								<h3>Bijlage: Div structuur</h3>
<pre class="code">

&lt;div id=&quot;table-wrapper&quot;&gt;
    &lt;div&gt;
        Ploeg nummer 1
        &lt;a href=&quot;http://noginvullen.nl&quot; target=&quot;_blanc&quot;&gt;
            &lt;img src=&quot;./logos/arkel.gif&quot; alt=&quot;Arkel&quot;&gt;&lt;/img&gt;
&lt;/a&gt;
    &lt;/div&gt;
    &lt;div&gt;
        Ploeg nummer 2
        &lt;a href=&quot;http://noginvullen.nl&quot; target=&quot;_blanc&quot;&gt;
            &lt;img src=&quot;./logos/biermann.jpg&quot; alt=&quot;Biermann&quot;&gt;&lt;/img&gt;
        &lt;/a&gt;
    &lt;/div&gt;
    &lt;div&gt;
        Ploeg nummer 3
        &lt;a href=&quot;http://noginvullen.nl&quot; target=&quot;_blanc&quot;&gt;
            &lt;img src=&quot;./logos/biketotaal.gif&quot; alt=&quot;Bike-Totaal&quot;&gt;&lt;/img&gt;
        &lt;/a&gt;
    &lt;/div&gt;
</pre>						

							
							</div>
							
							<div class="bijlage">
								<h3>Bijlage: Tour de Junior Site</h3>
								<p>Je kunt het gebruikte HTML document voor deze opdracht <a href="/AO/HtmlCss/H2/tweede-opdracht-div.htm">
								hier</a> vinden</p>
							
		
							
								<div class="toonknopcontainer">
									<button class="toonknop" id="toon1.1" onclick="verberg('uitw2.2')">Verberg uitwerking</button>
							</div>
					
						</div>
					</div>
					
					
					
					<div class="opdrachten">
						<h2>Opdracht 2.3</h2>
						<p>Probeer met de opgedane kennis een web pagina te maken voor iemand die postzegels verzamelt.<br>
						De gebruikte foto's kun je <a href="https://drive.google.com/folderview?id=0B_plfM9Z75S4ejc4WUcwS1ZpVUE&usp=sharing">
						hier</a> vinden</p> 
						
						<div id="opdrachtframe2_2">
							<h1 id="postzegel_titel">Mijn postzegelverzameling</h1>
							<div class="postzegel">
								<h2>Flamingo</h2>
								<img src="postzegels/flamingo.jpg" width="86" height="120">
								<p>Uit Rusland</p>
							</div>
							<div class="postzegel">
								<h2>Struisvogel</h2>
								<img src="postzegels/struisvogel.jpg" width="89" height="120">
								<p>Uit Rusland</p>
							</div>
							<div class="postzegel">
								<h2>Ibis</h2>
								<img src="postzegels/ibis.jpg" width="120" height="86">
								<p>Uit Rusland</p>
							</div>
							<div class="postzegel">
								<h2>Specht</h2>
								<img src="postzegels/specht.jpg" width="120" height="84">
								<p>Uit Rusland</p>
							</div>
							<div class="postzegel">
								<h2>Steenarend</h2>
								<img src="postzegels/steenarend.jpg" width="87" height="120">
								<p>Uit Tadjikistan</p>
							</div>
							<div class="postzegel">
								<h2>Geelpootmeeuw</h2>
								<img src="postzegels/geelpootmeeuw.jpg" width="120" height="120">
								<p>Uit Armeni&euml;</p>
							</div>
							<div class="postzegel">
								<h2>Goudplevier</h2>
								<img src="postzegels/goudplevier.jpg" width="103" height="120">
								<p>Uit Duitsland</p>
							</div>
								<div class="postzegel">
								<h2>Scholekster</h2>
								<img src="postzegels/scholekster.jpg" width="120" height="89">
								<p>Uit de Far Oer</p>
							</div>
							<div class="postzegel">
								<h2>Jan van Gent</h2>
								<img src="postzegels/janvangent.jpg" width="84" height="120">
								<p>Uit de Far Oer</p>
							</div>
							<div class="postzegel">
								<h2>Papegaaiduiker</h2>
								<img src="postzegels/papegaaiduiker.jpg" width="84" height="119">
								<p>Uit de Far Oer</p>
							</div>
							<div class="postzegel">
								<h2>Zwarte Ooievaar</h2>
								<img src="postzegels/zwarteooievaar.jpg" width="120" height="100">
								<p>Uit Kazachstan</p>
							</div>
							
						
						</div>
						
					</div>
					
					<div class="toonknopcontainer">
							<button class="toonknop" id="toon2.3" onclick="toon('uitw2.3')">Toon uitwerking</button>
						</div>
						
						<div class="uitwerking" id="uitw2.3">
						<h2>Uitwerking opgdracht 2.3</h2>
						<p>De html pagina kun je <a href="/AO/HtmlCss/H2/opgpostzegels/index.html">hier</a> vinden. Open de pagina in Firefox en 
						inspecteer hem met Firebug.</p>
						<img src="/AO/HtmlCss/H2/images/firebug.jpg" alt="screenshot firebug">
						</div>
						
						<div class="bijlage">
								<h3>Bijlage: HTML document structuur</h3>
					
		
<pre class="code">
&lt;!DOCTYPE <span class="html">html</span>&gt;

&lt;<span class="html">html</span>&gt;

    &lt;<span class="html">head</span>&gt;

        &lt;<span class="html">title</span>&gt;HTML 5 structuur&lt;/<span class="html">title</span>&gt;

        &lt;<span class="html">style</span> type = &quot;text/css&quot;&gt;

        tagnaam {

        ……. : ……;

        ……. : ……;

}

&lt;/<span class="html">style</span>&gt;

        &lt;/<span class="html">head</span>&gt;

        &lt;<span class="html">body</span>&gt;

            &lt;<span class="html">header</span>&gt;

                Header

            &lt;/<span class="html">header</span>&gt;

            &lt;<span class="html">nav</span>&gt;

                Navigatie

            &lt;/<span class="html">nav</span>&gt;

            &lt;<span class="html">div</span>&gt;

                Content

            &lt;/<span class="html">div</span>&gt;

            &lt;<span class="html">footer</span>&gt;

                Footer

            &lt;/<span class="html">footer</span>&gt;

         &lt;/<span class="html">body</span>&gt;

&lt;/<span class="html">html</span>&gt;
</pre>					
							
						</div>
							
						<div class="bijlage">
							<h3>Bijlage: Overzicht behandelde HTML tags</h3>
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
									
							</table>
					</div>
	
<%@ include file="/AO/HtmlCss/includes/bottom.html" %>
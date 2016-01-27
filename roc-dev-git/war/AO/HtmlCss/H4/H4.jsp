<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

<%@ include file="/AO/HtmlCss/includes/zijmenu.jsp" %>

      
      <div class="col-md-9">
      <h2>H4 Invoervelden</h2>
  
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	    	<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je: </p>
			<ul>
				<li> </li>
				<li></li>
				<li></li>
				<li></li>

			</ul>
	    
	       
	          
        </div>

        <!-- inhoud -->
        	<div class="opdrachten">
						<h2>Het eindresultaat</h2>
						<p>In deze opdracht ga je met behulp van de layout uit het vorige hoofdstuk een pagina maken die er
						als volgt uitziet:</p>
						<img class="imgfullwidth" src="images/resultaat.png" alt="resultaat opdracht">
						<p><span class="letop">Opm: </span>Maak gebruik van  HTML standaard en style-block CSS.
						Bij deze opdracht mag je gebruik maken van opdracht 3. <br>
						Zie bijlagen voor diverse hints.</p>
						
						<h2>Opdracht 4.1</h2>
						<p>Maak de volgende mappen: </p>
						<img src="images/mappen.png" alt="map structuur"><br>
						<p>In de map eu staat: derde-opdracht.htm (bestand &quot;moet je zelf maken&quot;)<br>
						In de map logos staan alle *.gif en *.jpg bestanden. Download <a href="logos/logos.zip">
						logos.zip</a></p>
						<p>Maak de &lt;title&gt; van de pagina: &quot;Vierde voorbeeld HTML - CSS&quot;</p>
							
					</div>
					
					<div class="opdrachten">
						<h2>Opdracht 4.2</h2>
						<p>Maak in je menu2-box met behulp van een &lt;<a href="http://www.w3schools.com/tags/tag_fieldset.asp">fieldset</a>&gt; 
						een inlog dialoog.<br>
						Plaat een tekstveld &lt;<a href="http://www.w3schools.com/tags/tag_input.asp">input</a> type=&quot;text&quot;&gt; voor
						de gebruiksersnaam en een ander tekstveld met &lt;input 
						type=&quot;<a href="http://www.w3schools.com/html/html_forms.asp">password</a>&quot;&gt;<br>
						Maak een knop &lt;input type=&quot;submit&quot;&gt; voor het verzenden van de gegevens en een 
						&lt;input type=&quot;<a href="http://www.w3schools.com/jsref/dom_obj_checkbox.asp">checkbox</a>&quot;&gt;
						voor het vastleggen van de inloggegevens.					
		
						<div class="toonknopcontainer">
						<button class="toonknop" id="toon4.2" onclick="toon('uitw4_2')">Toon uitwerking</button>
						</div>
						
						<div class="uitwerking" id="uitw4_2">
							<h2>Uitwerking opdracht 4.2</h2>
							<p>Hieronder de uitwerking in een iframe, de eigenlijke pagina kun je  <a href="opdracht/Opzet3.html">hier</a> vinden.</p>
							<iframe id="frame42" src="opdracht/Opzet3.html">Frame uitwerking opdracht 4.2</iframe>
						</div>
						
					</div>
					
					<div class="opdrachten">
						<h2>Opdracht 4.3</h2>
						<p>Maak een HTML document genaamd &quot;invoer.html&quot;. Dit ga je straks als iframe in je pagina laden. 
						Voor de layout zie de voorbeeld pagina.<br>
						Plaats op het scherm een:</p>
						<ul>
							<li>&lt;ul&gt; unordered list</li>
							<li>&lt;fieldset&gt;</li>
							<li>&lt;input type=&quot;text&quot;&gt;</li>
							<li>&lt;label for=&quot;id van bijbehorende invoerelement&quot;&gt; met &quot;for&quot; koppel je 
								het label aan het bijbehorende input element. Klikken op het label geeft het betreffende 
								invoerelement de focus van de cursor.</li>
							<li>&lt;<a href="http://www.w3schools.com/tags/tag_select.asp">select</a>&gt; dropdown list</li>
							<li>&lt;<a href="http://www.w3schools.com/tags/tag_textarea.asp">textarea</a>&gt; invoer meerdere regels tekst</li>
							<li>&lt;input type=&quot;submit&quot;&gt; knop die een actie kan doen.</li>
							<li>&lt;input type=&quot;reset&quot;&gt; knop die de tekstvelden leeg maakt.</li>
						</ul>
						<p>Je kunt de labels en de invoervelden het beste netjes ordenen middels een &lt;table&gt;.</p>
						
						<div class="toonknopcontainer">
						<button class="toonknop" id="toon4.3" onclick="toon('uitw4_3')">Toon uitwerking</button>
						</div>

					
						<div class="uitwerking" id="uitw4_3">
							<h2>Uitwerking opdracht 4.3</h2>
							<div class="bijlage">
								<h3>Het gebruikte bestand:</h3>
								
									<p><a href="opdracht/invoer.html">invoer.html</a></p>
								
								<iframe id="frame43" src="opdracht/invoer.html">iframe opgave 4.3</iframe>
							</div>	
						</div>
				
					</div>
					
					<div class="opdrachten">
						<h2>Opdracht 4.4</h2>
						<p>Laad nu het invoer.html bestand als iframe in je content sectie.</p>
						
						<div class="toonknopcontainer">
						<button class="toonknop" id="toon4.4" onclick="toon('uitw4_4')">Toon uitwerking</button>
						</div>
						
						<div class="uitwerking" id="uitw4_4">
							<h2>Uitwerking opdracht 4.4</h2>
							<p>Klik <a href="opdracht/Opzet4.html">hier </a>voor het html bestand.</p>
							<p>In deze uitwerking kun je het formulier in het iframe laden door op de knop &quot;Lid worden&quot; in 
							het rechtse menu te klikken. De andere knoppen in de pagina en het formulier doen nog niks.<p>

							
							<iframe id="frame44" src="opdracht/Opzet4.html">iframe opgave 4.4</iframe>
								
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
							&lt;<span class="html">img src=&quot;/images/image1&quot;</span>&gt;<br>
							&lt;/<span class="html">a</span>&gt;
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
						<tr>
							<td>Unordered List</td>
							<td>Lijst met bullet points</td>
							<td>Zie Ordered List</td>
						</tr>
						<tr>
							<td>Ordered List</td>
							<td>Genummerde lijst</td>
							<td>&lt;<span class="html">ol</span>&gt;<br>
							&lt;<span class="html">li</span>&gt; lijst element&lt;/<span class="html">li</span>&gt;<br>
							&lt;<span class="html">li</span>&gt; lijst element&lt;/<span class="html">li</span>&gt;<br>
							&lt;/<span class="html">ol</span>&gt;
						</tr>
						<tr>
							<td>Inline Frame</td>
							<td>inhoud van een andere web pagina</td>
							<td>&lt;<span class="html">iframe</span>&gt;alt tekst&lt;/<span class="html">iframe</span>&gt;
						</tr>
						<tr>
							<td>Invoerveld</td>
							<td>Invoervelden diverse <a href="http://www.w3schools.com/tags/att_input_type.asp">typen</a></td>
							
							<td>&lt;<span class="html">input type=&quot;.....&quot;</span> &gt;
						</tr>
						<tr>
							<td>Input textbox</td>
							<td>Tekst invoerveld</td>
							<td>&lt;<span class="html">input type=&quot;text&quot;</span> &gt;
						</tr>
						<tr>
							<td>Input checkbox</td>
							<td>checkbox meerdere opties</td>
							<td>&lt;<span class="html">input type=&quot;checkbox&quot;</span> &gt;
						</tr>
						<tr>
							<td>Verzend knop</td>
							<td>Verzendt het ingevulde formulier</td>
							<td>&lt;<span class="html">input type=&quot;submit&quot; value=&quot;Verzenden&quot;</span> &gt;
						</tr>
						<tr>
							<td>Reset knop</td>
							<td>Maak ingevulde velden leeg</td>
							<td>&lt;<span class="html">input type=&quot;reset&quot; onclick=&quot;JavaScript functie&quot;</span> &gt;
						</tr>
						
						<tr>
							<td>Formulier</td>
							<td>Een formulier met input velden</td>
							<td>&lt;<span class="html">form</span>&gt;invoerelementen&lt;/<span class="html">form</span>&gt;
						</tr>
						<tr>
							<td>Fieldset</td>
							<td>Omhulling van invoervelden evt. met legenda</td>
							<td>&lt;<span class="html">fieldset</span>&gt;<br>
								&lt;<span class="html">legend</span>&gt;legenda&lt;/<span class="html">legend</span>&gt;<br>
								&lt;<span class="html">input type=&quot;text&quot; name=&quot;...&quot;</span>&gt;<br>
								&lt;/<span class="html">fieldset</span>&gt;
						</tr>
						<tr>
							<td>Label</td>
							<td>Tekstlabel bij invoerveld</td>
							<td>&lt;<span class="html">label for=&quot;id inputelement&quot;</span>&gt;tekst&lt;/<span class="html">label</span>&gt;
						</tr>
						<tr>
							<td>Dropdown selectie lijst</td>
							<td>Kiezen uit een lijst met vaste opties</td>
							<td>&lt;<span class="html">select name=&quot;...&quot;</span>&gt;<br>
								&lt;<span class="html">option value=&quot;waarde&quot;</span>&gt;Naam optie&lt;/<span class="html">option</span>&gt;<br>
								&lt;/<span class="html">select</span>&gt;
						</tr>
						<tr>
							<td>Tekst gebied</td>
							<td>Invoerveld grotere stukken tekst</td>
							<td>&lt;<span class="html">textarea rows=&quot;5&quot; cols=&quot;50&quot;</span>&gt;&lt;/<span class="html">textarea</span>&gt;
						</tr>
							
					</table>
					</div>
					
				</div>			
		</div>
<%@ include file="/AO/HtmlCss/includes/bottom.html" %>

<%@ include file="/AO/htmlCss/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-10">
      <h2>H1 Introductie</h2>
  
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	    	<h2>Leerdoelen</h2>
			<ul>
				<li>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je begrijpt hoe HTML en CSS met elkaar
				samenwerken</li>
				<li>Weet hoe je een .html bestand kunt maken en hoe je verschillende stijlkenmerken aan elementen kunt toevoegen</li>
				
			</ul>
	    
	       
	          
        </div>
        
        
        
        <!-- Studeeraanwijzingen -->
        <div class="bs-callout bs-callout-info">
        <h2>Studeeraanwijzingen</h2>
			<p>Zet een ontwikkelomgeving op. Installeer Notepad++ en maak je vertrouwd met de Firefox browser en de 
			Firebug add-on</p>
			<p>Maak voor jezelf een simpele website als oefenomgeving die je gaandeweg kunt uitbreiden</p>
	        
	        
	        
        </div>
        
        
        
        <!-- inhoud -->
        <div class="table_wrapper">
		<iframe id="presentatie" src="https://docs.google.com/presentation/d/1zgm1sfiacxOqpDjqsSHoI25sQFT45QKU0AnZAHx7aps/embed?
		start=false&loop=false&delayms=3000" frameborder="0" width="480" height="299" allowfullscreen="true" 
		mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
		</div>
		<div class="opdrachten" id="opdr1.1">
					
						<h2>Opdracht 1.1</h2>
						<img class="imgfullwidth" src="images/ScreenShot_before.jpg" alt="Schermafdruk open met Firefox">
						
						<p>Maak volgens de HTML 5.0 standaard bovenstaande HTML pagina. Met behulp van Notepad++ maak je een bestand aan met 
						de naam <em>eerste-opdracht.<b>html</b></em> en plak de onderstaande code in het bestand. Pas totaal 
						<span class="letop">geen</span> opmaak/css toe. Later in dit hoofdstuk vind je meer informatie over de structuur 
						en de gebruikte HTML tags.</p>
						
<!-- Code blok -->

<pre class="code">
&lt;!DOCTYPE html&gt;

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;HTML 5 - structuur&lt;/title&gt;
    &lt;style type = &quot;text/css&quot;&gt;
    
       
    &lt;/style&gt;
  &lt;/head&gt;
  
  &lt;body&gt;
    &lt;header&gt;
      Header (Eerste opdracht)
    &lt;/header&gt;
		
    &lt;div id=&quot;html5&quot;&gt;
      &lt;h1&gt;HTML 5&lt;/h1&gt;
      &lt;h2&gt;HTML 5&lt;/h2&gt;
      &lt;h3&gt;HTML 5&lt;/h3&gt;
      &lt;h4&gt;HTML 5&lt;/h4&gt;
      &lt;h5&gt;HTML 5&lt;/h5&gt;
      &lt;h6&gt;HTML 5&lt;/h6&gt;
    &lt;/div&gt;
		
    &lt;nav id=&quot;navigatie&quot;&gt;
      Navigatie
        &lt;a href=&quot;#&quot;&gt;link1&lt;/a&gt;	
    &lt;/nav&gt;
		
		
    &lt;h4&gt;Enkele voorbeelden van speciale tekens&lt;/h4&gt;
    &lt;ul&gt;
      &lt;li&gt;Het euro teken &amp;euro;&lt;/li&gt;
      &lt;li&gt;Het Apenstaartje &amp;#64;&lt;/li&gt;
    &lt;/ul&gt;


    &lt;h4&gt;De standaard Lorem Ipsum passage, in gebruik sinds de 16e eeuw&lt;/h4&gt; 
    &lt;div id=&quot;tekst1&quot;&gt;
      &quot;Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
      nisi ut aliquip ex ea commodo consequat. Duis aute irure 
      dolor in reprehenderit in voluptate velit esse cillum 
      dolore eu fugiat nulla pariatur. Excepteur sint occaecat
      cupidatat non proident, sunt in culpa qui officia deserunt
      mollit anim id est laborum.&quot;
    &lt;div&gt;

    &lt;h4&gt;Wat is De standaard Lorem Ipsum passage&lt;/h4&gt; 
    &lt;div id=&quot;tekst2&quot;&gt;
      Lorem Ipsum is slechts een proeftekst uit het drukkerij- en zetterijwezen. 
      Lorem Ipsum is de standaard proeftekst in deze bedrijfstak sinds de 16e 
      eeuw, toen een onbekende drukker een zethaak met letters nam en ze door 
      elkaar husselde om een font-catalogus te maken. Het heeft niet alleen 
      vijf eeuwen overleefd maar is ook, vrijwel onveranderd, overgenomen in 
      elektronische letterzetting. Het is in de jaren &#39;60 populair geworden 
      met de introductie van Letraset vellen met Lorem Ipsum passages en meer 
      recentelijk door desktop publishing software zoals Aldus PageMaker die 
      versies van Lorem Ipsum bevatten.
    &lt;/div&gt;
		
    &lt;footer&gt;
      Footer (Het copyright teken &amp;copy;)
    &lt;/footer&gt;
    
  &lt;/body&gt;
  
&lt;/html&gt;

</pre>
				
						<p>Sla het bestand op als .html bestand en open het in Firefox.</p>
						<img class="imgfullwidth" src="images/ScreenShot_2.jpg" alt="Schermafdruk open met Firefox">
						<p>Vervolgens gaan we wat CSS code toevoegen </p>
						
	
<!-- Code blok -->
<pre  class="code">
&lt;!DOCTYPE html&gt;

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;HTML 5 - structuur&lt;/title&gt;
    <div class="css">
    &lt;style type = &quot;text/css&quot;&gt;
    
    
      header {
        height: 20px;
        text-align: center;
        background-color: lightgray;
      }
      
      div#html5 {
        margin-left: 60px;
      }
      
      nav {
        height: 20px;
        text-align: center;
        background-color: lightgray;
      }
      
      footer {
        height: 20px;
        text-align: center;
        background-color: lightgray;
        margin-top: 10px;
      }
    
      
    &lt;/style&gt;
    </div>
  &lt;/head&gt;
  
  &lt;body&gt;
    &lt;header&gt;
      Header (Eerste opdracht)
      ...
    

</pre>
	
						
						<div class="toonknopcontainer">
							<button class="toonknop" id="toon1.1" onclick="toon('uitw1.1')">Toon uitwerking</button>
						</div>
					
					
						<div class="uitwerking" id="uitw1.1">
							<h2>Uitwerking opdracht 1.1</h2>
							<p>Als het goed is gegaan zie je het volgende scherm in je browser:</p>
							<img src="images/opdr_1.jpg" width="800" alt="schermafdruk">
							
							<div class="toonknopcontainer">
								<button class="toonknop" id="toon1.1" onclick="verberg('uitw1.1')">Verberg uitwerking</button>
							</div>
						</div>
						
					</div>
					<div class="opdrachten" id="opdr1.2">	
						<h2>Opdracht 1.2</h2>
						<p>Zorg dat in Firefox het bestand uit de vorige opgave is geopend. Installeer nu de add-on Firebug in
						Firefox als je dat nog niet had gedaan.</p>
						<p>Klik met je rechter muisknop ergens in het scherm en kies voor <em>"Element inspecteren met Firebug"</em>.</p>
						<p>Firebug opent nu een scherm waarin je de HTML en de CSS code van de pagina kunt bekijken en zelfs kunt manipuleren.
						Bekijk wat er allemaal mogelijk is. Voor meer info zie bijvoorbeeld 
						<a href="http://www.opleidingwebdesigner.be/tutorial/codediagnose-met-firebug">hier</a> voor uitgebreidere info over Firebug.</p>
						
						<div class="toonknopcontainer">
							<button class="toonknop" id="toon1.2" onclick="toon('uitw1.2')">Toon uitwerking</button>
						</div>
					
					
						<div class="uitwerking" id="uitw1.2">
							<h2>Uitwerking opdracht 1.2</h2>
							<p>In Firebug kun je de code van iedere webpagina inspecteren. Door met je muis over de elementen te
							bewegen kun je zien waar ze zich op de pagina bevinden. Ook kun je elementen uitschakelen of hun waardes
							veranderen en meteen het resultaat bekijken in je browser. Dit wordt vaak gebruikt om snel te kunnen zien wat 
							het gevolg is van bepaalde keuzes. </p>
							<img src="images/ScreenShot_3.jpg" width="600">
							
							
							
							<div class="toonknopcontainer">
								<button class="toonknop" id="verberg1.2" onclick='verberg("uitw1.2")'>Verberg uitwerking</button>
							</div>
						</div>
					</div>
					<div class="bijlage">
						<h3>Bijlage: De structuur van een HTML document</h3>
						
<!-- Code blok -->					
<pre class="code">
&lt;!DOCTYPE <span class="html">html</span>&gt;

&lt;<span class="html">html</span>&gt;

    &lt;<span class="html">head</span>&gt;

        &lt;<span class="html">title</span>&gt;HTML 5 structuur&lt;/<span class="html">title</span>&gt;

        &lt;<span class="html">style</span> type = &quot;text/css&quot;&gt;

        tagnaam {
         stijl : waarde;
         stijl : waarde;
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
								<td>Footer tag</td>
								<td>tekst onder pagina</td>
								<td>&lt;<span class="html">footer</span>&gt;tekst&lt;/<span class="html">footer</span>&gt;
							</tr>
							
						</table>
						</div>
						</div>
						
						<div class="bijlage">
						
							<h3>Bijlage: Het gebruikte HTML document</h3>
						
	
<pre  class="code">
&lt;!DOCTYPE html&gt;

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;HTML 5 - structuur&lt;/title&gt;
    &lt;style type = &quot;text/css&quot;&gt;
    
    
      header {
        height: 20px;
        text-align: center;
        background-color: lightgray;
      }
      
      div#html5 {
        margin-left: 60px;
      }
      
      nav {
        height: 20px;
        text-align: center;
        background-color: lightgray;
      }
      
      footer {
        height: 20px;
        text-align: center;
        background-color: lightgray;
        margin-top: 10px;
      }
    
      
    &lt;/style&gt;
  &lt;/head&gt;
  
  &lt;body&gt;
    &lt;header&gt;
      Header (Eerste opdracht)
    &lt;/header&gt;
		
    &lt;div id=&quot;html5&quot;&gt;
      &lt;h1&gt;HTML 5&lt;/h1&gt;
      &lt;h2&gt;HTML 5&lt;/h2&gt;
      &lt;h3&gt;HTML 5&lt;/h3&gt;
      &lt;h4&gt;HTML 5&lt;/h4&gt;
      &lt;h5&gt;HTML 5&lt;/h5&gt;
      &lt;h6&gt;HTML 5&lt;/h6&gt;
    &lt;/div&gt;
		
    &lt;nav id=&quot;navigatie&quot;&gt;
      Navigatie
        &lt;a href=&quot;#&quot;&gt;link1&lt;/a&gt;	
    &lt;/nav&gt;
		
		
    &lt;h4&gt;Enkele voorbeelden van speciale tekens&lt;/h4&gt;
    &lt;ul&gt;
      &lt;li&gt;Het euro teken &amp;euro;&lt;/li&gt;
      &lt;li&gt;Het Apenstaartje &amp;#64;&lt;/li&gt;
    &lt;/ul&gt;


     &lt;h4&gt;De standaard Lorem Ipsum passage, in gebruik sinds de 16e eeuw&lt;/h4&gt; 
    &lt;div id=&quot;tekst1&quot;&gt;
      &quot;Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
      nisi ut aliquip ex ea commodo consequat. Duis aute irure 
      dolor in reprehenderit in voluptate velit esse cillum 
      dolore eu fugiat nulla pariatur. Excepteur sint occaecat
      cupidatat non proident, sunt in culpa qui officia deserunt
      mollit anim id est laborum.&quot;
    &lt;div&gt;

    &lt;h4&gt;Wat is De standaard Lorem Ipsum passage&lt;/h4&gt; 
    &lt;div id=&quot;tekst2&quot;&gt;
      Lorem Ipsum is slechts een proeftekst uit het drukkerij- en zetterijwezen. 
      Lorem Ipsum is de standaard proeftekst in deze bedrijfstak sinds de 16e 
      eeuw, toen een onbekende drukker een zethaak met letters nam en ze door 
      elkaar husselde om een font-catalogus te maken. Het heeft niet alleen 
      vijf eeuwen overleefd maar is ook, vrijwel onveranderd, overgenomen in 
      elektronische letterzetting. Het is in de jaren &#39;60 populair geworden 
      met de introductie van Letraset vellen met Lorem Ipsum passages en meer 
      recentelijk door desktop publishing software zoals Aldus PageMaker die 
      versies van Lorem Ipsum bevatten.
    &lt;/div&gt;
		
    &lt;footer&gt;
      Footer (Het copyright teken &amp;copy;)
    &lt;/footer&gt;
    
  &lt;/body&gt;
  
&lt;/html&gt;

</pre>		
									
	
				</div>
		
				
		</div>


	
    </div>
  </div>
</div>
	
<% } %>

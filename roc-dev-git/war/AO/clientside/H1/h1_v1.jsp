<%@ include file="/AO/clientside/includes/pagetop.jsp" %>
  


<%	if (user != null) { 
		if (request.getAttribute("check") == null) {
			response.sendRedirect("/jquery");
		} else {

%>

      
	<div class="col-md-10">
		<h2>Introductie</h2>
		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
	    	<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
			<ul>
				<li></li>
			</ul>
		</div>
	
	<p>In deze cursus gaan we aan de slag met het programmeren van web applicaties aan de client 
	kant. Bij het programmeren aan de client kant wordt het werk door de computer van de 
	gebruiker gedaan in plaats van een veraf gelegen server. Je maakt uiteraard gebruik van HTML/CSS, 
	maar vooral van JavaScript en JavaScript bibliotheken zoals het populaire JQuery.</p>
	
	<p>Om je een idee van de mogelijkheden te geven , kun je de (open source) 
	<a href="https://github.com/gabrielecirulli/2048" target="_blank">broncode</a> 
	van het populaire spel 2048 op je online portfolio zetten. Voor hulp kun je terecht bij een 
	gratis online cursus van &quot;Udacity&quot;.
	Je hoeft hiervoor geen voorkennis te hebben.</p>
	
	
	
	
	
	<!-- 2048 -->
	
<!-- 	<div id="t2048" class="table_wrapper">
	<div class="container_2048">
    <div class="heading_2048">
      <h1 class="title_2048">2048</h1>
      <div class="scores-container">
        <div class="score-container">0</div>
        <div class="best-container">0</div>
      </div>
    </div>

    <div class="above-game">
      <p class="game-intro">
      <a class="restart-button">Nieuw spel</a>
      Gebruik je pijltjestoetsen om de plaatjes te verschuiven. Als twee dezelfde plaatjes worden 
      gecombineerd, vormen ze een nieuw plaatje.</p>
      
    </div>
	<div class="pre-game">
      <p class="learn">Leer hoe je je eigen versie van 2048 kunt maken in deze mini online cursus voor beginners.</p>
      <a class="learn" href="https://www.udacity.com/course/ud248" target="_blank">Doe de cursus!</a>
    </div>
    


    <div class="game-container">
      <div class="game-message">
        <p></p>
        <div class="lower">
	        <a href="http://www.udacity.com/course/ud248/"class="learn learn-low">Doe de cursus!</a>
          <a class="retry-button">Nieuw spel</a>
          <div class="score-sharing"></div>
        </div>
      </div>

      <div class="grid-container">
        <div class="grid-row">
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
        </div>
        <div class="grid-row">
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
        </div>
        <div class="grid-row">
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
        </div>
        <div class="grid-row">
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
          <div class="grid-cell"></div>
        </div>
      </div>

      <div class="tile-container">

      </div>
    </div>

  </div>
  
  EINDE 2048
  </div> -->
  
  <h3>JavaScript</h3>
  <p>JavaScript is in 1995 ontwikkeld door <a href="http://en.wikipedia.org/wiki/Brendan_Eich" 
  target="_blank">Brendan Eich</a> voor Netscape. Zijn opdracht was om een 
  programmeertaal te ontwikkelen die gemakkelijk te gebruiken zou zijn door ongeschoolde programmeurs, en 
  waarmee de code direct in HTML geschreven kon worden. De benaming voor de taal was aanvankelijk &quot;ActionScript&quot; 
  maar vanwege de populariteit van de  nieuwe programmeertaal Java werd besloten om de naam te veranderen. Ook 
  werd de taal aangepast zodat de syntax aan java doet denken. Verder heeft JavaScript niets met java te maken!</p>
  <p>Het feit dat JavaScript inderdaad gebruikt kan worden door ongeschoolde programmeurs, o.m. omdat je gemakkelijk 
  stukken code kunt knippen, plakken en uitproberen maakte dat JavaScript lange tijd door &quot;echte programmeurs&quot; 
  werd beschouwd als een inferieur speelgoedtaaltje. Ook het feit dat het zo gemakkelijk is om uiterst slecht onderhoudbare 
  code vol fouten te schrijven heeft daaraan bijgedragen.</p>
  <p>Sinds de opkomst van <a href="http://nl.wikipedia.org/wiki/Asynchronous_JavaScript_and_XML" target="_blank">Ajax</a> 
  (waarover later meer) is er meer belangstelling voor JS gekomen en is er daarmee ook meer oog gekomen voor de 
  mooie eigenschappen, de flexibiliteit en de kracht van de taal. Ook werden JavaScript bibliotheken als 
  <a href="http://nl.wikipedia.org/wiki/JQuery" target="_blank">JQuery</a> ontwikkeld 
  om de valkuilen van JS te vermijden. In deze cursus gaan we hier dankbaar gebruik van maken.</p>
  
  <h3>JQuery</h3>
  <p>Met de volgende opdracht leer je hoe je met behulp van JQuery er voor zorgt dat de pagina inhoud verandert als je 
  op een knop klikt.</p>
  <div class="opdrachten" id="jq_oef1">
  	<h2>Opdracht 1</h2>
  	<p>Maak een html webpagina en importeer JQuery met een link naar een &quot;cdn&quot; (content 
  	delivery network; zie code).</p>
  
<pre class="code">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset=&quot;UTF-8&quot;&gt;
&lt;title&gt;oefening 1&lt;/title&gt;
<span class="codeplus">&lt;script src=&quot;https://code.jquery.com/jquery-2.1.3.min.js&quot;&gt;&lt;/script&gt;</span>
&lt;/head&gt;
&lt;body&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>  


	<p>Voeg vervolgens een aantal simpele pagina elementen en een knop toe aan de body.</p>
<pre class="code">
&lt;body&gt;
    &lt;h1&gt;Oefening 1&lt;/h1&gt;
    &lt;p&gt;Een willekeurig stukje tekst&lt;/p&gt;
    &lt;p&gt;Een ander stukje tekst&lt;/p&gt;
    &lt;button type=&quot;button&quot; id=&quot;knop_1&quot;&gt;Verander tekst&lt;/button&gt;
&lt;/body&gt;
</pre>	
	<p>Zet nu de volgende JQuery code in je document. De plek maakt op zich niet uit. Later ga je JS/JQ code in 
	een apart .js bestand zetten.</p>
<pre class="code">
&lt;script&gt;
    <span class="comment">//voer uit als document gereed is</span>
    $(document).<span class="codeplus">ready</span> (function () {
        <span class="comment">// voeg event handling aan de knop toe</span>
        $(&quot;#knop_1&quot;).<span class="codeplus">click</span>(function() {
            <span class="comment">// beschrijf wat er moet gebeuren</span>
             $(&quot;p&quot;).text(&quot;it just works!!!!&quot;);
             $(&quot;button&quot;).hide();
             $(&quot;h1, p&quot;).css({ 
                 &#039;color&#039;: &#039;red&#039;, 
                 &#039;font-size&#039;: &#039;200%&#039;,
                 &#039;font-family&#039;: &quot;&#039;Comic Sans MS&#039;, cursive, sans-serif&quot; 
             });
        }); <span class="comment">//einde click event</span>
    }); <span class="comment">//einde ready event</span>
&lt;/script&gt;

</pre>	
	
	
	
  </div>
  <h3>Events</h3>
  <p>JavaScript is &quot;event driven&quot; dat wil zeggen dat het een functie uitvoert als er iets gebeurt. 
  In bovenstaande code zijn er twee events. De eerste is het moment dat de pagina geladen is. Dit is standaard 
  het begin van je code.</p>
<pre class="code">
$(document).ready <span class="codeplus">(</span>function () <span class="codeplus">{</span>
    <span class="comment">// hier komen je functies</span>
<span class="codeplus">});</span> <span class="comment">//einde ready event</span>;
</pre>
  <p>Hier staat letterlijk: voer de volgende functies uit zodra het document gereed is. De functies die je 
  schrijft worden als argument aan de <em>ready</em> functie meegegeven. Omdat functies in JavaScript vaak binnen andere 
  functies worden &quot;genest&quot; is het heel belangrijk dat je er voor zorgt dat je code goed inspringt. 
  Vaak wordt aan het einde van een functie (te herkennen aan }); commentaar gezet zoals in bovenstaande code.</p>
  
  <p>Binnen de ready functie wordt de click functie ge&iuml;nitialiseerd. Deze zorg er voor dat een functie wordt uitgevoerd 
  als gebruiker op de knop klikt.</p>
  <h3>Elementen selecteren</h3>
  
  
</div> 

	    

  
	
  </div>
 </div>
</div>
  <!-- <script src="/AO/clientside/H1/2048/js/bind_polyfill.js"></script>
  <script src="/AO/clientside/H1/2048/js/classlist_polyfill.js"></script>
  <script src="/AO/clientside/H1/2048/js/animframe_polyfill.js"></script>
  <script src="/AO/clientside/H1/2048/js/keyboard_input_manager.js"></script>
  <script src="/AO/clientside/H1/2048/js/html_actuator.js"></script>
  <script src="/AO/clientside/H1/2048/js/grid.js"></script>
  <script src="/AO/clientside/H1/2048/js/tile.js"></script>
  <script src="/AO/clientside/H1/2048/js/local_storage_manager.js"></script>
  <script src="/AO/clientside/H1/2048/js/game_manager.js"></script>
  <script src="/AO/clientside/H1/2048/js/application.js"></script>
  <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
 -->

</body>

<% } } %>
</html>	
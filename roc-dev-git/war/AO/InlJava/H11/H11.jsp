<%@ include file="/AO/InlJava/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-10">
        <h2>H11 Herhaling</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	       <h2>Leerdoelen</h2>
					
				<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je weet </p>
					<ul>
						<li>hoe je lussen (loops) gebruikt</li>
						<li>hoe je het <b>for-</b>,</li>
						<li>het <b>while-</b> &amp;</li>
						<li>het <b>do-while</b> statement kunt gebruiken</li>
						<li>wat wordt bedoeld met het <b>&quot;nesten&quot;</b> van lussen</li>
						
						
					</ul>
	          
        </div>
        <h4>Praktijk</h4>
		<img src="loop.png" width=450>
        
        
       
       <h3>Inleiding</h3>
					<p>Waar de computer echt goed in is, is steeds hetzelfde doen. En dat kan ook erg nuttig zijn. Bijvoorbeeld als uit een 
					lijst met namen alle Jansens geselecteerd moeten worden, betekent dat hij per naam steeds moet kijken of de naam hetzelfde 
					als Jansens is. Zo ja, dan moet die naam geselcteerd worden, zo nee, dan gaat de computer naar de volgende naam. Zo&#39;n 
					herhaling wordt ook wel iteratie of lus (in het Engels loop) genoemd.</p>
					
					<h3>Het for-statement</h3>
					<p>In het volgende voorbeeld worden 10 lijnen en 10 cijfers op het beeldscherm getekend. Dit gebeurt door middel van twee 
					opdrachten in een herhalingslus.</p>
					
<pre class="code">
<span class="comment">// Voorbeeld 11.1</span>

import java.awt.*;
import java.applet.*;


public class For extends Applet {
	
    public void init() {}

    public void paint(Graphics g) {
        int teller;
        int y = 0;
		
        <span class="codeplus">for(teller = 0; teller &lt; 10; teller++) {</span>
            y += 20;
            g.drawLine(50 , y, 300, y );
            g.drawString(&quot;&quot; + teller, 305, y );
        <span class="codeplus">}</span>
    }
}
</pre>					
					
					
					
					
					
					
					<p>De regel waar het omgaat is:<br>
					<b>for(teller = 0; teller < 10; teller ++);</b><br>
					Het for-statement bestaat naast de naam <b>for</b> uit drie onderdelen:</p>
					<ul>
						<li><p><b>teller = 0;</b><br>
						Eerst wordt de teller op 0 gezet. Dus de eerste keer dat de twee volgende opdrachten worden uitgevoerd, 
						is de teller 0. Je kunt dit zien als je de applet laat draaien, want achter de lijnen verschijnt steeds 
						de waarde die de teller op dat moment heeft.</p></li>
						<li><p><b>teller &lt; 10;</b><br>
						Dit is de voorwaarde. Zolang de teller kleiner is dan 10, worden de twee opdrachten in de lus uitgevoerd. 
						De 10e keer staat er in de teller 9, de 11e keer staat er in de teller 10, dit is niet langer kleiner dan 10 
						en dus wordt de lus verlaten.</p></li>
						<li><p><b>teller++</b><br>
						Elke keer als de lus wordt doorlopen, wordt de teller met 1 opgehoogd. De eerste keer is de teller 0, de 
						laatste keer 9, daarna is de teller niet meer kleiner dan 10 en wordt de lus verlaten.</p></li>
					</ul>
					
					
					<h3>Het while-statement</h3>
					<p>Wat er eigenlijk gebeurt met een for-statement, is dat deze wordt omgezet in een while-lus. Het volgend 
					voorbeeld heeft precies dezelfde uitvoer als het vorige voorbeeld:</p>

<pre class="code">
<span class="comment"> Voorbeeld 11.2</span>

import java.awt.*;
import java.applet.*;


public class For extends Applet {
	
    public void init() {}

    public void paint(Graphics g) {
        int teller = 0;
        int y = 0;
		
        <span class="codeplus">while(teller &lt; 10) {</span>
            y += 20;
            g.drawLine(50 , y, 300, y );
            g.drawString(&quot;&quot; + teller, 305, y );
            <span class="codeplus">teller++;</span>
        <span class="codeplus">}</span>
    }
}
</pre>							
					
					<p>Ook hier wordt de teller eerst op 0 gesteld, alleen nu in een aparte opdracht. Achter while staat nu tussen ronde 
					haken de voorwaarde: <b>teller &lt; 10</b> en aan het einde van de lus wordt de teller opgehoogd: <b>teller ++;</b> ook weer in een 
					aparte opdracht. De body van de lus staat evenals bij het for-statement tussen accolades.</p>
					
					<h3>Het do-while-statement</h3>
					<p>Het onderstaande voorbeeld geeft precies dezelfde uitvoer als de twee vorige voorbeelden.</p>
					
<pre class="code">
<span class="comment"> Voorbeeld 11.3</span>

import java.awt.*;
import java.applet.*;


public class For extends Applet {
	
    public void init() {}

    public void paint(Graphics g) {
        int teller = 0;
        int y = 0;
		
        <span class="codeplus">do {</span>
            y += 20;
            g.drawLine(50 , y, 300, y );
            g.drawString(&quot;&quot; + teller, 305, y );
            <span class="codeplus">teller++;</span>
        <span class="codeplus">} while (teller &lt; 10);</span>
    }
}
</pre>							
					<p>Eerst wordt weer de teller op 0 gesteld. Op de volgende regel staat nu niet <b>while</b>, maar <b>do</b>. De body van de lus 
					staat wederom tussen accolades. De teller wordt aan het einde van de lus opgehoogd met 1 en vervolgens staat het 
					while-statement met daarachter de voorwaarde. Het verschil tussen een while-lus en een do-while-lus is dat de laatste 
					minimaal &eacute;&eacute;n keer wordt doorlopen omdat controle van de voorwaarde achteraf plaatsvindt en een while-lus 
					minimaal nul keer wordt doorlopen omdat de voorwaarde vooraf gecontroleerd wordt.</p>
					
					<h3>Lussen in het algemeen</h3>
					<p>Belangrijk is, dat de voorwaarde meteen ge&euml;valueerd wordt  als de variabele die in de voorwaarde van de lus staat, 
					gewijzigd wordt. Als dat niet gebeurt, wordt het gedrag van de lus onvoorspelbaar. Bij het for-statement gebeurt dat automatisch, 
					bij de while- en do-while-statement moet de programmeur daar zelf opletten.</p>
					<p>Verder is het mogelijk dat in de body van een lus nog een lus voorkomt en nog &eacute;&eacute;n en nog &eacute;&eacute;n. 
					Dat wordt het nesten van lussen genoemd. Hetzelfde geldt overigens voor het if-else-statement. Doe dit zo weinig mogelijk, 
					want de broncode wordt onleesbaar en dus niet meer onderhoudbaar. Als iets dergelijks op te lossen is door voorwaarden te 
					combineren met logische operatoren, dan verdient die werkwijze de voorkeur. Er zijn echter situaties waarin het nesten van 
					lussen niet voorkomen kan worden.</p>
					<p>Een lus kent altijd &eacute;&eacute;n of meerdere voorwaarden. Deze voorwaarden werken op dezelfde manier als bij het 
					if-then-statement. Ook het gebruik van de logische operatoren is hetzelfde.</p>
					<p>In de voorbeelden hierboven is de teller van de lus steeds met &eacute;&eacute;n opgehoogd. Dat hoeft natuurlijk niet 
					bij elke lus zo te zijn: Hij kan ook met 2 of 3 worden opgehoogd, of de teller kan bij 10 beginnen en eindigen als hij gelijk 
					is aan 0. Ook kan een lus verlaten worden als aan een andere voorwaarde is voldaan. Bijvoorbeeld bij zoeken naar de naam Jansens 
					zal de lus verlaten worden zodra de naam is gevonden.</p>
					<p>Het kan voorkomen dat je een oneindige lus hebt gemaakt. Dat betekent dat de computer steeds bezig is de opdrachten in de lus 
					uit te voeren en altijd aan de voorwaarde voldoet. Sluit dan de browser als het in een browser gebeurt of be&euml;indig de taak 
					in taakbeheer (ctrl+shift+esc).</p>
				
										
					
				
				
									
				
				<div class="opdrachten">
					
					<h2>Vragen</h2>
					<ol>
						<li><p>Wat is het verschil tussen een while- en do-while-lus?</p></li>
						<li><p>Is de for-lus eigenlijk een do-while-lus of een while-lus?</p></li>
						<li><p>Wat is het nesten van lussen?</p></li>
						<li><p>Bekijk de volgende broncode</p>
<pre class= "code">
int eind = 5;
for(int x = 10;  x &lt; eind;  x++) {
     ....
     ....
}
</pre>						
						<p>Wordt de lus uitgevoerd? Geef een verklaring voor je antwoord</p></li>
						
					</ol>
		
					<h2>Opdracht 11.1</h2>
					<p>Schrijf een applet, waarin 10 <b>verticale</b> lijnen worden getoond.</p>
					
					<h2>Opdracht 11.2</h2>
					<p>Schrijf een applet, waarin tien getallen van 20 tot 10 worden getoond.</p>
					
					<h2>Opdracht 11.3</h2>
					<p>Geef de rij van Fibonacci. De eerste twee getallen van de rij zijn 1 en de volgende zijn de som van de twee voorgangers.<br>
					1,   1,    2,    3,    5,    8,    13,    21,  en zo voort...</p>
					
					<h2>Opdracht 11.4</h2>
					<p>Maak een applet waarin de tafel van drie getoond wordt.</p>
					
					<h2>Opdracht 11.5</h2>
					<p>Breid de applet uit opdracht 4 zo uit dat de gebruiker kan ingeven welke tafel hij wil zien.</p>
					
					<h2>Opdracht 11.6</h2>
					<p>Teken vijf vierkanten volgens onderstaand figuur:<br>
					
					<canvas id="vierkanten" width=150 height=150></canvas>
					
					<script>
					var c = document.getElementById("vierkanten");
					var ctx = c.getContext("2d");
					var x = 20;
					var y = 20;
					var breedte = 20;
					var hoogte = 20;

					
					for (i = 0; i < 5; i++) {
						ctx.beginPath();
						ctx.rect(x, y, breedte, hoogte);
						ctx.stroke();
						x += 20;
						y += 20;
					}


					</script>
					
					<h2>Opdracht 11.7</h2>
					<p>Teken vijf concentrische cirkels zoals in het volgende figuur:</p>
					
					<canvas id="cirkels" width=200 height=100></canvas>
					
					<script>
					var c = document.getElementById("cirkels");
					var ctx = c.getContext("2d");

					var straal = 7;
					for (i = 0; i < 5; i++) {
						ctx.beginPath();
						ctx.arc(95, 50, straal, 0, 2*Math.PI);
						straal += 7;
						ctx.stroke();
					}


					</script>
					
					<h2>Opdracht 11.8</h2>
					<p>Teken 50 concentrische cirkels zoals onderstaand figuur.</p>
					<canvas id="cirkels2" width=600 height=600></canvas>
					
					<script>
					var c = document.getElementById("cirkels2");
					var ctx = c.getContext("2d");

					var straal = 5;
					for (i = 0; i < 50; i++) {
						ctx.beginPath();
						ctx.arc(300, 300, straal, 0, 2*Math.PI);
						straal += 5;
						ctx.stroke();
					}
					</script>
					
					<h2>Opdracht 11.9</h2>
					<p>Schrijf een applet waarin minimaal 100 cirkels worden getoond die hetzelfde beginpunt hebben, maar elke cirkel wordt 
					iets groter dan de vorige.</p>
					
					<h2>Opdracht 11.10</h2>
					<p>Schrijf een applet waarin een schaakbord op het scherm wordt getekend. Een schaakbord heeft 8 bij 8 vakken om en om 
					wit en zwart. Zie <a href="Schaakbord.jsp" target="_blank">nadere uitleg</a></p>
					
					<h2>Praktijkopdracht</h2>
					<p>Deze praktijkopdracht bevat twee opdrachten die over tafels gaan. Een tafel op het scherm ziet er als volgt uit:<br>
					<b>1 x 1 = 1<br>
					2 x 1 = 2<br>
					enz...</b></p>
					<ol>
					<li><p>Schrijf een applet in Java, waarin de gebruiker een getal invoert en als de gebruiker op de Ok-knop klikt, verschijnt 
					de tafel van dat getal in het venster. Dus als de gebruiker een 9 heeft ingetikt, verschijnt de tafel van 9. Als de gebruiker 
					opnieuw een getal intikt, wordt die tafel weergegeven.</p></li>
					<li><p>Schrijf een applet in Java, waarin de tafels van 1 tot en met 10 worden weergegeven. Als &eacute;&eacute;n tafel op het 
					scherm zichtbaar is en de gebruiker klikt op de Ok-knop, dan wordt de volgende tafel zichtbaar.</p>
					</ol>
					<p>
					
					
				</div>
		


	
    </div>
  </div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="/AO/InlJava/includes/inlJava.js" type="text/javascript"></script>
<% } %>

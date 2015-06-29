<%@ include file="/AO/InlJava/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-10">
        <h2>H13 Zelf methodes maken</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	       <h2>Leerdoelen</h2>
					
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
			<ul>
				<li>weet hoe je zelf methodes kunt maken en hoe je ze kunt aanroepen</li>
				<li>weet wanneer je globale en wanner je lokale variabelen gebruikt</li>
				<li>weet hoe je parameters aan een methode meegeeft</li>
				<li>weet hoe je een methode een waarde kunt laten teruggeven (terugkeerwaarde)</li>
				<li>weet wat <b>void</b> betekent</li>
			</ul>
	          
        </div>
        
        
        
       
        
			<h4>Praktijk</h4>
			<img src="methodes.png" width=400>
			<h3>Inleiding</h3>
			<p>Methodes zijn stukjes programmatuur die een bepaalde functie vervullen. Veel methodes zijn voorgedefinieerd 
			zoals <b>drawString()</b>. Er kan aan deze methode niets veranderd worden. Alleen met argumenten kan aangegeven worden 
			wat waar op het beeldscherm gezet wordt.</p>
			<p>Ook zijn er methodes waarvan je zelf de inhoud kunt bepalen. Daarbij moet wel rekening gehouden worden met het doel 
			van de functie. Een voorbeeld is <b>paint()</b>. De bedoeling van de functie is dat er iets op het scherm gezet wordt 
			en Windows roept de methode aan als het nodig is het scherm te verversen. Als er in deze methode een berekening gezet wordt, 
			wordt deze berekening telkens uitgevoerd als het scherm ververst wordt. Er is dan niet bekend op welk moment de berekening 
			wordt uitgevoerd. </p>
			<p>Tot slot kun je zelf methodes maken. Je bepaalt dan niet alleen de inhoud van de methode, maar ook de naam en eventueel 
			de argumenten en de terug te geven waarde van de methode.</p>
			
			<h3>De declaratie van een methode</h3>
					<p>De declaratie van een methode bepaalt drie eigenschappen van de methode: Of en zo ja de soort waarde die teruggegeven wordt, 
					de naam van de methode en het aantal en de soort argumenten. </p>
					<p>Het is belangrijk de methode een logische naam te geven, zodat je aan de naam van de methode kunt zien welke functie de 
					methode heeft. Een naam als &quot;xxx&quot; zegt dus niets, een naam als &quot;bereken&quot; ook niet. Een naam als 
					&quot;berekenSom&quot; zegt wel iets.  Ook hier geldt evenals bij primitieve variabelen, dat de naam van een methode met een 
					kleine letter begint en de tweede en andere woorden met een hoofdletter.</p>
					<p>Een methode die  als volgt is gedefinieerd: <b>void berekenGemiddelde()</b> heeft geen argumenten (Dat zien we aan de haakjes waar 
					niets tussen staat) en geeft geen waarde terug Dat zien we aan het woord 
					<a href="https://translate.google.nl/#en/nl/void" target="_blank"><b>void</b></a> voor de naam van de functie. De naam van de 
					methode vertelt dat er een som wordt berekend.</p>
					
					<h3>De body van de methode</h3>	
					<p>De body van een methode bestaat uit &eacute;&eacute;n of meerdere programmaregels. De body begint en eindigt met een accolade:</p>
					
<pre class="code">
{
    int som, gem;
    int a = 5, b = 6;

    som = a + b;
    gem = som /2;
}
</pre>				
					<p>Deze body bestaat uit twee regels met declaraties van variabelen, uit twee opdrachtregels en uit een begin- en een eindaccolade.</p>
					<p>Met deze kennis kunnen we een eerste eenvoudige methode schrijven:</p>
					
<pre class="code">
void berekenGemiddelde() {
    double som, gem;
    double a = 5, b = 6;

    som = a + b;
    gem = som /2;
}

</pre>
						
								
					<p>Toch kan deze methode nog niet veel. Het enige wat er gebeurt, is de berekening van het gemiddelde van 5 en 6. Ook de rest 
					van het programma kan niets met de resultaten (de som en gemiddelde) van de methode.</p>
					
					<h3>Globale en lokale variabelen</h3>
					<p>De variabele <b>gem</b> kan bovenaan in  klasse worden gedeclareerd. Dan kan overal in het programma de variabele gebruikt worden. 
					Deze variabelen worden globaal genoemd. Nu kan dat niet omdat de variabelen <b>som</b> en <b>gem</b> zijn opgenomen in de body van de methode. 
					Ze kunnen alleen gebruikt worden in de body van de functie en verder niet. <b>som</b> en <b>gem</b> zijn lokale variabelen. Als we willen dat 
					<b>gem</b> globaal wordt, komt het programma er als volgt uit te zien:</p>
					
<pre class="code">
<span class="comment">//Voorbeeld 13.1</span>

import java.awt.*;
import java.applet.*;

public class EersteMethode extends Applet {
	
    <span class="codeplus">double gem;</span>
	
    public void init() {
        berekenGemiddelde();
    }

    public void paint(Graphics g) {
        g.drawString("Het gemiddelde is: " + <span class="codeplus">gem</span>, 50, 60 );
    }
	
    void berekenGemiddelde() {
        double som;
        double a = 5, b = 6;
		
        som = a + b;
        <span class="codeplus">gem = som / 2;</span>
    }
}
</pre>					
					
					<p>Zou gem niet bovenaan in de applet staan, maar in de body van de methode, dan verschijnt de foutmelding: <b>cannot resolve symbol</b>.</p>
					<p>Als vuistregel kun je hanteren dat wanneer je een variabele alleen in &eacute;&eacute;n methode gebruikt, je hem daar als lokale 
					variabele declareert. 
					Globale variabelen gebruik je alleen wanneer je ze in meerdere methodes gebruikt.
					Bovendien blijft je code op die manier overzichtelijker. </p>
					
					<h3>Aanroepen van een methode</h3>
					<p>In <b>Init()</b> van Voorbeeld 13.1 staat de aanroep van <b>berekenGemiddelde()</b>. De aanroep bestaat uit de naam van de methode en uit 
					twee ronde haken. Eventueel staan tussen de ronde haken de argumenten, gescheiden door komma&#39;s.</p>
					
					<h3>Parameters</h3>
					<p>Toch is deze methode niet erg handig. Het enige wat deze methode uitrekent, is nog steeds het gemiddelde van 5 en 6. De methode 
					moet nog algemener worden zodat de methode niet alleen geschikt is voor deze applet, maar ook in andere applets gebruikt kan worden.</p>
					<p>Daarvoor moet zowel de aanroep als de declaratie van de methode aangepast worden. De aanroep verandert door argumenten of 
					(invoer)parameters mee te geven aan de functie: </p>
<pre class="code">
berekenGemiddelde(5, 6)
</pre>					
					
					<p>Om ervoor te zorgen dat de methode weet wat er met de 5 en de 6 moet gebeuren, moet ook de declaratie gewijzigd worden:</p>
					
<pre class="code">
void berekenGemiddelde(double a, double b) {

}
</pre>					
					
					<p>Nu kunnen we in de applet waar we dat willen, de methode aanroepen met 
					willekeurige getallen. We kunnen nu ook met variabelen van dezelfde soort de methode aanroepen:</p>
					
<pre class="code">
<span class="comment">//Voorbeeld 13.2</span>

import java.awt.*;
import java.applet.*;

public class EersteMethode extends Applet {
	
    double <span class="codeplus">gem</span>;
	
    public void init() {
        double c = 6;
        double d = 7;
        berekenGemiddelde(<span class="codeplus">c</span>, <span class="codeplus">d</span>);
    }

    public void paint(Graphics g) {
        g.drawString("Het gemiddelde is: " + <span class="codeplus">gem</span>, 50, 60 );
    }
	
    void berekenGemiddelde(double <span class="codeplus">a</span>, double <span class="codeplus">b</span>) {
        double som;
        som = <span class="codeplus">a</span> + <span class="codeplus">b</span>;
        <span class="codeplus">gem</span> = som / 2;
    }
}
</pre>				

					<p>Toch is de methode nog niet algemeen genoeg. gem Is nog steeds een globale variabele. Als deze lokaal wordt, 
					moet de methode op een andere manier het resultaat van de berekening aan het programma doorgeven. Dan spreken we van 
					een uitvoerparameter of terugkeerwaarde (return value). Welke soort variabele de methode teruggeeft, moet in de declaratie 
					worden aangegeven. In plaats van <b>void</b> komt er <b>double</b> te staan:<br>
					<b>double berekenGemiddelde(double a, double b)</b></p>
					<p>In de laatste regel van de body van de methode komt dan de opdracht return te staan met daarachter de waarde (eventueel 
					in de vorm van een variabele) die teruggeven wordt: return gem; Daar waar de methode wordt aangeroepen, moet komen te staan 
					in welke variabele het resultaat van de methode moet worden opgeslagen:<br>
					<b> gemiddelde = BerekenGemiddelde(c, d);</b></p> 
					<p>Het volledige programma komt er als volgt uit te zien: </p>
					
<pre class="code">
<span class="comment">//Voorbeeld 13.3</span>

import java.awt.*;
import java.applet.*;

public class EersteMethode extends Applet {
	
    double <span class="codeplus">gemiddelde</span>;
	
    public void init() {
        double c = 6;
        double d = 7;
        <span class="codeplus">gemiddelde</span> = berekenGemiddelde(c, d);
    }

    public void paint(Graphics g) {
        g.drawString("Het gemiddelde is: " + <span class="codeplus">gemiddelde</span>, 50, 60 );
    }
	
    <span class="codeplus">double</span> berekenGemiddelde(double <span class="codeplus">a</span>, double <span class="codeplus">b</span>) {
        double som;
        double gem;
        som = <span class="codeplus">a</span> + <span class="codeplus">b</span>;
        <span class="codeplus">gem</span> = som / 2;
        <span class="codeplus">return gem;</span>
    }
}
</pre>					


					<p>Toch is de methode nog niet algemeen genoeg, want er kan alleen nog maar een gemiddelde van twee waarden worden berekend. 
					Wat we willen, is dat een tabel van een willekeurig aantal getallen aan de methode wordt aangeboden en dat de methode dan het 
					gemiddelde teruggeeft. Dat kan door een tabel aan de methode door te geven als invoerparameter:</p>
					
<pre class="code">
<span class="comment">//Voorbeeld 13.4</span>

import java.awt.*;
import java.applet.*;

public class EersteMethode extends Applet {
	
    <span class="codeplus">double[] getallen = { 2, 4, 6, 8};</span>
    double gemiddelde;
	
    public void init() {
       gemiddelde = berekenGemiddelde(<span class="codeplus">getallen</span>);
    }

    public void paint(Graphics g) {
        g.drawString("Het gemiddelde is: " + <span class="codeplus">gemiddelde</span>, 50, 60 );
    }
    
    <span class="comment">/**</span>
    <span class="comment"> *geeft gemiddelde van reeks getallen</span>
    <span class="comment"> *@param array van doubles</span>
    <span class="comment"> *@return double gemiddelde</span>
    <span class="comment"> */</span>
    double berekenGemiddelde(<span class="codeplus">double[] d</span>) {
        int teller;
        double som = 0;
        double gem = 0;
        
        for (teller = 0; teller < <span class="codeplus">d.length</span>; teller++) {
            som += <span class="codeplus">d[teller]</span>;
        }
        gem = som / <span class="codeplus">d.length</span>;
        
        <span class="codeplus">return gem;</span>
    }
}
</pre>								
					
					<p>De declaratie van de methode is veranderd: De invoerparameters a en b zijn verdwenen en er is 
					een tabel a voor in de plaats gekomen. Eerst wordt som ge&iuml;nitialiseerd. Anders is in de lus niet 
					bekend welke waarde som heeft. Verder staat er in de body van de methode een lus, die de tabel 
					doorloopt. De methode <b>d.length</b>  geeft het aantal elementen van de tabel terug. In de lus wordt de 
					som van de getallen in de tabel berekend. Daarna wordt de som van alle getallen gedeeld door het 
					aantal elementen in de tabel en wordt het gemiddelde aan het programma teruggegeven. De methode 
					is nu in veel situaties te gebruiken. De enige beperking is dat de tabel geheel gevuld moet 
					zijn met getallen.</p>
					<div class="opdrachten">
					
						
					<h2>Opdracht 13.1</h2>
					<p>Schrijf een applet in Java waarin vijf knoppen in het venster worden geplaatst die elk een andere achtergrondkleur 
					en de naam van de achtergrondkleur als tekst hebben. Als de gebruiker op &eacute;&eacute;n van de knoppen drukt, komt 
					in het venster de naam van de kleur te staan.</p>
					<h2>Opdracht 13.2</h2>
					<p>2. Maak een applet in Java met een methode om een driehoek te tekenen. De declaratie van de methode ziet er als volgt uit:</p>
<pre class="code">
void tekenDriehoek( Graphics g, int x1, int y1, int x2, int y2, int x3, int y3);
</pre>					
					<p>De methode roep je aan vanuit paint(). De argumenten x1, y1 en x2, y2 en x3, y3 zijn de co&ouml;rdinaten 
					van de hoekpunten van de driehoek.</p>
					
					<h2>Opdracht 13.3</h2>
 					<p>Schrijf een applet in Java waarin in een methode een muur van rode bakstenen wordt getoond.</p>
 					
 					<h2>Opdracht 13.4</h2>
 					<p>Schrijf een applet die bij de start alleen twee knoppen toont. Als de gebruiker op de &eacute;ne knop klikt krijgt hij een 
 					muur met rode bakstenen te zien en als hij op de andere knop klikt, krijgt hij een muur met grijze betonblokken te zien. 
 					De betonblokken zijn groter dan de bakstenen. Bedenk zelf welke methodes je nodig hebt met welke argumenten.</p>

					<h2>Praktijkopdracht</h2>
					<p>1. Maak een applet met een methode om een eenvoudige boom te tekenen. Bedenk zelf welke argumenten de methode zou moeten hebben.</p>
					<p>2. Gebruik de methode uit opdracht 1 om een boomgaard te tekenen die uit tenminste 2 rijen van minimaal 5 bomen bestaat.</p>
					<p>Als je klaar bent, lever je de broncode in</p>
				</div>
			
				
		</div>


	
    </div>
  </div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="/AO/InlJava/includes/inlJava.js" type="text/javascript"></script>	
<% } %>

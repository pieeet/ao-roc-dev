<%@ include file="/AO/InlJava/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-10">
        <h2>H6 Getallen</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	       <h2>Leerdoelen</h2>
				<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
				<ul>
					<li>weet hoe je in Java variabelen declareert en initialiseert</li>
					<li>weet wat de primitieven int, long double en float zijn</li>
					<li>hoe je dezen naar een String kunt converteren om ze bijvoorbeeld op een scherm af te drukken</li>
					<li>de verschillende operatoren in rekenkundige bewerkingen kent</li>
					<li>hoe je unaire operatoren gebruikt</li>
					<li>wanneer en hoe je bij conversie van types typecasting moet toepassen</li>
					<li>hoe je in Java variabelen (betekenisvolle) namen geeft</li>
				</ul>
	          
        </div>
        
        
        
       
        <div id="artikel">
     		
					<h4>Praktijk</h4>
					<img src="images/10_trans.png" width="500">
					
					<h3>int en long</h3>			
					<p>Voor gehele getallen kun je het beste variabelen gebruiken van het type int of long. De keuze tussen de twee typen 
					hangt af van de grootst mogelijke waarde die de variabele moet kunnen bevatten. Over het algemeen zal een int volstaan. 
					Wel moet je ervoor oppassen dat de waarden niet buiten de begin- en eindwaarde komen, want dan krijg je onjuiste en 
					onvoorspelbare resultaten. Als een variabele van het type int een waarde hoger dan 2147483647 krijgt, zal dat vaak 
					resulteren in een negatieve waarde en niet in een positieve waarde.</p>
					
					
					
				</div>
				
<pre class="code">
<span class="comment">//Voorbeeld 6.1</span>

import java.awt.*;
import java.applet.*;


public class Reken extends Applet {
    int a;
    int b;
    int c;
    int uitkomst;

    public void init() {
        a = 7;
        b = 8;
        c = 3;
        uitkomst = (a + b) / c;
    }

    public void paint(Graphics g) {
        g.drawString("De uitkomst is: " + uitkomst, 20, 20);
    }
}
</pre>
					
					<p>Op het scherm komt te staan: <b>De uitkomst is 5</b>
					<p>Eerst worden de variabelen <em>&quot;gedeclareerd&quot;</em>
					
<pre class="code">
int a;
int b;
int c;
int uitkomst;
</pre>					
					<p>Er had ook kunnen staan:</p>
<pre class="code">
int a, b, c, uitkomst;
</pre>
					
					<p>In de methode <b>init()</b> worden aan de variabelen waarden toegekend. Dat wordt initialiseren genoemd. 
					Dat moet altijd gebeuren, want anders weet je niet welke waarde in een variabele staat. Dat kan namelijk een 
					waarde zijn van een vorig programma die toevallig dezelfde geheugencellen heeft gebruikt en hoeft dus niet per se 
					0 te zijn:</p>
<pre class="code">
a = 7;
b = 8;
c = 3;
uitkomst = (a + b) / c;
</pre>
					<p>Deze opdrachten worden toekenningen of assignments genoemd en het &quot;=&quot;-teken heet de assignment-operator.</p>
					<p>Vervolgens wordt er een berekening gedaan en de uitkomst van die berekening wordt opgeslagen in de variabele 
					<b>uitkomst</b>. Eerst worden de waarden van a en b bij elkaar opgeteld en vervolgens wordt de som van a en b gedeeld 
					door de waarde in c.</p> 
					
					<h3>Conversie naar string</h3>
					<p>Zoals uitgelegd is in hoofdstuk 5, kunnen variabelen van het type int niet naar het scherm geschreven worden. 
					De conversie van int naar string vindt in de volgende regel plaats:</p>
					
<pre class="code">
g.drawString(&quot;De uitkomst is: &quot; + <span class="codeplus">uitkomst</span>, 20, 20);
</pre>					
					
					<p><b>&quot;De uitkomst is &quot;</b> en <b>uitkomst</b> zijn twee verschillende typen: namelijk een string en een int. In 
					dit geval zal Java <b>uitkomst</b> automatisch naar een string converteren en achter <em>&quot;De uitkomst is: &quot;</em> plakken. 
					Een double (decimaal getal) kun je op dezelfde manier converteren naar een string. Als alleen het getal in het venster 
					zichtbaar moet worden, dan gebruik je een <b>lege string</b>:
					</p>
<pre class="code">
g.drawString(<span class="codeplus">&quot;&quot; + uitkomst</span>, 20, 20);
</pre>						
					<h3>Rekenkundige bewerkingen</h3>
					<div class="table_wrapper">
					<table border="1">
						<tr>
							<th>Operator</th><th>Bewerking</th>
						</tr>
						<tr>
							<td>*</td><td>Vermenigvuldigen</td>
						</tr>
						<tr>
							<td>/</td><td>Delen</td>
						</tr>
						<tr>
							<td>%</td><td>Moduleren</td>
						</tr>
						<tr>
							<td>+</td><td>Optellen</td>
						</tr>
						<tr>
							<td>-</td><td>Aftrekken</td>
						</tr>
					</table>
					</div>
					
					<p>In de tabel zie je de operator staan en de bewerking die erbij hoort. Bij delen moet je er rekening mee houden dat 
					een int door een int delen betekent dat er een int wordt teruggegeven. Dat wil zeggen dat 20 / 6 als uitkomst heeft 3 
					en niet 3,33333333. 20 % 6 heeft als uitkomst 2, namelijk de rest van de deling 20 / 6. <br>
					De prioriteit bepaalt de volgorde van de rekenkundige bewerkingen die worden uitgevoerd. Als een operator een hogere 
					prioriteit heeft, dan wordt de rekenkundige bewerking eerder uitgevoerd. Als operatoren een gelijke prioriteit hebben, 
					dan wordt de berekening van links naar rechts uitgevoerd. De operatoren *, /, % hebben een hogere prioriteit dan de operatoren 
					+ en -. De operatoren *, /, % hebben een gelijke prioriteit evenals de operatoren + en -. Door het gebruik van ronde haken kun 
					je een andere prioriteit geven aan een rekenkundige bewerking.</p>
					
					<p>Verder zijn er de volgende unaire operatoren. Unair wil zeggen dat zij op &eacute;&eacute;n variabele van toepassing zijn. In onderstaande 
					tabel wordt dit ge&iuml;llustreerd. Uitgangspunt is dat de a een variabele is van het type int en een waarde van 35 heeft.</p> 
					<div class="table_wrapper">
					<table border="1">
						<tr>
							<th>Operator</th><th>Voorbeeld</th><th>Betekenis</th><th>Uitkomst</th>
						<tr>
						<tr>
							<td>+=</td><td>a += 30</td><td>a = a + 30</td><td>65</td>
						</tr>
						<tr>
							<td>-=</td><td>a -= 30</td><td>a = a - 30</td><td>5</td>
						</tr>
						<tr>
							<td>*=</td><td>a *= 30</td><td>a = a * 30</td><td>1050</td>
						</tr>
						<tr>
							<td>/=</td><td>a /= 30</td><td>a = a / 30</td><td>1</td>
						</tr>
						<tr>
							<td>%=</td><td>a %= 30</td><td>a = a % 30</td><td>5</td>
						</tr>
						<tr>
							<td>++</td><td>a++</td><td>a = a + 1<br>a += 1</td><td>36</td>
						</tr>
						<tr>
							<td>--</td><td>a--</td><td>a = a - 1<br>a -= 1</td><td>34</td>
						</tr>
					</table>
					</div>
					<p>De laatste twee operatoren worden veelvuldig gebruikt, meestal als er sprake is van een teller.</p>

<pre class="code">
<span class="comment">// Voorbeeld 6.2</span>

import java.awt.*;
import java.applet.*;


public class Teller extends Applet {
    <span class="codeplus">int teller;</span>
	
    public void init() {
        <span class="codeplus">teller = 0;</span>
    }

    public void paint(Graphics g) {
        <span class="codeplus">teller++;</span>
        g.drawString("Scherm is " + teller + 
            " keer ververst.", 50, 60 );
    }
}
</pre>					
					
					<p>In dit programma wordt een teller als een int gedeclareerd:</p>
					<pre class="code">int teller;</pre>
					In <b>init()</b> wordt teller ge&iuml;nitialiseerd:<br>
					<pre class="code">teller = 0;</pre>
					In <b>paint()</b> wordt teller met 1 opgehoogd:<br>
					<pre class="code">teller++;</pre>
					<p>En in de volgende regel wordt teller op het scherm gezet met tekst erbij. Het programma telt het aantal keren dat het 
					venster van de applet getekend wordt. Anders gezegd: Het programma telt het aantal keren dat de methode paint() wordt 
					aangeroepen en uitgevoerd.</p>
					
					<h3>double en float</h3>
					<p>Double en float zijn primitieve typen die gebruikt worden voor gebroken getallen. Omdat float een precisie heeft van 
					hooguit 7 cijfers en double een precisie heeft van 15 cijfers, gaat de voorkeur uit naar double. Bij float leidt de lagere 
					precisie al snel tot afkappingen en dat heeft onnauwkeurigheid tot gevolg. Net zoals bij integers kun je bij doubles de operatoren 
					*, /, %, +, - gebruiken. Voor deze operatoren gelden dezelfde prioriteiten als bij ints.</p>
					
<pre class="code">
<span class="comment">//Voorbeeld 6.3</span>

import java.awt.*;
import java.applet.*;


public class Reken extends Applet {
    double a, b, c, uitkomst;
	
	
    public void init() {
        a = 8;
        b = 8;
        c = 3;
        uitkomst = (a + b) / c;
    }

    public void paint(Graphics g) {
        g.drawString("De uitkomst is: " + uitkomst, 20, 20);
    }
}
</pre>					
					<p>Op het scherm komt te staan: De uitkomst is: 5,333333333333333. Vergelijk dat maar eens met voorbeeld 6.1.</p>
					
					<h3>Conversie</h3>
					<p>De conversie van een int naar een double gaat redelijk makkelijk, omdat een double een groter bereik heeft dan een int. De int 
					8 kan zonder informatieverlies worden geconverteerd naar double 8.0. De volgende code wordt daarom probleemloos door de compiler 
					geaccepteerd.</p>
					
<pre class="code">
<span class="comment">//Dit gaat zonder meer goed</span>
int geheel;
double gebroken;
gebroken = geheel;
</pre>					
					<p>Bij de conversie van double naar int kan wel informatie verloren gaan. De conversie van 8.3 naar een int zou immers 8 opleveren. Dit 
					wordt niet zonder tegensputteren geaccepteerd.</p>
					
 <pre class="code">
 <span class="comment">//Dit levert een foutmelding op</span>
int geheel;
double gebroken;
geheel = gebroken;
 </pre>
					<p>De volgende foutmelding krijg je te zien:<br>
					<b>found: double<br>
					required: int</b></p>
					
					<p>Om toch conversie van double naar int af te dwingen moet er &quot;typecasting&quot; plaatsvinden. Hiermee zegt de programmeur 
					als het ware tegen de compiler dat hij zich er van bewust is dat er informatie verloren kan gaan, maar dat hij dat accepteert.</p>
 <pre class="code">
<span class="comment">//Typecasting</span>
int geheel;
double gebroken;
geheel = <span class="codeplus">(int)</span> gebroken;
 </pre>					
					<p>De double die achter (int) staat, beschouwt de compiler nu als een geheel getal. Dat betekent dat de compiler de cijfers 
					achter de decimale punt weghaalt. Er kan dus sprake zijn van informatieverlies.</p>
					
					<h3>Namen van variabelen</h3>
					<p>In de voorbeelden hierboven zijn eenvoudige nietszeggende namen gebruikt: a of b. Het is verstandig in de broncode van een 
					programma de namen van variabelen betekenisvolle namen te geven, zodat je meteen kunt zien wat de inhoud van een variabele is. 
					Zo is de naam gemiddelde een betekenisvolle naam want aan de naam zie je dat de inhoud van de variabele een gemiddelde is. 
					Geef variabelen dus logische namen.</p>
					<p>Namen van variabelen mogen bestaan uit kleine letters, hoofdletters, cijfers en de underscore. Namen van variabelen mogen 
					echter nooit met een cijfer beginnen. Verder mogen er in namen van variabelen geen leestekens voorkomen. Begin de namen van 
					variabelen altijd met een kleine letter en begin eventueel een tweede of volgend woord met een hoofdletter. Bijvoorbeeld:<br>
					<b>gemiddeldCijfer</b>.
					
				
				
									
				
				<div class="opdrachten">
					<h2>Vragen</h2>
					<ol>
						<li>Waarom is initialiseren van variabelen noodzakelijk?</li>
						<li>Waarom is er typecasting noodzakelijk bij de conversie van een double naar een int?</li>
					
					
<pre class="code">
<span class="comment">//Voorbeeld 6.4</span>

import java.awt.*;
import java.applet.*;


public class Reken extends Applet {
    int a, b, c;
    double uitkomst;
	
	
    public void init() {
        a = 8;
        b = 8;
        c = 3;
        uitkomst = (a + b) / c;
    }

    public void paint(Graphics g) {
        g.drawString(&quot;De uitkomst is: &quot; + uitkomst, 20, 20);
    }
}
</pre>
						<li>Wat is de uitvoer van dit programma? Geef een verklaring.</li>
						<li>In de regel uitkomst = (a + b) / c; laat je de ronde haken weg. De regel ziet er dan als volgt uit:<br>
						<pre class="code">uitkomst = a + b / c;</pre>
						Wat is de uitvoer van dit programma? Geef een verklaring.</li>
					</ol>
					
					<h2>Opdracht 6.1</h2>
					<p>Met z&#39;n vieren (Jan, Ali, Jeannette en jij) hebben jullie een karwei verricht en daarmee 113 euro verdiend. 
					Schrijf een applet waarin je een berekening maakt om het geld zo eerlijk mogelijk te verdelen. In het venster van 
					de applet komen de vier namen onder elkaar te staan met daarachter het bedrag dat een ieder krijgt.</p>
					
					<h2>Opdracht 6.2</h2>
					<p>Schrijf een applet, waarin berekend wordt hoeveel seconden er in een uur, dag en jaar gaan en de uitkomst 
					van de berekening in het venster van de applet toont.</p>
					
					<h2>Opdracht 6.3</h2>
					<p>Schrijf een applet waarin je twee ints met positieve waarden bij elkaar optelt en er een negatieve int uit komt.</p>
					
					
					<h2>Praktijkopdracht</h2>
					<p>Een cursist heeft drie cijfers behaald: 5,9; 6.3; 6,9.<br>
					Schrijf een applet in Java, waarin van de bovenstaande cijfers het gemiddelde wordt uitgerekend en dat gemiddelde met 
					&eacute;&eacute;n decimaal op het scherm wordt getoond. Op het scherm komt te staan: <b>Het gemiddelde is: 6.3</b>.  
					Het gemiddelde mag afgekapt worden en hoeft niet afgerond te worden. Als je klaar bent, lever je de broncode in bij je docent.</p>
					<p><b>Aanwijzing</b>: Als je het gemiddelde hebt uitgerekend, komt er te staan 6.366666666... Door gebruik te maken van de eigenschappen 
					van double en int kun je afkappen. Je moet het gemiddelde met 10 vermenigvuldigen en daarna converteren naar een int. Vervolgens 
					terugconverteren naar een double en door 10 delen.</p>
						
						</div>
					
					
					
					
					
					</div>
					
					
						
				

	
    </div>
  </div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="/AO/InlJava/includes/inlJava.js" type="text/javascript"></script>	
<% } %>

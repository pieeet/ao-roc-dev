<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

	<%@ include file="/AO/InlJava/includes/zijmenu.jsp"%>


	<div class="col-md-9">
		<h2>H12 Tabellen</h2>
		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>


			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je:</p>
			<ul>
				<li>weet hoe je een tabel (<b>array</b>) maakt
				</li>
				<li>weet hoe je waardes in een tabel <b>declareert</b> en op
					verschillende manieren <b>instantieert</b></li>
				<li>hoe je met een <b>for-</b> en <b>while-lus</b> door een
					tabel kunt gaan
				</li>
				<li>weet hoe je de <b>lengte</b> van een tabel kunt opvragen
				</li>
				<li>weet hoe je een ondiepe kopie (<b>shallow copy</b>) en een
					diepe kopie (<b>deep copy</b>) van een tabel kunt maken en wat het
					verschil is
				</li>
				<li>weet hoe je waardes in een tabel kunt <b>zoeken</b></li>
				<li>weet hoe je een tabel kunt <b>sorteren</b></li>
			</ul>

		</div>





		<h4>Praktijk</h4>
		<img src="/AO/InlJava/H12/images/tabellenTransp.png">
		<h3>Inleiding</h3>
		<p>
			Een tabel is een rij gelijksoortige gegevens in het intern geheugen
			van de computer. Een tabel betekent hier iets geheel anders dan een
			tabel in een database. Met gelijksoortig wordt bedoeld dat een tabel
			uit <em>of</em> een aantal objecten <em>of</em> uit waarden van
			hetzelfde primitieve type bestaat.
		</p>
		<p>Een tabel bestaat altijd uit een van tevoren vastgesteld aantal
			elementen. Het aantal elementen dat maximaal in de tabel kan worden
			opgenomen, heet de lengte of grootte van een tabel. Een tabel begint
			altijd bij element 0 en eindigt bij het aantal elementen min
			&eacute;&eacute;n. Elk element wordt in de tabel aangeduid met een
			geheel getal. Deze wordt de index genoemd.</p>
		<p>
			Een tabel wordt ook wel een reeks of rij genoemd, in het Engels <b>array</b>.
		</p>

		<h3>Het maken van een tabel</h3>
		<p>Er zijn drie stappen nodig om een tabel te maken:</p>
		<ul>
			<li><p>
					Declareer de naam van de tabel, je wilt bijvoorbeeld een tabel
					maken waarin je salarissen opslaat. Omdat salarissen decimaal zijn
					maken we een tabel met waarden van het primitieve type <b>double</b>.
					Je kunt dit op twee manieren doen: door rechte haken achter het
					type te zetten of achter de naam van de variabele.
				</p> <pre class="code">					
double<span class="codeplus">[]</span> salaris;
double salaris<span class="codeplus">[]</span>;
</pre></li>
			<li><p>Vervolgens maken we het object aan. Daarbij moet je
					aangeven hoe groot de tabel wordt.</p> <pre class="code">					
salaris = new double<span class="codeplus">[5]</span>
</pre></li>
			<li><p>Vervolgens moet de tabel gevuld worden met waarden.
					Dit doe je als volgt:</p> <pre class="code">					
salaris<span class="codeplus">[0]</span> = 100;
salaris<span class="codeplus">[1]</span> = 200;
salaris<span class="codeplus">[2]</span> = 300;
salaris<span class="codeplus">[3]</span> = 400;
salaris<span class="codeplus">[4]</span> = 500;
</pre></li>
		</ul>
		<p>De tabel bestaat nu uit vijf elementen van het type double. Het
			eerste element wordt niet met 1 aangeduid maar met 0. Het laatste
			niet met 5 maar met 4 (= aantal - 1).</p>
		<p>Een tabel kan heel makkelijk met het For-statement benaderd
			worden. Het volgende codefragment laat zien hoe je de tabel met een
			for-lus zou kunnen vullen in plaats van alle waardes afzonderlijk in
			te typen zoals hiervoor werd gedaan:</p>
		<pre class="code">					
for (<span class="codeplus">int teller = 0;</span> teller &lt; 5; teller ++)
    salaris[teller] = 100 * <span class="codeplus">(teller + 1)</span>;
</pre>
		<p>De teller teller begint bij 0 en de lus eindigt als de waarde
			in teller is opgelopen tot 5. Nog mooier is het Java de hoogste grens
			te laten bepalen:</p>
		<pre class="code">					
for (int teller = 0; <span class="codeplus">teller &lt; salaris.length;</span> teller ++)
    salaris[teller] = 100 * (teller + 1);
</pre>
		<p>Nu hoeven we niet meer te weten hoe groot de tabel is.</p>
		<p>Met de for-lus kan de tabel gemakkelijk op het scherm gezet
			worden:</p>

		<pre class="code">					
for (int teller = 0; <span class="codeplus">teller &lt; salaris.length;</span> teller ++)
    g.drawString(&quot;&quot; + salaris[teller], 50, 20 * teller + 20);
</pre>

		<p>het gehele programma ziet er als volgt uit:</p>

		<pre class="code">
<span class="comment">//Voorbeeld 12.1</span>

import java.awt.*;
import java.applet.*;

public class Tabel extends Applet {
    double salaris[];
	
    public void init() {
        salaris = new double [5];
		
        for (int teller = 0; teller &lt; salaris.length; teller ++) {
            salaris[teller] = 100 * <span class="codeplus">teller + 100</span>;
        }
    }

    public void paint(Graphics g) {
        for (int teller = 0; teller &lt; salaris.length; teller ++) {
            g.drawString(&quot;&quot; + salaris[teller], 50, 20 * teller + 20);
        }
    }
}
</pre>


		<h3>Het maken van een kopie</h3>
		<p>
			Soms moeten de waarden worden gekopieerd van de &eacute;ne naar een
			andere tabel. Je zou daarbij de volgende regel kunnen gebruiken:<br>
			<b>kopie = salaris</b>
		</p>
		<p>Als vervolgens de elementen van kopie op het scherm wordt
			gezet, dan lijkt het alsof er een kopie van is gemaakt. Dat is niet
			waar: Er is een referentie gemaakt.</p>
		<img src="/AO/InlJava/H12/images/referentie.png" width=600>
		<p>Dit wordt een ondiepe kopie (shallow copy) genoemd. Wijzigingen
			die op kopie plaatsvinden, worden dus tevens voor salaris
			doorgevoerd.</p>
		<p>Met een for-lus kunnen we een zogenaamde diepe kopie (deep
			copy) maken:</p>

		<pre class="code">
for(int teller = 0; teller &lt; salaris.length; teller ++) {
    kopie[teller] = salaris[teller];
}
</pre>
		<p>Als we nu een wijziging aanbrengen in de table kopie dan blijft
			de table salaris ongewijzigd:</p>
		<img src="/AO/InlJava/H12/images/kopie.png" width=600>
		<p>De volgende programma&#39;s laten dit principe zien:</p>
		<pre class="code">
<span class="comment">//Voorbeeld 12.2</span>

import java.awt.*;
import java.applet.*;

public class Tabel extends Applet  {
    double[] salaris;
    double[] kopie;
	
    public void init() {
        salaris = new double[5];
        kopie = new double[5];

        for (int teller = 0; teller &lt; salaris.length; teller ++) {
            salaris[teller] = 100 * teller + 100;
        }
        <span class="codeplus">kopie = salaris;</span>
        <span class="codeplus">kopie[3] = 1000;</span>  <span
				class="comment">//salaris[3] wordt nu ook gewijzigd!</span>
    }

    public void paint(Graphics g) {
        for (int teller = 0; teller &lt; salaris.length; teller ++) {
            g.drawString(&quot;&quot; + kopie[teller], 50, 20 * teller + 20);
            g.drawString(&quot;&quot; + salaris[teller], 100, 20 * teller + 20);
        }
    }
}
</pre>

		<pre class="code">
<span class="comment">//Voorbeeld 12.3</span>

import java.awt.*;
import java.applet.*;

public class Tabel extends Applet  {
    double[] salaris;
    double[] kopie;
	
    public void init() {
        salaris = new double[5];
        kopie = new double[5];

        for (int teller = 0; teller &lt; salaris.length; teller ++) {
            salaris[teller] = 100 * teller + 100;
        }
         for (int teller = 0; teller &lt; salaris.length; teller ++) {
             <span class="codeplus">kopie[teller] = salaris[teller]</span>
         }
        <span class="codeplus">kopie[3] = 1000;</span>  <span
				class="comment">//salaris[3] wordt nu niet gewijzigd!</span>
    }

    public void paint(Graphics g) {
        for (int teller = 0; teller &lt; salaris.length; teller ++) {
            g.drawString(&quot;&quot; + kopie[teller], 50, 20 * teller + 20);
            g.drawString(&quot;&quot; + salaris[teller], 100, 20 * teller + 20);
        }
    }
}
</pre>
		<p>
			Test beide applets. In voorbeeld 12.2 is de waarde in het vierde
			element in beide tabellen 1000 geworden, in voorbeeld 12.3 is alleen
			in <b>kopie</b> de waarde van het vierde element 1000 geworden.
		</p>

		<h3>Een tabel initialiseren</h3>
		<p>Een tabel initialiseren betekent dat de beginwaarden in een
			tabel gezet worden. Dat gaat het snelst op de volgende manier:</p>

		<pre class="code">
double[] salaris = { 100, 200, 300, 400, 500 };
</pre>
		<p>Dat is alleen maar mogelijk als van tevoren bekend is, wat de
			beginwaarden van een tabel moeten zijn. Als de beginwaarden niet
			bekend zijn, kun je de tabel standaard-beginwaarden meegeven,
			bijvoorbeeld een nul.</p>

		<h3>Grootste waarde in een tabel</h3>
		<p>Soms moet de grootste of de kleinste waarde in een tabel
			gezocht worden. Dat kun je doen door de tabel met een for-lus te
			doorlopen. In onderstaand voorbeeld is de eerste waarde de grootste
			die tot dan toe is waargenomen. Die waarde zetten we in de variabele
			waarin we de grootste bewaren. Als in de lus een grotere waarde wordt
			gevonden, dan zetten we die in de variabele:</p>

		<pre class="code">
<span class="comment">//Voorbeeld 12.4</span>

import java.awt.*;
import java.applet.*;

public class Tabel extends Applet {
    double[] salaris = { 100.0, 200.0, 500.0, 400.0, 300.0 }; 
    double <span class="codeplus">maximum;</span>
    
    public void init() {
        <span class="codeplus">maximum = salaris[0];</span>
        for (int teller = 0; teller &lt; salaris.length; teller ++) {
            <span class="codeplus">if(salaris[teller] &gt; maximum) {</span>
                <span class="codeplus">maximum = salaris[teller];</span>
            }
        }
    }

    public void paint(Graphics g)  {
        g.drawString(&quot;Het maximum is: &quot; + maximum, 50, 20);
    }
}
    
</pre>

		<p>Wanneer je de kleinste wilt zoeken hoef je alleen het
			groter-dan (&gt;) teken te vervangen met kleiner-dan (&lt;)</p>

		<h3>Zoeken in een tabel</h3>
		<p>
			Het zoeken in een tabel gaat op een vergelijkbare wijze. Je begint
			bij het eerste element en je zoekt totdat de waarde die je zocht is
			gevonden of tot het einde van de tabel. Om te kunnen weten, of een
			waarde is gevonden, maken we een hulpvariabele van het type <b>boolean</b>.
			Deze heeft maar twee mogelijke waarden: waar of niet waar (true /
			false).
		</p>

		<pre class="code">
<span class="comment">//Voorbeeld 12.5</span>

import java.awt.*;
import java.applet.*;

public class Tabel extends Applet {
    <span class="codeplus">boolean gevonden;</span>
    double[] salaris = { 100.0, 200.0, 500.0, 400.0, 300.0 }; 
    double gezocht;
	
    public void init() {
        gezocht = 400;
        <span class="codeplus">gevonden = false;</span>
        int teller = 0;
        while(teller &lt; salaris.length) {
            if(salaris[teller] == gezocht) {
                <span class="codeplus">gevonden = true;</span>
            }
            teller ++;
        }
    }

    public void paint(Graphics g) {
        if(<span class="codeplus">gevonden == true</span>) {
            g.drawString(&quot;De waarde is gevonden.&quot;, 20, 50);
        }
        else {
            g.drawString(&quot;De waarde is niet gevonden.&quot;, 20, 50);
        }
    }
}
</pre>
		<p>Voorbeeld 12.5 heeft &eacute;&eacute;n nadeel. Als de gezochte
			waarde gevonden is, gaat de lus door met zoeken terwijl dat niet
			nodig is. Bij vijf elementen is dat niet erg, er is nauwelijks
			tijdverlies, maar bij een tabel van 100.000 elementen kan dat - zeker
			bij een ingewikkelde zoekopdracht - tijdrovend zijn. Er moet aan dit
			programma nog iets toegevoegd worden waardoor de lus stopt als de
			gezochte waarde is gevonden.</p>

		<h3>Sorteren</h3>
		<p>
			Sorteren is tegenwoordig niet meer moeilijk in Java. De klasse <b><a
				href="http://docs.oracle.com/javase/7/docs/api/java/util/Arrays.html"
				target="_blank">Arrays</a></b> heeft een methode <b>sort</b>, waarmee
			gemakkelijk een tabel gesorteerd kan worden. Wel moet de package
			&quot;util&quot; ge&iuml;mporteerd worden:
		</p>

		<pre class="code">
<span class="comment">//Voorbeeld 12.6</span>

import java.awt.*;
import java.applet.*;
import java.util.*;

public class Stringarrays extends Applet {
    String[] <span class="codeplus">namen</span> = { &quot;Valerie&quot;, &quot;Jeroen&quot;, &quot;Sander&quot;, &quot;Frank&quot;}; 
	
    public void init() {
        <span class="codeplus">Arrays.sort(namen);</span>
    }

    public void paint(Graphics g) {
        for (int teller = 0; teller &lt; namen.length; teller ++) {
            g.drawString(&quot;&quot; + namen[teller], 50, 20 * teller + 20);
        }
    }
}
</pre>
		<h3>Tot slot</h3>
		<p>Behalve in het laatste voorbeeld zijn tot nu alleen doubles
			gebruikt voor tabellen, maar ook van bijvoorbeeld tekstvakken en van
			strings zijn op dezelfde manier tabellen te maken. In voorbeeld 12.6
			zag je hoe een array van strings gemaakt kan worden.</p>
		<div class="opdrachten">


			<h2>Opdracht 12.1</h2>
			<p>Maak een applet in Java waarin een tabel van 10 getallen.
				Bereken het gemiddelde en zet de tien elementen en het gemiddelde op
				het scherm.</p>
			<h2>Opdracht 12.2</h2>
			<p>Maak een applet met een array van 25 knoppen. De knoppen
				hoeven niets te doen, maar moeten wel zichtbaar zijn.</p>
			<h2>Opdracht 12.3</h2>
			<p>Maak een applet waarin vijf tekstvakken (uiteraard in een
				tabel) worden getoond. In de tekstvakken moet de gebruiker getallen
				in kunnen voeren. Als de gebruiker op de Ok-knop klikt worden de
				getallen in de invoervolgorde gesorteerd getoond.</p>
			<h2>Opdracht 12.4</h2>
			<p>Zorg ervoor dat de lus waarin gezocht wordt naar een bepaalde
				waarde in voorbeeld 12.5 stopt als de waarde gevonden is.</p>
			<h2>Opdracht 12.5</h2>
			<p>Maak een applet met een tabel met getallen, waarin de
				gebruiker een getal kan intikken in een tekstvak. Als de gebruiker
				op de OK-knop klikt dan wordt de waarde opgezocht in de tabel en
				staat op het scherm niet alleen dat de waarde is gevonden maar ook
				de index. Als de waarde niet is gevonden dan wordt daarvan melding
				gedaan.</p>
			<h2>Opdracht 12.6</h2>
			<p>Maak een tabel, waarin elementen dezelfde waarde hebben. In de
				applet kan de gebruiker een waarde intikken. Vervolgens laat het
				programma de waarde zien en hoeveel keer de waarde voorkomt.</p>
			<h2>Praktijkopdracht</h2>
			<p>Schrijf een applet in Java, waarin de gebruiker 10 namen en 10
				telefoonnummers kan invoeren. Telkens als de gebruiker op de Ok-knop
				klikt, wordt er naar de volgende elementen gegaan van de tabellen.
				Als de gebruiker na het tiende element op de Ok-knop klikt, worden
				alle elementen in het venster getoond.</p>
		</div>
	</div>
</div>
<%@ include file="/AO/InlJava/includes/bottom.html"%>
</html>
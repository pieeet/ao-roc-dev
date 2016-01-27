<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

<%@ include file="/AO/InlJava/includes/zijmenu.jsp" %>
      
      <div class="col-md-9">
        <h2>H10 Beslissingen</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	       <h2>Leerdoelen</h2>
					
				
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
			<ul>
				<li>de relationele operatoren <b>&lt;</b>, <b>&gt;</b>, <b>==</b>, <b>&lt;=</b>, <b>&gt;=</b>, <b>!=</b> kent en kunt toepassen</li>
				<li>een <b>if</b> en <b>if-else</b> statement kunt toepassen</li>
				<li>de logische operatoren <b>&amp;&amp;</b>, <b>||</b>, en <b>!</b> kunt kent en kunt toepassen</li>
				<li>weet hoe je een <b>switch-statement</b> kunt toepassen</li>
				
				
				
			</ul>
	          
        </div>
        
        <h4>Praktijk</h4>
		<img src="/AO/InlJava/H10/images/beslissingen.png" width=500>
        
       
        <h3>Relationele operatoren</h3>
					<p>Een relationele operator vergelijkt twee waarden met elkaar. Deze waarde kan van alles zijn: twee doubles, een int 
					met het resultaat van een bewerking, twee strings, enzovoorts. Zo kan een relationele operator vragen of de ene waarde 
					groter is dan de andere waarde. Er zijn maar twee antwoorden mogelijk, ja of nee of in Java: <b>true</b> of <b>false</b>. Deze twee 
					waarden vormen samen een apart primitief, de <b>boolean</b>. (Zie bijlage II)<br>
					Dit zijn de relationele operatoren:
					<div class="table_wrapper">
					<table border=1>
						<tr>
							<th>Operator</th><th>Betekenis</th>
						</tr>
						<tr>
							<th>&lt;</th><td>Kleiner dan</td>
						</tr>
						<tr>
							<th>&gt;</th><td>Groter dan</td>
						</tr>
						<tr>
							<th>==</th><td>Gelijk aan</td>
						</tr>
						<tr>
							<th>&lt;=</th><td>Kleiner dan of gelijk aan</td>
						</tr>
						<tr>
							<th>&gt;=</th><td>Groter dan of gelijk aan</td>
						</tr>
						<tr>
							<th>!=</th><td><b>Niet</b> gelijk aan</td>
						</tr>
					</table>
					</div>
										
					<p>Let erop dat de logische operator <b>==</b> iets anders is dan de toekenningsoperator of assignment <b>=</b>. In het eerste geval gaat het 
					om een vergelijking tussen twee waarden, in het tweede geval wordt een waarde toegekend aan een variabele.<br>
					Een voorbeeld:</p>
<pre class="code">
<span class="comment">// Voorbeeld 10.1</span>

import java.awt.*;
import java.applet.*;


public class Beslissingen extends Applet {
	
  public void init() {}
	

  public void paint(Graphics g) {
    g.drawString(&quot;&quot; + 8 + &quot; is groter dan &quot; + 5 + &quot;: &quot; + <span class="codeplus">(8 &gt; 5)</span>, 50, 60 );
    g.drawString(&quot;&quot; + 8 + &quot; is kleiner dan &quot; + 5 + &quot;: &quot; + <span class="codeplus">(8 &lt; 5)</span>, 50, 80 );
  }
}
</pre>					
					<p>De uitvoer van dit programma is:<br>
					<b>8 is groter dan 5: true</b><br>
					<b>8 is kleiner dan 5: false</b><br>
					Door de uitdrukking <b>(8 &gt; 5)</b> te evalueren, komt Java tot de conclusie, dat dat waar is en geeft true terug. 
					De evaluatie van <b>(8 &lt; 5)</b> levert niet waar op en dan geeft Java false terug.</p>
					
					<h3>Het if-else-statement</h3>
					<p>Het kan voorkomen in programma&#39;s dat een keuze moet worden gemaakt of een opdracht moet worden uitgevoerd of niet,  
					of dat een bepaalde opdracht wel en een andere niet uitgevoerd moet worden. In het eerste geval gebruiken we alleen een if-statement:</p>
<pre class="code">
<span class="comment">// Voorbeeld 10.2</span>

import java.awt.*;
import java.applet.*;
import java.awt.event.*;


public class Beslissingen2 extends Applet {		

    int leeftijd;
    TextField tekstvak;
    Label label;
    String tekst;
	
    public void init() {
        tekstvak = new TextField(&quot;&quot;, 5);
        tekstvak.addActionListener( new VakListener() );
        tekst = &quot;&quot;;
		
        label = new Label(&quot;Geef uw leeftijd in en druk op enter&quot; );
		
        add( label );
        add( tekstvak );	
    }

    public void paint(Graphics g) {
        g.drawString(tekst, 50, 45 );
    }
	
    class VakListener implements ActionListener {
        public void actionPerformed( ActionEvent e ) {
            String s;
			
            s = tekstvak.getText();
            leeftijd = Integer.parseInt( s );
            <span class="codeplus">if ( leeftijd &gt; 20 ) {</span>
                <span class="codeplus">tekst = &quot;U bent meerderjarig.&quot;;</span>
                <span class="codeplus">repaint();</span>
            <span class="codeplus">}</span>		
        }
    }
}
</pre>				

					<p>Hier staat dat als de leeftijd groter is dan 20 op het scherm <b>U bent meerderjarig</b> moet verschijnen en als de 
					leeftijd 20 of lager is, dan gebeurt er niets. Dit programma werkt niet helemaal correct. Als het programma uitgevoerd 
					wordt en de gebruiker tikt bijvoorbeeld 12 in, dan gebeurt er niets. Dat is correct. Nu tikt de gebruiker 23 in en de 
					tekst <b>U bent meerderjarig</b> verschijnt op het scherm. Ook dat is juist. Maar tikt de gebruiker nu 12 in, dan blijft op 
					het scherm <b>U bent meerderjarig</b> staan en dat is niet juist. Blijkbaar moet er toch iets gebeuren als iemand niet meerderjarig 
					is. Het programma moet uitgebreid worden:</p>
<pre class="code">
if ( leeftijd &gt; 20 ) {
    tekst = &quot;U bent meerderjarig.&quot;;
    repaint();
}
<span class="codeplus">else {</span>
    <span class="codeplus">tekst = &quot;U bent minderjarig.&quot;;</span>
    <span class="codeplus">repaint();</span>
}    

</pre>					
					<p>De uitbreiding begint met <b>else {</b> en eindigt met de laatste sluitaccolade <b>}</b>. Er staat nu dat als 
					iemand 20 jaar of jonger is dan moet op het scherm komen te staan <b>U bent minderjarig</b>. Nu werkt het programma 
					wel correct.<br>
					Toch kan er een kleine verbetering plaatsvinden. Zowel onder de if-tak als onder de else-tak staat <b>repaint()</b>. Dat moet 
					in beide gevallen gebeuren, dus kan deze opdracht uit de if en else-tak gehaald worden en onderaan gezet worden. Dat levert 
					de volgende code op:</p>
					
<pre class="code">
if ( leeftijd &gt; 20 ) {
    tekst = &quot;U bent meerderjarig.&quot;;
}
else {
    tekst = &quot;U bent minderjarig.&quot;;
}
<span class="codeplus">repaint();</span>
</pre>					
					
					<p>In voorbeeld 10.2 staat nog een regel die toelichting verdient:</p>
<pre class="code">
    public void init() {
        tekstvak = new TextField(&quot;&quot;, 5);
        tekstvak.addActionListener( new VakListener() );
        <span class="codeplus">tekst = &quot;&quot;;</span>
        label = new Label(&quot;Geef uw leeftijd in en druk op enter&quot; );
        add( label );
        add( tekstvak );	
    }
</pre>					
					<p>Als deze regel er niet staat, is er sprake van dat tekst een null-string is. En een null-string kan niet naar het scherm 
					geschreven worden. Hij heeft nog geen adres in het geheugen gekregen en dus is het object nog niet in het geheugen aangemaakt. 
					Vandaar dat er een lege string van gemaakt moet worden zodat het object tekst aangemaakt wordt. De volgorde is namelijk dat 
					eerst <b>init()</b> uitgevoerd wordt, vervolgens <b>paint()</b> en pas als op de entertoets is gedrukt, wordt <b>VakListener()</b> 
					uitgevoerd. Dus de eerste keer dat <b>paint()</b> uitgevoerd wordt, mag tekst geen null-string zijn en daarom staat deze regel 
					in <b>init()</b>.</p>
					
					<h3>Logische operatoren</h3>
					<p>Helaas is het leven niet zo eenvoudig dat we vaak kunnen volstaan met &eacute;&eacute;n voorwaarde. Alleen al om te bepalen 
					of een jaar een schrikkeljaar is of niet hebben we drie voorwaarden nodig: Ten eerste moet het jaartal deelbaar zijn door 4, ten 
					tweede mag het jaartal niet deelbaar zijn door 100, maar &#45 en dat is de derde voorwaarde &#45 mag het jaartal wel door 400 deelbaar zijn. 
					Door gebruik te maken van logische operatoren kunnen we voorwaarden met elkaar combineren. Er zijn drie logische operatoren:</p>
					<ul>
						<li><p><b>&amp;&amp;</b> is de en-operator en het betekent dat beide voorwaarden waar moeten zijn, wil Java true geven. In alle andere 
						gevallen wordt false teruggegeven.</p></li>
						<li><p><b>||</b> is de of-operator en dan hoeft slechts &eacute;&eacute;n van beide waar te zijn, wil Java true geven. Alleen als beide 
						voorwaarden onwaar zijn, geeft Java false terug.</p></li>
						<li><p><b>!</b> is de niet operator. Hij maakt van true false en van false true.</p></li>
					</ul>
					<p>Voor een overzicht hiervan zie de tabellen in bijlag IV.<br>
					Het onderstaande voorbeeld volgt de en-tabel in bijlage IV.</p>

					
<pre class="code">
<span class="comment">// Voorbeeld 10.3</span>

import java.awt.*;
import java.applet.*;

public class Beslissingen extends Applet {
	
  public void init() {}

  public void paint(Graphics g) {
    g.drawString(&quot;&quot; + 6 + &quot; is groter dan &quot;+ 5 + &quot; en kleiner dan &quot; + 
        8  + &quot;: &quot; +(6 > 5 <span class="codeplus">&amp;&amp;</span> 6 < 8), 50, 60 );
    g.drawString(&quot;&quot; + 6 + &quot; is groter dan &quot;+ 5 + &quot; en groter dan &quot; + 
        8 + &quot;: &quot; + (6 > 5 <span class="codeplus">&amp;&amp;</span> 6 > 8), 50, 80 );
    g.drawString(&quot;&quot; + 6 + &quot; is kleiner dan &quot;+ 5 + &quot; en groter dan &quot; +
        8 + &quot;: &quot; + (6 <  5 <span class="codeplus">&amp;&amp;</span> 6 > 8), 50, 100 );
    g.drawString(&quot;&quot; + 6 + &quot; is kleiner dan &quot;+ 5 + &quot; en kleiner dan &quot; + 
        8 + &quot;: &quot; + (6 < 5 <span class="codeplus">&amp;&amp;</span> 6 < 8), 50, 120 );
    }
}
</pre>								
					<p>Als je de <b>&amp;&amp;</b> vervangt door <b>||</b>, dan volgt het programma de of-tabel in bijlage IV.</p>
					
					<p>De volgende regels betreffen de niet-operator. De voorwaarde waarvan het resultaat gewijzigd moet worden, 
					staat achter de operator tussen ronde haken. Vervang alle regels paint() door de volgende, dan volgt het programma 
					de niet-tabel in bijlage IV:</p>
<pre class="code">
g.drawString(&quot;&quot; + 6 + &quot; is groter dan &quot; + 5 + &quot;: &quot; + 
  (<span class="codeplus">!</span>(6 &gt; 5)), 50, 60 );
g.drawString(&quot;&quot; + 6 + &quot; is kleiner dan &quot; + 5 + &quot;: &quot; + 
  (<span class="codeplus">!</span> (6 &lt; 5)), 50, 100 );
</pre>					
					
					
					<p>Nu een ingewikkelder voorbeeld, waarin de logische operatoren worden gecombineerd: Welke jaren zijn schrikkeljaar 
					en welke niet?<br>
					Eerst de broncode:</p>
					
<pre class="code">
<span class="comment">// Voorbeeld 10.4</span>

import java.awt.*;
import java.applet.*;
import java.awt.event.*;


public class Schrikkeljaar extends Applet {
    TextField tekstvak;
    Label label;				
    String s, tekst;
    int jaartal;
	
    public void init() {
        tekstvak = new TextField(&quot;&quot;, 20);
        label = new Label(&quot;Type een jaartal en druk op enter&quot;);
        tekstvak.addActionListener( new TekstvakListener() );
        tekst = &quot;&quot;;
        add(label);
        add(tekstvak);
    }

    public void paint(Graphics g) {
        g.drawString(tekst, 50, 60 );
    }
	
    class TekstvakListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            s = tekstvak.getText();
            jaartal = Integer.parseInt( s);
            <span class="codeplus">if ( (jaartal % 4 == 0 &amp;&amp; !(jaartal % 100 == 0)) || </span>
            		<span class="codeplus">jaartal % 400 == 0 ) {</span>
                tekst = &quot;&quot;+ jaartal + &quot; is een schrikkeljaar&quot;;
            }
            else {
                tekst = &quot;&quot;+ jaartal + &quot; is geen schrikkeljaar&quot;;
            }
            repaint();
        }
    }
}
</pre>						
					
					
					<p>Het gaat natuurlijk om de regel:<br>
					<b>if ( (jaartal % 4 == 0 && !(jaartal % 100 == 0)) || jaartal % 400 == 0 )</b><br>
					Als jaartal % 4 gelijk is aan 0, dan betekent dat dat het jaartal door 4 deelbaar is. Er is geen rest na de deling door 4.<br>
					jaartal % 100 moet ongelijk zijn aan nul. Het jaartal mag niet deelbaar zijn door 100. Let op het woordje niet en dus wordt de 
					niet-operator gebruikt. Als deze twee voorwaarden (deelbaar door 4 en niet deelbaar door 100) beide waar zijn dan is er sprake 
					van een schrikkeljaar. De en-operator moet dus onderling gebruikt worden. De ronde haken om deze voorwaarden zorgen ervoor dat 
					deze twee voorwaarden samen ge&euml;valueerd worden en als  daar true uitkomt dan is er sprake van een schrikkeljaar. Echter als het 
					jaartal deelbaar is door 400 en dus ook door 100 en door 4, dan komen de eerste twee voorwaarden met false. Vandaar het gebruik 
					van de of-operator en de voorwaarde dat het jaar wel door 400 deelbaar mag zijn.</p>
					<p>Tot slot: Zet altijd accolades om de body van het if en het else-statement. Als het om &eacute;&eacute;n regel gaat, mag je ze weglaten, 
					maar bij meerdere regels in een body zijn ze verplicht.</p>
					
					
					<h3>Het switch-statement</h3>
					<p>Het switch-statement begint met switch en daarachter tussen ronde haken een variable van het type char, byte, short of int en 
					String (sinds Java 7). Dus long, double en float kunnen niet gebruikt worden bij het swich-statement. Daarna volgen in de body 
					omgeven door accolades de cases met daarachter de constante waarden. Na de constante volgt een &lsquo;<b>:</b>&rsquo;.</p>
					
<pre class="code">
<span class="comment">// Voorbeeld 10.5</span>

import java.awt.*;
import java.applet.*;
import java.awt.event.*;


public class Switch extends Applet {
    TextField tekstvak;
    Label label;				
    String s, tekst;
    int dag;
	
    public void init() {
        tekstvak = new TextField(&quot;&quot;, 20);
        label = new Label(&quot;Type het dagnummer en druk op enter&quot;);
        tekstvak.addActionListener( new TekstvakListener() );
        tekst = &quot;&quot;;
        add(label);
        add(tekstvak);
    }

    public void paint(Graphics g) {
        g.drawString(tekst, 50, 60 );
    }
	
    class TekstvakListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            s = tekstvak.getText();
            dag = Integer.parseInt( s);
            <span class="codeplus">switch(dag) {</span>
                <span class="codeplus">case 1:</span>
                    tekst = &quot;zondag&quot;;
                    <span class="codeplus">break;</span>
                case 2:
                    tekst = &quot;maandag&quot;;
                    break;
                case 3:
                    tekst = &quot;dinsdag&quot;;
                    break;
                case 4:
                    tekst = &quot;woensdag&quot;;
                    break;
                case 5:
                    tekst = &quot;donderdag&quot;;
                    break;
                case 6:
                    tekst = &quot;vrijdag&quot;;
                    break;
                case 7:
                    tekst = &quot;zaterdag&quot;;
                    break;
                default:
                    tekst = &quot;U hebt een verkeerd nummer ingetikt ..!&quot;;
                    break;
            }
            repaint();
        }
    }
}
</pre>					
					<p>De broncode spreekt voor zich. Alleen het default-statement dient verklaard te worden: Als er iets wordt ingetikt 
					dat niet gelijk is aan &eacute;&eacute;n van de constante waarden achter de cases, dan wordt <b>default</b> aangeroepen en worden de regels 
					daaronder uitgevoerd. In dit geval wordt de waarschuwing gegeven, dat er een verkeerd nummer is ingetikt. <b>Default</b> is 
					niet verplicht.</p>
				
				
									
				
				<div class="opdrachten">
					
							
					<h2>Opdracht 10.1</h2>
					<p>Schrijf een applet, waarin de gebruiker getallen kan intikken en op het scherm bijgehouden wordt welk getal het hoogst is.</p>
					<h2>Opdracht 10.2</h2>
					<p>Breid de applet uit opdracht 1 zo uit dat ook het laagste getal bijgehouden wordt.</p>
					<h2>Opdracht 10.3</h2>
					<p>Schrijf een applet, waarin het maandnummer ingetikt wordt en de maandnaam en het aantal dagen wordt getoond.</p>
					<h2>Opdracht 10.4</h2>
					<p>Breid de applet zo uit, dat ook het jaar ingegeven kan worden en aan de hand daarvan wordt bepaald of het om een 
					schrikkeljaar gaat om het juiste aantal dagen voor februari te kunnen vaststellen.</p>
					<h2>Opdracht 10.5</h2>
					<p>Schrijf een applet, waarin de gebruiker zijn cijfers kan invoeren en wordt getoond of het cijfer voldoende of onvoldoende is. 
					Tevens wordt het gemiddelde bijgehouden. Zodra de gebruiker op de Ok-knop klikt, wordt getoond wat het gemiddelde is en of de leerling 
					geslaagd is.</p> 
					<h2>Praktijkopdracht</h2>
					<p>Schrijf een applet in Java waarin een cijfer ingevoerd wordt en in het venster van de applet wordt getoond of het cijfer slecht, 
					onvoldoende, matig, voldoende of goed is. Als er een cijfer wordt ingevoerd dat niet in de onderstaande rij voorkomt, dan moet er een 
					waarschuwing getoond worden dat er een verkeerd cijfer is ingevoerd.</p>
					<p>De cijfers 1, 2 en 3 zijn slecht, het cijfer 4 is onvoldoende, het cijfer 5 is matig, de cijfers 6 en 7 zijn voldoende, 
					de cijfers 8, 9 en 10 zijn goed.</p>
				</div>

		</div>
<%@ include file="/AO/InlJava/includes/bottom.html"%>

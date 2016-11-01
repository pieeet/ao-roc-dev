<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

	<%@ include file="/AO/InlJava/includes/zijmenu.jsp"%>


	<div class="col-md-9">
		<h2>H8 Knoppen en tekstvakken</h2>
		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>

			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je:</p>
			<ul>
				<li>Een knop, teksvak en label aan je Applet kunt toevoegen</li>
				<li>weet hoe je event-handling aan knoppen en tekstvakken kunt
					toevoegen middels een inwendige klasse</li>
				<li>weet hoe je een lege string gebruikt</li>
				<li>Hoe je getallen in string vorm kunt converteren naar echte
					getallen</li>




			</ul>

		</div>


		<h4>Praktijk</h4>
		<img src="<c:url value="/AO/InlJava/H8/images/guiComp.png"/>">

		<h3>Een knop zichtbaar maken</h3>
		<p>Eerst de code:</p>

		<pre class="code">
<span class="comment">//Voorbeeld 8.1</span>

import java.awt.*;
import java.applet.*;


public class Knop extends Applet {
    <span class="codeplus">Button knop;</span>						
	
    public void init() {
        <span class="codeplus">knop = new Button();</span>
        <span class="codeplus">knop.setLabel( "Klik op mij" );</span>
        add(knop);
    }

    public void paint(Graphics g) {
        g.drawString("Doet deze knop wel iets?", 50, 60 );
    }
}
</pre>


		<p>Een knop zichtbaar maken gaat in vier stappen:</p>
		<ul>
			<li>De <em>declaratie</em> van de knop:<br> <pre
					class="code">
Button knop;
</pre>
				<p>De declaratie is van belang omdat je zo te kennen geeft welk
					object gemaakt gaat worden.</p></li>
			<li>De nieuwe knop aanmaken:<br> <pre class="code">
knop = new Button();
</pre>
				<p>Met deze opdracht wordt een deel van het intern geheugen
					gereserveerd voor deze knop. Hoeveel geheugen er wordt gereserveerd
					hangt af van de grootte van de klasse Button.</p></li>
			<li>Vervolgens wordt er tekst op de knop gezet: <pre
					class="code">
knop.setLabel( &quot;Klik op mij&quot; );
</pre>

				<p>De knop kent al een aantal methodes die je niet hebt
					geprogrammeerd zoals setLabel. Die methodes roep je op door achter
					de naam van het object een punt en de naam van de methode zetten
					met daarachter altijd ronde haken en eventueel tussen de ronde
					haken &eacute;&eacute;n of meerdere argumenten te noemen. In dit
					voorbeeld is de string &quot;Klik op mij&quot; het argument.</p></li>
			<li>En wordt de knop aan de applet toegevoegd:<br> <pre
					class="code">
add(knop);
</pre>
			</li>
		</ul>
		<p>
			De tweede en derde stap kun je ook in &eacute;&eacute;n keer
			afhandelen. De klasse <a
				href="http://docs.oracle.com/javase/7/docs/api/java/awt/Button.html"
				target="_blank">Button</a> heeft namelijk twee
			&quot;constructors&quot;, &eacute;&eacute;n zonder argumenten en
			&eacute;&eacute;n met (String label) als argument.
		</p>
		<pre class="code">
knop = new Button( &quot;Klik op mij&quot; );
</pre>
		<p>Als je dit programma uitvoert en je klikt op de knop, dan zie
			je de knop zelf op het scherm wel reageren (Dat handelt je
			besturingssysteem voor je af), maar verder gebeurt er niets. Dat komt
			omdat er nog geen methode met de knop is verbonden.</p>

		<h3>Event-handling</h3>
		<pre class="code" id="voorbeeld8_2">
<span class="comment">//Voorbeeld 8.2</span>

import java.awt.*;
import java.applet.*;
<span class="codeplus">import java.awt.event.*;</span>


public class Knop extends Applet {
    Button knop;
    String schermtekst;
	
    public void init() {
        schermtekst = &quot;Doet deze knop wel iets?&quot;
        knop = new Button(&quot;Klik op mij&quot;);
        <span class="codeplus">KnopListener kl = new KnopListener();</span>
        <span class="codeplus">knop.addActionListener( kl );</span>
        add(knop);
    }

    public void paint(Graphics g) {
        g.drawString(schermtekst, 50, 60 );
    }
	
    <span class="codeplus">class KnopListener implements ActionListener {</span>
        <span class="codeplus">public void actionPerformed( ActionEvent e ) {</span>
            <span class="codeplus">schermtekst = &quot;Ja, deze knop doet wel iets&quot;;</span>
        <span class="codeplus">}</span>
    <span class="codeplus">}</span>
}
</pre>
		<p>Ook nu zijn er vier stappen nodig om de event-handler te
			activeren:</p>
		<ul>
			<li><p>Allereerst moet de package ge&iuml;mporteerd worden
					waarin de definities van klassen staan die te maken hebben met de
					event-handling:</p> <pre class="code">
import java.awt.*;
import java.applet.*;
<span class="codeplus">import java.awt.event.*;</span>
</pre></li>
			<li><p>
					Maak een inwendige klasse:<br>
				</p> <pre class="code">
    class KnopListener implements ActionListener {
        public void actionPerformed( ActionEvent e ) {
            schermtekst = &quot;Ja, deze knop doet wel iets&quot;;
        }
    }
</pre>
				<p>
					Deze klasse wordt inwendig genoemd omdat hij zich geheel binnen de
					applet bevindt. Het deel <b>implements ActionListener</b> zorgt
					ervoor dat de klasse uitluistert. In de klasse wordt de methode <b>actionPerformed()</b>
					gebruikt om de binnengekomen gebeurtenissen af te handelen. In dit
					geval wordt de inhoud van de variabele String schermtekst gewijzigd
					van <b>&quot;Doet deze knop wel iets?&quot;</b> in <b>&quot;Ja,
						deze knop doet wel iets&quot;</b>.
				</p></li>

			<li><p>
					Een klasse op zich doet niets. Om een klasse te gebruiken moet je
					er een &quot;instantie&quot; (instance) van aanmaken. Je kunt in
					Java een instantie van een klasse aanmaken met het keyword <b>&quot;new&quot;.</b>
				</p> <pre class="code">
knop = <span class="codeplus">new</span> Button(&quot;Klik op mij!&quot;);
KnopListener kl = <span class="codeplus">new</span> KnopListener();
</pre></li>
			<li><p>
					Nu kun je de instantie van KnopListener (kl) aan de knop toevoegen
					door hem als argument mee te geven aan de methode <b>addActionListener()</b>
					van de klasse Button, waar onze knop een instantie van is.
				</p> <pre class="code">
knop.addActionListener( <span class="codeplus">kl</span> );
</pre></li>

		</ul>

		<p>
			Als we de applet gaan uitvoeren, wordt de knop getoond en eronder de
			tekst <b>&quot;Doet deze knop wel iets?&quot;</b>. Verder gebeurt er
			niets. Als je op de knop klikt, dan gebeurt er ook niets! Als je het
			scherm iets vergroot, dan wordt de tekst ineens wel gewijzigd. Dit
			komt omdat de string <b>schermtekst</b> in het geheugen netjes is
			aangepast, maar het venster is niet ververst en dus blijft de oude
			tekst staan totdat het scherm wordt ververst. We moeten er dus voor
			zorgen dat het venster ververst wordt. Dat doen we met de opdracht <b>repaint()</b>.
		</p>
		<p>De inwendige klasse KnopListener komt er dan zo uit te zien:</p>

		<pre class="code">
class KnopListener implements ActionListener {

    public void actionPerformed( ActionEvent e ) {
        schermtekst = &quot;Ja, deze knop doet wel iets&quot;;
        <span class="codeplus">repaint();</span>
    }
}
</pre>
		<p>We wijzigen eerst de inhoud van de string en geven daana
			opdracht het scherm te verversen. De methode paint() wordt door een
			aanroep naar repaint() opnieuw uitgevoerd.</p>

		<h3>Een tekstvak</h3>
		<p>Een tekstvak maken gaat op dezelfde manier als het maken van
			een knop.</p>
		<pre class="code">
<span class="comment">//Voorbeeld 8.3</span>

import java.awt.*;
import java.applet.*;

public class Tekstvak extends Applet {
    <span class="codeplus">TextField tekstvak;</span>				
	
	
    public void init() {
        <span class="codeplus">tekstvak = new TextField(&quot;Klik op mij&quot;, 20);</span>
        add(tekstvak);
    }

    public void paint(Graphics g) {
        g.drawString(&quot;Type iets in het tekstvakje&quot;, 50, 60 );
    }
}
</pre>
		<p>Er zijn drie stappen nodig om een tekstvak op het scherm
			zichtbaar te maken:</p>
		<p>Allereerst weer de declaratie:</p>

		<pre class="code">
TextField tekstvak;
</pre><p>Dan het reserveren van het geheugen:</p>
		<pre class="code">
tekstvak = new TextField(&quot;Klik op mij&quot;, 20);
</pre>
				<p>
					De tekst &quot;Klik op mij&quot; komt in het tekstvak te staan. Er
					kunnen ongeveer 20 tekens in het tekstvak staan. Dat is nooit
					helemaal zeker als het gaat om proportionele letters.<br> Dan
					moet het tekstvak aan de applet worden toegevoegd:
				</p>
				<pre class="code">
add(tekstvak);
</pre>


		<img src="<c:url value="/AO/InlJava/H8/images/tekstveld.jpg"/>">
		<h3>Een label</h3>
		<p>Het zou mooier als de tekst &quot;Type iets in het
			tekstvakje&quot; niet ergens onder maar voor het tekstvak komt te
			staan. Dat wordt opgelost met een zogenaamd label. Dit is een
			tekstvak waarin niets ingetikt kan worden, maar waar het programma
			wel tekst in kan zetten. Hieronder zie je het gebruik van het label
			aan de hand van het vorige voorbeeld.
		<pre class="code">
<span class="comment">//Voorbeeld 8.4</span>

import java.awt.*;
import java.applet.*;

public class Tekstvak extends Applet {
    TextField tekstvak;
    <span class="codeplus">Label label;</span>				
	
	
    public void init() {
        tekstvak = new TextField(&quot;Klik op mij&quot;, 20);
        <span class="codeplus">label = new Label(&quot;Type iets in het  tekstvakje&quot;);</span>
        add(label);
        add(tekstvak);
    }

    public void paint(Graphics g) {}
	
}
</pre>

		<img src="<c:url value="/AO/InlJava/H8/images/labelTekstveld.jpg"/>">
		<p>
			In drie stappen is het label gerealiseerd:<br>
		<ul>
			<li>Eerst de declaratie<br> <b>Label label;</b></li>
			<li>Dan het reserveren van het geheugen en het label meteen een
				tekst meegeven:<br> <b>label = new Label(&quot;Type iets in
					het tekstvakje&quot;);</b>
			</li>
			<li>En tenslotte het label toevoegen aan de applet:<br> <b>add(label);</b></li>
		</ul>
		<p>Als de applet wordt uitgevoerd kun je in het tekstvak iets
			intikken. Wat je intikt, verschijnt in het tekstvak. Omdat alleen
			standaardhandelingen voor het tekstvak nodig zijn, namelijk de
			ingetikte tekst tonen, hoeft voor een tekstvak geen event-handling
			plaats te vinden. Windows handelt dit intern af. Wel kan de gebruiker
			op de enter-toets drukken en op die manier een gebeurtenis
			veroorzaken die wel afgehandeld moet worden.</p>

		<pre class="code">
<span class="comment">// Voorbeeld 8.5</span>
import java.awt.*;
import java.applet.*;
import java.awt.event.*;

public class Tekstvak extends Applet {
    TextField tekstvak;
    Label label;				
    String s;
	
    public void init() {
        tekstvak = new TextField(&quot;Klik op mij&quot;, 20);
        label = new Label(&quot;Type iets in het tekstvak &quot; + 
            &quot;en druk op enter&quot;);
        tekstvak.addActionListener( new TekstvakListener() );
        add(label);
        add(tekstvak);
        <span class="codeplus">s = &quot;&quot;;</span>
    }

    public void paint(Graphics g) {
        g.drawString(s, 50, 60 );
    }
	
    class TekstvakListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            <span class="codeplus">s = tekstvak.getText();</span>
            repaint();
        }
    }
}
</pre>
		<p>
			Ook hier wordt net zoals bij de knoppen eerst de listener aan het
			tekstvak gekoppeld:<br> <b>tekstvak.addActionListener( new
				TekstvakListener() );</b><br> en wordt in de methode <b>actionPerformed</b>
			van de klasse TekstvakListener de gebeurtenis afgehandeld.<br>
			Met de regel <b>s = tekstvak.getText();</b> wordt de tekst in het
			tekstvak in de string s gezet. Deze string wordt in het venster van
			de applet op het scherm gezet.
		</p>

		<h3>Een knop en een tekstvak</h3>
		<pre class="code">
<span class="comment">//Voorbeeld 8.6</span>

import java.awt.*;
import java.applet.*;
import java.awt.event.*;

public class Tekstknop extends Applet {
    TextField tekstvak;				
    Button knop;
	
    public void init() {
        tekstvak = new TextField(&quot;&quot;, 30);
        knop = new Button(&quot;Ok&quot;);
        knop.addActionListener( new KnopListener() );
        add(tekstvak);
        add(knop);
    }

    public void paint(Graphics g) {
        g.drawString(&quot;Type een hele lange tekst &quot; +
           &quot;in het tekstvakje &quot; +
           &quot;en klik op Ok&quot;, 50, 60 );
    }
	
    class KnopListener implements ActionListener	{
        public void actionPerformed( ActionEvent e ) {
            tekstvak.setText("Jammer, &quot; +
                &quot;maar nu staat er iets anders");
            repaint();
        }
    }
}
</pre>
		<p>
			In feite is in deze code slechts &eacute;&eacute;n nieuw element
			aangebracht:<br> <b>tekstvak.setText(&quot;Jammer, maar nu
				staat er iets anders&quot;);</b>
		</p>
		<p>
			Als een gebruiker op de knop Ok klikt wordt zijn tekst vervangen door
			de hierboven gegeven tekst. SetText is een methode van het object
			tekstvak.<br> De &quot;&quot; in de regel <b>tekstvak = new
				TextField(&quot;&quot;, 30);</b> is een lege string. Met een lege string
			kun je het tekstveld leeg laten of leeg maken als er iets in staat.
		</p>

		<p>De volgende regel lijkt nieuw maar is het niet:</p>
		<pre class="code">
knop.addActionListener( new KnopListener() );
</pre>
		<p>
			Deze regel is een samenvoeging van de twee volgende regels uit <a
				href="#voorbeeld8_2">voorbeeld 8.2</a>:
		</p>
		<pre class="code">
KnopListener kl = new KnopListener();
knop.addActionListener(kl);
</pre>

		<p>
			Er zijn nu twee elementen aan de applet toegevoegd:<br> <b>add(tekstvak);</b><br>
			<b>add(knop);</b><br> De volgorde van deze regels bepalen de
			volgorde op het scherm: we zien eerst het tekstvak en daarna de knop
			rechts ervan. Als deze regels in omgekeerde volgorde zouden staan,
			dan zou de knop links van het tekstvak staan.
		</p>

		<h3 id="voorbeeld8_7">Tekstvakken en getallen</h3>
		<p>Als een getal uit een tekstvak opgehaald wordt, dan is dat
			altijd in de vorm van een string. Er is een extra stap nodig om die
			string tot int of een double te converteren.</p>

		<pre class="code">
<span class="comment">//Voorbeeld 8.7</span>

import java.awt.*;
import java.applet.*;
import java.awt.event.*;

public class Tekstvak extends Applet {
    TextField tekstvak;
    Label label;				
    double getal;
	
    public void init() {
        tekstvak = new TextField(&quot;&quot;, 20);
        label = new Label(&quot;Type een getal&quot;;
        tekstvak.addActionListener( new TekstvakListener() );
        add(label);
        add(tekstvak);
    }

    public void paint(Graphics g) {
        g.drawString(&quot;Het getal is &quot; + getal, 50, 60 );
    }
	
    class TekstvakListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            <span class="codeplus">String s = tekstvak.getText();</span>
            <span class="codeplus">getal = Double.parseDouble( s );</span>
            <span class="comment">//Je kan deze regels ook samenvoegen</span>
            <span class="comment">//getal = Double.parseDouble(tekstvak.getText());</span>
            repaint();
        }
    }
}
</pre>
		<p>
			De extra stap staat in de methode actionPerformed() en is de regel:<br>
			<b>getal = Double.parseDouble( s );</b><br> De string s is in de
			vorige regel opgehaald uit het tekstvak en wordt in deze regel door
			de methode Double.parseDouble( ) omgezet in een double en die waarde
			wordt in de variabele getal gezet. Voor een integer luidt deze regel:<br>
			<b>getal = Integer.parseInt( s );</b>
		</p>
		<div class="opdrachten">
			<h2>Vragen</h2>
			<ol>
				<li>Wat is event-handling?</li>
				<li>Wat is een gebruikersinterface?</li>
				<li>Waarom moet er voor een knop wel en voor een tekst geen
					event-handling geprogrammeerd worden?</li>
				<li>Wat is een lege string?</li>
				<li>Wat is het verschil tussen een tekstvak en een label?</li>
				<li>Waarom moeten getallen uit een tekstvak altijd
					geconverteerd worden naar een double of een int?</li>
			</ol>
			<h2>Opdracht 8.1</h2>
			<p>Maak een applet in Java, waarin een tekstvak met een label en
				twee knoppen voorkomen. De eerste knop is de ok-knop die ervoor
				zorgt dat wat de gebruiker in het tekstvak heeft ingetikt in het
				venster van de applet zichtbaar wordt. De tweede knop is de
				reset-knop die het tekstvak leeg maakt als de gebruiker erop klikt.</p>

			<h2>Opdracht 8.2</h2>
			<p>Op de open avonden van school wordt bijgehouden hoeveel mannen
				en vrouwen en hoeveel potenti&euml;le vrouwelijke en mannelijke
				leerlingen de school op zo&#39;n avond bezoeken. Schrijf een applet
				waarin alleen op &eacute;&eacute;n van de vier knoppen geklikt hoeft
				te worden en de vier aantallen en het totaal wordt in het venster
				van de applet worden bijgehouden.</p>

			<h2>Opdracht 8.3</h2>
			<p>
				Maak een applet waarin een tekstvak met label en een knop Ok staan.
				In het tekstvak moet een bedrag worden ingevuld en zodra de
				gebruiker op Ok klikt <b>of</b> op de enter-toets drukt moet de
				prijs inclusief BTW (= 21%) in het venster geplaatst worden.
			</p>

			<h2>Praktijkopdracht</h2>
			<p>Maak een rekenmachine in een applet. De rekenmachine bestaat
				uit twee tekstvakken en vier knoppen. De gebruiker tikt in het
				eerste tekstvak een getal in en in het tweede en klikt vervolgens op
				&eacute;&eacute;n van de knoppen om de berekening te laten
				uitvoeren. De uitkomst wordt in het eerste tekstvak getoond en het
				tweede tekstvak wordt leeggemaakt.</p>
			<img src="<c:url value="/AO/InlJava/H8/images/rekenmachine.jpg"/>">

			<h2>Uitbreiding staafdiagram</h2>
			<p>Voeg labels, invoervelden en een knop toe zodat de gebruiker
				de waardes van het staafdiagram kan veranderen.</p>
			<%--<div class="embed-responsive embed-responsive-16by9">--%>
				<%--<iframe width="560" height="315"--%>
					<%--src="https://www.youtube.com/embed/Dzo9tZgFzZM" frameborder="0"--%>
					<%--allowfullscreen></iframe>--%>
			<%--</div>--%>
			<img src="/AO/InlJava/H8/images/staafdiagramMetInvoer.png" height="400px">


		</div>
	</div>
</div>
<%@ include file="/AO/InlJava/includes/bottom.html"%>
<script>
	$(document).ready(function() {
		$("li#ij-h8").addClass("selected");
	})
</script>
</html>
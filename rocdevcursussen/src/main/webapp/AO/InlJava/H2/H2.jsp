<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

	<%@ include file="/AO/InlJava/includes/zijmenu.jsp"%>


	<div class="col-md-9">
		<h2>H2 Je eerste Java Applet</h2>
		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je:</p>
			<ul>
				<li>een eenvoudige Java Applet kunt maken</li>
				<li>2 manieren kent hoe je commentaar in je code kunt plaatsen</li>
				<li>weet hoe je andere Java klassen in je Applet kunt
					importeren</li>
				<li>hoe je een methode in je klasse maakt</li>
				<li>weet hoe je code overzichtelijk houdt door in te springen</li>
				<li>weet wat een String is</li>
				<li>weet hoe je een String op een bepaalde positie in het
					Applet venster plaatst</li>
				<li>weet hoe je (achtergrond-)kleuren kunt gebruiken</li>

			</ul>
		</div>

		<div id="artikel">

			<h4>Praktijk</h4>
			<p>
				In dit hoofdstuk leer je werken met een Java <a
					href="http://nl.wikipedia.org/wiki/Java-applet" target="blank">"Applet"</a>.
				De meeste code editors hebben een zogenaamde Applet Viewer waarmee
				een venster wordt geopend. Dit maakt ze zeer geschikt om de eerste
				Java beginselen mee te leren. Verder worden ze niet veel meer
				gebruikt.
			</p>
			<p>Sinds IntelliJ versie 2019.3 moet je een plug-in installeren om Applets in een Applet viewer
				te kunnen runnen. Op een Windows
				machine ga je naar file -> settings. Op mac naar IntelliJ IDEA -> preferences. Ga naar plug-ins en
				zoek in Market Place naar &quot;Java Applets Support&quot;. Nadat
				je de plug-in hebt geinstalleerd en je IntelliJ opnieuw hebt opgestart zou je Applets moeten kunnen
				runnen.</p>
			<img src="<c:url value="/AO/InlJava/H2/images/ScreenShot_2_003.jpg"/>"
				alt="screenshot Applet" width="600">
			<p>Maak de volgende klasse in je code editor en voer het
				programma uit.</p>

			<pre class="code">
<span class="comment">/*

@(#)Show.java 1.0 03/02/26

*

Voorbeeld 2.1

*

*/</span>

<span class="comment">//importeer de benodigde klassen uit de Java bibliotheek</span>
import java.awt.*;
import java.applet.*;

<span class="comment">//een klasse met de naam Show van het type Applet</span>
public class Show extends Applet {

  <span class="comment">//een (lege) methode die de Applet initialiseert</span>
  public void init() {
  
  }
  <span class="comment">//een methode die de inhoud van het scherm tekent</span>
  public void paint(Graphics g) {
    g.drawString(&quot;Welcome to Java!!&quot;, 50, 60 );
  }

}
</pre>

			<h3>Commentaar in je code opnemen</h3>
			<p>De applet begint met regels commentaar. Commentaar wordt niet
				door de compiler gelezen, maar is voor programmeurs bijvoorbeeld
				bedoeld als uitleg van de code eronder. Commentaar verspreid over
				meerdere regels staat tussen /* en */. Commentaar op een enkele
				regel kan achter // staan zoals je kunt zien.</p>

			<h3>Andere klassen Importeren</h3>
			<pre class="code">
import java.awt.*;
import java.applet.*;
</pre>

			<p>Achter import staat de naam van een klassenbibliotheek. Dit
				gebruikt de linker om uit de klassenbibliotheek voorgedefinieerde
				codes te halen. Je ziet dat het mogelijk is meerdere klassen in een
				applet te gebruiken. Klassen bevinden zich in zogenaamde "packages".
				Met het sterretje geef je aan dat alle klassen uit een bepaalde
				package ge&iuml;mporteerd moeten worden. Om een indruk te krijgen
				van alle packages en klassen die je in Java kunt gebruiken ga je
				naar de standaard Java API (zie web links).</p>

			<h3>Klasse</h3>

			<pre class="code">
public class Show extends Applet {

  public void init() {

  }

  public void paint(Graphics g) {
    g.drawString(&quot;Welcome to Java!!&quot;, 50, 60 );
  }
}
</pre>
			<p>
				Elk Java-programma bestaat uit tenminste &eacute;&eacute;n klasse
				die je zelf schrijft. In dit geval heet de klasse Show. Achter de
				naam Show staat extends Applet. Dat betekent dat de klasse Show een
				uitbreiding is van de klasse Applet. Deze klasse Applet staat in
				java.applet en daarom staat hij achter import. <strong>De
					naam van een klasse begint altijd met een hoofdletter</strong>. De body van
				een klasse begint altijd met een openingsaccolade en eindigt met een
				sluitaccolade. De sluitaccolade die op deze manier bij de
				openingsaccolade hoort, staat onder de eerste letter van de regel
				waarop de openingsaccolade staat. Om je code goed leesbaar te houden
				spring je na iedere openingsaccolade een aantal spaties of een tab
				in.
			</p>

			<h3>Methoden</h3>
			<p>
				Tussen de accolades van de klasse <b>Show</b> staan twee <b>methodes</b>:
				de methode <b>init</b> en de methode <b>paint</b>. Ook methodes
				hebben een openings- en een sluitaccolade. Omdat de methodes beide
				tot de klasse Show behoren, springen zij in, evenals hun accolades.
			</p>
			<p>Methodes kun je herkennen aan de ronde haakjes achter de naam
				van de methode. Een methode bestaat uit een aantal opdrachten met
				een naam erboven. De opdrachten die tussen de accolades van de
				methode staan, vormen samen de body van een methode.</p>

			<h3>Opdrachten</h3>
			<p>
				In de methode init staat tussen de accolades niets. Dat betekent dat
				de methode niets doet. De methode init wordt altijd eerst
				uitgevoerd, voordat andere methodes worden uitgevoerd. Daar zullen
				we in een volgend voorbeeld gebruik van maken. In de methode paint
				staat &eacute;&eacute;n opdracht:<br> <b>g.drawString("Welcome
					to Java!!", 50, 60 );</b><br> Een opdracht sluit je altijd af met
				een puntkomma. De opdracht g.drawString zorgt ervoor dat de tekst <b>Welcome
					to Java!!</b> in de applet op het scherm komt te staan. De dubbele
				aanhalingstekens komen niet op het scherm te staan. Zij geven aan in
				de broncode dat de tekst letterlijk op het scherm moet komen.
				Zo&#39;n tekst tussen aanhalingstekens heet een <b>string</b>,
				letterlijk ketting, een ketting van nul, &eacute;&eacute;n of
				meerdere tekens. Achter de string staan twee getallen. Dat zijn de
				co&ouml;rdinaten, waarmee de plaats bepaald wordt waar de string in
				de applet op het scherm komt. De co&ouml;rdinaten zorgen ervoor dat
				de linkeronderhoek van het eerste teken van de string op positie 50
				vanaf de linkerkant en op positie 60 vanaf boven geplaatst wordt. De
				x-co&ouml;rdinaat begint links met 0 en de y-co&ouml;rdinaat begint
				boven met 0.<br> <img
					src="<c:url value="/AO/InlJava/H2/images/schermcoordinaten.png"/>" height="500">
			</p>
			<p>De co&ouml;rdinaten zorgen ervoor dat de linkeronderhoek van
				het eerste teken van de string op positie 50 vanaf de linkerkant en
				op positie 60 vanaf boven geplaatst wordt. De x-co&ouml;rdinaat
				begint links met 0 en de y-co&ouml;rdinaat begint boven met 0.</p>

			<h3>Kleur gebruiken</h3>
			<p>
				Als je de applet laat uitvoeren, dan zie je een wit venster met
				daarin de tekst Welcome to Java!! In het zwart. Niets bijzonders
				dus. We gaan het programma uitbreiden en meer kleur in het leven
				brengen. Daarvoor gebruiken we in eerste instantie de methode init.
				Daarin zetten we de opdracht setBackground(Color.magenta); Deze
				opdracht stelt de achtergrondkleur van het venster in op paars. Ook
				breiden we de methode <b>paint()</b> uit met de opdracht
				g.setColor(Color.yellow);. Deze opdracht zorgt ervoor dat de tekens
				van de string in het geel worden getekend.
			</p>
			<p>De broncode van de applet ziet er nu als volgt uit:</p>
			<pre class="code">
<span class="comment">//Voorbeeld 2.2</span>

import java.awt.*;
import java.applet.*;

public class Show extends Applet {

  public void init() {
    <span class="codeplus">setBackground(Color.magenta);</span>
  }

  public void paint(Graphics g) {
    <span class="codeplus">g.setColor(Color.yellow);</span>
    g.drawString(&quot;Welcome to Java!!&quot;, 50, 60 );
  }
}
</pre>


		</div>



		<div class="opdrachten">

			<h2>Vragen</h2>
			<ol>
				<li>Wat is machinetaal?</li>
				<li>Welke drie hulpmiddelen heb je nodig om te programmeren?</li>
				<li>Hoe herken je opdrachten in de broncode?</li>
				<li>Waartoe dienen de import-opdrachten?</li>
				<li>Wat is een methode?</li>
			</ol>

			<h2>Opdracht 2.1</h2>
			<p>Maak een applet in Java waarin je naam in het geel wordt
				afgedrukt op een blauwe achtergrond.</p>

			<h2>Opdracht 2.2</h2>
			<p>Maak een applet in Java waarin je roepnaam en je achternaam
				onder elkaar worden afgedrukt. De achtergrond kleur is wit, je
				roepnaam wordt in blauw en je achternaam in rood afgedrukt op het
				scherm.</p>
		</div>
	</div>
</div>
<%@ include file="/AO/InlJava/includes/bottom.html"%>
<script>
	$(document).ready(function() {
		$("li#ij-h2").addClass("selected");
	})
</script>

</html>
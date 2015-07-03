<%@ include file="/AO/InlJava/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-10">
        <h2>H7 Vensters</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	       <h2>Leerdoelen</h2>
				
					<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
					<ul>
						<li>snapt hoe een applicatie samenwerkt met een besturingssysteem</li>
						<li>een idee hebt uit wat voor objecten een grafische interface is opgebouwd</li>
						<li>het begrip &quot;event-handling&quot; kent</li>
						
					</ul>
	          
        </div>
        
        
        
       
        <div id="artikel">
     		
					
					<h4>Theorie</h4>
					<img src="os_types.png" width="500">
					<p>Windows is een grafische interface: Afbeeldingen of opgemaakte tekst op het scherm tonen of afdrukken met de 
					printer op papier wordt door Windows afgehandeld. Een programmeur hoeft geen hardware te benaderen om afbeeldingen 
					af te drukken. Een in Windows geschreven programma kan elke videokaart of printer gebruiken, waarvoor in Windows 
					een stuurprogramma beschikbaar is.</p>
					<p>Maar Windows is meer: Windows is ook een besturingssysteem dat gebeurtenissen (events) afhandelt. In 
					objectgeori&euml;nteerd programmeren is een object een combinatie van code en gegevens. Een venster dat je op het 
					scherm ziet, is een object. Elke knop, radiobutton, invoervak, label en noem alle soorten objecten maar op die op het 
					scherm kunnen verschijnen, zijn vensters en werken in principe op dezelfde manier, omdat ze afgeleid zijn van het 
					basisobject venster.</p>
					<img src="guiKlassen.gif">
					<p>Als een gebruiker met de muis op een knop klikt, stuurt Windows een gebeurtenis naar de methode die bij die knop hoort: 
					In dit geval dat er op de knop is geklikt. Een andere gebeurtenis had dubbelklikken kunnen zijn. Windows houdt intern bij 
					welke methode bij welk venster hoort. Je kunt ook zeggen: Windows roept de methode aan die bij die knop hoort. Dit wordt in 
					vaktermen <em>event-handling</em> genoemd.<br>
					De methode staat in het intern geheugen van de computer. Een aantal eigenschappen zijn standaard: Een venster is altijd 
					rechthoekig en een knop zal zich indrukken zodra een gebruiker erop klikt. Een actief venster zal een titelbalk met blauwe 
					achtergrond laten zien.</p>
					<img src="eventHandling.png" width="550">
					<p>Een programmeur moet twee dingen doen:<br>
					<ul>
						<li>hij moet ervoor zorgen dat het venster zichtbaar wordt op het scherm</li>
						<li>hij moet aan Windows vertellen welke methode bij het venster hoort</li>
					</ul>
					Hoe dat praktisch in zijn werk gaat, lees je in het volgende hoofdstuk.</p>
					<h2>Vragen</h2>
					<ol>
						<li><p>Je kunt in de methode <b>init()</b> van je applet de afmetingen van het scherm bepalen met de methode 
						<b>setSize(int width, int height)</b>.<br>
						Tussen de haakjes wordt aangegeven dat deze methode twee argumenten (of parameters) van het type int verwacht. Je 
						kunt de methode als volgt &quot;aanroepen&quot;:</p>
<pre class="code">
import java.awt.*;
import java.applet.*;

public class Show extends Applet {

  public void init() {
    <span class="codeplus">setSize(400, 300);</span>
  }
  
  public void paint(Graphics g) {
    g.drawString(&quot;Welcome to Java!!&quot;, 50, 60 );
  }
}
</pre>						
						
						<p>Kun je in de Java API (zie web-links) deze methode ergens vinden?</p></li>
						<li><p>In welke klasse wordt deze methode gedefinieerd?</p></li>
						<li><p>Dezelfde klasse heeft een tweede methode met dezelfde naam. Wat is het verschil?</p></li>
					</ol>
					
					<div class="toonknopcontainer">
						<button class="toonknop" id="toon7.1" onclick="toon('uitw7.1')">Toon uitwerking</button>
					</div>
				</div>
				
				<div class="uitwerking" id="uitw7.1">
					<h2>Uitwerking</h2>
					<p>De methode wordt zonder tussenkomst van een instantie van een andere klasse aangeroepen in de klasse Show die een uitbreiding van 
					<a href="http://docs.oracle.com/javase/7/docs/api/java/applet/Applet.html" target="_blank">Applet</a> is. Je had ook mogen schrijven<br>
					<b>this.setSize(400, 300);</b> om aan te geven dat het een methode van de eigen klasse is. In de Java API zie je bij de klasse Applet 
					onder &quot;Method Summary&quot; alle methoden van de klasse opgesomd. De methode setSize() staat daar niet tussen. In het onderdeel 
					&quot;Methods inherited from class java.awt.Component&quot; wordt de methode w&eacute;l genoemd. Aangezien Applet een uitbreiding is van 
					onder meer <a href="http://docs.oracle.com/javase/7/docs/api/java/awt/Component.html" target="_blank">Component</a>, erft zij alle eigenschappen, waaronder methoden.</p>
					<img src="ScreenShot_2_004.jpg" alt="Java API" width=300>
					<p>Een klasse kan verschillende methoden bevatten met dezelfde naam, maar met verschillende argumenten. De klasse Component heeft nog een 
					methode setSize die als argument een instantie van het type 
					<a href="http://docs.oracle.com/javase/7/docs/api/java/awt/Dimension.html" target="_lank">Dimension</a> 
					accepteert. Dit noemen we &quot;overloading&quot;.</p>
					
<pre class="code">
	Dimension dim = new Dimension(400, 300);
	this.setSize(dim);
</pre>				
					
				</div>
		
			</div>
<%@ include file="/includes/bottom.html" %>
<% } %>

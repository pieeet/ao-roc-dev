<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

<%@ include file="/AO/InlJava/includes/zijmenu.jsp" %>
      
      <div class="col-md-9">
        <h2>H4 Tekenen</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	       <h2>Leerdoelen</h2>
					<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
					<ul>
						<li>in een applet met een object van de klasse Graphics lijnen, rechthoeken, ellipsen en bogen kunt tekenen</li>
						<li>weet dat de methode <b>paint()</b> wordt aangeroepen als het applet venster op het scherm wordt ververst</li>
						
					</ul>
	          
        </div>
        
        
        
       
        <div id="artikel">
     		<h3>Lijnen en rechthoeken</h3>
					<p>Voor het tekenen van een lijn is de opdracht <b>g.drawLine(50, 120, 270, 120);</b> De eerste twee getallen zijn de co&ouml;rdinaten 
					waar de lijn begint en de laatste twee getallen zijn co&ouml;rdinaten waar de lijn eindigt. De opdracht zorgt ervoor dat de lijn 
					begint op positie (50, 120) en eindigt op positie (270, 120).</p>
					<p>Met de methode <b>drawRect()</b> teken je een rechthoek. Een voorbeeld daarvan is:<br>
					<b>g.drawRect(20, 20, 100, 50);</b><br>
					Tussen de ronde haakjes staan vier getallen. De eerste twee zijn de co&ouml;rdinaten van de linkerbovenhoek. De laatste twee getallen 
					zijn niet de co&ouml;rdinaten van de rechterbenedenhoek van de rechthoek, zoals je misschien zou verwachten. Het zijn de breedte en de 
					hoogte van de rechthoek Van de rechthoek wordt alleen de omtrek getekend in de kleur die is ingesteld. Standaard is dat zwart. 
					Met <b>setColor()</b> kun je de kleur van de vier lijnen instellen. Met <b>fillRect()</b> teken je een gevulde rechthoek. Deze methode heeft 
					dezelfde vier argumenten:<br>
					<b>g.fillRect(20, 130, 100, 50);</b><br>
					De onderstaande broncode toont bij uitvoering twee rechthoeken onder elkaar:</p>
<pre class="code">
<span class="comment">//Voorbeeld 4.1</span>

import java.awt.*;
import java.applet.*;

public class Show extends Applet {

  public void init() {
  }

  public void paint(Graphics g) {
    setBackground(Color.blue); 
    g.setColor(Color.yellow);
    g.drawRect(20, 20, 100, 50);
    g.fillRect(20, 80, 100, 50);
  }
}
</pre>
					
					<p>Het maken van een vierkant is eenvoudig: Als de laatste twee getallen -de breedte en de hoogte- bij drawRect en fillRect gelijk zijn, 
					is het een vierkant:<br>
					<b>g.drawRect(20, 20, 100, 100);</b></p>
					
					<p>Een rechthoek met ronde hoeken teken je met behulp van <b>drawRoundRect()</b> of <b>fillRoundRect()</b>:<br>
					<img src="/AO/InlJava/H4/images/ronde_hoeken.png" height="200"><br>
					<b>g.drawRoundRect(20, 20, 100, 50, 10, 10);</b><br>
					De eerste vier getallen hebben dezelfde functie als in drawRect: twee co&ouml;rdinaten en de breedte en de hoogte. De laatste twee 
					getallen zijn de breedte en de hoogte van de ellips, waarmee de hoeken zijn afgerond. Maak je de laatste twee waarden groter dan 
					de breedte en de hoogte, dan zie je een ellips!</p>
					
					<h3>Ellipsen en bogen</h3>
					<p>Een ellips teken je met de methodes <b>drawOval()</b> en <b>fillOval()</b>:<br>
					<b>g.drawOval(20, 20, 50, 100);</b></p>
					<img src="/AO/InlJava/H4/images/ellips.png" height="600">
					<p>Eigenlijk zijn de co&ouml;rdinaten de linkerbovenhoek van een rechthoek en de twee laatste de breedte en de hoogte van diezelfde 
					rechthoek. De ellips wordt binnen de rechthoek getekend.</p>
					<p>Een cirkel teken je op dezelfde manier als een vierkant, maar dan met drawOval() of fillOval(). De laatste twee getallen zijn 
					dan weer aan elkaar gelijk.</p>
					<p>Tot slot is er de boog. Deze teken je met <b>drawArc()</b> of <b>fillArc()</b>. Eigenlijk wordt er een deel van de ellips getekend. De eerste 
					vier getallen hebben dezelfde functie als bij drawOval(): de twee co&ouml;rdinaten en de breedte en de hoogte van de rechthoek om 
					de ellips heen. De twee volgende getallen zijn de starthoek van de boog en de sluithoek van de boog in graden:</p>
					<p><b>g.drawArc(20, 20, 100, 50, 90, 135);</b></p>
					
					<img src="/AO/InlJava/H4/images/boog.png" height="423">
					
					<p>Met <b>g.fillArc(20, 20, 100, 50, 90, 135);</b> wordt de boog een taartpunt.</p>
					<p>Let op, want de graden beginnen in het oosten en niet in het noorden.</p>
					

				</div>
				
									
				
				<div class="opdrachten">
					<h2>Vragen</h2>
					<ol>
						<li>Wat is een platform?</li>
						<li>Waarom hoeft een programmeur in Java maar &eacute;&eacute;n keer een programma te schrijven voor verschillende platforms?</li>
						<li>Wat is bytecode?</li>
						<li>Wat doet JVM?</li>
						<li>Met welke methode kun je een vierkant tekenen?</li>
						<li>Noem drie methodes waarmee je een cirkel kunt tekenen</li>
						<li>Waarom worden opdrachten voor het scherm in paint() gezet en niet in een andere methode?</li>
					</ol>
				
					<h2>Opdracht 4.1</h2>
					<p>Teken een gelijkbenige driehoek</p>
					
					<h2>Opdracht 4.2</h2>
					<p>Teken een huis met daarin tenminste &eacute;&eacute;n raam en een deur</p>
					
					<h2>Opdracht 4.3</h2>
					<p>Teken de Nederlandse vlag aan een vlaggenstok</p>
					
					<h2>Opdracht 4.4</h2>
					<p>Drie kinderen hebben het volgende gewicht:</p>
					<ul>
					  <li>Valerie: 40 kg</li>
					  <li>Jeroen: 100 kg</li>
					  <li>Hans: 80 kg</li>
					</ul>
					
					<p>Maak van deze gegevens een staafdiagram, waarbij elke kolom een eigen kleur heeft. De namen van de kinderen 
					staan onder het staafdiagram en de verdeling van de schaal staat naast de diagram met daarbij om de 20 de verdeling.</p>
					
					<h2>Opdracht 4.5</h2>
					<p>Teken met <b>fillArc()</b> op een blauwe achtergrond een ellips die met geel is gevuld.</p>
					
					<h2>Opdracht 4.6</h2>
					<p>Teken een stoplicht</p>
					
					<h2>Opdracht 4.7</h2>
					<p>Teken de zijde waarop de vier van een dobbelsteen staat</p>
					
					<h2>Praktijkopdracht</h2>
					<img src="/AO/InlJava/H4/images/Praktijkopdracht4.jpg" alt="vormen tekenen">
					<p>Schrijf een applet in Java, waarin de bovenstaande figuur wordt getekend. De kleur van de gevulde figuren is magenta en 
					de teksten zijn in het zwart. De afgeronde hoeken hebben de waarde 30 en de taartpunt begint bij 0 en de hoek is 45 graden.<br>
					Als je klaar bent, lever je de broncode in bij je docent.</p>
					
					
			</div>
		</div>
<%@ include file="/AO/InlJava/includes/bottom.html"%>


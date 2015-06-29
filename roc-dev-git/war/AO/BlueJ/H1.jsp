<%@ include file="/AO/BlueJ/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-10">
        <h2>Objecten in BlueJ</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	       <h2>Leerdoelen</h2>
					
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je de volgende begrippen kent en kunt gebruiken:</p>
			<ul>
				<li>klasse</li>
				<li>object of instantie </li>
				<li>constructor</li>
				<li>methode</li>
				<li>parameter</li>
				<li>attribuut</li>
				<li>int (integer)</li>
				<li>boolean</li>
				<li>terugkeerwaarde</li>
				<li>void</li>
			</ul>
	          
        </div>
        <div class="bs-callout bs-callout-info">
	        <h2>Studeeraanwijzingen</h2>
			<p>Op de CD ROM van het leerboek of <a href="/AO/BlueJ/CDRom/index.html">hier</a> kun je de antwoorden op de vragen in het boek vinden.</p>
        </div>
        
        
		<h3>Klassen en objecten</h3>
		<p>In het eerste hoofdstuk ga je aan de slag met de <i>klasse</i> Lamp. Deze kun je vinden in de voorbeelden. 
		Lamp is een klasse. Een klasse is een soort bouwtekening. Van een klasse kun je een concreet <em>object</em> maken door 
		de <em>constructor</em> aan te roepen.</p>
		<img src="constructorpng.png" alt="constructor" >
        
       
<pre class="code">
<span class="comment">/**</span>
  <span class="comment">* Constructor voor objecten van klasse Lamp</span>
  <span class="comment">* Maakt een lamp op default positie (100)</span>
 <span class="comment">*/</span>
  public Lamp() {
    this( 100 ); <span class="comment">//roept andere constructor aan</span>
  }
  
<span class="comment">/**</span>
  <span class="comment">* Constructor 2 incl positie</span>
  <span class="comment">* @param positie lamp</span>
 <span class="comment">*/</span>  
 public Lamp(int positie) {
    this.positie = positie;
  }
  
<span class="comment">//objecten (of instanties) maken</span>
Lamp lamp1 = new Lamp();
Lamp lamp2 = new Lamp(200);

</pre>					
					
					<p> Een constructor is een speciale <i>methode</i> waarmee je een concreet object van een 
					klasse aan kunt maken. Een klasse kan meerdere constructors hebben. Lamp bijvoorbeeld heeft twee constructors. 
					De eerste maakt een lamp zonder dat je hoeft aan te geven waar deze op het scherm verschijnt. Als je een lamp op deze 
					manier maakt krijgt hij een default positie (in dit geval 100). Bij de andere constructor kun je wel aangeven waar hij op het scherm 
					moet komen. Bij deze constructor moet je de gewenste positie als <i>parameter</i> meegeven.</p>

					
					
					
					<pre class="code">
<span class="comment">/**</span>
  <span class="comment">* Constructor voor objecten van klasse Lamp</span>
  <span class="comment">* Maakt een lamp op de plaats aangegeven door positie</span>
  <span class="comment">* bij creatie is lamp onzichtbaar</span>
  <span class="comment">*/</span>
  public Lamp( int positie ) {
    this.positie = positie;
    <span class="codeplus">this.isZichtbaar = false;</span>
  }
Lamp lamp2 = new Lamp(400);
<span class="comment">// zet de lamp aan</span>
lamp2.aan();
</pre>		
					<p>De naam van een constructor is altijd hetzelfde als de naam van de klasse, inclusief hoofdletter.</p>
								
					<h3>Attributen</h3>
					<p>Een klasse heeft bepaalde eigenschappen - de <i>attributen</i>. De klasse Lamp bijvoorbeeld heeft drie attributen:
					<ul>
						<li>positie, uitgedrukt in int: een geheel getal;</li>
						<li>isZichtbaar, uitgedrukt in boolean: waar (true) of niet waar (false)</li>
						<li>isAan, ook uitgedrukt in boolean</li>
					</ul>
					<p>Attributen zijn - uitzonderingen daargelaten - private. Dit betekent dat ze niet direct aangeroepen kunnen worden.
					Om de toestand van attributen op te vragen worden methoden gebruikt.</p> 
					
					<h3>Methoden</h3>
					<p>Naast eigenschappen kent een klasse zogenaamde methoden. Grofweg zijn er twee soorten:</p>
					
					<h4>Terugkeerwaarde</h4>
					<p>Methoden die iets teruggeven als ze worden aangeroepen. Vaak is dit de toestand van een attribuut. 
					De <i>terugkeerwaarde</i> van de methode isAan() van de klasse Lamp geeft de toestand van het attribuut
					isAan terug als true of false, afhankelijk van de toestand van dat moment. Bij het schrijven van een methode moet de programmeur aangeven wat voor type 
					de methode terug geeft.</p>
<pre class="code">
<span class="comment">// Methode om te checken of lamp aan of uit is</span>
public <span class="codeplus">boolean</span> isAan() {
    return isAan;
}
</pre>

					<p>Methoden kunnen worden aangeroepen op objecten van de klasse.</p>
<pre class="code">
boolean b = lamp1.isAan();

</pre>				
					 <h4>Void</h4>
					<p>Methoden zonder terugkeerwaarde. Deze veranderen vaak iets aan de toestand van een attribuut. De methoden 
					aan() en uit() bijvoorbeeld veranderen de toestand van het attribuut isAan in respectievelijk true en false.
					Methoden zonder terugkeerwaarde krijgen als terugkeerwaarde <i>
					<a href="http://translate.google.nl/#en/nl/void">void</a>.</i></p>
<pre class="code">
<span class="comment">// Methode om lamp aan te zetten</span>
public <span class="codeplus">void</span> aan() {
    isAan = true;
}

<span class="comment">// Methode om lamp uit te zetten</span>
public void uit() {
    isAan = false;
}
<span class="comment">//aanroep van methode op object</span>
lamp1.aan();
lamp1.uit();
</pre>					

					
					<p>Methoden kunnen, mits ze toegankelijk (public) zijn worden aangeroepen op objecten van een klasse. Op een instantie
					van de klasse Lamp kun je dus public methoden aanroepen. In BlueJ kun je een overzicht van public methoden 
					krijgen door met de rechter muisknop op het object te klikken (zie screenshot).</p>
					<img class="imgfullwidth" src="/AO/BlueJ/images/H1Lamp.jpg" alt="screenshot klasse lamp">
				
		</div>


	
    </div>
  </div>
</div>
	
<% } %>

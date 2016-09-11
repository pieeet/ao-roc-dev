<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/BlueJ2/includes/zijmenu.jsp" %>
    <div class="col-md-9">
        <h2>2 Objecten in BlueJ</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>

            <p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
                je de volgende begrippen kent en kunt gebruiken:</p>
            <ul>
                <li>klasse</li>
                <li>object of instantie</li>
                <li>constructor</li>
                <li>methode</li>
                <li>int (integer)</li>
                <li>boolean</li>
                <li>terugkeerwaarde</li>
                <li>void</li>
                <li>de toestand van een object</li>
            </ul>

        </div>

        <h3>Inleiding</h3>
        <p>
            In deze cursus leer je programmeren in java. Dat doe je door objecten te maken. Programmeren met behulp van
            objecten heet <em>objectgeori&euml;nteerd programmeren</em>. Een object wordt ook wel <em>instantie
            (instance)</em> genoemd.
        </p>
        <p>Een object in java heeft wel iets weg van een apparaat uit het dagelijks leven zoals een televisietoestel.
            Veel apparaten hebben een soort geheugen. Zo weet een televisie welke zenders hij kan ontvangen en ook wat
            de
            laatste zender was waar je naar hebt gekeken. De meeste apparaten kun je op de &eacute;&eacute;n of andere
            manier bedienen. Een tv kun je aan- en uitzetten en je kunt het geluid harder of zachter zetten of je kunt
            een
            andere zender kiezen.</p>
        <p>Objecten in java hebben ook een geheugen. Ze kunnen verschillende dingen onthouden zoals een kleur een
            naam of een waarde. En je kunt een object iets laten doen. Iets optellen bijvoorbeeld of aangeven hoe oud
            een
            bepaalde persoon is. Hoe dat allemaal in zijn werk gaat is het onderwerp van dit hoofdstuk.</p>


        <div class="opdrachten">
            <h2>De klasse Lamp</h2>
            <p>Open in BlueJ het project Lamp. Dit project vind je in de map Voorbeelden.</p>
            <img src="/AO/BlueJ2/images/2_1Lamp.png" alt="lamp-project">
            <p>In dit venster zie je een rechthoek met de naam Lamp. Deze rechthoek stelt een <em>klasse</em> voor en
                van deze klasse kun je <em>objecten</em> maken. Laten we een lamp-object maken. Dit kun je doen door met
                je
                rechtse muisknop op de klasse te klikken en de optie <code>new Lamp()</code> te kiezen. Hiermee activeer
                je
                de zogeheten <em>constructor</em>. Een constructor zorgt voor het maken (construeren) van een object.
            </p>

            <p>Als je een object maakt moet je het een naam geven. Verschillende objecten moeten unieke namen hebben.
                Default is lamp1. Je kunt dit eventueel
                veranderen.</p>
            <p>Als je in BlueJ een object maakt verschijnt het onderin het scherm in de <em>Object bench</em>. Door
                er met je rechtse muisknop op te klikken krijg je de methodes te zien die je op het lamp-object kunt
                aanroepen. Met de methode <code>maakZichtbaar()</code> open je een scherm met daarin de lamp(en).</p>
            <img src="/AO/BlueJ2/images/2_1object.png" alt="lamp-object">

            <p>Bekijk de broncode van de klasse door op de klasse te dubbelklikken en bekijk de code van de constructor
                die je net hebt gebruikt.</p>

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
  <span class="comment">* @param positie van de lamp op het scherm</span>
 <span class="comment">*/</span>
 public Lamp(int positie) {
    isZichtbaar = false;
    this.positie = positie;
  }


</pre>
        </div>

        <h3>De constructor</h3>
        <img src="/AO/BlueJ/images/constructorpng.png" alt="constructor">
        <p>
            Een constructor is een speciale <em>methode</em> waarmee je een
            concreet object van een klasse aan kunt maken. De naam van een constructor is altijd hetzelfde als de
            naam van de klasse, inclusief hoofdletter. Een klasse kan
            meerdere constructors hebben. De klasse Lamp heeft twee
            constructors. De eerste maakt een lamp zonder dat je hoeft aan te
            geven waar deze op het scherm verschijnt. Als je een lamp op deze
            manier maakt krijgt hij een default positie (in dit geval 100). Bij
            de andere constructor kun je wel aangeven waar hij op het scherm moet
            komen. Bij deze constructor moet je de gewenste positie als <em>argument</em>
            meegeven.
        </p>
        <p>Als je een lamp object maakt kun je het scherm zichtbaar maken met de methode <code>maakZichtbaar()</code>.
            Je hoeft deze methode maar &eacute;&eacute;n keer op een object aan te roepen omdat alle lampen hetzelfde
            scherm met elkaar delen. </p>
        <p>Maak een aantal lampen en zet ze op verschillende posities. Zet ze aan en weer uit.</p>


        <h3>Methoden</h3>
        <p>Naast eigenschappen kent een klasse zogenaamde methoden.
            Grofweg zijn er twee soorten:</p>

        <h4>Terugkeerwaarde</h4>
        <p>
            Methoden die iets teruggeven als ze worden aangeroepen. De <em>terugkeerwaarde</em> van de
            methode isAan() van de klasse Lamp geeft de toestand van het
            attribuut isAan terug als true of false, afhankelijk van de toestand
            van dat moment. Bij het schrijven van een methode moet de programmeur
            aangeven wat voor type de methode terug geeft.
        </p>
        <pre class="code">
<span class="comment">// Methode om te checken of lamp aan of uit is</span>
public <span class="codeplus">boolean</span> isAan() {
    <span class="comment">// het attribuut isAan is van type boolean</span>
    <span class="codeplus">return isAan;</span>
}
</pre>

        <p>Methoden kunnen worden aangeroepen op objecten van de klasse. De onderstaande regel checkt of het
            betreffende lamp-object aan is en slaat de terugkeerwaarde op in een boolean variabele genaamd b.</p>
        <pre class="code">
boolean b = lamp1.isAan();

</pre>
        <h4>Void</h4>
        <p>
            Methoden zonder terugkeerwaarde. Deze veranderen vaak iets aan de
            toestand van een object. De methoden aan() en uit() bijvoorbeeld
            veranderen de toestand van het attribuut isAan in respectievelijk
            true en false. Methoden zonder terugkeerwaarde geven <em>void</em> (niets) terug.
            </em>
        </p>
        <pre class="code">
<span class="comment">// Methode om lamp aan te zetten</span>
public <span class="codeplus">void</span> aan() {
    isAan = true;
}
</pre>


        <p>Methoden kunnen, mits ze toegankelijk (public) zijn worden
            aangeroepen op objecten van een klasse. Op een instantie van de
            klasse Lamp kun je dus public methoden aanroepen. In BlueJ kun je een
            overzicht van public methoden krijgen door met de rechter muisknop op
            het object te klikken.</p>

        <h3>Methoden van de klasse Lamp</h3>
        <p>De klasse Lamp heeft 4 public methoden die zichtbaar worden als je met de rechtse muisknop op een
            object klikt. Om het scherm te tonen gebruik je de methode <code>maakZichtbaar()</code>. Probeer ze uit en
            bekijk de methodes in de broncode. Merk het verschil op tussen de methodes met terugkeerwaarde en de
            void methodes.</p>

        <h3>De object-inspector van BlueJ</h3>
        <p>BlueJ heeft een zogeheten <em>object-inspector</em> waarmee je als het ware in een object kunt kijken.
            Je kunt dan zien welke waarden er in een object zijn opgeslagen. De verzameling van alle waarden die in een
            object zitten noemen we de <em>toestand</em> van een object. </p>
        <p>Je roept de object-inspector op door met je rechtse muisknop op een object te klikken en voor
            <code>Inspect</code> te kiezen. Je ziet dat in een lamp-object drie waardes zijn opgeslagen:
        <ul>
            <li>positie uitgedrukt met een int waarde</li>
            <li>isZichtbaar en</li>
            <li>isAan beiden uitgedrukt met een boolean waarde (true of false)</li>
        </ul>
        </p>

        <div class="opdrachten">
            <h2>Vragen</h2>
            <ol>
                <li>Wat is een ander woord voor object?</li>
                <li>Wat is een constructor?</li>
                <li>Wat is een klasse?</li>
                <li>Hoeveel instanties kun je van een klasse maken?</li>
                <li>Op een instantie van Lamp kun je vier verschillende methodes aanroepen. Hoe reageert een
                lamp-object na het aanroepen van elk van deze methoden?</li>
                <li>Welke waardes kan een boolean variabele hebben?</li>
                <li>Wat geeft het woord void aan?</li>
                <li>Wat voor waarde heeft een int variabele?</li>
                <li>Wat bedoelen we met de toestand van een object?</li>
            </ol>
        </div>
        <div class="opdrachten">
            <h2>Opgaven</h2>
            <ol>
                <li>Open in BlueJ uit de map voorbeelden het project <code>GekleurdeLamp</code>. Wat is de toestand van
                    de lamp?</li>
                <li>Maak de lamp zichtbaar door de methode maakZichtbaar() aan te roepen. Wat is nu de toestand van
                    de lamp?</li>
                <li>Zet de lamp aan</li>
                <li>Roep de methode setBlauw() aan op de lamp. Wat gebeurt er? Wat is nu de toestand van de lamp?</li>
                <li>Maak lamp-objecten op posities 200, 300 en 450</li>
                <li>Zet alle lampen aan en geef ze verschillende kleuren.</li>
            </ol>

        </div>


    </div>
</div>
<%@ include file="/AO/BlueJ2/includes/bottom.html" %>
</html>


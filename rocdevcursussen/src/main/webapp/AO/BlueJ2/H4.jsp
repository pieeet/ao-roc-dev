<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

    <%@ include file="/AO/BlueJ2/includes/zijmenu.jsp" %>

    <div class="col-md-9">
        <h2>Objecten met objecten</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
                je de volgende begrippen kent en kunt gebruiken:</p>
            <ul>
                <li>associatie tussen klassen</li>
                <li>referentie objecten</li>
                <li>het Terminal Window</li>
                <li>de methoden System.out.print( ) &amp; System.out.println( )</li>
                <li>In BlueJ een test-klasse en een test-fixture kunt maken</li>
                <li>concatenatie van Strings</li>
                <li>de methode toString( )</li>
            </ul>

        </div>
        <h3>Inleiding</h3>
        <p>In de praktijk bevatten objecten vaak andere objecten. Een bank bijvoorbeeld is in het dagelijks leven
            beheerder van bankrekeningen. In objectgeori&euml;nteerd programmeren probeer je de werkelijkheid zoveel
            mogelijk in software na te bootsen. Dat betekent dat je een Bank-object maakt met daarin een aantal
            Bankrekening-objecten. In dit en het volgende hoofdstuk leer je hoe je objecten in objecten kunt
            &quot;opbergen&quot;.</p>

        <h3>Teams van leerlingen</h3>
        <p>Tijdens de sportweek doen aan verschillende onderdelen teams van twee leerlingen mee. Voor de
            leerlingen kun je de klasse Leerling uit het vorige hoofdstuk gebruiken. Voor de teams maak je een nieuwe
            klasse Team. Om aan te geven dat de klassen Team en Leerling iets met elkaar te maken hebben teken je een
            lijn tussen de twee klassen. We zeggen dat er een <em>associatie</em> is tussen die klassen.</p>
        <img src="/AO/BlueJ2/images/klassendiagram_sportweek.png">
        <p>Om duidelijk te maken wat de associatie inhoudt kun je een toelichting bij de lijn zetten: een team bestaat
            uit leerlingen, in dit geval twee leerlingen.</p>
        <img src="/AO/BlueJ2/images/klassendiagram_sportweek_2.png">
        <h3>Een object dat objecten maakt</h3>
        <p>We gaan nu een klasse maken voor een team van twee leerlingen. De klasse heeft twee attributen: beide
            teamleden. In deze eerste versie van de klasse maakt de constructor de teamleden.</p>
        <img src="/AO/BlueJ2/images/klassendiagram_team.png">

        <p>In bovenstaand klassendiagram lijkt het of de klasse geen attributen heeft, het middelse vak is immers
            leeg. Dat is echter maar schijn. De associatie die naar de klasse leerling loopt, geeft aan dat Team
            twee attributen heeft met de naam lid1 en lid2. Het minteken voor de namen zegt dat ze private zijn.</p>
        <p>De broncode van de klasse leerling heb je in het vorige hoofdstuk gemaakt. De broncode van Team vind je
            hieronder.</p>

        <pre class="code">
public class Team {
    <span class="comment">// Twee teamleden</span>
    private Leerling lid1;
    pivate Leerling lid2;

    <span class="comment">// Constructor</span>
    public Team() {
        lid1 = new Leerling(&quot;Charlotte&quot;, &quot;6A&quot;, &quot;meisje&quot;, 101);
        lid2 = new Leerling(&quot;Heleen&quot;, &quot;5B&quot;, &quot;meisje&quot;, 103);
    }
}</pre>
        <p>De klasse heeft twee attributen van het type Leerling die eerst worden gedeclareerd en in de constructor
            worden aangemaakt. Dit zijn zogenaamde <em>referenties</em> naar objecten.
        </p>
        <p>Met de uitdrukking new Leerling(...) wordt een object gemaakt met de constructor van Leerling. In een
            object kunnen dus objecten van andere klassen worden gemaakt.</p>
        <p>Laten we de klasse gaan testen. Maak een nieuw projectNaam genaamd Sportweek en maak de klasse Team. De klasse
            Leerling die je al had gemaakt kun je in het projectNaam importeren (<code>Project</code> &#8594;
            <code>Import...</code>). Als het goed is zie je dat er in het venster van BlueJ een stippellijn loopt tussen
            de
            twee klassen. Dit is de manier van BlueJ om een associatie tussen de klassen aan te geven.</p>
        <img src="/AO/BlueJ2/images/screenie_team_speler.png">
        <p>Maak een object van Team en inspecteer hem. In het venster van de object-inspector zie je de attributen
            lid1 en lid2 met daarachter een kromme pijl. Dat betekent dat dit referenties zijn die naar een object
            wijzen.
            Deze objecten kun je op hun beurt ook weer inspecteren om hun inhoud te bekijken.</p>
        <p>Het zou wel handig zijn als de klasse Team een methode zou hebben die in &eacute;&eacute;n keer een
            overzicht geeft van de teamleden. Dit kan met de volgende methode:</p>
        <pre class="code">
public void print() {
    System.out.println( &quot;Indeling van dit team:&quot; );
    System.out.println( lid1.getNaam() );
    System.out.println( lid2.getNaam() );
    System.out.println(&quot;-----------------------------&quot;);
}
</pre>
        <p>Met de opdracht System.out.println() opent BlueJ een apart uitvoervenster, het zogeheten Terminal Window.
            Daarin wordt de tekst geplaatst die je tussen de haakjes van println() zet.</p>
        <img src="/AO/BlueJ2/images/terminal_team.png">
        <ul>
            <li>Voeg de methode print() aan de klasse Team toe.</li>
            <li>Compileer de klasse en roep de methode print() aan.</li>
        </ul>
        <p>De methode System.out.println() zet tekst in het uitvoervenster. De letters ln zijn een afkorting
            voor <em>line</em> en deze duiden erop dat de methode voor de overgang naar een nieuwe regel zorgt.
            Er bestaat ook een methode System.out.print(). Deze plaatst ook tekst op het scherm maar zonder de overgang
            naar een nieuwe regel. Uitvoer komt dan op dezelfde regel.</p>
        <h3>Een tweede Team-object</h3>
        <p>Als je een tweede Team-object maakt zie je een ernstige beperking van deze klasse: elk object - elk team -
            heeft dezelfde leden namelijk Charlotte en Heleen. Dat komt doordat in de constructor van de klasse twee
            Leerling-objecten gemaakt worden, er is geen mogelijkheid een andere samenstelling van het team te
            maken.</p>
        <p>Moet je nu voor ieder team een nieuwe klasse maken? Nee, alle teams zijn gelijksoortige objecten en voor
            gelijksoortige objecten maak je maar &eacute;&eacute;n klasse. Waar je voor moet zorgen is dat je de
            mogelijkheid hebt telkens bij het maken van een Team-object andere leerlingen aan het team toe te
            voegen.</p>

        <h3>Team versie 2</h3>
        <p>Om te bewerkstelligen dat elk team verschillende leden krijgt, kun je de constructor twee argumenten geven
            zodat je van buitenaf een team kunt vullen. Het diagram van deze klasse ziet er als volgt uit:</p>
        <img src="/AO/BlueJ2/images/klassendiagram_team_2.png">
        <p>De broncode van de nieuwe versie zie je hieronder:</p>
        <pre class="code">
<span class="comment">//Versie 2: Team van twee willekeurige leerlingen</span>
public class Team {
    <span class="comment">//twee teamleden</span>
    private Leerling lid1;
    private Leerling lid2;

    <span class="comment">//Constructor</span>
    public Team(Leerling lid1, Leerling lid2) {
        this.lid1 = lid1;
        this.lid2 = lid2;
    }

    public void print() {
        System.out.println( &quot;Indeling van dit team:&quot; );
        System.out.println( lid1.getNaam() );
        System.out.println( lid2.getNaam() );
        System.out.println(&quot;-----------------------------&quot;);
    }
}</pre>
        <ul>
            <li>wijzig de broncode van de klasse team zoals hierboven is weergegeven</li>
            <li>compileer de klasse</li>
        </ul>
        <p>Je hebt nu twee lid-objecten nodig om het Team-object te kunnen maken. Je kunt voordat je een team maakt
            eerst twee Leerling objecten maken en dezen selecteren door er op te klikken als je het team maakt. Ook kun
            je in het invoervak van de leden van Team met new Lid(...) een lid-object maken. Je moet dan wel de juiste
            argumenten meegeven.</p>
        <ul>
            <li>maak een Team-object met twee leden</li>
            <li>roep de methode print() aan om de samenstelling van het team te bekijken.</li>
        </ul>
        <p>Om te voorkomen dat eerdere print() opdrachten in het terminal venster worden getoond kun je in het
            terminal venster op <code>Options</code> klikken en op <code>Clear screen at method call</code> klikken. Er
            komt nu een vinkje bij deze optie te staan. Wanneer je nu een methode aanroept wordt het scherm eerst
            leeggemaakt.</p>

        <h3>Objecten bewaren in BlueJ</h3>
        <p>Bij het maken van een object moet je een constructor aanroepen en waarden voor de argumenten invoeren.
            Als je een wijziging aanbrengt in de broncode van een klasse en deze opnieuw laat compileren, verdwijnen
            alle objecten die je hebt gemaakt van de object bench. Je moet ze dan weer opnieuw maken en dat is op den
            duur vervelend werk.</p>
        <p>Heel handig is dat je in BlueJ objecten kunt bewaren om ze een volgende keer vrij eenvoudig tevoorschijn
            te laten komen.</p>
        <p>Om objecten te kunnen bewaren moet je eerst een wijziging aanbrengen in de instellingen van BlueJ</p>
        <h4>Windows</h4>
        <ul>
            <li>Klik in de menubalk op <code>Tools</code> &#8594; <code>Preferences</code></li>
            <li>Klik op tabblad <code>Miscellanious</code></li>
            <li>Zet een vinkje bij <code>Show unit testing tools</code></li>
        </ul>
        <h4>Mac</h4>
        <ul>
            <li>Klik in de menubalk op <code>BlueJ</code> &#8594; <code>Voorkeuren...</code></li>
            <li>Klik op tabblad <code>Interface</code></li>
            <li>Zet een vinkje bij <code>Show unit testing tools</code></li>
        </ul>
        <p>Merk op dat er in het BlueJ venster een paar (nog niet werkende) knoppen zijn bijgekomen.</p>

        <ul>
            <li>klik met de rechtermuisknop op de klasse Team en kies <code>Create Test Class</code></li>
        </ul>
        <p>Achter de klasse Team verschijnt nu een tweede - groen gekleurde - klasse met de naam TeamTest (of TestTeam).
            Je kunt nu gemaakte objecten bewaren door met je rechter muisknop op de TeamTest klasse te klikken en
            <code>Object Bench to Test Fixture</code> te kiezen. De objecten verdwijnen van de Object-bench. De
            objecten zijn nu opgeslagen in de TeamTest klasse. Je kunt ze weer oproepen met de optie <code>Test
                Fixture to Object Bench</code> te kiezen.</p>
        <h3>Strings aan elkaar plakken</h3>
        <p>Een String is een rij tekens (char). Meestal maak je een String met een regel tekst tussen
            aanhalingstekens.</p>
        <pre class="code">
String tekst = &quot;Dit is een String!&quot;;
</pre>
        <p>Twee strings kun je aan elkaar plakken met behulp van het plus-teken.</p>

        <pre class="code">
String tekst = &quot;abc&quot; + &quot;def&quot;
</pre>
        <p>Het resultaat is &quot;abcdef&quot;</p>
        <p>Het aan elkaar plakken van strings heet <em>concateneren</em>. Hoewel het type int (voor gehele getallen)
            en het type String heel verschillend zijn, kun je met het plus-teken ook een getal achter een string
            plakken.</p>

        <pre class="code">
String tekst = &quot;Leeftijd is &quot; + 17;
</pre>
        <p>De tekens (cijfers) worden automatisch naar een String geconverteerd. Als je alleen een getal naar een
            string wilt converteren kun je een zogenaamde lege string gebruiken.</p>
        <pre class="code">
String tekst = &quot;&quot; + 17;
</pre>
        <h3>Een methode toString() voor de klasse Leerling</h3>
        <p>Iedere klasse in java is een afstammeling van de klasse Object en erft de methoden van deze klasse.
            E&eacute;n van die methoden is toString() die een string representatie van de klasse maakt. Klik met de
            rechtse muisknop op een Leerling-object en kies <code>inherited from object</code> &#8594; <code>String
                toString()</code>. Dit levert bijvoorbeeld iets op als &quot;Leerling@644d9e55&quot;. Vaak is het
            handig om deze methode in je klasse te &quot;overriden&quot;. Je vervangt de methode als het ware zodat
            je een String krijgt die iets zinnigs zegt.</p>
        <ul>
            <li>Maak in de klasse Leerling een methode toString() bijvoorbeeld zoals hieronder</li>
        </ul>
        <pre class="code">
public void toString() {
    return naam + &quot;, &quot; + klas;
}</pre>
        <ul>
            <li>Je kunt nu de methode print() van de klasse team als volgt veranderen:</li>
        </ul>

        <pre class="code">
public void print() {
    System.out.println( "Indeling van dit team:" );
    System.out.println( <span class="codeplus">lid1</span> );
    System.out.println( <span class="codeplus">lid2</span> );
    System.out.println("-----------------------------");
}
</pre>
        <ul>
            <li>Test de methode. Je ziet dat de methode toString() die je net hebt gemaakt is gebruikt zonder
                dat je die methode expliciet hebt aangeroepen op het object.
            </li>
        </ul>
        <p>Omdat de methode println() een string als argument verwacht roept java automatisch de methode toString()
            op het object aan. Door de methode te overriden bepaal jij wat het resultaat van deze methode is.</p>

        <div class="opdrachten">
            <h2>Vragen</h2>
            <ol>
                <li>Wat is een associatie?</li>
                <li>Wat is een referentie?</li>
                <li>Welk teken gebruik je voor de concatenatie van strings?</li>
                <li>Hoe ziet de uitvoer van het volgende stukje broncode er precies uit?<br><br>
                    <pre class="code">
String naam1 = &quot;Ana&quot;;
String naam2 = &quot;Bea&quot;;
int leeftijd = 18;

System.out.print( naam1 + &quot; is &quot; );
System.out.println( leeftijd );
System.out.println( naam2 + &quot; is &quot; + (leeftijd + 10) );
				</pre>
                    Wat gebeurt er als je in de laatste regel de haakjes weghaalt? Kun je verklaren wat er gebeurt?

                </li>
                <li>Wat is een test-fixture? Waarom kan dat handig zijn?</li>
            </ol>
        </div>
        <div class="opdrachten">
            <h2>Opgave 5.1</h2>
            <p>Breid de methode toString() van de klasse Leerling uit zodat ook het geslacht en het
                leerlingnummer in de afgeleverde string komen.
            </p>
        </div>
        <div class="opdrachten">
            <h2>Opgave 5.2</h2>
            <img src="/AO/BlueJ2/images/klassendiagram_datum.png">
            <p>In bovenstaand figuur zie je het klassendiagram van Datum. De drie attributen dag, maand en jaar
                spreken voor zich. Via de constructor kun je de attributen een waarde geven. Verder heeft de klasse
                getters en setters om de waarde van de attributen op te vragen en te wijzigen.<br>
                Schrijf de broncode voor de klasse.<br>
                Test de klasse in BlueJ.</p>
        </div>
        <div class="opdrachten">
            <h2>Opgave 5.3</h2>
            <p>Voorzie de klasse Leerling van een attribuut geboortedatum. De geboortedatum is een instantie van de
                klasse Datum uit de vorige opgave. Wijzig de constructor van Leerling zodanig dat je ook een
                geboortedatum moet invoeren. Test de klasse in BlueJ.</p>
        </div>
        <div class="opdrachten">
            <h2>Opgave 5.4</h2>
            <p>Voorzie de klasse Team van een attribuut waarin je de naam van het team kunt opslaan. Wijzig de
                constructor overeenkomstig. Zorg dat de methode print() ook de naam van het team toont. Test de klasse
                in BlueJ.</p>
        </div>
        <div class="opdrachten">
            <h2>Opgave 5.5</h2>
            <p>Voeg aan het projectNaam Sportweek een klasse Wedstrijd toe. De klasse bevat de volgende attributen: twee
            teams (die tegen elkaar spelen), een datum (waarop de wedstrijd wordt gespeeld) en de uitslag. Bedenk zelf
            op welke manier je de uitslag wilt opslaan.</p>
            <img src="/AO/BlueJ2/images/wedstrijddiagram.png">
            <p>Schrijf de broncode van de klasse Wedstrijd en test het geheel in BlueJ.</p>
        </div>


    </div>
</div>
<%@ include file="/AO/BlueJ2/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#h5").addClass("selected");
    })
</script>
</html>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

    <%@ include file="/AO/BlueJ2/includes/zijmenu.jsp" %>


    <div class="col-md-9">
        <h2>De Schildpad</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
                je de volgende begrippen kent en kunt gebruiken:</p>
            <ul>

                <li>argumenten of parameters</li>
                <li>retour- of terugkeerwaarde &amp; void</li>
                <li>public</li>
                <li>body van klasse/methode</li>
                <li>statement</li>
                <li>compile</li>
                <li>overloading</li>
                <li>javadoc</li>

            </ul>

        </div>

        <h3>Inleiding</h3>
        <p>In dit hoofdstuk maak je kennis met een schildpad die je over het scherm kunt laten lopen. Je kunt hem
            besturen en hem ondertussen een tekening laten maken. Het besturen gebeurt door methodes van de schildpad
            aan te roepen. Via de schildpad maak je kennis met een aantal belangrijke begrippen zoals argument en
            retourwaarde van een methode, en leer je hoe je aan de zogeheten broncode van een klasse zelf een methode
            kunt toevoegen.<br>
            Het tekenen met een schildpad is niet nieuw: het idee is rond 1967 ontwikkeld en later bekend geworden als
            onderdeel van een computertaal met de naam <a
                    href="https://en.wikipedia.org/wiki/Logo_(programming_language)"
                    target="_blank">Logo</a> . In de voorbeelden vind je een aan Java en BlueJ aangepaste
            versie van de schildpad.</p>

        <h3>De interface van de schildpad</h3>
        <p>Om met de schildpad te kunnen tekenen moet je eerst een instantie van de klasse Schildpad maken.</p>
        <ul>
            <li>Open in BlueJ uit de map voorbeelden het project schildpad.</li>
            <li>Maak een object van Schildpad door met je rechtse muisknop op de klasse te klikken en
                <code>new Schildpad()</code> te kiezen
            </li>
            <li>Bekijk de beschikbare methodes van het schildpad-object door er met de rechtse muisknop op te
                klikken. Er verschijnt een lange lijst met methodes die je kunt gebruiken. Deze lijst met openbare
                (public) methodes heet ook wel de <em>interface</em> van het schilpad-object.
            </li>
        </ul>
        <img src="/AO/BlueJ2/images/3_1schildpad_interface.png">

        <h3>Methoden van de schildpad</h3>
        <p>Via zijn methoden kun je de schildpad opdrachten geven. Klik op de methode <code>toon()</code>. Er opent
            een venster met daarin de schildpad.</p>
        <img src="/AO/BlueJ2/images/3-2venster_schildpad.png">

        <p>De schildpad kan tekenen maar alleen als zijn pen naar beneden is. Controleer eerst of dat het geval is door
            de methode <code>isPenNeer()</code> aan te roepen. In het venster Method Result zie je het resultaat van
            deze methode: false. Dat betekent dat de pen niet omlaag is. De pen kun je omlaag doen met de methode
            <code>penNeer()</code>. Roep deze methode aan.</p>

        <h3>Methoden met een argument</h3>
        <p>Met de methode <code>vooruit()</code> kun je de schildpad laten bewegen. Als de pen neer is tekent hij een
            lijn terwijl hij beweegt.</p>
        <p>Open de interface van de schildpad en klik op de methode <code>vooruit(double x)</code>. Deze methode
            heeft een <em>argument</em> nodig van het type <em>double</em>. Er verschijnt een venster met de naam
            Method Call (methode-aanroep). Er staat een verklaring bij wat de methode doet: de schildpad loopt een
            aantal
            pixels vooruit. De waarde van het aantal pixels moet je in het vakje invullen, bijvoorbeeld 80. De schildpad
            zal dan 80 pixels vooruit gaan.</p>
        <p>De waarde die je invult bij het aanroepen van de methode heet het <em>argument</em> van de methode. De
            schildpad gaat het aantal pixels dat je hebt ingevuld vooruit en tekent een lijn op het scherm als de pen
            neer is.</p>
        <p>De methoden <code>draaiRechts(double hoek)</code> en <code>draaiLinks(double hoek)</code> zorgen er voor dat
            je de schildpad kunt laten draaien. Als argument moet je een waarde opgeven: de draaihoek in graden.</p>

        <p>Open de interface van de schildpad en klik op de methode <code>draaiRechts()</code>. Voer als argument de
            waarde 90 in. De schildpad draait 90 graden. Laat de schildpad 150 pixels vooruit lopen.</p>
        <img src="/AO/BlueJ2/images/3_3hoek.png">

        <h3>Methode met een String-argument</h3>
        <p>De kleur van de schildpad en daarmee ook de kleur waarmee hij tekent, kun je veranderen met de methode
            <code>setKleur()</code>. Als je deze methode aanroept moet je de naam van de kleur opgeven die je wilt
            gebruiken.
            Je kunt de volgende kleuren gebruiken: &quot;blauw&quot;, &quot;geel&quot;, &quot;groen&quot;, &quot;rood&quot;,
            &quot;zwart&quot;. Dergelijke namen en tekst in het algemeen zijn van het type <code>String</code>. Een
            String moet je in Java tussen aanhalingstekens zetten.</p>
        <p>Maak de schildpad rood. Kies uit de interface van de schildpad de methode <code>setKleur()</code> en
            voer als argument in &quot;rood&quot;. Denk om de aanhalingstekens! Als je de schildpad nu laat lopen,
            tekent
            hij met rood.</p>

        <h3>Methoden met een retourwaarde</h3>
        <p>Methoden als <code>draaiRechts()</code> en <code>vooruit()</code> laten de schildpad iets doen. Andere
            methoden zoals <code>getKleur()</code>, <code>getRichting()</code>, <code>getX()</code> en
            <code>getY()</code>
            leveren informatie over de schildpad af. De waarde die een methode aflevert heet de <em>retourwaarde</em>
            van
            die methode. Door <code>getKleur()</code> aan te roepen krijg je als retourwaarde een String die de naam van
            de
            kleur van de schildpad aangeeft. Met <code>getRichting()</code> krijg je als retourwaarde een getal van het
            type int dat de richting aangeeft waarin de schildpad kijkt. Mogelijke richtingen:</p>
        <ul>
            <li>0 graden: Oost</li>
            <li>90 graden: Noord</li>
            <li>180 graden: West</li>
            <li>270 graden: Zuid</li>
        </ul>
        <p>Met <code>getX()</code> en <code>getY()</code> krijg je de x- en y-co&ouml;rdinaten van de huidige positie
            van de schildpad als getal van het type int. Daarbij geldt dat de oorsprong (0, 0) in de linkerbovenhoek van
            het scherm zit en dat de y-as van boven naar beneden loopt. De retourwaarde van een methode krijg je in
            BlueJ in een apart scherm te zien.
        </p>
        <ul>
            <li>roep de methode <code>getKleur()</code> aan</li>
            <li>roep de methode <code>getRichting()</code> aan</li>
            <li>roep de methode <code>getX()</code> en <code>getY()</code> aan</li>
        </ul>

        <h3>Broncode van de klasse Schildpad</h3>
        <p>Door op de java klasse te dubbelklikken open je de broncode. In de broncode vind je onder meer
            de methoden die we hiervoor hebben behandeld. De broncode is geschreven in Java. Met een beetje moeite
            kun je de broncode lezen, begrijpen en er iets aan toevoegen.</p>
        <div class="opdrachten">
            <h2>Opdracht: Een nieuwe methode maken</h2>
            <p>Maak een nieuwe methode tekenVierkant() die een vierkant tekent. Compileer de klasse en test de
                methode.</p>
        </div>

        <h3>De schildpad laten slapen</h3>
        <p>Je kunt de schildpad tussen iedere stap even laten pauzeren met de methode slaap(). Tussen de haakjes geef
            je het aantal milliseconden dat gepauzeerd moet worden. Laat de schildpad tussen de opdrachten in de methode
            tekenVierkant() even pauzeren.</p>

        <div class="opdrachten">
            <h2>Opdracht: Een methode met argument maken</h2>
            <p>De methode tekenVierkant() kan maar &eacute;&eacute;n soort vierkant maken. Maak een nieuwe methode
                tekenVierkant(int zijde) die een argument accepteert die de grootte van de zijde van de vierkant
                bepaalt. </p>
        </div>

        <h3>Overloading</h3>
        <p>Je hebt nu twee methodes die dezelfde naam hebben. Ze verschillen van elkaar in de argumenten die ze
            accepteren. Bij het
            aanroepen van de methode bepaalt Java aan de hand van de argumenten welke methode moet worden geselecteerd.
            Dit verschijnsel heet <em>Overloading</em>.</p>

        <h3>Documentatie</h3>
        <p>Als je broncode schrijft is het verstandig om daarbij ook meteen <em>documentatie</em> te maken. In de
            documentatie van een klasse geef je tenminste aan waar de klasse toe dient, hoe de methoden gebruikt kunnen
            worden, wat voor argumenten je mag invullen en welke retourwaarde een methode eventueel heeft. </p>
        <p>Documentatie schrijf je in de broncode zelf. Als je de broncode van de Schildpad opent zie je daar een
            voorbeeld van. De tekst in het groen is zogenaamd javadoc commentaar en kenmerkt zich doordat het begint met
            /**.</p>

        <pre class="code">
<span class="comment">/**
 * Constructor voor een schildpad;
 * maakt een schildpad op positie (200, 200) die naar boven kijkt.
 */</span>
 public Schildpad() {
    xEcht = xDefault;
    yEcht = yDefault;
    richting = richtingDefault;
    verberg = false;
    penNeer = false;
    tekening = new ArrayList< Lijn >();
    kleur = &quot;groen&quot;;
 }</pre>

        <p>Als je in BleuJ de constructor aanroept om een nieuw object te maken zie je dat dit commentaar letterlijk
            wordt weergegeven in het Create Object scherm.</p>

        <h3>Javadoc</h3>
        <p><em>Javadoc</em> is een programma dat bij de JDK geleverd wordt en waarmee je een
            <a href="/AO/BlueJ2/doc/index.html">fraai ogend overzicht</a>
            kunt maken van alle documentatie die in de broncode van een klasse staat. In BlueJ kun je de documentatie
            laten genereren via het <code>Tools</code> menu.</p>
        <p>Tekst die je voor javadoc maakt bestaat in het algemeen uit twee gedeelten: eerst een beschrijving en
            daarna een gedeelte met zogeheten <em>block tags</em> die met het @-teken beginnen.</p>

        <pre class="code">
  <span class="comment">/**
   * Klasse voor een virtuele schildpad die kan tekenen,
   * gebaseerd op de Logo-schildpad van Seymour Papert.
   * <span class="codeplus">@version 3.0</span>
   * <span class="codeplus">@author Gertjan Laan</span>
   */</span></pre>

        <p>Bij constructors en methodes met &eacute;&eacute;n of meer parameters (argumenten) gebruik je de block-tag
            @param met daarna de naam van de parameter en de betekenis ervan.</p>

        <pre class="code">
<span class="comment">/**
 * De schildpad loopt een aantal pixels vooruit.
 * <span class="codeplus">@param x</span>  het aantal pixels dat de schildpad vooruit loopt; mag ook negatief zijn
 */</span></pre>

        <p>Bij methoden met een retourwaarde gebruik je de block-tag @return om te beschrijven wat de methode
            teruggeeft.</p>

        <pre class="code">
<span class="comment">/**
 * Levert de waarde true als de pen van de schilpad naar beneden is
 * zodat hij kan tekenen.
 * Levert false als dat niet zo is.
 * <span class="codeplus">@return</span> de waarde van het attribuut penNeer
 */</span></pre>

        <div class="opdrachten">
            <h2>Vragen</h2>
            <ol>
                <li>Wat verstaan we onder de interface van een object?</li>
                <li>Wat betekent &quot;een methode aanroepen&quot;?</li>
                <li>Wat is de retourwaarde van een methode?</li>
                <li>Hoe kun je in BlueJ de broncode van een klasse zien?</li>
                <li>Wat betekent compileren?</li>
                <li>Waarom is compileren noodzakelijk?</li>
                <li>Wat is overloading?</li>
                <li>Geef bij elk van onderstaande uitdrukkingen aan of het een String, een int of geen van beide is.
                    <ul>
                        <li>&quot;lichtblauw&quot;</li>
                        <li>123</li>
                        <li>&quot;456&quot;</li>
                        <li>d66</li>
                        <li>&quot;hotmail&quot;</li>
                        <li>geel</li>
                    </ul>
                </li>
            </ol>
        </div>

        <div class="opdrachten">
            <h2>Opgave 3.1</h2>
            Open het project Schildpad en maak van de klasse Schildpad een object.<br>
            Bedenk of vind uit hoe je de schildpad een gelijkzijdige driehoek kunt laten tekenen.<br>
            Noteer de opdrachten die je de schildpad hebt gegeven om tot zo&#39;n driehoek te komen.
        </div>

        <div class="opdrachten">
            <h2>Opgave 3.2</h2>
            <p>Schrijf de broncode voor een methode tekenDriehoek() die een gelijkzijdige driehoek met zijde 100
                tekent en voeg de code toe aan de klasse Schildpad.<br>
                Laat de klasse compileren en maak een object.<br>
                Test de methode door de schildpad een driehoek te laten tekenen.
            </p>
        </div>

        <div class="opdrachten">
            <h2>Opgave 3.3</h2>
            <p>Voeg aan de klasse Schildpad een tweede methode tekenDriehoek(int zijde) toe waarmee je gelijkzijdige
                driehoeken van verschillende groottes kunt tekenen.</p>
        </div>
        <div class="opdrachten">
            <h2>Opgave 3.4</h2>
            <p>Maak van de klasse Schildpad twee objecten. Laat de schildpadden op verschillende plaatsen verschillende
                gekleurde vierkanten tekenen.<br>
                Gebruik &eacute;&eacute;n van de methoden die je eerder hebt gemaakt.</p>
        </div>
        <div class="opdrachten">
            <h2>Opgave 3.5</h2>
            <p>Laat de schildpad een huisje tekenen. Maak een methode tekenHuis() waarbij je gebruik maakt van de
                methoden tekenVierkant() en tekenDriehoek()</p>
        </div>
        <div class="opdrachten">
            <h2>Opgave 3.6</h2>
            <p>Geef de klasse Schildpad een methode vierHuizen() waarvan in de body de volgende vier opdrachten staan
                die een huisje tekenen:</p>
            <ul>
                <li>tekenHuis(50);</li>
                <li>tekenHuis(70);</li>
                <li>tekenHuis(90);</li>
                <li>tekenHuis(110);</li>
            </ul>
            <p>Wat is het effect als je deze methode aanroept?</p>
        </div>
        <div class="opdrachten">
            <h2>Opgave 3.7</h2>
            <p>Geef de klasse Schildpad een methode tekenDorp() die een dorpje maakt met ten minste vier
                verschillend gekleurde, niet even grote, vrijstaande huizen. Zie voorbeeld.</p>
            <img class="imgfullwidth" src="/AO/BlueJ/images/tekendorp.jpg"
                 alt="resultaat dorp">
        </div>
        <div class="opdrachten">
            <h2>Opgave 3.8</h2>
            <p>Voorzie de methoden die je in de vorige opgaven gemaakt hebt van javadoc-commentaar. Laat de
            documentatie genereren.</p>

        </div>
    </div>


</div>
</div>
<%@ include file="/AO/BlueJ2/includes/bottom.html" %>
</html>
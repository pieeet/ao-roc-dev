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
        <code>setKleur()</code>. Als je deze methode aanroept moet je de naam van de kleur opgeven die je wilt gebruiken.
        Je kunt de volgende kleuren gebruiken: &quot;blauw&quot;, &quot;geel&quot;, &quot;groen&quot;, &quot;rood&quot;,
            &quot;zwart&quot;. Dergelijke namen en tekst in het algemeen zijn van het type <code>String</code>. Een
        String moet je in Java tussen aanhalingstekens zetten.</p>
        <p>Maak de schildpad rood. Kies uit de interface van de schildpad de methode <code>setKleur()</code> en
        voer als argument in &quot;rood&quot;. Denk om de aanhalingstekens! Als je de schildpad nu laat lopen, tekent
        hij met rood.</p>

        <h3>Methoden met een retourwaarde</h3>
        <p>Methoden als <code>draaiRechts()</code> en <code>vooruit()</code> laten de schildpad iets doen. Andere
        methoden zoals <code>getKleur()</code>, <code>getRichting()</code>, <code>getX()</code> en <code>getY()</code>
        leveren informatie over de schildpad af. De waarde die een methode aflevert heet de <em>retourwaarde</em> van
        die methode. Door <code>getKleur()</code> aan te roepen krijg je als retourwaarde een String die de naam van de
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




        <img class="imgfullwidth" src="/AO/BlueJ/images/tekendorp.jpg"
             alt="resultaat dorp">

    </div>
</div>
<%@ include file="/AO/BlueJ2/includes/bottom.html" %>
</html>
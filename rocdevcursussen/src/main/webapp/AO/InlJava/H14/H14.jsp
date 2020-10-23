<%@ page import="inleidingJava.DeelKaarten" %><%--suppress ALL --%>
<%--suppress JSUnresolvedFunction --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

    <%@ include file="/AO/InlJava/includes/zijmenu.jsp" %>


    <div class="col-md-9">
        <h2>H14 Multimedia</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">

            <h2>Leerdoelen</h2>
            <p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
                je:</p>
            <ul>
                <li>weet hoe je willekeurige (random) getallen kunt aanmaken</li>
                <li>weet hoe je afbeeldingen en geluid in je programma kunt
                    gebruiken
                </li>
            </ul>

        </div>


        <h4>Praktijk</h4>
        <img src="<c:url value="/AO/InlJava/H14/images/multimedia.png"/>">

        <h3>Willekeurige getallen</h3>
        <p>Met de random-functie kunnen we willekeurige getallen
            genereren, dat betekent dat telkens als de functie aangeroepen wordt
            er een willekeurig getal van 0.0 tot 1.0 wordt aangemaakt. Let op: De
            1.0 komt dus nooit voor.</p>
        <pre class="code">
<span class="comment">//Voorbeeld 14.1</span>

import java.awt.*;
import java.applet.*;

public class Random extends Applet {
	
    double r;
	
    public void init() {
        r = <span class="codeplus">Math.random();</span>		
    }

    public void paint(Graphics g) {
        g.drawString("" + r, 50, 60 );
    }
}
</pre>
        <p>
            <b>random()</b> is een statische functie uit de klasse <b>Math</b>.
            Vandaar de punt tussen <b>Math</b> en <b>random()</b>. Door de regel
            <b>r = Math.random();</b> wordt een getal gegenereerd en dat getal
            wordt in de variable <b>r</b> gezet. Omdat het gaat om een getal
            vanaf 0.0 tot 1.0 is r als <b>double</b> gedeclareerd.
        </p>
        <p>Veel stelt dit programma niet voor. Maar met deze functie
            kunnen we bijvoorbeeld het werpen van een dobbelsteen simuleren. Een
            dobbelsteen heeft echter hele waarden die lopen vanaf 1 tot en met 6.
            Het volgende programma laat zien hoe een dobbelsteen wordt
            gesimuleerd:</p>

        <pre class="code">
<span class="comment">//Voorbeeld 14.2</span>

import java.awt.*;
import java.applet.*;

public class Random extends Applet {
	
    double r;
    <span class="codeplus">int worp;</span>
	
    public void init() {
        r = <span class="codeplus">Math.random();</span>
        <span class="codeplus">worp = (int)(r * 6 + 1);</span>		
    }

    public void paint(Graphics g) {
        g.drawString("" + worp, 50, 60 );
    }
}
</pre>

        <p>Er zijn twee regels bijgekomen. De eerste is de declaratie van
            de integer worp. De tweede regel die erbij is gekomen, is
            interessanter:</p>
        <p>
            <b>worp = (int) (r * 6 + 1);</b>
        </p>
        <p>r heeft de willekeurige waarde vanaf 0.0 tot 1.0. Stel de
            laagste waarde 0.0 staat in r. De laagste waarde van een worp met een
            dobbelsteen is altijd 1, de hoogste 6. Dus moet r met 6
            vermenigvuldigd worden om bij maximaal 5.4 uit te komen. Omdat de
            laagste waarde 1 moet zijn, moet er 1 bij opgeteld worden. Dan wordt
            de minimale waarde 1.0, als in r 0.0 staat en de hoogste waarde 6.4
            als er in r 0.9 staat. Dat laatste is te hoog en de getallen zijn nog
            steeds geen gehele getallen. Vandaar de conversie van een double naar
            int. Dat betekent dat een van een 1.0 een 1 wordt gemaakt en van 6.4
            een 6. Door de conversie van een double naar een int wordt alles wat
            achter de punt staat afgekapt. De laagste waarde is dus nu 1 en de
            hoogste waarde een 6 en alle waarden zijn gehele getallen.</p>
        <p>
            De algemene formule waarmee een reeks binnen een begin- en een
            eindwaarde kan worden berekend, is:<br> <em>RandomGetal *
            MaximumGetal + MinimumGetal</em>
        </p>

        <h3>Afbeeldingen</h3>
        <p>In Java kun je afbeeldingen van schijf opvragen en deze in het
            venster van je applet laten zien. De afbeelding moet dan wel in gif-,
            jpeg- of jpg-formaat zijn opgeslagen. Ook bewegende gif-afbeeldingen
            worden getoond. Is de afbeelding niet in &eacute;&eacute;n van de
            drie formaten opgeslagen, dan kun je heel eenvoudig de afbeelding met
            een tekenprogramma zoals Paint of Paintshop converteren naar het
            juiste formaat.</p>
        <p>De klasse Image maakt het mogelijk in Java te werken met
            afbeeldingen. Allereerst moet je de afbeelding in je project plaatsen. Ga als
            volgt te werk:</p>
        <p>Maak in je src map een package voor je afbeeldingen. Je zou deze map bijvoorbeeld
            &quot;resources&quot; kunnen noemen. Kopieer de afbeelding die je wilt gebruiken
            naar deze map.</p>


        <p>Er zijn twee stappen nodig om een afbeelding in
            het venster van de applet te tonen. De eerste is de afbeelding van
            schijf inlezen en de tweede is de afbeelding in het venster van de
            applet te tonen. Het programma hieronder laat dit zien.</p>
        <pre class="code">
<span class="comment">//Voorbeeld 14.3</span>

import java.awt.*;
import java.applet.*;
<span class="codeplus">import java.net.URL;</span>

public class Afbeelding extends Applet {
	
    private <span class="codeplus">Image</span> afbeelding;
    private <span class="codeplus">URL</span> pad;
	
    public void init() {
        <span class="comment">/* uitgangspunt is dat de package &quot;resources&quot;
                in src map zit. De naam Afbeelding verwijst naar de naam van de klasse */</span>
        pad = <span class="codeplus">Afbeelding.class.getResource(&quot;/resources/&quot;)</span>
        afbeelding = <span class="codeplus">getImage(pad, &quot;Afbeelding.gif&quot;);</span>		
    }

    public void paint(Graphics g) {
        g.drawString(<span class="codeplus">pad.toString()</span>, 20, 10 );
        g.<span class="codeplus">drawImage(afbeelding, 20, 20, 400, 300, this);</span>
    }
}
</pre>
        <p>
            Allereerst het inlezen: daarvoor moet eerst de variabele afbeelding
            van de klasse <b>Image</b> gedeclareerd worden. Hierin wordt de
            afbeelding geplaatst als deze is ingelezen. Verder moet bekend zijn
            waar de afbeelding op schijf gevonden wordt: Hiervoor wordt de
            variabele pad gedeclareerd als <b>URL</b>: Unified Resource Locator.
            Eigenlijk is dit de manier waarop bestanden op internet gevonden
            kunnen worden. Ook kan deze gebruikt worden voor bestanden die op
            schijf staan. Om URL te kunnen gebruiken moet <b>java.net.*</b>
            ge&iuml;mporteerd worden. In de methode init wordt allereerst de
            variabele <b>pad</b> gevuld met de volledige verwijzing naar het pad
            waarvanuit het HTML-bestand is gestart die de applet heeft gestart.
            Dit gebeurt door de methode <b>getDocumentBase()</b>. Een andere
            mogelijke methode is <b>getCodeBase()</b> die de verwijzing doorgeeft
            naar het pad van het class-bestand. Als in pad staat waar het bestand
            zich bevindt, kan de afbeelding ingelezen worden en in afbeelding
            geplaatst worden. In de methode <b>paint</b> wordt het pad met de
            methode <b>toString</b> van de klasse pad in het venster getoond en
            wordt daaronder met de methode <b>drawImage</b> van de klasse g de
            afbeelding in het venster geplaatst. De werking van deze methode
            lijkt op die van het tekenen van rechthoeken. De eerste twee
            parameters geven de linkerbovenhoek van de afbeelding aan en de
            volgende twee de breedte en de hoogte van de afbeelding. Omdat
            drawImage() in de klasse Applet is ge&iuml;mplementeerd, kan de
            laatste parameter met <b>this</b> naar de applet verwijzen.
        </p>

        <h3>Geluid</h3>

        <p>Ook geluid is in Java niet moeilijk te realiseren.</p>

        <div><audio controls>
            <source src="/AO/InlJava/H14/images/scream1.wav" type="audio/wav">
            Your browser does not support the audio element.
        </audio><br>
        <a href="/AO/InlJava/H14/images/scream1.wav" download="scream.wav">Download scream.wav</a><br>
        <audio controls>
            <source src="/AO/InlJava/H14/images/applaus.wav" type="audio/wav">
            Your browser does not support the audio element.
        </audio><br>
        <a href="/AO/InlJava/H14/images/applaus.wav" download="applaus.wav">Download applaus.wav</a>
        </div><br>
        <p>Het lijkt
            heel veel op de wijze waarop afbeeldingen ingelezen en getoond
            worden. Zie het volgende voorbeeld:</p>
        <pre class="code">
<span class="comment">//Voorbeeld 14.4</span>

import java.awt.*;
import java.applet.*;
import java.net.URL;

public class LoadAndPlay extends Applet {

    private URL pad;
    private <span class="codeplus">AudioClip</span> sound;
	
    public void init() {

        <span class="comment">/* uitgangspunt is dat de package &quot;resources&quot;
                in de src map zit */</span>
        pad = <span class="codeplus">LoadAndPlay.class.getResource(&quot;/resources/&quot;)</span>
        sound = <span class="codeplus">getAudioClip(pad, &quot;scream.wav&quot;);</span>
        		
    }

    public void paint(Graphics g) {
        <span class="codeplus">sound.play();</span>
    }
}
</pre>

        <p>
            Allereerst wordt er een instantie van de klasse <b>AudioClip</b>
            gedeclareerd. De klasse AudioClip kan verschillende soorten
            geluidsbestanden aan, waarvan midi en wav de bekendste zijn. Aan <b>sound</b>
            wordt in dit geval een wav-bestand gekoppeld in de functie <b>init()</b>.
            Dat gebeurt op dezelfde wijze als een afbeelding wordt ingelezen.
            Vervolgens wordt in de functie <b>paint()</b> het bestand afgespeeld.
        </p>

        <div class="opdrachten">


            <h2>Opdracht 14.1</h2>
            <p>
                Schrijf een applet waarin het delen van &eacute;&eacute;n kaart
                wordt gesimuleerd. Er wordt willekeurig een kleur en binnen die
                kleur een willekeurige kaart gekozen. Maak een array voor de kleuren
                en &eacute;&eacute;n voor de kaarten binnen de kleuren. Laat de
                keuze als volgt in het venster van de applet zien, bijvoorbeeld: <em>Ruiten
                aas</em>.
            </p>
            <button type="button" id="deelKaartButton" class="btn btn-danger" value="Deel Kaart">Deel kaart</button>
            <br><br>
            <p id="deel-kaart"></p>


            <h2>Opdracht 14.2</h2>
            <p>Schrijf een applet waarin alle kaarten worden verdeeld over
                vier spelers. Maak voor iedere speler een array van 13. Let op: een
                kaart kan maar &eacute;&eacute;n keer gedeeld worden. Laat na het
                delen het resultaat in het venster van de applet zien. Als de
                kaarten verdeeld zijn, laat de computer dat door een geluid blijken.</p>
            <!-- <p>Probeer het eerst zelf. Kom je er niet uit dan kun je <a href="/AO/inleiding-java/deel-kaarten">hier</a> hulp
                        bij de uitwerking vinden.</p> -->
            <p>Met de volgende methode kun je een random kaart uit je deck halen en deze kaart uit het deck verwijderen.
            Uitgangspunt is dat je een string-array genaamd &quot;deck&quot; met 52 kaarten hebt.</p>

            <pre class="code">
private <span class="codeplus">String</span> deelKaart() {
    int random = new Random().nextInt(deck.length);
    String kaart = deck[random];

    <span class="comment">//vervang de inhoud van deck met een nieuwe lijst</span>
    <span class="comment">//het nieuwe deck is 1 kaart kleiner dan het oude deck</span>
    String[] hulpLijst = new String[<span class="codeplus">deck.length - 1</span>];
    <span class="comment">//om het nieuwe deck te vullen hebben we een index nodig</span>
    int hulpindex = 0;
    <span class="comment">//kopieer alle kaarten naar hulplijst behalve de kaart die net gedeeld is</span>
    for (int i = 0; i &lt; deck.length; i++) {
        if (<span class="codeplus">i != random</span>) {
            hulpLijst[hulpindex] = deck[i];
            hulpindex++;
        }
    }
    <span class="comment">//vervang nu deck met de nieuwe lijst</span>
    deck = hulpLijst;
    <span class="comment">//de methode geeft de random kaart terug</span>
    <span class="codeplus">return kaart</span>;
}
</pre>


            <button type="button" id="deelKaartenButton" class="btn btn-danger" value="Deel Kaarten">Deel kaarten
            </button>

            <div id="kaarten-delen"></div>


            <h2>Praktijkopdracht</h2>
            <p>Maak een spel waarbij een menselijke speler het tegen de
                computer opneemt. Er zijn 23 stenen (lucifers of knopen of iets
                anders mag ook). De bedoeling van het spel is dat de degene die de
                laatste steen wegneemt, verliest. Er mogen in &eacute;&eacute;n
                beurt 1, 2 of 3 stenen weggenomen worden en er moet altijd
                &eacute;&eacute;n of meerdere stenen weggenomen worden.</p>
            <p>De computer vraagt eerst om menselijke invoer. De invoer wordt
                gecontroleerd (1, 2 of 3) en daarna vermindert de computer het
                aantal stenen. Vervolgens bepaalt de computer zijn eigen zet, deelt
                die aan de speler mee, vermindert het aantal stenen met zijn zet en
                vermeldt het aantal stenen. Dan is de speler weer aan de beurt
                enzovoorts totdat het aantal stenen nul is. Degene die de laatste
                steen heeft weggehaald, heeft verloren.</p>
            <p>
                Om te bepalen welke strategie de computer moet volgen, beginnen we
                aan het einde van het spel. Aan het einde moet de computer ervoor
                zorgen dat er nog maar &eacute;&eacute;n steen over is. Verder moet
                hij ervoor zorgen dat de speler er nooit &eacute;&eacute;n kan
                overlaten, maar altijd minstens 2. Dat betekent dat de computer er
                bij de voorlaatste zet 5 moet overhouden. De speler kan er dan
                altijd 1, 2 of 3 wegnemen, daarna kan de computer ervoor zorgen dat
                er nog &eacute;&eacute;n steen overblijft. Die moet de speler dan
                nemen, waardoor de computer wint. De speler mag dus nooit 5 stenen
                kunnen overlaten, maar minstens 6. Dat kan als er nog 9 stenen
                overblijven. Als we zo doorredeneren, komen we tot de volgende
                getallen: 1, 5, 9, 13, 17, 21. Op de eerste na is dat dus een <em>veelvoud
                van 4 + 1</em>.
            </p>
            <h3>Voorbeeld uitwerking</h3>


            <div id="spel_result">
                <button type="button" class="btn btn-danger" id="start_spel_button">Start
                    spel
                </button>
            </div>
        </div>
    </div>
</div>
<%@ include file="/AO/InlJava/includes/bottom.html" %>
<%--suppress JSUnresolvedFunction --%>
<script>
    $(document).ready(
            function () {
                $(document).on('click', 'button#start_spel_button',
                        function () {
                            nieuwSpel();
                        });
                $(document).on('click', '#speel_knop', function () {
                    speel();
                });
                $(document).on(
                        'keydown',
                        '#invoer_spel',
                        function (e) {
                            var code = e.which; // recommended to use e.which, it's normalized across browsers
                            if (code == 13)
                                e.preventDefault();
                            if (code == 32 || code == 13
                                    || code == 188 || code == 186) {
                                speel();
                            }

                        });

                function speel() {
                    var aantal_verminderen = $("#invoer_spel")
                            .val();
                    var aantal_lucifers = $("#aantal_lucifers")
                            .val();

                    $.get("/eindspel?aantal_lucifers="
                            + aantal_lucifers
                            + "&aantal_verminderen="
                            + aantal_verminderen, function (responseText) {
                        $('#spel_result').html(responseText);
                    });
                    setTimeout(function () {
                        $('#invoer_spel').focus()
                    }, 500);
                }

                $(document).on('click', '#nieuw_spel_knop',
                        function () {
                            nieuwSpel();
                        });

                function nieuwSpel() {
                    $.get("/eindspel?nieuw_spel=x", function (responseText) {
                        $('#spel_result').html(responseText);
                    });
                }


                $("li#ij-h14").addClass("selected");

                $(document).on('click', '#deelKaartenButton', function () {
                    $.get("/deelKaarten?alle-kaarten", function (resp) {
                        $("#kaarten-delen").html(resp);
                    });
                });

                $(document).on('click', '#deelKaartButton', function () {
                    $.get("/deelKaarten?enkele-kaart", function (resp) {
                        $("#deel-kaart").text(resp);
                    });
                });


            });

</script>
</html>
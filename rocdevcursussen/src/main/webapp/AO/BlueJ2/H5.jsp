<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

    <%@ include file="/AO/BlueJ2/includes/zijmenu.jsp" %>


    <div class="col-md-9">
        <h2>Collecties</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
                je:</p>
            <ul>
                <li>weet hoe je een <em>ArrayList</em> maakt en gebruikt
                </li>
                <li>de <em>for-each</em> lus kent
                </li>
                <li>uitvoer kunt formatteren met <em>String.format()</em> en <em>printf()</em></li>
            </ul>
        </div>

        <h3>Inleiding</h3>
        <p>Een <em>collectie</em> is een object dat een willekeurig aantal andere objecten kan bevatten. Een
            sportteam bijvoorbeeld kan uit 2, 4, of 6 of 11 leerlingen bestaan. Je maakt dan een Team-object met een
            collectie van Leerling-objecten.</p>

        <h3>Herontwerp klasse Team</h3>
        <p>Om de klasse Team geschikt te maken voor het samenstellen van bijvoorbeeld een volleybalteam van zes
            personen of een voetbalelftal moet je een <em>collectie</em> gebruiken. Java kent verschillende soorten
            collecties: &eacute;&eacute;n die geschikt is voor deze toepassing is een
            <a href="https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html" target="_blank">ArrayList</a>.
            Als je een ArrayList wilt gaan gebruiken moet je erbij vertellen van welk type (klasse) de objecten zijn
            die je in de ArrayList wilt opbergen. In dit geval gaat het om objecten van het type Leerling.
        </p>
        <p>Een ArrayList waarin je Leerling-objecten kunt opbergen maak je zo:</p>

        <pre class="code">
ArrayList&lt;Leerling&gt; lijst;
</pre>
        <p>Dit is alleen nog maar een referentie (met de naam lijst) die nog nergens naar wijst. De eigenlijke
            ArrayList maak je zo:</p>
        <pre class="code">
lijst = new ArrayList&lt;&gt;();
</pre>
        <p>De ArrayList is nog leeg, je kunt er met de methode add() leerlingen aan toevoegen. Bijvoorbeeld zo:</p>
        <pre class="code">
lijst.add(new Leerling( &quot;Paulo&quot;, &quot;6C&quot;, &quot;jongen&quot;, 223);
</pre>

        <h3>Team met ArrayList</h3>
        <p>Een ArrayList kun je aan de klasse Team toevoegen. Zie broncode hieronder.</p>

        <pre class="code">
import java.util.*;

public class Team {

    ArrayList&lt;Leerling&gt; lijst;

    <span class="comment">// Constructor</span>
    public Team() {
        lijst = new ArrayList&lt;&gt;();
    }

    <span class="comment">// Methode om lid toe te voegen</span>
    public void voegLidToe(Leerling lid) {
        lijst.add(lid);
    }

    <span class="comment">// Methode om de lijst te printen</span>
    public void print() {
        System.out.println(&quot;Indeling van dit team:&quot;;
        for (Leerling lid: lijst) {
            System.out.println( lid.getNaam() );
        }
        System.out.println(&quot;----------------------&quot;;
    }
}
</pre>
        <p>De klasse ArrayList is een onderdeel van de zogeheten java-library. Deze bevat duizenden klassen en is
            onderverdeeld in verschillende <em>packages</em>, een soort mappen waarin een relatief klein aantal
            klassen zit. De klasse ArrayList is onderdeel van de package java.util. Om een ArrayList te kunnen
            gebruiken moet je boven in de broncode de volgende <em>import</em> opdracht opnemen.</p>
        <pre class="code">
import java.util.*
</pre>
        <p>Met het sterretje geef je aan dat je alle klassen uit de package java.util importeert. De compiler
            zoekt daaruit de klasse ArrayList.</p>

        <h3>De praktijk</h3>
        <p>Laten we eerst eens kijken hoe we de nieuwe klassse Team met een ArrayList werkt.</p>
        <ul>
            <li>Start in BlueJ ee nieuw project met de naam Sportweek2</li>
            <li>Maak een nieuwe klasse Team, gebruik de broncode uit de vorige paragraaf</li>
            <li>Sluit de editor</li>
        </ul>
        <p>Importeer de eerder gemakte klasse Leerling in dit project.</p>
        <ul>
            <li>Kies in de menubalk <code>Project</code> &#8594; <code>Import...</code></li>
            <li>Navigeer naar het project Leerling, selecteer dit en klik op Import.</li>
            <li>Laat alles compileren door op Compile te klikken</li>
        </ul>
        <p>Als de vertaling gelukt is, kun je een team gaan samenstellen.</p>
        <ul>
            <li>Maak een Team-object</li>
            <li>Maak een paar Leerling-objecten</li>
            <li>Voeg de Leerling-objecten aan het team toe met de methode voegLidToe() van het Team-object.</li>
            <li>Roep de methode print() aan om de samenstelling van het team te bekijken.</li>
        </ul>
        <p>Hoeveel leerlingen je ook toevoegt aan het team, ze komen allemaal op het scherm dankzij de <em>
            for-each</em> opdracht in de methode print().</p>
        <h3>De for-each-opdracht</h3>
        <p>In de methode print() staat de volgende opdracht om alle leerlingen van het team op het scherm te
            krijgen:</p>
        <pre class="code">
for (Leerling lid: lijst) {
    System.out.println( lid.getNaam() );
}</pre>
        <p>Dit is de zogeheten for-each opdracht die je als volgt kunt vertalen:</p>
        <p><em>Voor elke leerling (die de tijdelijke naam lid krijgt) die in de lijst zit, vraag de naam op van dat
            lid en print het resultaat.</em></p>

        <p>Het komt er dus op neer dat het for-each statement de leerlingen in de lijst &eacute;&eacute;n voor
            &eacute;&eacute;n langsloopt, voor elka leerling de methode getNaam() aanroept en het resultaat in het
            uitvoervenster zet.</p>
        <h3>Klassendiagram</h3>
        <p>In een klassendiagram gebruik je en sterretje om een willekeurig aantal aan te geven. Een simpel klassendiagram
            van een team dat uit een willekeurig aantal leerlingen bestaat ziet er als volgt uit:</p>
        <img src="/AO/BlueJ2/images/klassendiagram sportweek_2.png">
        <h3>Cijfers</h3>
        <p>Een andere toepassing waar een ArrayList goed van pas komt, is een cijferlijst - om bijvoorbeeld
        proefwerkcijfers in op te slaan, de cijfers op het scherm te zetten en het gemiddelde uit te rekenen. Van
        tevoren wet je niet altijd hoeveel cijfers er in de lijst zullen komen en daarom is een ArrayList heel
        geschikt.</p>
        <p>Het hoeft niet om gehele getallen te gaan, het kunnen gebroken getallen zijn zoals 8,5 of 6,2. Daarom
        nemen we voor de cijfers het type double. Het klassendiagram zie je hieronder.</p>
        <img src="/AO/BlueJ2/images/klassendiagram_cijferlijst.png">
        <ul>
            <li>Open in BlueJ uit de map voorbeelden het project Cijferlijst</li>
            <li>Maak een object van de klasse Cijferlijst</li>
            <li>Roep een aantal maal de methode voegtoe() aan en voer een cijfer in (gebruik eventueel een decimale
            punt in de cijfers.</li>
            <li>roep de methode gemiddelde() aan</li>
            <li>roep de methode print() aan</li>

        </ul>




    </div>
</div>
<%@ include file="/AO/BlueJ2/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#h6").addClass("selected");
    });
</script>
</html>
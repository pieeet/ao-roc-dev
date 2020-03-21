<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/PHP/includes/zijmenu.jsp" %>

    <div class="col-md-9">
        <h2>Installeren ontwikkelomgeving</h2>
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
                je:</p>
            <ul>
                <li>een werkende web server en een database server hebt ge&iuml;nstalleerd op jouw systeem</li>
                <li>een geschikte ontwikkelomgeving voor php hebt ge&iuml;nstalleerd.</li>
                <li>foutmeldingen kunt aan- en uitzetten in het php.ini file</li>
                <li>de termen client en server begrijpt</li>
            </ul>
        </div>

        <img src="/AO/PHP/img/web-server-transp.png">

        <p>We gaan in deze cursus werken met PHP. PHP is een scripting taal waarmee je vanaf een server webpagina's kunt
            maken . Een bezoeker van een website vraagt met behulp van een http(s) request een pagina van een web-server.
            De server ontvangt het verzoek en stuurt html terug naar de client.  In een .php bestand zie je vaak html en
            php code door elkaar gebruikt worden.De PHP code zelf is onzichtbaar voor
            de gebruiker, alleen de output van PHP in de vorm van tekst of html wordt terug gestuurd.</p>

        <div class="opdrachten">
            <h2>Installeer WAMP/MAMP</h2>
            <p>Installeer op een Windows systeem het programma
                <a href="http://www.wampserver.com/en/download-wampserver-64bits/" target="_blank">WAMP</a>. In dit
                pakket zit PHP, MySQL, een webserver en database server. Als je al een MySQL server op je systeem hebt
                ge&iuml;nstalleerd kun je die het beste verwijderen om vervelende conflicten te voorkomen.
                Let op bij het installeren dat je naast MariaDB ook MySQL versie 5.x installeert. Deze gaan
                we namelijk gebruiken. Als de installatie geslaagd is zie je in je system-tray het
                WAMP icoontje. Als de servers draaien wordt het icoontje groen. Als je een MAC gebruikt
                kun je <a href="https://www.mamp.info/en/mac/" target="_blank">MAMP</a>  installeren.
                Let op dat je de gratis versie gebruikt.
            </p>
            <p>
                Standaard draait de web server van WAMP op poort 80. De server van MAMP draait standaard
                op poort 8888.
            </p>

            <p>
                Als je WAMP gebruikt kun je een project aanmaken in de www directory die je vindt in de
                directory waarin WAMP is ge&iuml;nstalleerd (C:/wamp64). Als je MAMP gebruikt kun je de
                root directory voor je PHP projecten zelf kiezen d.m.v preferences -> Web Server.
            </p>

            <p>
                Kies een editor waar je php code mee kunt schrijven. Ben je gewend om met IntelliJ te werken
                dan zou je PHP Storm van JetBrains kunnen gebruiken of een PHP plug-in in IntelliJ installeren.
                Andere veelgebruikte editors zijn Atom of Visual Studio Code. Maak in je editor een php project aan
                en sla dit op in de www map van WAMP of de root-directory die in MAMP staat ingesteld. Maak een
                bestand genaamd index.php en zet daar de volgende code in.

            <pre class="code">
&lt;?php
<span class="comment">//output een stukje tekst</span>
<span class="codeplus">echo</span> "Hello World";</pre>
            <p>
                Ga nu in je browser naar localhost/[naam_van_je_project]. MAMP gebruikers gaan naar
                localhost:8888/[naam_van_je_project] tenzij je de poort hebt gewijzigd in poort nummer 80.
                Als er op het scherm &quot;Hello World&quot; verschijnt heb je je eerste PHP project
                succesvol gemaakt. Bekijk de paginabron en merk op dat alleen de output &quot;Hello World&quot; te zien
                is en niet de overige php code.
            </p>
        </div>
        <div class="opdrachten">

            <h2>Foutmeldingen weergeven</h2>
            <p>Als je een applicatie aan het ontwikkelen bent is het voor jou als developer handig om foutmeldingen
                te krijgen. Dat kan je namelijk helpen om bugs te fixen. Als je je applicatie online (in productie)
                brengt wil je die foutmeldingen niet zien omdat dit slordig staat en hackers kan helpen om
                kwetsbaarheden
                te vinden.
            </p>
            <p>Wijzig het bovenstaande script maar haal nu de punt-komma weg. Als je de pagina nu opnieuw laadt zie
                je wel of niet een foutmelding. Als je geen foutmelding ziet kun je dit aanpassen in het php.ini
                bestand.
                Om te achterhalen waar het php.ini bestand zich bevindt, kun je het volgende scriptje draaien:</p>
            <pre class="code">
&lt;?php
<span class="comment">//opent een webpagina met info over je php installatie</span>
<span class="codeplus">phpinfo();</span>
?&gt;</pre>
            <p>Dit scriptje opent een pagina met daarop allerlei info over je php installatie, waaronder de locatie
                van het php.ini bestand. Zoek het bestand in je explorer/finder en open het in een teksteditor of je
                IDE. Haal de
                punt-komma voor de volgende regels weg en sla het bestand op.</p>
            <pre class="code">
error_reporting  =  E_ALL
display_errors = On
            </pre>
            <p>Herstart je web server en test of je nu wel foutmeldingen krijgt.</p>
        </div>

        </div>
    </div>
</div>
<%@ include file="/AO/PHP/includes/bottom.html" %>
</html>


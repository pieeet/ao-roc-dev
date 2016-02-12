<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 10-02-16
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

    <%@ include file="/AO/Greenfoot/includes/zijmenu.jsp"%>


    <div class="col-md-9">
        <h1>Greenfoot</h1>
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>In deze serie lessen leer je een spel maken met behulp van
                Greenfoot. In elke opdracht worden ook een aantal termen van het
                programmeren uitgelegd. Deze termen (vaktaal) moet je kennen en dus
                leren.</p>
            <p>
                In <a href="<c:url value="/AO/Greenfoot/includes/images.zip"/>">images.zip</a> vind
                je de afbeeldingen die je nodig hebt voor het spel en in <a
                    href="<c:url value="/AO/Greenfoot/includes/sounds.zip"/>">sounds.zip</a> de
                geluiden. Als je het spel alvast wilt spelen kun je een <a
                    href="<c:url value="/AO/Greenfoot/includes/GarpsGame.jar"/>">uitwerking</a>
                downloaden.
            </p>
        </div>
        <div class="opdrachten">
            <h2>Ontwikkelomgeving maken en de eerste stappen in Greenfoot</h2>
            <p>
                In deze opdracht maak je de ontwikkelomgeving in orde door Java te
                installeren als deze nog niet op je computer staat en door Greenfoot
                te installeren. Daarna volgt er een eerste kennismaking met
                Greenfoot en Garp. Zie verder <a
                    href="<c:url value="/AO/Greenfoot/includes/Spelen_in_Java.pdf"/>" target="_blank">de
                instructie</a>. Heb je afbeeldingen en geluiden nodig, dan vind je die
                in de web links.
            </p>
            <p>Leer ook de vaktermen die aan het einde van de bijlage staan.</p>
        </div>
        <div class="opdrachten">
            <h2>Garp wijkt van het rechte pad af en Gnomus gaat op dievenpad</h2>
            <p>Garp moet diamanten gaan verzamelen. Daarvoor moet hij kunnen
                bewegen. De speler moet Garp kunnen sturen. Ook leren we de geheimen
                van de dief Gnomus kennen. Hoe komt het toch dat hij vanzelf beweegt
                en een eigen leven leidt?</p>
            <div class="embed-responsive embed-responsive-16by9">

                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/ng2rGEFrT_E" frameborder="0"
                        allowfullscreen></iframe>
            </div>
        </div>
        <div class="opdrachten">
            <h2>De wereld wordt steeds gevaarlijker</h2>
            <p>We gaan de wereld van Garp in orde maken. Garp en Gnomus
                worden automatisch op de wereld gezet die steeds gevaarlijker wordt.
                We plaatsen een aantal obstakels in zijn wereld. Verder gaan we
                achtergrondmuziek maken.</p>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/WMnHPALJOvo" frameborder="0"
                        allowfullscreen></iframe>
            </div>
        </div>
        <div class="opdrachten">
            <h2>Leven en niet laten leven</h2>
            <p>Garp en Gnomus leven nog langs elkaar heen. Ze gaan nog over
                de rotsen en Garp verzamelt nog steeds geen diamanten. We gaan nu
                eerst Garp diamanten laten verzamelen en daarna leren we Gnomus hoe
                hij Garp moet vermoorden. En verder zullen ze niet over de rotsen
                heen kunnen, maar moeten zij er omheen. En, o, ja ... De bommen gaan
                eindelijk ontploffen!</p>

            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/e_s5hXNh66Q" frameborder="0"
                        allowfullscreen></iframe>
            </div>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/eONZWVS7a6g" frameborder="0"
                        allowfullscreen></iframe>
            </div>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/BCEm09jCkn4" frameborder="0"
                        allowfullscreen></iframe>
            </div>
        </div>
        <div class="opdrachten">
            <h2>De buit verdelen</h2>
            <p>Tot slot moet de score nog worden bijgehouden tijdens het spel
                en moet aan het eind van het spel een venster verschijnen met daarin
                de aanduiding of de speler gewonnen of verloren heeft. Verder wordt
                de score zichtbaar gemaakt en de duur van het spel. De score is het
                aantal diamanten dat Garp heeft verzameld.</p>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="420" height="315"
                        src="https://www.youtube.com/embed/xFTRGjOqIbM" frameborder="0"
                        allowfullscreen></iframe>
            </div>
        </div>
        <div class="opdrachten">
            <h2>Drie extra opdrachten</h2>
            <ol>
                <li>Gnomus kan al in de verte zien waar Garp is en vervolgens
                    op Garp afgaan om hem te doden. Dat kun je programmeren met behulp
                    van de methodes int getX() en int getY() van het object Garp. Het
                    object Garp moet dan wel bekend zijn aan Gnomus:
                    getObjectsInRange(100, &quot;Garp.class&quot;);</li>
                <li>Je kunt het spel ook met zijn twee spelers spelen, waarbij
                    een speler Garp aanstuurt en de andere speler Gnomus. Gnomus wordt
                    op dezelfde manier aangestuurd als Garp maar dan met bijvoorbeeld
                    de toetsen: Z, X, C en S, aan de linkerkant van het toetsenbord. De
                    pijltjestoetsen zitten namelijk aan de rechterkant van het
                    toetsenbord. Als Gnomus een bom raakt, ontploft de bom en heeft
                    Garp gewonnen.</li>
                <li>Je kunt het spel ook zo veranderen dat er twee Garps zijn
                    die beide door een speler worden aangestuurd. De Garp die de meeste
                    diamanten heeft verzameld als alle diamanten uit het spel zijn,
                    heeft gewonnen. Als de twee Garps tegen elkaar botsen, dan heeft de
                    Garp met de meeste diamanten gewonnen. Als een van de Garps eerder
                    dood gaat door Gnomus of door een bom, dan gaat de andere Garp door
                    totdat hij of ook dood gaat of alle diamanten die nog in het spel
                    zijn, heeft verzameld. In het laatste geval heeft deze Garp
                    gewonnen. Het bijhouden van de scores moet dan ook aangepast
                    worden.
            </ol>
        </div>
    </div>
</div>
<%@ include file="/AO/Greenfoot/includes/bottom.html"%>

</html>

<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 19-11-16
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android_nano_basics/includes/zijmenu.jsp" %>

    <div class="col-md-9">

        <h2>Android Basics Nanodegree</h2>
        <p>Deze cursus volgt het <a href="https://www.udacity.com/course/android-basics-nanodegree-by-google--nd803"
                                    target="_blank">
            Android Basics Nanodegree</a> van <a href="https://www.udacity.com/" target="_blank">Udacity</a>. Voor
            de cursus is geen voorkennis vereist.
            De cursus is ontwikkeld in nauwe samenwerking met Google, de
            eigenaar van Android en is daarmee dus als het ware gecertificeerd.
            Het nanodegree programma kost normaal gesproken
            $ 200,- per maand, maar je kunt de afzonderlijke cursussen ook gratis zelfstandig volgen als je
            eenmaal de weg weet.</p>
        <p>Om het nanodegree
            te krijgen
            moet je je projecten door Udacity laten beoordelen. Hiervoor moet je ingeschreven zijn. Je kunt je dus helemaal
            voorbereiden door de afzonderlijke cursussen te voltooien en de projecten te maken. Later kun je er dan
            voor kiezen om
            alsnog in korte tijd het nanodegree te halen om het op je cv en in je portfolio te zetten.
            Al het werk heb je dan namelijk al gedaan. Bewaar je werk dus
            zorgvuldig!</p>

        <h3>Het cursustraject</h3>

        <div class="bs-callout bs-callout-warning">
            <h3>Android Basics: User Interface</h3>
            <p>Project: Maak een simpele app met &eacute;&eacute;n scherm die informatie over een klein bedrijf of
                bijvoorbeeld een vereniging toont.</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Android Basics: User input</h3>
            <p>Project 1: maak een app die de score van een sportwedstrijd bijhoudt</p>
            <p>Project 2: ontwerp en maak een quiz app over een onderwerp waar jij vertrouwd mee bent</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Android Basics: Multi-screen apps</h3>
            <p>Project 1: maak een app waarmee muziek afgespeeld wordt</p>
            <p>Project 2: Maak een java klasse om een rapport van een student te modelleren </p>
            <p>Project 3: maak een app waarmee een gebruiker door een stad of gebied geleid wordt</p>
        </div>

        <h4></h4>

    </div>
</div>
<%@ include file="/AO/android_nano_basics/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#intro").addClass("selected");
    })
</script>
</html>

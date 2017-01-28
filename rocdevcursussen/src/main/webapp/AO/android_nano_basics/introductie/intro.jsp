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
            moet je je projecten door Udacity laten beoordelen. Hiervoor moet je ingeschreven zijn. Je kunt je dus
            helemaal
            voorbereiden door de afzonderlijke cursussen te voltooien en de projecten te maken. Later kun je er dan
            voor kiezen om
            alsnog in korte tijd het nanodegree te halen om het op je cv en in je portfolio te zetten.
            Al het werk heb je dan namelijk al gedaan. Bewaar je werk dus
            zorgvuldig!</p>
        <%--<div class='paysa-wij' data-max-width='320px'--%>
             <%--data-params='{"title":"android developer","company":"","locality":"","selectable":false,"iframed":null}'--%>
             <%--data-type='salary'><p> Discover more salary details for <a--%>
                <%--href='https://www.paysa.com/salaries/android-developer--t?utm_source=widget' target='_blank'>Android--%>
            <%--Developer</a>. Browse salaries by <a href='https://www.paysa.com/salaries-list/title?utm_source=widget'--%>
                                                 <%--target='_blank'>job title</a>, <a--%>
                <%--href='https://www.paysa.com/salaries-list/company?utm_source=widget' target='_blank'>company</a>, <a--%>
                <%--href='https://www.paysa.com/salaries-list/locality?utm_source=widget' target='_blank'>location</a>, <a--%>
                <%--href='https://www.paysa.com/salaries-list/school?utm_source=widget' target='_blank'>school</a> on <a--%>
                <%--href="https://www.paysa.com/?utm_source=widget">Paysa</a></p></div>--%>
        <%--<script deferred src='//media.paysa.com/assets/widgets/loader.js'></script>--%>

        <h3>Het nanodegree traject</h3>
        <div class="bs-callout bs-callout-warning">
            <h3>Android Basics: <a href="/AO/android-nano-beginners/user-interface">User Interface</a></h3>
            <p>Project: Design and implement a simple app that displays information about a small business.</p>
            <p>tijdsbesteding ca 12 uur</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Android Basics: <a href="/AO/android-nano-beginners/user-input">User input</a></h3>
            <p>Project 1: Implement an app to track scores between two teams within a basketball game.</p>
            <p>Project 2: Design and implement a short quiz app about some topic you are familiar with.</p>
            <p>tijdsbesteding ca 20 uur</p>
        </div>

        <div class="bs-callout bs-callout-warning">
            <h3>Android Basics: <a href="/AO/android-nano-beginners/multiscreen">Multi-screen apps</a></h3>
            <p>Project 1: Architect the user experience and technical design of an app to play music for a user.</p>
            <p>Project 2: Create a custom Java class to model the information in a student report card.</p>
            <p>Project 3: Create an app to guide a user around a city or location of your choice</p>
            <p>tijdsbesteding ca 40 uur</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Android Basics: <a href="/AO/android-nano-beginners/networking">Networking</a></h3>
            <p>Project 1: Create an app to list the published books on a given topic using the Google Books API.</p>
            <p>Project 2: Create an app to display recent news stories on a topic of your choice using a web API. </p>
            <p>tijdsbesteding ca 40 uur</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Android Basics: <a href="#">Data Storage</a></h3>
            <p>Project 1: Create an app to track your habits</p>
            <p>Project 2: Create an app to track the inventory of a retail store, including current stock and
                supplier information.</p>
            <p>tijdsbesteding ca ... uur</p>
        </div>


    </div>
</div>
<%@ include file="/AO/android_nano_basics/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#intro").addClass("selected");
    })
</script>
</html>

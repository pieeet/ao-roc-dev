<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 19-11-16
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android_nano_basics/includes/zijmenu.jsp" %>

    <div class="col-md-9">

        <div class="bs-callout bs-callout-info">
            <h2>
                <a href="https://www.udacity.com/course/android-basics-nanodegree-by-google--nd803"
                   target="_blank">Android for beginners Nanodegree</a></h2>
            <h3>Android Basics: <a
                    href="https://classroom.udacity.com/courses/ud836/lessons/4038208680/concepts/0bd6ff7e-ba88-4dac-8093-a5a6d561efa0#"
                    target="_blank">User Input</a></h3>
            <p>Benodigde tijd: ca 20 uur</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Leerdoelen</h3>
            <p>Na het voltooien van deze cursus kun je:</p>
            <ul>

                <li><strong>variabelen</strong> gebruiken om waardes in op te slaan</li>
                <li>een <strong>int</strong> variabele gebruiken</li>
                <li>fouten opsporen (<strong>debuggen</strong>) door de <strong>logcat</strong> te lezen</li>
                <li>fouten <strong>debuggen</strong> met behulp van <strong>breakpoints</strong> in debug mode</li>
                <li>de waarde van een <strong>int</strong> variabele verhogen of verlagen</li>
                <li><strong>globale variabelen</strong> maken die een waarde in het geheugen bewaart
                zolang de app actief is</li>
                <li>een View Group <strong>nesten</strong> in een View Group</li>
                <li>in java  <strong>String</strong> variabelen maken</li>
                <li>bepaalde characters (zoals aanhalingstekens) in een string <strong>escapen</strong> met
                    een backslash (\)</li>
                <li>meerdere strings aan elkaar plakken (<strong>concateneren</strong>)</li>
                <li>andere datatypen (zoals int waarden) aan strings kunt plakken</li>
                <li>een methode <strong>definieren</strong> en een methode <strong>aanroepen (call)</strong></li>
                <li>input aan een methode meegeven met <strong>input parameters</strong></li>
                <li>output van een methode terug krijgen met <strong>return waarde</strong></li>
                <li>in java <strong>resources</strong> <strong>objecten</strong> opvragen uit
                    de <strong>res</strong> directory met behulp
                van map en filename of met een id dat je aan een view hebt gegeven</li>
                <li>methodes op deze objecten aanroepen om hun <strong>toestand (state)</strong> te veranderen</li>
                <li>een <strong>checkbox</strong> aan je UI toevoegen en met een <strong>boolean</strong> opvragen
                    of hij &quot;gechecked&quot; is</li>
                <li>een <strong>ScrollView</strong> gebruiken </li>
                <li>een <strong>EditText</strong> view gebruiken en input van de gebruiker kunt opvragen in java</li>
                <li>een <strong>(implicit) intent</strong> maken waarmee een andere app wordt gestart, bijvoorbeeld
                een Email app of een Maps app</li>
                <li>strings maken in <strong>strings.xml</strong> in je res/values map en verschillende bestanden voor
                verschillende talen maken</li>
                <li><strong>styles</strong> gebruiken om views vorm te geven</li>


            </ul>

        </div>


        <div class="opdrachten">
            <h2>Project 1</h2>
            <p>Maak een app die de score van twee teams tijdens een wedstrijd bijhoudt. Voor meer info zie
            <a href="https://classroom.udacity.com/courses/ud836/lessons/7830628637239847/concepts/78286506390923#"
               target="_blank">Project Prep</a>. </p></div>
        <div class="opdrachten">
            <h2>Project 2</h2>
            <p>Maak een onderwijs-app met een quiz over een bepaald onderwerp. Voor meer info zie
                <a href="https://classroom.udacity.com/courses/ud836/lessons/6767261086239847/concepts/78270406590923#"
                   target="_blank">Project Prep</a>. </p></div>



    </div>




</div>
</div>
<%@ include file="/AO/android_nano_basics/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#user_input").addClass("selected");
    })
</script>
</html>
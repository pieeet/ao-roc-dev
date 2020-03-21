<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 13/03/2020
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/PHP/includes/zijmenu.jsp" %>

    <div class="col-md-9">
        <h2>Beginnen met programmeren in PHP</h2>
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
                je:</p>
            <ul>
                <li>verschillende data-typen kent zoals integer, string, boolean, array, associative array etc.</li>
                <li>weet wat autotyping is</li>
                <li>weet hoe je variabelen kunt concateneren</li>
                <li>kunt werken met verschillende operators zoals +, -, &lowast;, en modulus (%)</li>
            </ul>
        </div>

        <h3>Variabelen</h3>
        <p>Uiteraard wordt in PHP met variabelen gewerkt. Het grote verschil met de meeste andere programmeertalen
        is dat je een variabele niet declareert. Met behulp van een $ teken geef je aan dat het een variabele is.
        Variabelen mogen beginnen met een letter of een underscore, maar niet met een cijfer. Aan de hand van de
        waarde die je een variabele geeft bepaalt php wat voor datatype het is.</p>

        <pre class="code">
<span class="comment">//JavaScript voorbeeld</span>
<span class="comment">//maak (declareer) een variabele</span>
<span class="codeplus">var aantal = 42;</span>
<span class="comment">//gebruik de variabele</span>
<span class="codeplus">console.log(aantal);</span>

<span class="comment">//PHP voorbeeld</span>
&lt?php
<span class="comment">//maak een variabele</span>
<span class="codeplus">$aantal = 42;</span>
<span class="comment">//gebruik de variabele</span>
<span class="codeplus">echo $aantal;</span></pre>

        <h3>Datatypen, output en concatenatie</h3>
        <p>Met het echo commando maak je output - tekst of HTML - die in de browser wordt getoond. Omdat je niet hoeft aan
        te geven wat voor datatype je variabele is interpreteert PHP dit voor je.</p>

        <pre class="code">
<span class="comment">//PHP gaat er van uit dat $aantal_1 en $aantal_2 gehele getallen (integers) zijn.</span>
$aantal_1 = 20;
$aantal_2 = 22;
<span class="comment">//PHP &quot;ziet&quot; dat $zin een string is.</span>
$zin = &quot;Het aantal is: &quot;
<span class="comment">//PHP converteert $aantal_1 naar een string.</span>
echo $zin . $aantal_1 + $aantal_2;</pre>

        <p>De punt in bovenstaande code plakt de verschillende variabelen als strings aan elkaar (concateneren).
            De code levert echter een foutmelding op.</p>
        <pre class="code">
<strong>Warning:</strong> A non-numeric value encountered in...</pre>

        <p>Dit betekent dat PHP de integer variabele heeft omgezet naar een string en daar kun je niet mee rekenen.
            Eerst moet de berekening worden uitgevoerd, pas dan kan de uitkomst omgezet worden naar een string.</p>
        <pre class="code">
...
<span class="comment">//PHP converteert de uitkomst van de berekening naar een string.</span>
echo $zin . ($aantal_1 + $aantal_2);</pre>
        <p>Dit laat zien dat PHP wel degelijk onderscheid maakt in data-typen.</p>
    </div>
</div>
<%@ include file="/AO/PHP/includes/bottom.html" %>
</html>
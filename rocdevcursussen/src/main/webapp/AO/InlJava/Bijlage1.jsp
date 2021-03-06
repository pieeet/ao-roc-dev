<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

    <%@ include file="/AO/InlJava/includes/zijmenu.jsp" %>

    <div class="col-md-9">
        <h2>Bijlage 1 Kleuren</h2>
        <p>Er zijn in Java standaard 13 kleuren: </p>
        <table class="table table-striped">

            <tr>
                <td>Color.BLACK</td>
                <td>zwart</td>
            </tr>
            <tr>
                <td>Color.BLUE</td>
                <td>blauw</td>
            </tr>
            <tr>
                <td>Color.CYAN</td>
                <td>groenblauw</td>
            </tr>
            <tr>
                <td>Color.DARKGRAY</td>
                <td>donkergrijs</td>
            </tr>
            <tr>
                <td>Color.GRAY</td>
                <td>grijs</td>
            </tr>
            <tr>
                <td>Color.GREEN</td>
                <td>groen</td>
            </tr>
            <tr>
                <td>Color.LIGHTGRAY</td>
                <td>lichtgrijs</td>
            </tr>
            <tr>
                <td>Color.MAGENTA</td>
                <td>paars</td>
            </tr>
            <tr>
                <td>Color.ORANGE</td>
                <td>oranje</td>
            </tr>
            <tr>
                <td>Color.PINK</td>
                <td>roze</td>
            </tr>
            <tr>
                <td>Color.RED</td>
                <td>rood</td>
            </tr>
            <tr>
                <td>Color.WHITE</td>
                <td>wit</td>
            </tr>
            <tr>
                <td>Color.YELLOW</td>
                <td>geel</td>
            </tr>
        </table>

        <p>Deze kleuren kun je met setColor() en setBackground() gebruiken.</p>

        <p>Je kunt ook met het RGB-systeem kleuren maken. RGB staat voor rood, groen en blauw. Pixels bestaan uit drie
            puntjes die ieder
            &eacute;&eacute;n van de drie kleuren weergeven. Door de intensiteit van zo&#39;n puntje te wijzigen, krijg
            je een andere kleur.
            Een rode achtergrond krijg je door alleen het rode puntje aan te zetten. Dat doe je door bijvoorbeeld de
            volgende opdracht: </p>
					
<pre class="code">
g.setBackground( new Color( 255, 0, 0) );
</pre>


        <p>Het groene en het blauwe puntje staan uit door daar 0 mee te geven. Het rode puntje staat aan. Een hogere
            waarde dan 255 geeft
            een foutmelding bij de uitvoering van de applet. Met dit systeem heb je ongeveer 16 miljoen
            mogelijkheden.</p>

    </div>
</div>
<%@ include file="/AO/InlJava/includes/bottom.html" %>
</html>

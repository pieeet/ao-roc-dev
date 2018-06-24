<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 08-06-18
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/mobilewebspecialistnanodegree/includes/zijmenu.jsp" %>

    <div class="col-md-9">

        <div class="bs-callout bs-callout-info">
            <h3>Mobile Web Specialist Nanodegree: <a
                    href="https://udacity.com/course/responsive-web-design-fundamentals--ud893"
                    target="_blank">Responsive Web Design Fundamentals</a></h3>
            <p>Benodigde tijd: ca 16 uur</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Leerdoelen</h3>
            <p>Na het voltooien van deze cursus kun je:</p>
            <ul>
                <li>dev tools in Chrome gebruiken om pagina elementen te bekijken en de verschillende beschikbare
                    emulators
                    gebruiken
                </li>
                <li>dev tools met een fysiek mobiel apparaat (Andoid/iOS) gebruiken</li>
                <li>uitleggen wat device pixel ratio is en het verschil aangeven tussen hardware pixels en device
                    independant pixels (dip&#39;s)
                </li>
                <li>de inhoud van je web pagina aanpassen aan de breedte (width) van het device en de relatie tussen
                    css pixels en dip&#39;s doorgeven aan de browser:<br>
                    &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width&quot;, initial scale=1&quot;&gt;
                </li>
                <li>grote elementen op je pagina responsive maken en daarmee overflow
                    vermijden met een relatieve (max-)width, bijvoorbeeld 100%
                </li>
                <li>tap targets zoals buttons en links groot genoeg (48 x 48px) maken om gemakkelijk klikbaar te
                    maken.
                </li>
                <li>een pagina ontwerp maken dat begint met een klein device (telefoonscherm) en van daaruit opschalen
                    naar grotere devices (tablet, laptop, monitor)
                </li>
                <li>selectief css toepassen door met behulp van &quot;media queries&quot; verschillende
                    style sheets voor verschillende devices te maken of in dezelfde style sheet verschillende media
                    queries
                    aan je elementen toe te voegen
                </li>
                <li>&quot;breakpoints&quot; in je web pagina defini&euml;ren die recht doen aan de inhoud van je
                    pagina
                </li>
                <li>complexe media queries maken met meerdere breakpoints</li>
                <li><a
                    href="https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout"
                    target="_blank">grid based layouts</a> zoals Bootstrap gebruiken
                </li>
                <li>een flexbox container maken</li>
                <li>flex-wrap: wrap aan je flexbox container toevoegen zodat elementen naar beneden springen als er te
                    weinig ruimte is.
                </li>
                <li>het order attribuut gebruiken om de volgorde van elementen te be&iuml;nvloeden</li>
                <li>verschillende design-patterns kint gebruiken
                </li>
                <li>met behulp van media queries een table op verschillende manieren kunt manipuleren</li>
            </ul>
        </div>
    </div>
</div>
<%@ include file="/AO/mobilewebspecialistnanodegree/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#nav_responsive_web_design").addClass("selected");
    })
</script>
</html>


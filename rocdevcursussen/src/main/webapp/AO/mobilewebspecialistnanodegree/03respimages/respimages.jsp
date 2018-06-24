<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 19-06-18
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/mobilewebspecialistnanodegree/includes/zijmenu.jsp" %>

    <div class="col-md-9">

        <div class="bs-callout bs-callout-info">
            <h3>Mobile Web Specialist Nanodegree: <a
                    href="https://udacity.com/course/responsive-images--ud882"
                    target="_blank">Responsive Images</a></h3>
            <p>Benodigde tijd: ca 16 uur</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Leerdoelen</h3>
            <p>Na het voltooien van deze cursus kun je:</p>
            <ul>
                <li>uitleggen hoe grootte en compressie invloed hebben op het aantal bits van een foto</li>
                <li>in css met calc() calculaties maken</li>
                <li>in css de maat-eenheden viewport-width (vw) en viewport-height (vh) gebruiken, bijvoorbeeld<br>
                height: 100vh; dat zegt dat de totale hoogte van de viewport wordt benut.</li>
                <li>de eenheden vmin en vmax gebruiken om een afbeelding responsive te maken. Bijvoorbeeld<br>
                    width: 100vmin;<br>
                    height: 100vmin;<br>
                    zorgt er voor dat de hoogte en breedte even groot zijn als de breedte of de hoogte van de viewport
                    afhankelijk van welke
                    het kleinst is. Om een image te &quot;croppen&quot; kun je de vmax unit gebruiken, bijvoorbeeld<br>
                    width: 100vmax;<br>
                    height: 100vmax;<br>
                    maakt de breedte of de hoogte van de afbeelding even groot als de breedte of de hoogte van de viewport
                    afhankelijk van welke het grootst is. Dit zorgt er voor dat de afbeelding gaat croppen.
                </li>
                <li>
                    Het verschil aangeven tussen raster- en vectorafbeeldingen
                </li>
                <li>Grunt gebruiken om grote hoeveelheden afbeeldingen te resizen</li>
                <li>in css background-image, background-repeat en background-size gebruiken</li>
                <li>Unicode characters gebruiken</li>
                <li>verschillende manieren benoemen om afbeeldingen in je web app te gebruiken zonder een extra request
                    te hoeven doen zoals inline svg en data-uri&#39;s in je html of je css code</li>
                <li>de browser met &quot;srcset&quot; attribuut laten beslissen welke afbeelding het meest geschikt is
                    afhankelijk van pixel density van het scherm en de grootte van de afbeelding
                </li>
                <li>het &quot;sizes&quot; attribuut gebruiken om de browser te vertellen hoeveel ruimte van de viewport-width
                    de afbeelding inneemt en dit combineren met media-queries.</li>
                <li>het picture element gebruiken met media queries</li>

            </ul>
        </div>
    </div>
</div>
<%@ include file="/AO/mobilewebspecialistnanodegree/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#nav_responsive_images").addClass("selected");
    })
</script>
</html>

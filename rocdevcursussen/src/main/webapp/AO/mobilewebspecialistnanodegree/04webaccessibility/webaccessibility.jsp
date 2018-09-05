<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 24-06-18
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/mobilewebspecialistnanodegree/includes/zijmenu.jsp" %>

    <div class="col-md-9">

        <div class="bs-callout bs-callout-info">
            <h3>Mobile Web Specialist Nanodegree: <a
                    href="https://udacity.com/course/web-accessibility--ud891"
                    target="_blank">Web accessibility</a></h3>
            <p>Benodigde tijd: ca 16 uur</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Leerdoelen</h3>
            <p>Na het voltooien van deze cursus kun je:</p>
            <ul>
                <li>verschillende beperkingen benoemen waar je gebruikers mee te maken kunnen hebben</li>
                <li>de <a href="https://www.w3.org/TR/WCAG20/"
                          target="_blank">Web Content Accessibility Guidelines 2.0</a> en de <a
                        href="https://webaim.org/standards/wcag/checklist" target="_blank"> Web Aim checklist for
                WCAG 2.0</a> toepassen</li>
                <li>uitleggen wat focus op een web pagina betekent en hoe je de focus kunt verleggen naar het volgende
                of vorige element</li>
                <li>de tab order van elementen be&iuml;nvloeden dmv de DOM order</li>
                <li>focus afdwingen op elementen die niet van zichzelf focusable zijn met tabindex</li>
                <li>met JavaScript focus zetten op een bepaald element met de methode focus() in bijvoorbeeld een
                single page website</li>
                <li>zogenaamde skip-links gebruiken om bijvoorbeeld navigatie-links over te kunnen slaan</li>



            </ul>
        </div>
    </div>
</div>
<%@ include file="/AO/mobilewebspecialistnanodegree/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#nav_web_accessibility").addClass("selected");
    })
</script>
</html>


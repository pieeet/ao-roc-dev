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
                   target="_blank">Android for beginners</a></h2>
            <h3>Android Basics: <a
                    href="https://classroom.udacity.com/courses/ud834/lessons/4027328704/concepts/216017e8-8a5c-4fc8-925d-f03df3618d0c"
                    target="_blank">User Interface</a></h3>
            <p>Benodigede tijd: ca 12 uur</p>

        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Leerdoelen</h3>
            <p>Na het voltooien van deze cursus kun je:</p>
            <ul>
                <li>schermelementen met xml maken</li>
                <li>een TextView, ImageView en Button maken</li>
                <li>met de attributen <strong>width</strong> en <strong>height</strong> werken en weet je wat
                    <strong>density independant pixels (dp)</strong> betekent
                </li>
                <li><strong>wrap_content</strong> en <strong>match_parent</strong> gebruiken
                    in de width en height attributen
                </li>
                <li><strong>textSize</strong> aanpassen met <strong>scale independant
                    pixels (sp)</strong></li>
                <li>kleuren maken met de attributen <strong>background</strong> en
                    <strong>textColor</strong> en weet je hoe je zelf kleuren kunt maken met behulp van hexadecimale
                    waarden.
                </li>
                <li>een imageView maken en het attribuut <strong>scaleType</strong> gebruiken</li>
                <li>verschillende <strong>View Groups</strong> met <strong>children</strong> maken</li>
                <li>een <strong>LinearLayout</strong> maken met het attribuut <strong>orientation</strong></li>
                <li>het attribuut <strong>weight</strong> gebruiken in een LinearLayout</li>
                <li>elementen ten opzichte van elkaar positioneren in een <strong>Relative Layout</strong></li>
                <li><strong>padding</strong> en <strong>margin</strong> gebruiken</li>
                <li>een android project starten met Android Studio</li>
                <li>een Android telefoon en/of een emulator gebruiken om je apps te testen</li>
                <li>een foto naar de map drawable van je Android project kunt kopi&euml;ren en deze gebruiken in een
                    ImageView
                </li>
            </ul>

        </div>
        <div class="opdrachten">
            <h2>Project</h2>
            <p>Maak een app die informatie geeft over bijvoorbeeld een bedrijf, een winkel of een
                vereniging. Voor meer info zie <a
                        href="https://classroom.udacity.com/courses/ud834/lessons/6774550984239847/concepts/74065285400923#"
                        target="_blank">Project Prep</a>. Het mooist is natuurlijk als je een echte opdrachtgever voor
                je app kunt vinden.</p>
        </div>


    </div>


</div>
</div>
<%@ include file="/AO/android_nano_basics/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#user_interface").addClass("selected");
    })
</script>
</html>
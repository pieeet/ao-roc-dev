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
            <p>Benodigede tijd: ca 20 uur</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Leerdoelen</h3>
            <p>Na het voltooien van deze cursus kun je:</p>
            <ul>
                <li>een <strong>methode</strong> in een java klasse maken</li>
                <li><strong>variabelen</strong> gebruiken om waardes in op te slaan</li>
                <li>een <strong>int</strong> variabele gebruiken</li>
                <li>fouten opsporen (<strong>debuggen</strong>) door de <strong>logcat</strong> te lezen</li>
                <li>fouten <strong>debuggen</strong> met behulp van <strong>breakpoints</strong> in debug mode</li>
                <li>de waarde van een variabele verhogen of verlagen</li>
                <li><strong>globale variabelen</strong> maken die een waarde in het geheugen bewaart
                zolang de app actief is</li>

            </ul>

        </div>



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
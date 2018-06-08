<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 07-06-18
  Time: 08:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/mobilewebspecialistnanodegree/includes/zijmenu.jsp" %>

    <div class="col-md-9">


        <h2>Mobile Web Specialist Nanodegree</h2>
        <p>Deze cursus volgt het <a href="https://www.udacity.com/course/mobile-web-specialist-nanodegree--nd024"
                                    target="_blank">
            Become a Mobile Web Specialist</a> Nanodegree program van <a href="https://www.udacity.com/"
                                                                         target="_blank">Udacity</a>. De
            cursussen veronderstelt de nodige voorkennis op het gebied van HTML, CSS en JavaScript.
            De cursus is ontwikkeld in nauwe samenwerking met Google.</p>
        <blockquote>
            As a graduate of this program, you'll be job-ready for Mobile Web Developer roles. In addition, you'll
            be fully prepared to earn the Google Mobile Web Specialist Certification, offered directly by Google.
            <footer>Udacity</footer>
        </blockquote>
        <p>Het nanodegree programma kost normaal gesproken
            $ 200,- per maand, maar je kunt de afzonderlijke cursussen ook gratis zelfstandig volgen als je
            eenmaal de weg weet.</p>
        <p>Google stelt geregeld <a href="https://goo.gl/LVVHge" target="_blank">&quot;scholarships&quot;</a>
            voor het Nanodegree beschikbaar. Meld je aan voor notificaties als je hiervoor in aanmerking wilt komen.</p>


    </div>


</div>
</div>
<%@ include file="/AO/mobilewebspecialistnanodegree/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#intro").addClass("selected");
    })
</script>
</html>

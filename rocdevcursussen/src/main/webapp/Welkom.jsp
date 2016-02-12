<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">
    <%@ include file="/includes/zijmenu.jsp"%>


    <div class="container">
        <!--Main sectie == alles onder titelbalk -->

        <div id="main">


            <div class="col-md-9">

                <h2>Welkom ${fn:escapeXml(user.nickname)}!</h2>
                <div class="bs-callout bs-callout-warning">
                    <h3>Leerdoelen</h3>
                    <p>
                        Het doel van deze website is om je te helpen met de vakken van AO.
                        Per cursus vind je hier de leerdoelen studeeraanwijzingen, de
                        opgaven en uitwerkingen van de opgaven. De studie AO stoomt je
                        klaar voor het vak Applicatie-ontwikkelaar en geeft je toeganng
                        tot een HBO vervolgstudie. Wat je precies aan het eind van de
                        studie moet kennen en kunnen wordt uitgebreid beschreven in de
                        landelijk vastgestelde <a href="/AO/kd_ao.pdf" target="_blank">kwalificatiebeschrijving</a>
                        Applicatie- en mediaontwikkeling.
                    </p>
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe width="480" height="360"
                                src="//www.youtube.com/embed/EAkQejGAMoo" frameborder="0"
                                allowfullscreen></iframe>
                    </div>
                </div>

                <div class="bs-callout bs-callout-info">
                    <h3>Studeeraanwijzingen</h3>
                    <p>Het leren van programmeertalen en het schrijven van code
                        lijkt wel een beetje op het leren van autorijden. Deels heb je
                        theorie nodig, maar je leert het vooral door het veel in de
                        praktijk te doen. Tijdens de cursussen &quot;programmeren&quot;
                        zul je daarom heel veel opdrachten krijgen die je uit moet werken.
                        Om je een beetje op weg te helpen vind je op deze site
                        uitwerkingen. Probeer eerst zelf de opgaven te maken, maar blijf
                        niet te lang ploeteren. Kom je er niet uit: kijk dan naar de
                        uitwerkingen en probeer het dan nogmaals.</p>
                </div>

                <div id="artikel"></div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/includes/bottom-home.html"%>
</html>

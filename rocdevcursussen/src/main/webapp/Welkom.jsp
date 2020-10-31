<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <style>
        div.btnholder {
            margin-bottom: 15px;
        }
    </style>

    <div class="row">
        <div class="col-md-8">
            <h1>Open dag 7 november 2020</h1>
            <p>Op zaterdag 7 november organiseren we een open dag. Helaas kunnen we aankomende
                studenten en hun ouders niet op onze lokatie in Almere Buiten ontvangen. Daarom
                gaan we de open dag met behulp van Google Meet organiseren. De docenten van de opleiding
                gaan zich voorstellen en er wordt een presentatie over de opleiding gegeven. Uiteraard
                kun je vragen stellen via de microfoon van je computer of telefoon of via de chat functie.</p>
            <p>De Google Meet sessies zijn gepland om 10:00 11:00 12:00 en 13:00 uur. Onderstaande knoppen
                leiden je naar de bijeenkomsten.</p>
            <p>Om je op de hoogte te kunnen houden van nieuws en ontwikkelingen vragen we je om hieronder
                je email adres in te vullen. Nadat je je email hebt ingevuld en een sessie hebt gekozen
                ben je ingeschreven. Op de dag zelf kun je naar de
                sessie gaan door op &eacute;&eacute;n van de sessie knoppen te klikken.</p>

            <label for="input-email">email</label><br>
            <input class="form-control" type="email" id="input-email">
            <p id="email-warning" class="error" hidden> Vul een geldig email adres in</p>
            <h2>Schrijf je in voor een sessie</h2>
            <p>Om aan een Google Meet sessie deel te kunnen nemen heb je een Google account nodig. Google Meet sessies
            werken niet in Internet Explorer.</p>
            <div class="col-md-3 btnholder">
                <button type="button" class="btn btn-primary btn-sm btn-success sessionbtn"
                        data-sessie="1" data-opleiding="SD"
                        data-url="https://meet.google.com/cxa-xctn-msc">10:00 uur
                </button>
            </div>
            <div class="col-md-3 btnholder">
                <button type="button" class="btn btn-primary btn-sm btn-success sessionbtn"
                        data-sessie="2" data-opleiding="SD"
                        data-url="https://meet.google.com/fgd-riqr-jje">11:00 uur
                </button>
            </div>
            <div class="col-md-3 btnholder">
                <button type="button" class="btn btn-primary btn-sm btn-success sessionbtn"
                        data-sessie="3" data-opleiding="SD"
                        data-url="https://meet.google.com/veb-htse-qrd">12:00 uur
                </button>
            </div>
            <div class="col-md-3 btnholder">
                <button type="button" class="btn btn-primary btn-sm btn-success sessionbtn"
                        data-sessie="4" data-opleiding="SD"
                        data-url="https://meet.google.com/ofo-oprv-ccn">13:00 uur
                </button>
            </div>

        </div>
    </div>


    <%--    <%@ include file="/includes/zijmenu.jsp" %>--%>


    <%--    <div class="container">--%>
    <%--        <!--Main sectie == alles onder titelbalk -->--%>

    <%--        <div id="main">--%>


    <%--            <div class="col-md-9">--%>

    <%--                <h2>Welkom ${fn:escapeXml(user.nickname)}!</h2>--%>

    <%--                <div class="bs-callout bs-callout-warning">--%>
    <%--                    <h3>Leerdoelen</h3>--%>
    <%--                    <p>--%>
    <%--                        Het doel van deze website is om je te helpen met de vakken van AO.--%>
    <%--                        Per cursus vind je hier de leerdoelen studeeraanwijzingen, de--%>
    <%--                        opgaven en uitwerkingen van de opgaven. De studie AO stoomt je--%>
    <%--                        klaar voor het vak Applicatie-ontwikkelaar en geeft je toeganng--%>
    <%--                        tot een HBO vervolgstudie. Wat je precies aan het eind van de--%>
    <%--                        studie moet kennen en kunnen wordt uitgebreid beschreven in de--%>
    <%--                        landelijk vastgestelde <a href="/AO/kd_ao.pdf" target="_blank">kwalificatiebeschrijving</a>--%>
    <%--                        Applicatie- en mediaontwikkeling.--%>
    <%--                    </p>--%>
    <%--                    <div class="embed-responsive embed-responsive-16by9">--%>
    <%--                        <iframe width="480" height="360"--%>
    <%--                                src="//www.youtube.com/embed/EAkQejGAMoo" frameborder="0"--%>
    <%--                                allowfullscreen></iframe>--%>
    <%--                    </div>--%>
    <%--                </div>--%>

    <%--                <div class="bs-callout bs-callout-info">--%>
    <%--                    <h3>Studeeraanwijzingen</h3>--%>
    <%--                    <p>Het leren van programmeertalen en het schrijven van code--%>
    <%--                        lijkt wel een beetje op het leren van autorijden. Deels heb je--%>
    <%--                        theorie nodig, maar je leert het vooral door het veel in de--%>
    <%--                        praktijk te doen. Tijdens de cursussen &quot;programmeren&quot;--%>
    <%--                        zul je daarom heel veel opdrachten krijgen die je uit moet werken.--%>
    <%--                        Om je een beetje op weg te helpen vind je op deze site--%>
    <%--                        uitwerkingen. Probeer eerst zelf de opgaven te maken, maar blijf--%>
    <%--                        niet te lang ploeteren. Kom je er niet uit: kijk dan naar de--%>
    <%--                        uitwerkingen en probeer het dan nogmaals.</p>--%>
    <%--                </div>--%>

    <%--                <div id="artikel"></div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
</div>
<%@ include file="/includes/bottom-home.html" %>

<script>

    function validateEmail(email) {
        const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    $(document).ready(function () {
        $('.sessionbtn').click(function () {
            let sessionbuttons = $('.sessionbtn');
            sessionbuttons.attr("disabled", true);
            const emailInput = $('#input-email');
            const email = emailInput.val();
            if (!validateEmail(email)) {
                $('#email-warning').removeAttr('hidden');
                sessionbuttons.attr("disabled", false);
                return;
            }
            const session = $(this).data('sessie');
            const meetURL = $(this).data("url");
            const servletUrl = "/opendag";
            const opleiding = $(this).data('opleiding');
            $.ajax({
                type: "POST",
                url: servletUrl,
                data: {
                    email: email,
                    sessie: session,
                    opleiding: opleiding
                },
                success: function (data) {
                    if (data === "ok") {
                        window.location.href = meetURL;
                    } else {
                        alert(data);
                    }
                }
            });

        });
    });

</script>


</html>

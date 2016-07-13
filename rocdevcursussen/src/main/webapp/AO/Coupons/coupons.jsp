<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 12-07-16
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%
    if (request.getAttribute("schooljaren") == null) {
        response.sendRedirect("/AO/gcpcoupons");
    } else {
        String[] schooljaren = (String[]) request.getAttribute("schooljaren");

%>

<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

    <%@ include file="/AO/Coupons/includes/zijmenu.jsp" %>

    <div class="col-md-9">

        <h1>GCP Couponcodes</h1>
        <p>Je kunt met je roc-dev account een Google Cloud Platform coupon krijgen ter waarde van
            $400,-. Deze is een jaar geldig. Volgend jaar hopen we weer nieuwe coupons te krijgen.</p>


        <input type="hidden" id="schooljaar" value="2016">

        <div class="bs-callout bs-callout-succes" id="get_coupon_button">
            <p> Druk op onderstaande knop om je code te genereren of als je
                al een code hebt om hem op te
                vragen. We hebben 120 coupons gekregen, dus je krijgt maar &eacute;&eacute;n code.</p>
            <button type="button" class="btn btn-success">Geef me een coupon</button>
        </div>

        <div class="bs-callout bs-callout-succes" id="resultaat">
            <p>Je couponcode:</p>
            <ul id="code_response"></ul>
        </div>


        <p>Je kunt je coupon verzilveren op <a href="http://cloud.google.com/redeem" target="_blank">
            cloud.google.com/redeem
        </a>. Je wordt dan gevraagd om eerst een &quot;billing account&quot; aan te maken. Hiervoor moet je een
            bankrekening nummer opgeven. Bij bedrijfsnaam (verplicht) kun je gewoon je naam invullen. Je krijgt
            ook nog een regulier free-trial krediet, maar deze is maar 60 dagen geldig.</p>
        <div class="bs-callout bs-callout-danger">
            <h3>Let op!</h3>
            <p>Als je
                krediet op is of als de coupon verlopen is, dan worden eventueel doorlopende kosten van je rekening
                afgeschreven.
                Let hier dus wel op!
                Je krijgt maandelijks een factuur per email en je vindt een overzicht van je projecten en
                je krediet op je <a href="https://console.cloud.google.com/billing" target="_blank">billing
                    page</a>.</p>
        </div>

    </div>

</div>


</div>
</div>
<%@ include file="/AO/Coupons/includes/bottom.html" %>

<script>
    $(document).ready(
            function () {
                $("#resultaat").hide();
                var schooljaar = $("#schooljaar").val();
                var userName = $("#username").text();
                var listItems = "";


                $(document).on(
                        'click',
                        '#get_coupon_button',
                        function () {

                            $.post("/AO/gcpcoupons", {
                                        get_coupon_button: "x",
                                        schooljaar: schooljaar,
                                        username: userName
                                    },
                            function (response) {
                                $("#get_coupon_button").hide();
                                var jsonArray = JSON.parse(response);

                                var i = 0;
                                jsonArray.forEach(function (entry) {
                                    listItems += "<li>" + entry + "</li>";
                                });
                                $("#code_response").html(listItems);
                                $("#resultaat").show();

                            }

                            )
                            ;

                        });
            });

</script>


</html>
<% } %>
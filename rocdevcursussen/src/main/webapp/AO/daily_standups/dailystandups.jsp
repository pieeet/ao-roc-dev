<%@ page import="dailystandups.Planning" %>
<%@ page import="dailystandups.StandUpUser" %>
<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 14-02-18
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%
    if (request.getAttribute("fromservlet") == null) {
        response.sendRedirect("/AO/planning");
    } else {
    Planning planning = (Planning) request.getAttribute("planning");
    StandUpUser standUpUser = null;
    if (planning != null) {
        standUpUser = planning.getUser();
    }
%>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h1>Planningsformulier</h1>
        <p>In dit formulier geef je aan wat je afgelopen week hebt gedaan en wat je de komende week wilt gaan doen.</p>
        <form role="form" id="planning_form">
            <div class="form-group">
                <label for="groep_kiezer">Groep</label>
                <select class="form-control required" id="groep_kiezer" name="groep_kiezer">

                    <%
                        if (standUpUser != null) {
                    %>
                    <option value="<%=standUpUser.getGroepEsc()%>"><%=standUpUser.getGroepEsc()%></option>

                    <%} else {%>
                    <option value="">Kiezen...</option>
                    <%}%>

                    <option value="MMVAO5A">MMVAO5A</option>
                    <option value="MMVAO6A">MMVAO6A</option>
                    <option value="MMVAO6C">MMVAO6C</option>
                    <option value="MMVAO7A">MMVAO7A</option>
                    <option value="MMVAO7B">MMVAO7B</option>
                </select>
            </div>

            <div class="form-group">
                <label for="naam_input">Naam</label>

                <%
                    if (standUpUser == null) {
                %>

                <input class="form-control required" id="naam_input" name="naam_input"
                       placeholder="Naam">
                <%
                    } else {
                %>
                <input class="form-control required" id="naam_input" name="naam_input"
                       value="<%=standUpUser.getNaamEsc()%>">

                <%
                    }
                %>


            </div>

            <div class="bs-callout bs-callout-warning">
                <h2>Huidige planning</h2>
                <div id="planning_wrapper">
                    <%
                        if (planning == null) { %>
                    <p>Je hebt nog geen planning</p>
                    <%
                    } else { %>
                    <p>Datum ingevuld: <%= planning.getDateFormat(request.getLocale())%>
                    </p>
                    <h3>Gepland werk</h3>
                    <p><%= planning.getPlanningEsc() %>
                    </p>
                    <h3>Belemmeringen</h3>
                    <p><%=planning.getBelemmeringenEsc()%>
                    </p>
                    <%
                        }%>

                </div>
            </div>

            <%
                if (planning != null) {
            %>

            <p>Geef aan of je je aan je eigen planning hebt kunnen houden. Probeer te bedenken waarom dat deze week
                juist wel of juist niet is gelukt. Als het niet is gelukt, hoe kwam dat dan en wat ga je doen om het
                volgende keer wel te laten lukken?</p>

            <h3>Vorige planning</h3>


            <div class="form-group">
                <label for="planning_gehaald">Heb je je planning gehaald?</label>
                <select class="form-control required" id="planning_gehaald" name="planning_gehaald">
                    <option value="">Kiezen</option>
                    <option value="Ja">Ja</option>
                    <option value="Nee">Nee</option>
                </select>
            </div>


            <div class="form-group">
                <label for="wat_wel_gedaan">Wat heb je wel gedaan?</label>
                <textarea class="form-control" id="wat_wel_gedaan" name="wat_wel_gedaan"></textarea>
            </div>

            <div class="form-group">
                <label for="wat_nog doen">Wat moet je nog doen?</label>
                <textarea class="form-control" id="wat_nog doen" name="wat_nog doen"></textarea>
            </div>

            <div class="form-group">
                <label for="waarom_niet_gelukt">Indien nog niet af: waarom is het niet gelukt?</label>
                <textarea class="form-control" id="waarom_niet_gelukt" name="waarom_niet_gelukt"></textarea>
            </div>
            <%
                }
            %>

            <h2>Planning komende week</h2>
            <p>Probeer zo concreet mogelijk te beschrijven wat je wilt gaan doen.
                Concreet betekent dat precies duidelijk is wat je afgerond hebt over een week. (bijv. php hfdst 1
                helemaal af ) </p>
            <div class="form-group">
                <label for="plannen_komende_week">Wat zijn je plannen voor komende week?</label>
                <textarea class="form-control required" id="plannen_komende_week"
                          name="plannen_komende_week"></textarea>
            </div>

            <h3>Zijn er belemmeringen?</h3>
            <p>Geef hier aan of je problemen verwacht. Zijn er nog zaken die je niet begrijpt of nog niet hebt geoefend.
                Heb je hulp nodig van een docent? Met andere woorden: Geef aan of er zaken zijn waar je hulp bij nodig
                hebt.</p>
            <div class="form-group">
                <label for="hulp_nodig">Waar heb je hulp bij nodig?</label>
                <textarea class="form-control" id="hulp_nodig" name="hulp_nodig"></textarea>
            </div>


            <button type="submit" class="btn btn-primary btn-danger" name="submit_planning_btn"
                    id="submit_planning_btn">Submit
            </button>
        </form>

        <div class="verzend-info"></div>

    </div>
</div>
<%@ include file="/AO/daily_standups/includes/bottom.html" %>
<script
        src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"
        type="text/javascript"></Script>

<script type="text/javascript">
    $(document).ready(
        function () {
            // configure your validation
            $("#planning_form").validate({
                rules: {
                    groep_kiezer: {required: true},
                    naam_input: {required: true},
                    planning_gehaald: {required: true},
                    plannen_komende_week: {required: true}
                },
                messages: {
                    groep_kiezer: {required: "Selecteer een groep"},
                    naam_input: {required: "Vul je naam in"},
                    planning_gehaald: {required: "Maak een keuze"},
                    plannen_komende_week: {required: "Geef aan wat je planning is"}
                },
                submitHandler: function (form) {
                    const url = "/AO/planning";
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: $(form).serialize(),
                        success: function (data) {
                            location.reload(true);
                        }
                    });
                    return false; // override default submit
                }
            });
        });

</script>
<%}%>
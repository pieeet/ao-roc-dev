<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 14-02-18
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dailystandups.model.Planning" %>
<%@ page import="dailystandups.model.StandUpUser" %>
<%@ page import="dailystandups.model.Ticket" %>
<%@ page import="dailystandups.model.Vak" %>

<%
    if (request.getAttribute("fromservlet") == null) {
        response.sendRedirect("/AO/planning");
    } else {
        Planning planning = (Planning) request.getAttribute("planning");
        StandUpUser standUpUser = (StandUpUser) request.getAttribute("standupuser");
        Ticket[] tickets = null;
        boolean hasTickets = false;
        if (planning != null) {
            hasTickets = planning.getTickets() != null && planning.getTickets().length > 0;
            if (hasTickets) {
                tickets = planning.getTickets();
            }
        }
        @SuppressWarnings("unchecked")
        ArrayList<Vak> vakken = (ArrayList<Vak>) request.getAttribute("vakken");
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
                    <%if (standUpUser != null) {%>
                    <option value="<%=standUpUser.getGroepEsc()%>"><%=standUpUser.getGroepEsc()%>
                    </option>
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
                <%if (standUpUser == null) {%>
                <input class="form-control required" id="naam_input" name="naam_input"
                       placeholder="Naam">
                <%} else {%>
                <input class="form-control required" id="naam_input" name="naam_input"
                       value="<%=standUpUser.getNaamEsc()%>">
                <%}%>
            </div>
            <h2>Huidige planning</h2>
            <div class="bs-callout bs-callout-warning">

                <%if (planning == null) { %>
                <p>Je hebt nog geen planning</p>
                <%} else { %>

                <%--user heeft een planning--%>
                <p>Datum ingevuld: <%= planning.getEntryDateFormat()%>
                </p>
                <h3>Tickets</h3>
                <%if (hasTickets) {%>
                <ul>
                    <%for (Ticket ticket : tickets) {%>
                    <li><%=ticket.getVak().getNaam()%> - <%=ticket.getCodeTicket()%> - <%=ticket.getAantalUren()%>
                        punten
                    </li>
                    <%}%>
                </ul>
                <%} else {%>
                <p>Je hebt nog geen tickets</p>
                <%}%>
                <%--evt belemmeringen--%>
                <%
                    String belemmeringen = planning.getBelemmeringenEsc();
                    if (belemmeringen != null && !belemmeringen.equals("")) {
                %>
                <h3>Belemmeringen</h3>
                <p><%=planning.getBelemmeringenEsc()%>
                </p>
                <%}%>
                <%}%>
            </div>
            <%if (planning != null) {%>
            <p>Geef aan of je je aan je eigen planning hebt kunnen houden. Probeer te bedenken waarom dat deze week
                juist wel of juist niet is gelukt. Als het niet is gelukt, hoe kwam dat dan en wat ga je doen om het
                volgende keer wel te laten lukken?</p>
            <div class="form-group">
                <label for="planning_gehaald">Heb je je planning gehaald?</label>
                <select class="form-control required" id="planning_gehaald" name="planning_gehaald">
                    <option value="">Kiezen</option>
                    <option value="Ja">Ja</option>
                    <option value="Nee">Nee</option>
                </select>
            </div>
            <%if (hasTickets) {%>
            <label>Welke tickets heb je afgerond?</label><br>
            <div id="tickets_checkbox">
                <%for (Ticket ticket : tickets) {%>
                <input type="checkbox" class="ticket_checkbox" value="<%=ticket.getId()%>"
                       title="<%=ticket.getCodeTicket()%>">
                <%=ticket.getVak().getNaam()%> - <%=ticket.getCodeTicket()%><br>
                <%
                    }
                %>
            </div>
            <%
                } // end indien tickets
            %>
            <div class="form-group hidden" id="waarom_niet_gelukt_wrapper">
                <label for="waarom_niet_gelukt">Indien niet gehaald: waarom is het niet gelukt?</label>
                <textarea class="form-control required" id="waarom_niet_gelukt" name="waarom_niet_gelukt"></textarea>
            </div>
            <%}%>
            <h2>Planning komende week</h2>
            <p>Voeg tickets toe. Een punt staat voor een lesuur van een gemiddelde student. Zorg dus dat het aantal
                punten ongeveer overeenkomt met het aantal lesuren op je rooster voor
                Applicatieontwikkeling.</p>
            <div class="row">
                <div class="col-md-6">
                    <label for="select_vak">Kies vak/project</label><br>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <select id="select_vak" class="ignore">
                        <option value="">Kies...</option>
                        <%for (Vak vak : vakken) {%>
                        <option value="<%= vak.getId() %>" data-naam_vak="<%=vak.getNaam()%>"><%= vak.getNaam() %>
                        </option>
                        <%}%>
                    </select>
                </div>
            </div>
            <div id="ticket_kiezer_wrapper" class="hidden">
                <div class="row">
                    <div class="col-md-12">
                        <label>Kies ticket</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4" id="ticket_kiezer">

                    </div>
                    <div class="col-md-8">
                        <button type="button" class="btn btn-primary btn-success btn-sm btn-block"
                                id="btn_select_ticket">Voeg toe
                        </button>
                    </div>
                </div>
            </div>
            <div id="tickets" class="hidden">
                <div class="bs-callout bs-callout-warning">
                    <h2>Tickets komende week</h2>
                    <p>Totaal punten geselecteerde tickets: <span id="totaal_uren">0</span></p>
                    <h3>Tickets</h3>
                    <ul id="tickets_list"></ul>
                </div>
                <%-- Hier komen de geselecteerd tickets --%>
            </div>
            <h3>Zijn er belemmeringen?</h3>
            <p>Geef hier aan of je problemen verwacht. Zijn er nog zaken die je niet begrijpt of nog niet hebt geoefend.
                Heb je hulp nodig van een docent? Met andere woorden: Geef aan of er zaken zijn waar je hulp bij nodig
                hebt.</p>
            <div class="form-group">
                <label for="hulp_nodig">Waar heb je hulp bij nodig?</label>
                <textarea class="form-control" id="hulp_nodig" name="hulp_nodig"></textarea>
            </div>

            <button type="submit" class="btn btn-primary btn-danger btn-lg btn-block" name="submit_planning_btn"
                    id="submit_planning_btn">Submit
            </button>
        </form>
        <div class="verzend-info"></div>
    </div>
</div>
<%@ include file="/AO/daily_standups/includes/bottom.html" %>

<script type="text/javascript">
    $(document).ready(
        function () {
            $('html, body').animate({scrollTop: 0}, 500);
            // configure your validation
            $("#planning_form").validate({
                rules: {
                    groep_kiezer: {required: true},
                    naam_input: {required: true},
                    planning_gehaald: {required: true},
                    waarom_niet_gelukt : {required: true}
                },
                messages: {
                    groep_kiezer: {required: "Selecteer een groep"},
                    naam_input: {required: "Vul je naam in"},
                    planning_gehaald: {required: "Maak een keuze"},
                    waarom_niet_gelukt: {required: "Geef een reden"}
                },
                submitHandler: function (form) {
                    const url = "/AO/planning";
                    let submitBtn = $("#submit_planning_btn");
                    submitBtn.attr('disabled', 'disabled');
                    let formData = $(form).serialize();
                    let tickets = "";
                    $("ul#tickets_list li").each(function () {
                        tickets += '__' + $(this).data('ticket_id');
                    });
                    let ticketsAfgerond = "";
                    $('#tickets_checkbox').find('input:checked').each(function () {
                        ticketsAfgerond += '__' + $(this).val();
                    });
                    if (tickets === "") {
                        alert("Kies minimaal een ticket");
                        submitBtn.removeAttr('disabled');
                    } else {
                        formData += '&ticketIds=' + tickets;
                        if (ticketsAfgerond !== "") {
                            formData += '&ticketsAfgerond=' + ticketsAfgerond;
                        }
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: formData,
                            success: function (data) {
                                location.reload(true);
                            }
                        });
                    }
                    return false; // override default submit
                }
            });
            $("#select_vak").on('change', function () {
                let vak = $("#select_vak").val();
                const url = "/AO/planning";
                $.ajax({
                    type: "GET",
                    url: url,
                    data: {vak: vak},
                    success: function (data) {
                        $("#ticket_kiezer").html(data);
                        $("#ticket_kiezer_wrapper").removeClass('hidden');
                    }
                });
            });
            // on function necessary for dynamically generated elements
            $(document).on('click', '#btn_select_ticket', function () {
                let ticketSelector = $("#ticket_selector");
                let selectedItem = ticketSelector.find(':selected');
                if (!(selectedItem.val() === "Kies")) {
                    let vak = selectedItem.data("vak_naam");
                    if (vak !== null) {
                        let ticketCode = selectedItem.data("code");
                        let ticketId = selectedItem.data("ticket_id");
                        let urenTicket = selectedItem.data("uren");
                        $("#tickets_list").append('<li data-ticket_id=' + ticketId + '>' + vak +
                            ' ' + ticketCode + ' ' + urenTicket + ' punten</li>');
                        let uurSpan = $("#totaal_uren");
                        let totaalUren = Number(uurSpan.text());
                        totaalUren += Number(urenTicket);
                        uurSpan.text(totaalUren);
                        $("#tickets").removeClass('hidden');
                        selectedItem.hide();
                        ticketSelector.val("Kies");
                    }
                }
            });
            $('#planning_gehaald').on('change', function () {
                let keuze = this.value;
                let ticketsCheckbox = $('#tickets_checkbox');
                let hasTickets = ticketsCheckbox.find(':checkbox').length > 0;
                if (keuze === "Ja") {
                    ticketsCheckbox.find(':checkbox').prop('checked', true);
                    $('#waarom_niet_gelukt_wrapper').addClass('hidden');
                } else if (keuze === "Nee") {
                    ticketsCheckbox.find(':checkbox').prop('checked', false);
                    $('#waarom_niet_gelukt_wrapper').removeClass('hidden');
                }
                if (hasTickets) {
                    checkPlanningGehaald();
                }
            });
            $('.ticket_checkbox').on('change', function () {
                checkPlanningGehaald();
            });
            function checkPlanningGehaald() {
                let ticketsCheckbox = $('#tickets_checkbox');
                let ticketCount = ticketsCheckbox.children().length / 2; //break also counts
                let checkedBoxes = ticketsCheckbox.find('input:checked').length;
                if (checkedBoxes < ticketCount) {
                    $('#planning_gehaald').val("Nee");
                    $('#waarom_niet_gelukt_wrapper').removeClass('hidden');
                } else {
                    $('#planning_gehaald').val("Ja");
                    $('#waarom_niet_gelukt_wrapper').addClass('hidden');
                }
            }
        });
</script>
<style>
    #btn_select_ticket {
        width: 8em;
        margin-top: -.3em;
    }

    #submit_planning_btn {
        margin-top: 2em;
        margin-bottom: 2em;
    }

    select {
        margin-bottom: .5em;
    }

    label {
        margin-top: 1em;
        font-weight: bold;
    }
</style>
<%}%>

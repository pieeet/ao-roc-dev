<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 14-02-18
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dailystandups.model.*" %>

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
                tickets = planning.getTicketsSorted();
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
            <div class="row">
                <div class="col-md-6">
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
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
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
                </div>
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
                    <%
                        for (Ticket ticket : tickets) {
                    %>
                    <li><%=ticket.getTicketRegel()%>
                    </li>
                    <%}%>
                </ul>
                <%} else {%>
                <p>Je hebt nog geen tickets</p>
                <%}%>

                <%
                    //oude versie planning
                    if (planning.getPlanning() != null) {
                %>

                <h3>Gepland werk</h3>
                <p><%=planning.getPlanningEsc()%></p>
                <%
                    }
                %>

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
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="planning_gehaald">Heb je je planning gehaald?</label>
                        <select class="form-control required" id="planning_gehaald" name="planning_gehaald">
                            <option value="">Kiezen</option>
                            <option value="Ja">Ja</option>
                            <option value="Nee">Nee</option>
                        </select>
                    </div>
                </div>

            </div>
            <%if (hasTickets) {%>
            <label>Welke tickets heb je afgerond?</label><br>
            <div id="tickets_checkbox">
                <%for (Ticket ticket : tickets) {%>
                <input type="checkbox" class="ticket_checkbox" value="<%=ticket.getId()%>"
                       title="<%=ticket.getCodeTicket()%>">
                <%=ticket.getTicketRegel()%><br>
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
            <p>Voeg tickets toe. Voor een goed studieresultaat moet je ongeveer gemiddeld 25 punten per week halen.</p>
            <div class="row">
                <div class="col-md-12">
                    <label for="select_vak">Kies vak/project</label><br>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
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
                    <div class="col-md-12" id="ticket_kiezer">

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-primary btn-success btn-sm btn-block"
                                id="btn_select_ticket">Voeg toe
                        </button>
                    </div>
                </div>
            </div>

            <div id="custom_ticket_maker" class="hidden">


                <label for="naam_project_input">Naam project</label><br>
                <input id="naam_project_input" class="custom_ticket_input" name="naam_project_input">
                <p class="error hidden" id="error_project_input">Geef een naam</p>


                <label for="ticket_beschrijving_input">Ticket omschrijving</label><br>
                <input id="ticket_beschrijving_input" class="custom_ticket_input"
                       name="ticket_beschrijving_input">
                <p class="error hidden" id="error_omschrijving_ticket">Geef een beschrijvingTicket</p>

                <label for="aantal_uren_input">Inschatting aantal uren</label><br>
                <input type="number" id="aantal_uren_input" class="custom_ticket_input" name="aantal_uren_input">
                <p class="error hidden" id="error_aantal_uren">Vul aantal uren in</p>

                <button type="button" class="btn btn-primary btn-success btn-sm btn-block"
                        id="btn_custom_ticket">Voeg toe
                </button>


            </div>


            <div id="tickets" class="hidden">
                <div class="bs-callout bs-callout-warning">
                    <h2>Tickets komende week</h2>
                    <p>Totaal punten geselecteerde tickets: <span id="totaal_uren">0</span></p>
                    <h3>Tickets</h3>
                    <ul id="tickets_list"><%-- Hier komen de geselecteerd tickets --%></ul>
                </div>

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
                    waarom_niet_gelukt: {required: true}
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
                    if (tickets === "") {
                        alert("Kies minimaal een ticket");
                        submitBtn.removeAttr('disabled');
                    } else {
                        formData += '&ticketIds=' + tickets;
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
                const selectVak = $("#select_vak");
                if ($("#planning_gehaald").find(":selected").text() === "Kiezen") {
                    selectVak.val("");
                    alert("Geef eerst aan of je je planning hebt gehaald");

                } else {
                    const ticketKiezerWrapper = $("#ticket_kiezer_wrapper");
                    const customTicketMaker = $("#custom_ticket_maker");
                    let vakNaam = selectVak.find(':selected').data("naam_vak");
                    if (vakNaam === "Project") {
                        customTicketMaker.removeClass("hidden");
                        if (!ticketKiezerWrapper.hasClass("hidden")) {
                            ticketKiezerWrapper.addClass("hidden");
                        }
                    } else {
                        if (!(customTicketMaker.hasClass("hidden"))) {
                            customTicketMaker.addClass("hidden");
                        }
                        let vakId = selectVak.val();
                        const url = "/AO/planning";
                        $.ajax({
                            type: "GET",
                            url: url,
                            data: {vak: vakId},
                            success: function (data) {
                                $("#ticket_kiezer").html(data);
                                ticketKiezerWrapper.removeClass('hidden');
                            }
                        });
                    }
                }
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
                        verhoogUren(urenTicket);
                        $("#tickets").removeClass('hidden');
                        selectedItem.hide();
                        ticketSelector.val("Kies");
                    }
                }
            });

            function verhoogUren(uren) {
                let uurSpan = $("#totaal_uren");
                let totaalUren = Number(uurSpan.text());
                totaalUren += Number(uren);
                uurSpan.text(totaalUren);
            }

            $('#planning_gehaald').on('change', function () {
                let keuze = this.value;
                let ticketsCheckbox = $('#tickets_checkbox');
                let hasTickets = ticketsCheckbox.find(':checkbox').length > 0;
                if (keuze === "Ja") {
                    ticketsCheckbox.find(':checkbox').prop('checked', true);
                    ticketsCheckbox.find("input").each(function() {
                        let ticketId = $(this).val();
                        setTicketWelGehaald(ticketId);
                    });
                    $('#waarom_niet_gelukt_wrapper').addClass('hidden');
                } else if (keuze === "Nee") {
                    ticketsCheckbox.find(':checkbox').prop('checked', false);
                    ticketsCheckbox.find("input").each(function() {
                        let ticketId = $(this).val();
                        setTicketNietGehaald(ticketId);
                    });
                    $('#waarom_niet_gelukt_wrapper').removeClass('hidden');
                }
                if (hasTickets) {
                    checkPlanningGehaald();
                }
            });
            $('.ticket_checkbox').on('change', function () {
                checkPlanningGehaald();
                let ticketId = $(this).val();
                const url = "/AO/planning";
                if (this.checked) {
                    setTicketWelGehaald(ticketId);
                } else {
                    setTicketNietGehaald(ticketId);
                }

            });

            function setTicketNietGehaald(ticketId) {
                const url = "/AO/planning";
                $.ajax({
                    type: "POST",
                    url: url,
                    data: {
                        change_ticket_afgerond: ticketId,
                        mode: "set_niet_afgerond"
                    },
                    success: function(data) {
                    }
                });
            }

            function setTicketWelGehaald(ticketId) {
                const url = "/AO/planning";
                $.ajax({
                    type: "POST",
                    url: url,
                    data: {
                        change_ticket_afgerond: ticketId,
                        mode: "set_afgerond"
                    },
                    success: function(data) {
                    }
                });
            }


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

            $(document).on('click', '#btn_custom_ticket', function () {
                let projectNaam = $("#naam_project_input").val();
                if (projectNaam === "") {
                    $("#error_project_input").removeClass("hidden");
                    return;
                } else {
                    $("#error_project_input").addClass("hidden");
                }
                let ticketBeschrijving = $("#ticket_beschrijving_input").val();
                if (ticketBeschrijving === "") {
                    $("#error_omschrijving_ticket").removeClass('hidden');
                    return;
                } else {
                    $("#error_project_input").addClass("hidden");
                }
                let aantalUur = $("#aantal_uren_input").val();
                let aantalUurNumber = Math.ceil(aantalUur);
                if (isNaN(aantalUurNumber) || aantalUurNumber === 0) {
                    $("#error_aantal_uren").removeClass('hidden');
                    return;
                } else {
                    $("#error_project_input").addClass("hidden");

                }
                $("#custom_ticket_maker").find(".error").addClass('hidden');
                const selectVak = $("#select_vak");
                let vakId = selectVak.val();
                let vak = selectVak.find(":selected").text();

                const url = "/AO/planning";
                $.ajax({
                    type: "POST",
                    url: url,
                    data: {
                        maak_project_ticket: "x",
                        project_naam: projectNaam,
                        beschrijving_ticket: ticketBeschrijving,
                        aantal_uur: aantalUur,
                        vak_id: vakId
                    },
                    success: function (data) {
                        $("#tickets_list").append('<li data-ticket_id=' + data + '>' + projectNaam +
                            ' - ' + ticketBeschrijving + ' - ' + aantalUur + ' punten</li>');
                        verhoogUren(aantalUur);
                        $("#tickets").removeClass('hidden');
                        $(".custom_ticket_input").val("");

                    }
                });
            });

            $("input.ticket_checkbox").change(function() {

            });

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

    div#custom_ticket_maker input {
        width: 100%;
    }

    button#btn_custom_ticket {
        margin-top: 2em;
    }
    button#btn_select_ticket {
        margin-top: .5em;
    }

</style>
<%}%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dailystandups.model.Vak" %>
<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 08-03-18
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%
    @SuppressWarnings("unchecked")
    ArrayList<Vak> vakken = (ArrayList<Vak>) request.getAttribute("vakken");
    if (vakken == null) {
        response.sendRedirect("/AO/planning/admin");
    } else {
%>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/daily_standups/includes/zijmenu.jsp" %>
    <div class="col-md-8">
        <h2>Voeg vak/project toe</h2>
        <form role="form" id="voeg_vak_toe_form">

            <div class="form-group">
                <label for="naam_vak_input">Naam</label>
                <input class="form-control required" id="naam_vak_input" name="naam_vak_input"
                       placeholder="Naam">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-danger" name="submit_vak_btn"
                        id="submit_vak_btn">Submit
                </button>
            </div>
        </form>
        <h2>Voeg ticket toe</h2>
        <form role="form" id="voeg_ticket_toe_form">
            <%
                if (vakken.isEmpty()) {
            %>
            <p>Nog geen vakken</p>
            <%
            } else {
            %>
            <div class="form-group">
                <label for="vak_kiezer">Kies vak/project</label>
                <select class="form-control required" id="vak_kiezer" name="vak_kiezer">
                    <option value="">Kiezen</option>
                    <%
                        for (Vak vak : vakken) {
                    %>
                    <option value="<%=vak.getId()%>"><%=vak.getNaam()%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="ticket_code_input">Maak code</label>
                <p>Tickets worden alfabetisch op code gesorteerd.</p>
                <input class="form-control required" id="ticket_code_input" name="ticket_code_input"
                       placeholder="code">
            </div>
            <div class="form-group">
                <label for="ticket_uren_input">Aantal uren (int) </label>
                <input type="number" class="form-control required" id="ticket_uren_input" name="ticket_uren_input"
                       placeholder="Aantal uur">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-danger" name="submit_ticket_btn"
                        id="submit_ticket_btn">Submit
                </button>
            </div>
            <%
                }
            %>
        </form>
        <h2>Beheer vakken &amp; tickets</h2>
        <div class="row">
            <div class="col-md-12">
                <%
                    if (vakken.isEmpty()) {
                %>
                <p>Je hebt nog geen vakken.</p>
                <%
                    } else {
                %>

                <label for="select_vak">selecteer een vak</label><br>
                <select id="select_vak">
                    <option value="">Kies...</option>
                    <%for (Vak vak : vakken) {%>
                    <option value="<%= vak.getId() %>" data-naam_vak="<%=vak.getNaam()%>"><%= vak.getNaam() %>
                    </option>
                    <%}%>
                </select>
                <%
                    }
                %>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="loading_img_container hidden" id="loading_tickets">
                    <img src="<c:url value="/images/ajax-loader.gif"/>">
                </div>
                <div class="beheer_vak_ticket_wrapper hidden">
                    <div id="beheer_vak">
                        <label for="wijzig_naam_vak">Wijzig/verwijder vak</label><br>
                        <input class="form-control" id="wijzig_naam_vak" data-vak_id=""><br>

                        <button type="submit" class="btn btn-primary btn-danger" id="btn_wijzig_naam_vak"
                                value="wijzig" disabled>wijzig
                        </button>
                        <button type="submit" class="btn btn-primary btn-danger" id="btn_verwijder_vak"
                                value="verwijder">verwijder
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-md-12" id="beheer_tickets"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<%@ include file="/AO/daily_standups/includes/bottom.html" %>
<script type="text/javascript">
    $(document).ready(
        function () {
            // configure your validation
            $("#voeg_vak_toe_form").validate({
                rules: {
                    naam_vak_input: {required: true}
                },
                messages: {
                    naam_vak_input: {required: "Geef een naam"}
                },
                submitHandler: function (form) {
                    const url = "/AO/planning/admin";
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
            $("#voeg_ticket_toe_form").validate({
                rules: {
                    vak_kiezer: {required: true},
                    ticket_code_input: {required: true},
                    ticket_uren_input: {
                        required: true,
                        number: true
                    }
                },
                messages: {
                    vak_kiezer: {required: "Kies een vak/project"},
                    ticket_code_input: {required: "Geef een code"},
                    ticket_uren_input: {
                        required: "Geef aantal uren aan",
                        number: "alleen cijfers toegestaan"
                    }
                },
                submitHandler: function (form) {
                    const url = "/AO/planning/admin";
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
            const selectVak = $("#select_vak");
            selectVak.on('change', function () {
                const beheerWrapper = $(".beheer_vak_ticket_wrapper");
                const naamVak = selectVak.find(':selected').data("naam_vak");
                const vakId = selectVak.val();
                if (naamVak !== "") {
                    $("#btn_wijzig_naam_vak").prop('disabled', true);
                    if (!(beheerWrapper.hasClass('hidden'))) {
                        beheerWrapper.addClass('hidden');
                    }
                    $("#loading_tickets").removeClass('hidden');
                    // $("#beheer_vak").removeClass('hidden');
                    const wijzigVakInput = $("#wijzig_naam_vak");
                    wijzigVakInput.val(naamVak);
                    wijzigVakInput.data("vak_id", vakId);
                    selectVak.val("");
                    const url = "/AO/planning/admin";
                    $.ajax({
                        type: "GET",
                        url: url,
                        data: {vak: vakId},
                        success: function (data) {
                            const beheerTickets = $("#beheer_tickets");
                            beheerTickets.html(data);
                            $("#loading_tickets").addClass('hidden');
                            // beheerTickets.removeClass('hidden');
                            beheerWrapper.removeClass('hidden');
                        }
                    });
                }
            });
            $(document).on("input", "#wijzig_naam_vak", function () {
                $("#btn_wijzig_naam_vak").removeAttr('disabled');
            });
            $(document).on("click", "#btn_wijzig_naam_vak", function () {
                $("#btn_wijzig_naam_vak").prop('disabled', true);
                const wijzigNaamVak = $("#wijzig_naam_vak");
                const naamVak = wijzigNaamVak.val();
                const vakId = wijzigNaamVak.data("vak_id");
                $.ajax({
                    type: "POST",
                    url: "/AO/planning/admin",
                    data: {
                        wijzig_vak: "x",
                        naam_vak: naamVak,
                        vak_id: vakId
                    },
                    success: function (data) {
                        if (data === "ok") {
                            alert("Naam is veranderd");

                        } else {
                            alert("Naam is niet veranderd. Probeer opnieuw of herlaad de pagina");
                        }

                    }
                });
            });
            $(document).on('click', "#btn_verwijder_vak", function () {
                const wijzigNaamVak = $("#wijzig_naam_vak");
                const naamVak = wijzigNaamVak.val();
                const vakId = wijzigNaamVak.data("vak_id");
                const confirmed = confirm("Wil je " + naamVak + " definitief verwijderen?");
                if (confirmed) {
                    $.ajax({
                        type: "POST",
                        url: "/AO/planning/admin",
                        data: {
                            vak_id: vakId,
                            verwijder_vak: "x"
                        },
                        success: function (data) {
                            if (data === "ok") {
                                location.reload(true);
                            } else {
                                alert("Vak kon niet worden verwijderd. Probeer opnieuw of herlaad de pagina");
                            }
                        }
                    });
                }
            });
            $(document).on('input', ".input_code, .input_uren", function() {
                const parent = $(this).parent();
                const wijzigBtn = parent.find(".wijzig_ticket_btn");
                wijzigBtn.removeAttr('disabled');
            })


            $(document).on('click', ".wijzig_ticket_btn", function () {
                const parent = $(this).parent();
                parent.find(".wijzig_ticket_btn").prop('disabled', true);
                const ticketId = parent.data("ticket_id");
                const codeTicket = parent.find(".input_code").val();
                const urenTicketInput = parent.find(".input_uren");
                const urenTicket = urenTicketInput.val();
                if (!($.isNumeric(urenTicket))) {
                    urenTicketInput.val("");
                    urenTicketInput.attr("placeholder", "vul geheel getal in");
                } else {
                    $.ajax({
                        type: "POST",
                        url: "/AO/planning/admin",
                        data: {
                            wijzig_ticket: "x",
                            ticket_id: ticketId,
                            code_ticket: codeTicket,
                            aantal_uren: urenTicket
                        },
                        success: function (data) {
                            if (data === "ok") {
                                alert("Ticket wijzigen gelukt");
                            } else {
                                alert("Ticket wijzigen niet gelukt. Probeer opnieuw of herlaad de pagina");
                            }
                        }
                    });
                }
            });
            $(document).on('click', ".verwijder_ticket_btn", function () {
                const parent = $(this).parent();
                const ticketId = parent.data("ticket_id");
                const codeTicket = parent.find(".input_code").val();
                const confirmed = confirm("Wil je " + codeTicket + " definitief verwijderen?");
                if (confirmed) {
                    $.ajax({
                        type: "POST",
                        url: "/AO/planning/admin",
                        data: {
                            verwijder_ticket: "x",
                            ticket_id: ticketId
                        },
                        success: function (data) {
                            if (data === "ok") {
                                alert("Ticket verwijderen gelukt");
                                parent.hide();
                            } else {
                                alert("Ticket verwijderen niet gelukt. Probeer opnieuw of herlaad de pagina");
                            }
                        }
                    });
                }
            });
            $('#tickets_maken').addClass('selected');
        });
</script>
<%
    }
%>
<style>
    .ticket_wrapper {
        border: 1px solid;
        padding: 10px;
        box-shadow: 2px 5px #888888;
        margin-top: 2em;
    }

    select#select_vak {
        margin-bottom: 2em;
    }
</style>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dailystandups.model.Ticket" %>
<%@ page import="dailystandups.model.Planning" %>
<%@ page import="dailystandups.model.StandUpUser" %>
<%@ page import="dailystandups.model.ProjectTicket" %><%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 23-02-18
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>

<%
    @SuppressWarnings("unchecked")
    ArrayList<Planning> planningen = (ArrayList<Planning>) request.getAttribute("planningen");
    @SuppressWarnings("unchecked")
    ArrayList<Ticket> afgerondeTickets = (ArrayList<Ticket>) request.getAttribute("afgerondetickets");
    StandUpUser standUpUser = (StandUpUser) request.getAttribute("standupuser");
    if (planningen == null || standUpUser == null) {
        response.sendRedirect("/AO/planning");
    } else {
%>


<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%--<%@ include file="/AO/daily_standups/includes/zijmenu.jsp" %>--%>
    <div class="row">
        <div class="col-md-12">
            <h2>Afgeronde tickets <%=standUpUser.getNaamEsc()%>
            </h2>
            <div class="bs-callout bs-callout-succes">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="no_bullet">
                            <%
                                int aantalPunten = 0;
                                for (Ticket ticket : afgerondeTickets) {
                                    aantalPunten += ticket.getAantalUren();
                            %>
                            <li class="custom_img list-group-item col-xs-6"><%=ticket.getTicketRegel()%><br>

                                <%
                                    if (ticket instanceof ProjectTicket && ((ProjectTicket) ticket).getApproved() != null) {
                                %>
                                <p>Akkoord: <%=((ProjectTicket) ticket).getApproved()%></p>

                                <%
                                    }
                                %>

                                <button type="button" class="delete_ticket_afgerond btn btn-primary btn-warning btn-sm"
                                        data-ticketid="<%=ticket.getId()%>">delete</button></li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h3>Totaal punten: <%=aantalPunten%>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive" id="plannings_tabel">
                <table class="table table-bordered table-condensed">
                    <tr>
                        <th>Datum/tijd</th>
                        <th>Tickets</th>
                        <th>Nog te doen</th>
<%--                        <th>Hulp nodig</th>--%>
                        <th>Reden niet af</th>
                    </tr>
                    <%
                        for (Planning p : planningen) {
                            Ticket[] tickets = p.getTickets();
                            StringBuilder geplandeTickets = new StringBuilder();
                            for (Ticket ticket : tickets) {
                                geplandeTickets.append(ticket.getTicketRegel()).append("<br>");
                            }
                            StringBuilder ticketsNietAf = new StringBuilder();
                            for (Ticket ticket : tickets) {
                                if (ticket.getIsAfgerond() <= 0) {
                                    ticketsNietAf.append(ticket.getTicketRegel()).append("<br>");
                                }
                            }
                    %>
                    <tr>
                        <td><%=p.getEntryDateFormat()%>
                        </td>
                        <td><%=geplandeTickets.toString()%>
                        </td>
                        <td><%=ticketsNietAf.toString()%>
                        </td>
<%--                        <td><%=p.getBelemmeringenEsc()%>--%>
<%--                        </td>--%>
                        <td><%=p.getRedenNietAfEsc()%>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</div>
<%@ include file="/AO/daily_standups/includes/bottom.html" %>
<style>
    li.custom_img {
        background: url('/images/check_box_clipart_24px.png') no-repeat left top;
        padding: 1px 0 3px 25px;
        /* reset styles (optional): */
        list-style: none;
        margin: 0;
    }

    .delete_ticket_afgerond {
        margin: .5em 0;
    }
</style>

<script>
    $(document).ready(function () {
        $(document).on('click', ".delete_ticket_afgerond", function () {
            let ticketId = $(this).data('ticketid');
            let email = "<%= standUpUser.getEmail()%>";
            $.ajax({
                type: "POST",
                url: "/AO/planning/studentplanningen",
                data: {
                    setticketnietafgerond: "true",
                    ticketid: ticketId,
                    email: email
                },
                success: function (data) {
                    if (data === "ok") {
                        location.reload(true);
                    } else {
                        alert("Er is iets mis gegaan. Herlaad pagina en probeer opnieuw.");
                    }
                }
            });

        });
    });
</script>


<%
    }
%>
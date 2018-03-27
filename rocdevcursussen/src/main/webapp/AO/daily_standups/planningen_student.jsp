<%@ page import="java.util.ArrayList" %>
<%@ page import="dailystandups.model.Ticket" %>
<%@ page import="dailystandups.model.Planning" %><%--
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
    if (planningen == null) {
        response.sendRedirect("/AO/planning");
    } else {
%>


<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%--<%@ include file="/AO/daily_standups/includes/zijmenu.jsp" %>--%>

    <div class="col-md-12">

        <h2>Afgeronde tickets</h2>
        <ul>
            <%
                int aantalPunten = 0;
                for (Ticket ticket : afgerondeTickets) {
                    aantalPunten += ticket.getAantalUren();
            %>

            <li><%=ticket.getTicketRegel()%>
            </li>

            <%
                }
            %>

        </ul>
        <h3>Totaal punten: <%=aantalPunten%></h3>
        <div class="table-responsive" id="plannings_tabel">

            <table class="table table-bordered table-condensed">
                <tr>
                    <th>Datum/tijd</th>
                    <th>Tickets</th>
                    <th>Nog te doen</th>
                    <th>Hulp nodig</th>
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
                    <td><%=p.getBelemmeringenEsc()%>
                    </td>
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


<%@ include file="/AO/daily_standups/includes/bottom.html" %>

<%
    }
%>
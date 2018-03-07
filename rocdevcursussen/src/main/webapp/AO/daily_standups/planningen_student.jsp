<%@ page import="java.util.ArrayList" %>
<%@ page import="dailystandups.Planning" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 23-02-18
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>

<%
    @SuppressWarnings("unchecked")
    ArrayList<Planning> planningen = (ArrayList<Planning>) request.getAttribute("planningen");
    if (planningen == null) {
        response.sendRedirect("/AO/planning");
    } else {
%>


<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%--<%@ include file="/AO/daily_standups/includes/zijmenu.jsp" %>--%>

    <div class="col-md-12">

        <div class="table-responsive" id="plannings_tabel">

            <table class="table table-bordered table-condensed">
            <tr>
                <th>Datum/tijd</th>
                <th>Planning</th>
                <th>Hulp nodig</th>
                <th>Voltooid</th>
                <th>Wel gedaan</th>
                <th>Nog te doen</th>
                <th>Reden niet af</th>
            </tr>
            <%
                for (Planning p: planningen) {
            %>
            <tr>
                <td><%=p.getDateFormat()%></td>
                <td><%=p.getPlanningEsc()%></td>
                <td><%=p.getBelemmeringenEsc()%></td>
                <td><%=p.getAfgerondString()%></td>
                <td><%=p.getGedaanEsc()%></td>
                <td><%=p.getNogTeDoenEsc()%></td>
                <td><%=p.getRedenNietAfEsc()%></td>
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
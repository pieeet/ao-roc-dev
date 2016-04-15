<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 09-03-16
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jspcursus.rekenmachinedemo.Rekenmachine" %>

<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/JSP_Java_DB/includes/zijmenu.jsp" %>

<%
// Rekenmachine
    String uitkomst = "";
    String foutboodschap = "";


    if (request.getParameter("functie") != null) {
        String getal1 = request.getParameter("getal_1");
        String getal2 = request.getParameter("getal_2");
        String functie = request.getParameter("functie");

        Rekenmachine rm = new Rekenmachine(getal1, getal2, functie);
        uitkomst = rm.getUitkomst();
        foutboodschap = rm.getFoutboodschap();
    }




%>

<h2>Rekenmachine</h2>


<form action="" method="get">
    <table id="rekenmachine">

        <tr>
            <th colspan="2">Eerste getal</th>
            <th colspan="2">Tweede getal</th>
        </tr>
        <tr>
            <td colspan="2"><input name="getal_1" value="<%= uitkomst %>">
            </td>
            <td colspan="2"><input name="getal_2"></td>
        </tr>
        <tr>
            <td><input type="submit" name="functie" value="+"></td>
            <td><input type="submit" name="functie" value="-"></td>
            <td><input type="submit" name="functie" value="X"></td>
            <td><input type="submit" name="functie" value="/"></td>
        </tr>
        <tr>
            <td colspan="4">
                <%= foutboodschap %>
            </td>
        </tr>


    </table>
</form>
</div>

<%@ include file="/AO/JSP_Java_DB/includes/bottom.html" %>

</html>

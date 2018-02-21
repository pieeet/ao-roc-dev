<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 19-02-18
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/daily_standups/includes/zijmenu.jsp" %>

    <div class="col-md-7">



        <div class="form-group">
            <label for="cohort_kiezer">Select list:</label>
            <select class="form-control" id="cohort_kiezer">
                <option>2015</option>
                <option>2016</option>
                <option>2017</option>
            </select>
        </div>




        <table>
            <tr>
                <th>Naam</th>
                <th>Plannen </th>
                <th>Hulp nodig</th>
            </tr>




        </table>




    </div>

</div>
<%@ include file="/AO/daily_standups/includes/bottom.html" %>
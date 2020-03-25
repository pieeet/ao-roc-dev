<%@ page import="dailystandups.model.Groep" %>
<%@ page import="dailystandups.model.StandUpUser" %><%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 24/03/2020
  Time: 07:15
  To change this template use File | Settings | File Templates.
--%>

<%
    User admin = UserServiceFactory.getUserService().getCurrentUser();
    if (!AuthUtils.isAdmin(admin)) {
        response.sendRedirect("/");
    } else {
        StandUpUser student = null;
        String error = null;
        if (request.getAttribute("student") != null) {
            student = (StandUpUser) request.getAttribute("student");

        } else {
            error = (String) request.getAttribute("error");
        }
%>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/daily_standups/includes/zijmenu.jsp" %>
    <div class="col-md-8">
        <div class="row">
            <div class="col-md-6">
                <h3>Zoek student</h3>
                <form role="form" id="email-form" action="/AO/planning/admin/datastudent">
                    <div class="form-group">
                        <label for="email">zoek op roc-dev email</label>
                        <input class="form-control" type="text" value="" name="email" id="email">
                        <%
                            if (error != null) {
                        %>
                        <p class="error"><%= error %>
                        </p>
                        <%
                            }
                        %>

                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-danger" name="getstudentbtn">
                    </div>

                </form>

            </div>
        </div>


        <%
            if (student != null) {
        %>
        <div class="row">
            <div class="col-md-6">
                <h3>Wijzig student</h3>
                <form role="form" action="/AO/planning/admin/datastudent" method="POST">
                    <div class="form-group">
                        <label for="naam">naam</label>
                        <input class="form-control" type="text" name="naam" id="naam"
                               value="<%= student.getNaamEsc()%>">
                    </div>

                    <input type="hidden" name="email" value="<%= student.getEmail()%>">


                    <div class="form-group">
                        <label for="groep">groep</label>
                        <select class="form-control" name="groep" id="groep">
                            <%
                                for (Groep groep : Groep.values()) {
                                    if (groep.getNaam().equals(student.getGroep())) {
                            %>
                            <option value="<%= groep.getNaam()%>" selected><%= groep.getNaam()%>
                            </option>
                            <%
                            } else {
                            %>
                            <option value="<%= groep.getNaam()%>"><%= groep.getNaam()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>


                        <%--                        <input class="form-control" type="text" name="groep" id="groep" value="<%= student.getGroepEsc()%>">--%>
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="email" value="<%= student.getEmail()%>">
                        <label for="status">status</label>
                        <select class="form-control" name="status" id="status">
                            <%
                                for (int i = 0; i < StandUpUser.statussen.length; i++) {
                            %>

                            <%
                                if (i == student.getStatus()) {
                            %>
                            <option value="<%= i %>" selected><%= StandUpUser.statussen[i]%>
                            </option>
                            <%
                            } else {
                            %>
                            <option value="<%= i %>"><%= StandUpUser.statussen[i]%>
                            </option>

                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>

                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-danger" name="changestudentbtn">
                    </div>
                </form>
                <a href="/AO/planning/studentplanningen?email=<%= student.getEmail()%>" target="_blank">Overzicht
                    tickets en planningen</a><br>
            </div>
        </div>

        <%
            }
        %>
    </div>
</div>
<%@ include file="/AO/daily_standups/includes/bottom.html" %>
<script type="text/javascript">
    $(document).ready(function() {
        $('#data_student').addClass('selected');
    })
</script>
<%

    }
%>


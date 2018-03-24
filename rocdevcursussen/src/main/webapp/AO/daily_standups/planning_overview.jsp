<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 19-02-18
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>

<%
    if (request.getAttribute("fromserver") == null) {
        response.sendRedirect("/AO/planningoverview");

    } else {
%>

<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

    <%@ include file="/AO/daily_standups/includes/zijmenu.jsp" %>

    <div class="col-md-8">


        <form role="form" id="planning_overview_form">
            <div class="form-group">
                <label for="cohort_kiezer">Cohort:</label>
                <select class="form-control" id="cohort_kiezer" name="cohort_kiezer">
                    <option value="kies">Kiezen...</option>
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                    <option value="2017">2017</option>
                </select>
            </div>
        </form>

        <div class="table-responsive" id="plannings_tabel">

        </div>

        <div id="img_container" class="hidden">
            <img src="<c:url value="/images/ajax-loader.gif"/>">
        </div>

    </div>


</div>

<%@ include file="/AO/daily_standups/includes/bottom.html" %>

<script type="text/javascript">
    $(document).ready(
        function () {
            let cohortKiezer = $('#cohort_kiezer');
            cohortKiezer.on('change', function() {
                let imgContainer = $('#img_container');
                imgContainer.removeClass('hidden');
                let planningsTabel = $("#plannings_tabel");
                planningsTabel.html("");
                let data = cohortKiezer.val();
                if (data !== "kies") {
                    const url = "/AO/planning/admin/planningoverzicht";
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: {cohort: data},
                        success: function (data) {
                            planningsTabel.html(data);
                            imgContainer.addClass('hidden');
                            cohortKiezer.val("kies");

                        }
                    });
                }
            });
            $(document).on("click", ".klik_user", function() {
                let email = $(this).data("email");
                window.location = "/AO/planning/studentplanningen?email=" + email;
            })
            $('#overzicht_planningen').addClass('selected');
        });


</script>
<%
    }
%>

<style>
    div#img_container {
        width: 64px;
        height: 64px;
        margin-left: auto;
        margin-right:auto;
    }
</style>
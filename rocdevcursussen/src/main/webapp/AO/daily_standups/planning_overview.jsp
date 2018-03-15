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
    <%--<%@ include file="/AO/daily_standups/includes/zijmenu.jsp" %>--%>

    <div class="col-md-12">


        <form role="form" id="planning_overview_form">
            <div class="form-group">
                <label for="cohort_kiezer">Cohort:</label>
                <select class="form-control" id="cohort_kiezer" name="cohort_kiezer">
                    <option value="">Kiezen...</option>
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                    <option value="2017">2017</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary btn-danger" name="kies_cohort_btn"
                    id="kies_cohort_btn">Haal gegevens
            </button>
        </form>

        <div class="table-responsive" id="plannings_tabel">

        </div>
    </div>


</div>

<%@ include file="/AO/daily_standups/includes/bottom.html" %>

<script type="text/javascript">
    $(document).ready(
        function () {
            // configure your validation
            $("#planning_overview_form").validate({
                rules: {
                    cohort_kiezer: {required: true},
                },
                messages: {
                    cohort_kiezer: {required: "Selecteer een cohort"},
                },
                submitHandler: function (form) {
                    const url = "/AO/planning__";
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: $(form).serialize(),
                        success: function (data) {
                            $("#plannings_tabel").html(data);
                        }
                    });
                    return false; // override default submit
                }
            });
            $(document).on("click", ".klik_user", function() {
                var email = $(this).data("email");
                window.location = "/AO/student__?email=" + email;
            })
        });

</script>
<%
    }
%>
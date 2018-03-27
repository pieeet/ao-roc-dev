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
                <input class="form-control required" id="ticket_code_input" name="ticket_code_input"
                       placeholder="code">
            </div>
            <div class="form-group">
                <label for="ticket_uren_input">Aantal uren</label>
                <input class="form-control required" id="ticket_uren_input" name="ticket_uren_input"
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
                    vak_kiezer: {required: "Kies een vak/projectNaam"},
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
            $('#tickets_maken').addClass('selected');
        });

</script>

<%
    }
%>
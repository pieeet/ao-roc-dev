<%@ page import="dailystandups.model.Hulpvraag" %>
<%@ page import="dailystandups.model.Vak" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 18/03/2020
  Time: 06:54
  To change this template use File | Settings | File Templates.
--%>
<%
    ArrayList<Vak> vakken = (ArrayList<Vak>) request.getAttribute("vakken");
    ArrayList<Hulpvraag> vragen = (ArrayList<Hulpvraag>) request.getAttribute("vragen");
    User user2 = UserServiceFactory.getUserService().getCurrentUser();
    boolean isAdmin = AuthUtils.isAdmin(user2);
%>


<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h2>Maak Hulp-Ticket</h2>
            <p>Soms zijn er zoveel vragen dat er een soort file ontstaat. Om dit een beetje in goede banen te leiden
            kun je een ticket maken, Tickets worden zoveel mogelijk op volgorde behandeld op basis van &quot;first
            come first serve&quot;. Als je nog even moet wachten blijf dan zelf proberen om je probleem op te lossen.
            Probeer te googlen, vraag je medestudenten etc. Problemen oplossen is &eacute;&eacute;n van de belangrijkste
            kwaliteiten van een software developer.</p>

            <form role="form" id="hulpvraag-form">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="vak_kiezer">Vak</label>
                        <select class="form-control required" id="vak_kiezer" name="vak_kiezer">
                            <option value="0" selected>Kies...</option>
                            <%
                                for (Vak vak : vakken) {
                            %>
                            <option value="<%=vak.getNaam()%>"><%=vak.getNaam()%>
                            </option>
                            <%
                                }
                            %>

                        </select>
                        <p class="error" id="vak-warning" hidden>Kies een vak</p>
                        <small class="form-text text-muted">Als het niet om een specifiek vak gaat kies je
                            Project/Overig.</small>

                    </div>
                    <div class="form-group">
                        <label for="hulpvraag">Beschrijf je hulpvraag</label>
                        <textarea class="form-control required" id="hulpvraag"
                                  name="hulpvraag"></textarea>
                        <p class="error" id="vraag-warning" hidden>Formuleer je vraag</p>
                        <small class="form-text text-muted">Wees zo specifiek mogelijk. Dus welk hoofdstuk, welke
                            opdracht
                            etc.</small>
                    </div>

                    <button type="button" class="btn btn-primary btn-success btn-lg btn-block"
                            name="submit_hulpvraag_btn"
                            id="submit_hulpvraag_btn">Submit
                    </button>

                </div>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-10">
            <h2>Openstaande tickets</h2>
            <div class="table-responsive">
                <table class="table table-bordered table-condensed">
                    <thead>
                    <tr>
                        <th>Datum</th>
                        <th>Email Student</th>
                        <th>Vak</th>
                        <th>Hulpvraag</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (Hulpvraag hulpvraag : vragen) {
                    %>
                    <tr>
                        <td><%= hulpvraag.getEntryDateFormat()%>
                        </td>
                        <td><%= hulpvraag.getEmailUser()%>
                        </td>
                        <td><%= hulpvraag.getVakEsc()%>
                        </td>
                        <td><%= hulpvraag.getHulpvraagEsc()%>
                        </td>
                        <%
                            if (user.getEmail().equals(hulpvraag.getEmailUser()) || isAdmin) {
                        %>
                        <td>
                            <button type="button" class="btn btn-primary btn-warning btn-delete"
                            data-id="<%= hulpvraag.getId()%>">delete</button>
                        </td>

                        <%
                            }
                        %>

                    </tr>

                    <%
                        }
                    %>
                    </tbody>

                </table>
            </div>

        </div>
    </div>



    <br><br><br><br><br>
    <%@ include file="/AO/daily_standups/includes/bottom.html" %>

    <script type="text/javascript">
        $(document).ready(function () {
            const url = "/AO/planning/hulpvraag";
            $("h1#page-title-heading").text("Hulp-Tickets");
            let submit_btn = $("#submit_hulpvraag_btn");
            submit_btn.click(function () {
                submit_btn.attr("disabled", true);
                submit_btn.text("...");
                let vak = $("#vak_kiezer").val();
                let vraag = $("#hulpvraag").val();

                if (vak === "0") {
                    $("#vak-warning").removeAttr("hidden");
                    submit_btn.attr("disabled", false);
                    submit_btn.text("Submit");
                } else if (vraag.length < 4) {
                    $("#vraag-warning").removeAttr("hidden");
                    submit_btn.attr("disabled", false);
                    submit_btn.text("Submit");
                } else {
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: {
                            vak: vak,
                            vraag: vraag,
                            submit_hulpvraag: ""
                        },
                        success: function (data) {
                            if (data === 'ok') {
                                setTimeout(function () {
                                    location.reload();
                                }, 400);
                            } else {
                                alert(data);
                            }
                        }
                    });
                }
            });
            $(".btn-delete").click(function() {
                let btn = $(this);
                btn.attr("disabled", true);
                btn.text("...");
                const id = btn.data('id');
                $.ajax({
                    type: "POST",
                    url: url,
                    data: {
                        delete_hulpvraag: "",
                        id: id
                    },
                    success: function (data) {
                        if (data ==='ok') {
                            setTimeout(function() {
                                location.reload();
                            }, 400);
                        } else {
                            alert(data);
                        }
                    }
                });
            });
        });
    </script>
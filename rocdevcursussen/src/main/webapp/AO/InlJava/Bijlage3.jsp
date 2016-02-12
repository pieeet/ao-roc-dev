<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

    <%@ include file="/AO/InlJava/includes/zijmenu.jsp" %>

    <div class="col-md-9">
        <h2>Bijlage 3 Tabellen logische operatoren</h2>
        <h3> de en-tabel</h3>
        <table class="table table-striped">
            <tr>
                <th>Eerste voorwaarde</th>
                <th>Tweede voorwaarde</th>
                <th>Resultaat van &amp;&amp;</th>
            <tr>
                <td>true</td>
                <td>true</td>
                <td>true</td>
            </tr>
            <tr>
                <td>true</td>
                <td>false</td>
                <td>false</td>
            </tr>
            <tr>
                <td>false</td>
                <td>false</td>
                <td>false</td>
            </tr>
            <tr>
                <td>false</td>
                <td>true</td>
                <td>false</td>
            </tr>
        </table>
        <h3>de of-tabel</h3>
        <table class="table table-striped">
            <tr>
                <th>Eerste voorwaarde</th>
                <th>Tweede voorwaarde</th>
                <th>Resultaat van ||</th>
            <tr>
                <td>true</td>
                <td>true</td>
                <td>true</td>
            </tr>
            <tr>
                <td>true</td>
                <td>false</td>
                <td>true</td>
            </tr>
            <tr>
                <td>false</td>
                <td>false</td>
                <td>false</td>
            </tr>
            <tr>
                <td>false</td>
                <td>true</td>
                <td>true</td>
            </tr>
        </table>
        <h3>de niet-tabel</h3>
        <table class="table table-striped">
            <tr>
                <th>voorwaarde</th>
                <th>resultaat van !</th>
            <tr>
                <td>true</td>
                <td>false</td>
            </tr>
            <tr>
                <td>false</td>
                <td>true</td>
            </tr>

        </table>
    </div>
</div>

<%@ include file="/AO/InlJava/includes/bottom.html" %>
</html>
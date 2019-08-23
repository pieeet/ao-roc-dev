<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/InlJava/includes/zijmenu.jsp" %>
    <div class="col-md-9">


        <style>
            .media-left {
                width: 30%;
            }
            img {
                border-radius: 15px;
            }
        </style>

        <div class="media">
            <div class="media-left">
                <img src="/images/Ton_van_Beuningen.png"/>
            </div>
            <div class="media-body">
                <h3>Inleiding Java</h3>
                <p>De cursus Inleiding Java is oorspronkelijk ontwikkeld door Ton van Beuningen, de &quot;Founding
                Father&quot; van de opleiding Applicatieontwikkeling. Inmiddels hebben vele generaties studenten
                    de eerste beginselen van het programmeren met behulp van deze cursus geleerd. Sinds Juli 2019 geniet
                    Ton van een welverdiend pensioen.</p>
                <p>De cursus bestaat uit 14 hoofdstukken waarin de basisprincipes van het programmeren worden
                    behandeld. Principes die in vrijwel iedere programmeertaal worden gebruikt.
                    Ieder hoofdstuk heeft een aantal opdrachten. Door deze opdrachten zo zelfstandig
                    mogelijk te maken leer je programmeren door het in de praktijk toe te passen.</p>
            </div>
        </div>

    </div>
</div>
<%@ include file="/AO/InlJava/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#ij-h0").addClass("selected");
    })
</script>
</html>
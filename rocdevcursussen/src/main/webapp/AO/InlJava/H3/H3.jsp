<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

	<%@ include file="/AO/InlJava/includes/zijmenu.jsp"%>

	<div class="col-md-9">
		<h2>H3 Verschil applicatie en applet</h2>
		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>

			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je:</p>
			<ul>
				<li>begrijpt wat het verschil is tussen een applet en een
					applicatie.</li>

			</ul>

		</div>
		<div id="artikel">

			<h4>Theorie</h4>
			<p>Een applicatie is een programma dat buiten de webbrowser of
				buiten een appletviewer kan worden uitgevoerd. Dit geldt voor alle
				applicaties in welke programmeertaal dan ook geschreven. Een
				applicatie geschreven in Java, heeft wel JVM (Java Virtual Machine)
				nodig om uitgevoerd te kunnen worden. Een applet kan alleen in een
				webbrowser of appletviewer uitgevoerd worden. Een applet is namelijk
				altijd een onderdeel van webpagina.</p>
			<p>Elke processor (bijvoorbeeld die van Intel, Motorola of SPARC)
				heeft zijn eigen machinetaal. Daarnaast heeft elke computer ook een
				besturingssysteem die ook eigen eisen stelt aan programma&#39;s. Die
				combinatie van een processor en een besturingssysteem noemen we een
				platform. In andere programmeertalen moet de programmeur voor elk
				platform een applicatie maken. In Java wordt de broncode vertaald
				naar een tussentaal die standaard is. Deze tussentaal wordt Bytecode
				genoemd. Vervolgens vertaalt de JVM tijdens de uitvoering de
				applicatie of de applet de bytecode in machinetaal voor het
				betreffende platform. In Java hoeft een programmeur dus maar
				&eacute;&eacute;n keer een applicatie of een applet te maken. Wel
				moet het besturingssysteem over een JVM beschikken. De verschillen
				tussen bytecode enerzijds en de verschillende machinetalen
				anderzijds zijn zo klein, dat een gebruiker daarvan nauwelijks of
				niets merkt.</p>

			<img src="<c:url value="/AO/InlJava/H3/images/java_machinetaal.png"/>">
			<p>Er is nog een verschil tussen een applet en een applicatie:
				Een applicatie kan gegevens uit bestanden lezen, gegevens naar
				bestanden schrijven en bestanden maken of verwijderen. Uit
				veiligheidsoverwegingen kan een applet dat niet. Een applet draait
				op de client en dus op zeer veel verschillende computers en zou veel
				schade kunnen aanrichten, als het met bestanden kan omgaan.</p>

		</div>
	</div>
</div>
<%@ include file="/AO/InlJava/includes/bottom.html"%>

</html>
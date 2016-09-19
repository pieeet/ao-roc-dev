<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

	<%@ include file="/AO/InlJava/includes/zijmenu.jsp"%>


	<div class="col-md-9">
		<h2>H5 Variabelen</h2>
		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>

			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je:</p>
			<ul>
				<li>begrijpt hoe een programma gegevens (tijdelijk) in het
					interne geheugen van de computer opslaat</li>
				<li>weet dat variabelen verschillende typen gegevens - zoals
					string (tekst) of int (integer: geheel getal) - kunnen bevatten</li>
				<li>weet dat in sommige gevallen gegevenstypes geconverteerd
					(of gecast) moeten worden</li>

			</ul>

		</div>

		<div id="artikel">

			<h4>Theorie</h4>
			<img src="<c:url value="/AO/InlJava/H5/images/variabele.png"/>" class="gewoon_plaatje">
			<p>Als een programma wordt uitgevoerd, slaat de computer gegevens
				op in het intern geheugen. Dat gebeurt in cellen. Die cellen zijn
				&eacute;&eacute;n byte ( = 8 bits) groot. Dat betekent dat de
				maximale waarde van een cel 255 is. Als een hogere waarde moet
				worden bewaard, dan doet de computer (of eigenlijk het
				besturingssysteem) dit door een aantal cellen aan elkaar te
				koppelen. In de tabel in bijlage II staan de minimale en maximale
				waarde van de primitieve variabelen en het aantal cellen dat een
				primitief gebruikt.</p>
			<p>Een string kan zo op het scherm gezet worden. In het geheugen
				wordt de string op een andere manier onthouden. Bijvoorbeeld de
				string &quot;Java&quot; heeft vier letters. Dat betekent in het
				geheugen dat er vijf cellen nodig zijn. In de eerste vier staan de
				waarden uit de ascii-tabel (zie bijlage III) en in de vijfde cel
				staat een 0. Een string eindigt altijd op een 0 zodat de computer
				weet dat de cel erna niet meer bij de string hoort. Dus de string
				&quot;Java&quot; wordt in het intern geheugen als volgt opgeslagen:
				74, 97, 118, 97, 0.</p>
			<p>In een variabele van het type int komt het getal 74 te staan.
				Dat betekent dat deze variabele als volgt wordt opgeslagen: 74, 0,
				0, 0. Als deze vier cellen als string worden behandeld, dan zou op
				het scherm &quot;J&quot; komen te staan. Wat we echter willen zien
				zijn de tekens &quot;7&quot; en &quot;4&quot;. Dat betekent dat deze
				variabele eerst omgezet moet worden naar een string voordat hij op
				het scherm gezet kan worden. Dat omzetten noemen we converteren of
				casten.</p>
			<p>In Java gaat het converteren van een getal naar een string
				bijna automatisch. Het komt echter ook voor, dat in een tekstvak een
				getal (eigenlijk een aantal tekens) is ingetikt. Een tekstvak geeft
				de inhoud door als string en als er gerekend moet worden, dan moet
				de string eerst geconverteerd worden naar &eacute;&eacute;n van de
				primitieve typen.</p>
			<p>Belangrijk is een goede en logische naamgeving voor
				variabelen. Zorg ervoor dat ze een naam hebben waaraan je meteen
				kunt zien wat de inhoud van een variabele is. In de tabel in bijlage
				III is daarom ook een kolom prefixen opgenomen. Bij kleine
				programma&#39;s kun je dat wel onthouden, maar bij grote
				programma&#39;s niet.</p>
			<div class="opdrachten">

				<h2>Opdracht 5.1</h2>
				<p>Maak praktijkopdracht van Hoofdstuk 4 opnieuw, maar maak nu
					gebruik van de volgende variabelen:</p>
				<ul>
					<li>kleur(en) van type &quot;Color&quot;</li>
					<li>breedte &amp;</li>
					<li>hoogte, beide van type &quot;int&quot;</li>
				</ul>
				<img src="<c:url value="/AO/InlJava/H5/images/opdracht5_1.png"/>"
					class="gewoon_plaatje">
				<p>
					Kun je nog meer variabelen bedenken?<br> Wat is het voordeel
					van deze aanpak?
				</p>

				<div class="toonknopcontainer">
					<button class="toonknop" id="toon5.1" onclick="toon('uitw5.1')">Toon
						uitwerking</button>
				</div>
				<div class="uitwerking" id="uitw5.1">
					<p>In een java klasse kun je variabelen gebruiken. Een
						variabele moet altijd eerst worden gedeclareerd. Daarna geef je
						hem een waarde. Deze waarde moet overeenstemmen met het type dat
						is gedeclareerd. Java is hier heel streng in.</p>

					<pre class="code">
public class Show extends Applet{
    <span class="comment">//declaratie.</span>
    Color <span class="codeplus">opvulkleur;</span>
    Color <span class="codeplus">lijnkleur;</span>
    int <span class="codeplus">breedte;</span>
    int <span class="codeplus">hoogte;</span>

    public void init() {
        <span class="comment">//initialisatie. </span>
        <span class="codeplus">opvulkleur</span> = Color.MAGENTA;
        <span class="codeplus">lijnkleur</span> = Color.BLACK;
        <span class="codeplus">breedte</span> = 200;
        <span class="codeplus">hoogte</span> = 100;
    }

    public void paint(Graphics g) {
        <span class="comment">//teken rechthoek</span>
        g.drawRect(100, 100, <span class="codeplus">breedte</span>, <span
							class="codeplus">hoogte</span>);
        <span class="comment">//teken afgeronde rechthoek</span>
        g.drawRoundRect(100, 225, <span class="codeplus">breedte</span>, <span
							class="codeplus">hoogte</span>, 30, 30);
        <span class="comment">//teken gevulde rechthoek</span>
        g.setColor(<span class="codeplus">opvulkleur</span>);
        g.fillRect(315, 100, <span class="codeplus">breedte</span>, <span
							class="codeplus">hoogte</span>);
        <span class="comment">//teken ovaal</span>
        g.setColor(<span class="codeplus">lijnkleur</span>);
        g.drawOval(315, 100, <span class="codeplus">breedte</span>, <span
							class="codeplus">hoogte</span>);
        <span class="comment">//teken gevulde ovaal</span>
        g.setColor(<span class="codeplus">opvulkleur</span>);
        g.fillOval(315, 225, <span class="codeplus">breedte</span>, <span
							class="codeplus">hoogte</span>);
        <span class="comment">// en zo voort...</span>
    }
}
</pre>
					<p>Je kunt van iedere waarde in principe een variabele maken.
						Voordeel is dat je code overzichtelijker en leesbaarder wordt en
						je alleen de waardes van de variabelen hoeft te wijzigen als je
						iets wilt veranderen.</p>

				</div>
			</div>

			<div class="opdrachten">
				<h2>Opdracht 5.2</h2>
				<p>Maak opgave 4.4 (staafdiagram) nu opnieuw, maar nu zodanig
					dat als je het gewicht van de kinderen
					verandert de staven automatisch worden aangepast als je de Applet uitvoert.</p>
				<%--<div class="embed-responsive embed-responsive-16by9">--%>
					<%--<iframe width="560" height="315"--%>
						<%--src="https://www.youtube.com/embed/IrcdzscWRMU" frameborder="0"--%>
						<%--allowfullscreen></iframe>--%>
				<%--</div>--%>
			</div>
		</div>
	</div>
</div>
<%@ include file="/AO/InlJava/includes/bottom.html"%>
<script>
	$(document).ready(function() {
		$("li#ij-h5").addClass("selected");
	})
</script>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

	<%@ include file="/AO/InlJava/includes/zijmenu.jsp"%>


	<div class="col-md-9">
		<h2>Schaakbord</h2>

		<h4>Uitwerking</h4>
		<p>
		<table class="schaakbord">
			<%
				for (int i = 0; i < 8; i++) {
			%>
			<tr>
				<%
					for (int j = 0; j < 8; j++) {
							if ((i + j) % 2 == 0) {
				%>
				<td class="zwart"></td>
				<%
					} else {
				%>
				<td class="wit"></td>
				<%
					}
						}
				%>
			</tr>
			<%
				}
			%>
		</table>


		<h3>Stapje voor stapje</h3>
		<h4>Declareer en initialiseer variabelen</h4>
		<p>Bedenk wat voor variabelen je gaat gebruiken. Een schaakbord
			bestaat uit 64 vierkanten. In hoofdstuk 4 heb je geleerd dat je een
			(gevulde) rechthoek (en dus ook een vierkant) tekent met de
			opdrachten:</p>
		<pre class="code">
g.drawRect(x, y, breedte, hoogte);
g.setColor(Color.BLACK);
g.fillRect(x, y, breedte, hoogte);
</pre>

		<p>Een schaakbord bestaat uit 8 x 8 = 64 velden. Je zou dus 64
			keer een vierkant kunnen tekenen, maar dat betekent dat je enorm veel
			code moet schrijven. Door gebruik te maken van lussen gaan we
			proberen een stuk effici&euml;nter te werken.</p>

		<p>Een schaakbord kun je zien als een verzameling rijen en
			kolommen. In Java (en andere programmeertalen) is het gebruikelijk om
			te beginnen te tellen bij 0.
		<table id="xtabel" class="table table-bordered">
			<%
				for (int i = 0; i < 8; i++) {
			%>
			<tr>
				<%
					for (int j = 0; j < 8; j++) {
				%>
				<td>rij <b><%=i%></b> kolom <b><%=j%></b></td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>
		</table>


		<h3>Een rij tekenen</h3>

		<p>Begin met het tekenen van een rij vierkanten met behulp van een
			lus.</p>

		<table class="schaakbord">
			<tr>
				<%
					for (int j = 0; j < 8; j++) {
				%>
				<td class="wit"></td>
				<%
					}
				%>
			</tr>
		</table>

		<p>Dit kun je doen met behulp van de volgende for-lus:</p>
		<pre class="code">
public void paint(Graphics g) {
<span class="comment">//de x en y coordinaten</span>
    int x = 50;
    int y = 50;
    <span class="codeplus">for (int kolom = 0; kolom &lt; 8; kolom++) {</span>
        g.drawRect(x, y, breedte, hoogte);
        <span class="codeplus">x += breedte;</span>
    }
}
</pre>
		<p>Bij het tekenen van &eacute;&eacute;n rij velden van een
			schaakbord moeten we er voor zorgen dat de x-co&ouml;rdinaat bij
			ieder nieuw veld net zoveel naar rechts schuift als de breedte van
			het veld. Anders zouden de velden elkaar overlappen.</p>

		<h3>als... dan...</h3>
		<p>
			Nu gaan we er voor zorgen dat de velden om en om zwart en wit worden.
			Er zijn 8 velden (kolommen) genummerd 0 t/m 7. Het eerste veld moet
			zwart worden. Dit betekent dat <b>als (if)</b> kolom nummer 0, 2, 4 <b>of</b>
			6 heeft, het veld zwart moet worden en <b>anders (else)</b> wit. Dit
			kun je uiteraard met een <b>if-else-statement</b> bewerkstelligen.
			Zie hoofdstuk 10.
		</p>
		<div>
			<table class="schaakbord">
			<tr>
				<%
					for (int j = 0; j < 8; j++) {
						if (j % 2 == 0) {
				%>
					<td class="zwart"></td>
				<%
					} else {
				%>
				<td class="wit"></td>
				<%
					}
					}
				%>
				</tr>
			</table>
		</div>
		<pre class="code">
public void paint(Graphics g) {
    y = 50;
    x = 50;
    for (int kolom = 0; kolom &lt; 8; kolom++) {
		
        <span class="codeplus">if (kolom == 0 || kolom == 2 || kolom == 4 || kolom == 6)</span> {
            g.setColor(zwart);
            g.fillRect(x, y, breedte, hoogte);
        } <span class="codeplus">else</span> {
            g.setColor(wit);
            g.fillRect(x, y, breedte, hoogte);
			
        }
        x += breedte;
    }
}
</pre>
		<p>Laten we nu een tweede rij maken. We moeten dan de
			Y-co&ouml;rdinaat met de hoogte van de cel verhogen om hem netjes
			onder de eerste rij te krijgen. Ook moeten we de kleuren omdraaien.</p>
		<pre class="code">
public void paint(Graphics g) {
    y = 50;
    x = 50;
    for (int kolom = 0; kolom &lt; 8; kolom++) {
		
        if (kolom == 0 || kolom == 2 || kolom == 4 || kolom == 6) {
            g.setColor(<span class="codeplus">zwart</span>);
            g.fillRect(x, y, breedte, hoogte);
        } else {
            g.setColor(<span class="codeplus">wit</span>);
            g.fillRect(x, y, breedte, hoogte);
        }
        x += breedte;
    }
    
    <span class="comment">//tweede rij</span>
    <span class="codeplus">x = 50;</span>
    <span class="codeplus">y += hoogte;</span>
    
    for (int kolom = 0; kolom &lt; 8; kolom++) {
        if (kolom == 0 || kolom == 2 || kolom == 4 || kolom == 6) {
            g.setColor(<span class="codeplus">wit</span>);
            g.fillRect(x, y, breedte, hoogte);
        } else {
            g.setColor(<span class="codeplus">zwart</span>);
            g.fillRect(x, y, breedte, hoogte);
			
        }
        x += breedte;
    }
}
</pre>
		<p>We moeten de X-co&ouml;rdinaat weer terug zetten naar zijn
			oorspronkelijke positie, anders krijgen we het volgende resultaat:</p>
		<img src="<c:url value="/AO/InlJava/H11/images/schaakfout3.jpg"/>">
		<h3>De scope van variabelen</h3>
		<p>
			Als een waarde aan een variabele wordt toegekend, dan wordt die
			waarde onthouden tot de sluitaccolade van de <em>body</em> waarbinnen
			hij is gedeclareerd. Dit kan verwarrend zijn, met name als je gebruik
			maakt van lussen!
		</p>
		<img src="<c:url value="/AO/InlJava/H11/images/scope.png"/>">
		<h3>Nesten</h3>
		<p>Bovenstaande code kun je herhalen tot het schaakbord compleet
			is. Maar het kan uiteraard nog veel korter door ook bij het maken van
			de 8 rijen gebruik te maken van een lus. Ga als volgt te werk:
		<ul>
			<li>ken een waarde toe aan de Y-co&ouml;rdinaat</li>
			<li>maak de eerste lus die 8 rijen gaat tekenen</li>
			<li>ken binnen de rijen-lus een beginwaarde aan de
				X-co&ouml;rdinaat toe. Hiermee zorg je er voor dat als er een nieuwe
				rij wordt gemaakt, de X-co&ouml;rdinaat weer naar zijn beginpositie
				terug gaat</li>
			<li>maak binnen de rijen-lus een if-else-statement om te bepalen
				of de rij met een zwart of een wit vlak moet beginnen</li>
			<li>maak voor de beide scenario&#39;s lussen die de kolommen
				maken (zie voorbeeld)</li>
			<li>zorg ervoor dat de X en de Y co&ouml;rdinaten op de juiste
				plek worden verhoogd</li>
		</ul>
		<p>
			Als het goed is gegaan beslaat je code nu nog maar zo&#39;n 40
			regels. Kun je manieren bedenken om het nog effici&euml;nter te
			maken? Tip: kijk goed naar de <a href="#xtabel">tabel</a> eerder op
			deze pagina om patronen te ontdekken die je kunt gebruiken in je
			algoritme.
		</p>
	</div>
</div>
<%@ include file="/AO/InlJava/includes/bottom.html"%>
<script>
	$(document).ready(function() {
		$("li#ij-h11").addClass("selected");
	})
</script>
</html>
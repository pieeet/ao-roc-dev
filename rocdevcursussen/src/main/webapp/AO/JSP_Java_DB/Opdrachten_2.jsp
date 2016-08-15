<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

	<%@ include file="/AO/JSP_Java_DB/includes/zijmenu.jsp"%>


	<div class="col-md-9">
		<h2>Formulieren</h2>

		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je:</p>
			<ul>
				<li>een formulier in html kunt maken</li>
				<li>tekst invoervelden en submit knoppen kunt maken</li>
				<li>weet wat request-parameters zijn</li>
				<li>hoe je parameters kunt opvragen</li>
				<li>weet hoe je strings naar getallen kunt &quot;parsen&quot;</li>
				<li>weet hoe je een Exception in java kunt afvangen en kunt
					gebruiken voor bijvoorbeeld een foutmelding</li>
				<li>hoe je in html verborgen (hidden) invoervelden kunt maken
					en gebruiken</li>
			</ul>



		</div>

		<!-- inhoud -->


		<img src="<c:url value="/AO/JSP_Java_DB/images/forms.png"/>" width=300>
		<p>
			In HTML kun je formulieren maken met de <a
				href="http://www.w3schools.com/tags/tag_form.asp" target="_blank">form
				tag</a>. Een html formulier met &eacute;&eacute;n invoerveld en
			&eacute;&eacute;n knop ziet er als volgt uit:
		</p>
		<pre class="code">
&lt;form action=&quot;doelpagina.jsp&quot; method=&quot;get&quot;&gt;
    &lt;input type=&quot;text&quot; name=&quot;tekst_input_1&quot;&gt;
    &lt;input type=&quot;submit&quot; name=&quot;knop_1&quot; value=&quot;Ok&quot;&gt;
&lt;/form&gt;
</pre>

		<h3>Uitleg</h3>
		<pre class="code">
&lt;form <span class="codeplus">action=&quot;doelpagina.jsp&quot;</span> method=&quot;get&quot;&gt;
    &lt;input type=&quot;text&quot; name=&quot;tekst_input_1&quot;&gt;
    &lt;input type=&quot;submit&quot; name=&quot;knop_1&quot; value=&quot;Ok&quot;&gt;
&lt;/form&gt;
</pre>
		<h4>action</h4>
		<p>Bepaalt naar welke pagina het formulier toe wordt gestuurd. Het
			gebeurt vaak dat bezoeker naar dezelfde pagina wordt teruggeleid.</p>
		<pre class="code">
&lt;form action=&quot;doelpagina.jsp&quot; <span class="codeplus">method=&quot;get&quot;&gt;</span>
    &lt;input type=&quot;text&quot; name=&quot;tekst_input_1&quot;&gt;
    &lt;input type=&quot;submit&quot; name=&quot;knop_1&quot; value=&quot;Ok&quot;&gt;
&lt;/form&gt;
</pre>
		<h4>method: get of post</h4>
		<p>
			Als een formulier wordt opgestuurd, dan worden de waardes van het
			formulier als parameters meegezonden. Indien voor <a
				href="http://www.w3schools.com/tags/att_form_method.asp"
				target="_blank">method</a> &quot;get&quot; wordt gekozen, dan worden
			de parameters in de url meegestuurd. Bovenin de adresbalk van je
			browser zie je dat achter de doelpagina (bijvoorbeeld eindigend op
			.jsp) een vraagteken met daarachter waardes worden toegevoegd.
			Verschillende waardes worden gescheiden met &amp;. Als bovenstaand
			formulier zou worden opgestuurd, dan zou je url twee parameters
			meekrijgen en er als volgt uitzien:
		</p>
		<p>
			http://doelpagina<span class="codeplus">?</span>tekst_input_1=[invoer
			gebruiker]<span class="codeplus">&amp;</span>knop_1=Ok
		</p>
		<p>Als je niet wilt dat de parameters in je url komen te staan,
			bijvoorbeeld omdat er vertrouwelijke info wordt verstuurd en je niet
			wilt dat die zichtbaar wordt, dan kun je de method &quot;post&quot;
			gebruiken.</p>

		<pre class="code">
&lt;form action=&quot;doelpagina.jsp&quot; method=&quot;get&quot;&gt;
    <span class="codeplus">&lt;input type=&quot;text&quot; name=&quot;tekst_input_1&quot;&gt;</span>
    &lt;input type=&quot;submit&quot; name=&quot;knop_1&quot; value=&quot;Ok&quot;&gt;
&lt;/form&gt;
</pre>
		<h4>input: text</h4>
		<p>Dit is een invoerveld waar de bezoeker iets in kan vullen. Het
			invoerveld krijgt een naam. Dit is de naam van de parameter die wordt
			meegestuurd</p>

		<pre class="code">
&lt;form action=&quot;doelpagina.jsp&quot; method=&quot;get&quot;&gt;
    &lt;input type=&quot;text&quot; name=&quot;tekst_input_1&quot;&gt;
    <span class="codeplus">&lt;input type=&quot;submit&quot; name=&quot;knop_1&quot; value=&quot;Ok&quot;&gt;</span>
&lt;/form&gt;
</pre>
		<h4>input: submit</h4>
		<p>Dit is een knop. Als gebruiker op deze knop klikt, wordt het
			formulier naar de doelpagina gestuurd. Ook een knop krijgt een naam.</p>

		<h3>Het formulier verwerken</h3>
		<p>In je doelpagina moet je de waardes eerst opvragen als je er
			iets mee wilt doen. Dit doe je als volgt:</p>

		<pre class="code">
<span class="jsp">&lt;%</span>
<span class="comment">//check welke knop bezoeker heeft geklikt</span>
if (request.getParameter(&quot;knop_1&quot;) != null) {
    <span class="comment">//haal de parameter(s) binnen</span>
    String invoer = request.getParameter(&quot;tekst_input_1&quot;);
}
<span class="jsp">%&gt;</span>
</pre>
		<div class="opdrachten" id="opg8">

			<h2>Opdracht 8</h2>

			<p>Breid opdracht 6 uit zodat de bezoeker van de webpagina door
				een getal in te voeren bepaalt welke tafel hij te zien krijgt. Er
				wordt pas een tafel zichtbaar nadat de de gebruiker op de knop heeft
				gedrukt. Bij foute invoer (geen geheel getal) wordt er naast het
				invoerveld een rode waarschuwingstekst vertoond. Probeer
				onderstaande uitwerking en let goed op de URL in de adresbalk van je
				browser voor- en nadat je op de knop hebt geklikt. Wat is er
				veranderd?</p>
			<h3>Aanwijzingen</h3>
			<p>
				De methode request.getParameter(&quot;naam&quot;) geeft altijd een
				string waarde. Om er mee te kunnen rekenen moet de string geparsed
				worden, in dit geval naar een integer (<a
					href="/AO/inleiding-java/h8#voorbeeld8_7" target="_blank">zie
					Inleiding Java</a>).
			</p>
			<p>
				Als gebruiker per ongeluk een letter in plaats van een getal heeft
				ingevuld, dan treedt er een zogenaamde NumberFormatException op. Om
				te vermijden dat je programma crasht, moet je deze <a
					href="https://docs.oracle.com/javase/tutorial/essential/exceptions/catch.html"
					target="_blank">&quot;afvangen&quot;</a>. Gebruik de Exception om
				een foutmelding in het scherm te zetten. Probeer maar eens uit in
				onderstaande uitwerking (voer een letter in in plaats van een
				cijfer).
			</p>

			<%
				boolean geklikt = false;
				String strGetal;
				int getal = -1;
				String foutboodschap = "";
				if (request.getParameter("knop1") != null) {
					strGetal = request.getParameter("getal1");
					try {
						getal = Integer.parseInt(strGetal);
						geklikt = true;

					} catch (NumberFormatException e) {
						foutboodschap = strGetal + " is geen geldige invoer";

					} finally {
						//doe niets
					}
				}
			%>

			<h3>Kies een tafel</h3>
			<form action="/AO/jsp/deel2#opg8" method="get">
				<input type="text" name="getal1" title="">

				<div class="fout">
					<%=foutboodschap%>
				</div>
				<div class="knop">
					<input type="submit" name="knop1" value="Ok">
				</div>
			</form>
			<br>
			<%
				if (geklikt) {
					out.println("<h3>De tafel van " + getal + "</h3>");
					for (int i = 1; i <= 10; i++) {
						out.println(i + " x " + getal + " = " + i * getal + "<br>");
					}
				}
			%>
			

			<!-- <div class="toonknopcontainer">
							<button class="toonknop" id="toon8" onclick="toon('uitw8')">Toon uitwerking</button>
						</div> -->

			<div class="uitwerking" id="uitw8">
				<h3>Formulier</h3>
				<p>Maak eerst het formulier. Dit bestaat uit twee input
					elementen: een tekstveld en een knop. Daar tussenin moet nog een
					foutmelding komen voor het geval de gebruiker een verkeerde waarde
					invoert. Daarover later meer.</p>
				<pre class="code">
&lt;form action=&quot;index.jsp&quot; method=&quot;get&quot;&gt;
	&lt;input type=&quot;text&quot; name=&quot;getal&quot;&gt;
           
	&lt;div class=&quot;fout&quot;&gt;
		&lt;%= foutboodschap %&gt;
	&lt;/div&gt;
	&lt;div class=&quot;knop&quot;&gt;
		&lt;input type=&quot;submit&quot; name=&quot;knop&quot; value=&quot;Ok&quot;&gt;
	&lt;/div&gt;
&lt;/form&gt;
</pre>
				<h3>Uitleg</h3>
				<p>In de &lt;form&gt; tag kun je met action=&quot;url&quot;
					aangeven naar welke pagina de gebruiker moet worden geleid wanneer
					hij op de knop drukt. In dit geval wordt de gebruiker naar dezelfde
					pagina terug geleid.</p>
				<p>
					Het tekstveld en de knop krijgen beide een naam met:
					name=&quot;...&quot;. Als de gebruiker op de knop drukt, worden er
					parameters aangemaakt met de namen van de input velden en hun
					waardes die aan het verzoek (request) voor de pagina worden
					meegegeven. De knop krijgt een standaardwaarde &quot;Ok&quot;. De
					waarde van getal is afhankelijk van wat de gebruiker in het
					tekstveld invult. Als je op de knop klikt zie je in de adresbalk
					van je browser na de verwijzing naar het pagina-bestand (eindigend
					op .jsp) een vraagteken verschijnen met daarachter de namen van de
					input velden en hun waardes, gescheiden met &amp;. Na klikken op de
					knop wordt de url aangevuld met twee parameters: <br> <span
						class="letop">&#63;getal=&amp;knop=Ok</span>
				</p>
				<p>De knop krijgt als waarde (value) Ok mee en getal heeft in
					dit geval geen waarde. Blijkbaar heeft de gebruiker niets ingevuld.</p>
				<h3>JSP</h3>
				<p>
					Met behulp van JSP maken we de benodigde variabelen en kennen
					waardes toe met behulp van de - met de request meegezonden -
					parameters. De waardes van parameters kunnen worden opgevraagd met:<br>
					request.getParameter(&quot;naam van het input-veld&quot;)
				</p>
				<pre class="code">
&lt;% 
int getal = 0;
boolean geklikt = false;
String strGetal;
String foutboodschap = &quot;&quot;;

if (request.getParameter(&quot;knop&quot;) != null) {
    strGetal = request.getParameter(&quot;getal&quot;);
    try {
        getal = Integer.parseInt(strGetal);
        geklikt = true;
    }
    catch(NumberFormatException exc) {
        
        foutboodschap = &quot;U moet een geheel getal invoeren!&quot;;
    }
    finally {
        
    }
}
%&gt;
</pre>
				<h3>Uitleg</h3>
				<p>We willen alleen dat er een tafel zichtbaar wordt nadat de
					gebruiker op de knop heeft gedrukt. Dit kunnen we aangeven met een
					aanroep naar de parameter "knop". Deze krijgt pas de waarde
					&quot;Ok&quot; nadat er op de knop is geklikt. Tot dan is hij null.
					Dit kunnen we gebruiken als voorwaarde in een if-statement.</p>
				<p>int getal krijgt zijn waarde als door de gebruiker een geldig
					getal is ingevuld. Hiermee wordt de tafel straks gemaakt.</p>
				<p>
					boolean geklikt gaan we gebruiken om te bepalen of er wel of niet
					een tafel wordt vertoond. Maak hem aanvankelijk false zodat er geen
					tafel wordt vertoond als gebruiker op de pagina komt. <br> Pas
					nadat gebruiker een geldig geheel getal heeft ingevoerd maken we
					hem true.
				</p>
				<p>strGetal: Wanneer een gebruiker een getal in een tekstvak
					invoert moet dit getal worden geconverteerd van String naar int.
					Dit doen we met: getal = Integer.parseInt(strGetal). De static
					methode parseInt() van de klasse Integer gooit een zogenaamde
					NumberFormatException op wanneer de gebruiker een ongeldige waarde
					invoert. Deze kunnen we &quot;opvangen&quot; (catch) in een
					try...catch blok. We gebruiken de exception om de foutboodschap aan
					te maken. Wanneer het ingevoerde getal kan worden geconverteerd
					naar een int, geven we boolean geklikt de waarde true. Daarmee geef
					je het groene licht voor het maken van de tafel.</p>
				<p>Voor de tafel zelf gebruiken we een for-lus.</p>

				<pre class="code">
&lt;% if (geklikt) { 
	for (int i = 1; i &lt;= 10; i++) { %&gt;
		&lt;%= i %&gt; x &lt;%= getal %&gt; = &lt;%= i * getal %&gt; &lt;br&gt;
	&lt;% } 
} %&gt;
</pre>
				<p>Met behulp van CSS code zorgen we er tenslotte voor dat de
					waarschuwingstekst rood wordt, iets kleiner dan de andere tekst
					naast het invoervak wordt geplaatst. Een div is van zichzelf een
					blok element. Blok elementen worden standaard van boven naar
					beneden onder elkaar geplaatst. Inline elementen worden daarentegen
					van links naar rechts naast elkaar geplaatst. In CSS kun je dit
					veranderen.</p>
				<pre class="code">
div.fout {
	color: red;
	font-size: 0.8em;
	display: inline;
}
</pre>
			</div>
		</div>

		<div class="opdrachten" id="opg9">

			<h2>Opdracht 9</h2>
			<p>Breid de vorige opdracht uit zodat de bezoeker met twee extra
				knoppen (&quot;vorige&quot; en &quot;volgende&quot;) de tafel met
				&eacute;&eacute;n kan verhogen of verlagen (zie voorbeeld).</p>
			<h3>Aanwijzingen</h3>
			<p>Soms moet met een formulier een waarde worden meegestuurd die
				je programma nodig heeft, maar die je bezoeker niet hoeft te zien.
				Dit kun je doen met een verborgen input veld. De waarde (value) kan
				bijvoorbeeld een jsp-expressie zijn.</p>

			<pre class="code">
&lt;form action=&quot;doelpagina.jsp&quot; method=&quot;get&quot;&gt;
    &lt;input type=&quot;text&quot; name=&quot;tekst_input_1&quot;&gt;
    &lt;input type=&quot;submit&quot; name=&quot;knop_1&quot; value=&quot;Ok&quot;&gt;
    &lt;input type=<span class="codeplus">&quot;hidden&quot;</span> name=&quot;naam&quot; value=&quot;<span
					class="codeplus">&lt;%= eenWaarde %&gt;</span>&quot;&gt;
&lt;/form&gt;
</pre>


			<%
				boolean geklikt2 = false;
				String strGetal2;
				int getal2 = 0;
				String foutboodschap2 = "";
				if (request.getParameter("knop2") != null
						|| request.getParameter("min") != null
						|| request.getParameter("plus") != null) {
					strGetal2 = request.getParameter("getal2");
					try {
						getal2 = Integer.parseInt(strGetal2);
						geklikt2 = true;

					} catch (NumberFormatException e) {
						foutboodschap2 = "U moet een geheel getal invoeren!";

					} finally {
						//doe niets
					}

					if (request.getParameter("min") != null) {
						getal2--;
					} else if (request.getParameter("plus") != null) {
						getal2++;
					}
				}
			%>

			<h3>Kies een tafel</h3>
			<form action="/AO/jsp/deel2#opg9" method="get">
				<input type="text" name="getal2">

				<div class="fout">
					<%=foutboodschap2%>
				</div>
				<div class="knop">
					<input type="submit" name="knop2" value="Ok">
				</div>
			</form>
			<%
				if (geklikt2) {
					out.println("<h3>De tafel van " + getal2 + "</h3>");
					for (int i = 1; i <= 10; i++ ) {
						out.println(i + " x " + getal2 + " = " + i * getal2 + "<br>");
					}
			%>
			
			<form action="/AO/jsp/deel2#opg9" method="get">
				<input type="hidden" name="getal2" value="<%=getal2%>"> <input
					type="submit" name="min" value="vorige"> <input
					type="submit" name="plus" value="volgende">
			</form>

			<%
				}
			%>
			<br>
			<!-- 	<div class="toonknopcontainer">
							<button class="toonknop" id="toon9" onclick="toon('uitw9')">Toon uitwerking</button>
						</div> -->

			<div class="uitwerking" id="uitw9">
				<p>Je kunt onder de tafel die je hebt gemaakt in opdracht 8 een
					formulier met twee knoppen &quot;min&quot; en &quot;plus&quot;
					toevoegen. In je Java code geef je aan dat getal moet worden
					verlaagd respectievelijk verhoogd wanneer gebruiker op
					&eacute;&eacute;n van de twee knoppen drukt. Het probleem dat zich
					nu voordoet is dat het oorspronkelijke getal vergeten is wanneer de
					gebruiker een nieuw request indient door op &eacute;&eacute;n van
					de knoppen te klikken. Om dit probleem op te losssen maak je
					gebruik van een &quot;verborgen&quot; invoerveld die de waarde van
					getal meegeeft aan het request.</p>

				<pre class="code">
&lt;% if (geklikt) { %&gt;
 &lt;h3&gt;De tafel van &lt;%= getal %&gt;&lt;/h3&gt;
 	&lt;% for (int i = 1; i &lt;= 10; i++) { %&gt;
     	&lt;%= i %&gt; x &lt;%= getal %&gt; = &lt;%= i * getal %&gt; &lt;br&gt;
 	&lt;% } %&gt;
 	&lt;form action=&quot;index.jsp&quot; method=&quot;get&quot;&gt;
 		<span class="codeplus">&lt;input type=&quot;hidden&quot; name=&quot;getal&quot; value=&quot;&lt;%= getal %&gt;&quot;&gt;</span>
 		&lt;input type=&quot;submit&quot; name=&quot;min&quot; value=&quot; &lt; &quot; &gt;
 		&lt;input type=&quot;submit&quot; name=&quot;plus&quot; value=&quot; &gt; &quot; &gt;
 	&lt;/form&gt;
 
&lt;% } %&gt;

</pre>
				<p>Nu kun je je Java code uitbreiden zodat de knoppen doen wat
					ze moeten doen.</p>

				<pre class="code">
&lt;&#37;
boolean geklikt = false;
String strGetal;
int getal = 0;
String foutboodschap = "";
if (request.getParameter("knop") != null <span class="codeplus">|| 
	request.getParameter("min") != null ||
	request.getParameter("plus") != null)
</span>
{
		strGetal = request.getParameter("getal");
		try {
			getal = Integer.parseInt(strGetal);
			geklikt = true;
		}
		catch(NumberFormatException e) {
			foutboodschap = "U moet een geheel getal invoeren!";
		}
		finally {
			//doe niets
		}
		<span class="codeplus">
		if (request.getParameter("min") != null) {
			getal = getal - 1;
		}
		else if (request.getParameter("plus") != null) {
			getal = getal + 1;
		}</span>
}
&#37;&gt;
</pre>
			</div>
		</div>
		<div class="opdrachten" id="opg10">
			<h2>Opdracht 10</h2>
			<p>
				Schrijf een webpagina waarin de graden in Celsius worden omgerekend
				naar graden in Fahrenheit. Het formulier op de pagina bevat een
				tekstvak en een knop. De formule voor de conversie is: Fahrenheit =
				Celsius * 1.8 + 32. De uitkomst wordt in een andere pagina gegeven
				waarop ook de link staat om terug te keren naar de vorige pagina. De
				uitkomst van de berekening moet worden weergegeven in een geheel
				getal. Voor een juiste afronding kun je &eacute;&eacute;n van de
				twee static methoden round() van de Java klasse <a
					href="http://docs.oracle.com/javase/7/docs/api/java/lang/Math.html"
					target="_blank">Math</a> gebruiken. Bij beide methoden zit echter
				een addertje onder het gras!
			</p>
			<form action="/AO/jsp/fahrenheit" method="get">
				<label>graden celsius</label> <input type="text"
					name="celsius" title=""> <input type="submit"
					value="reken om naar Fahrenheit">
			</form>
			<br>

			<!-- <div class="toonknopcontainer">
							<button class="toonknop" id="toon10" onclick="toon('uitw10')">Toon uitwerking</button>
						</div> -->


			<div class="uitwerking" id="uitw10">
				<p>Om er voor te zorgen dat de gebruiker naar een andere pagina
					wordt geleid als zij op de knop klikt, moet je een nieuwe .jsp
					pagina aanmaken en in het formulier bij action=&quot;.&quot;
					hiernaar verwijzen. In dit voorbeeld heet de jsp pagina
					fahrenheit.jsp en bevindt zich in dezelfde map als de
					oorspronkelijke pagina.</p>

				<pre class="code">
&lt;form action=&quot;fahrenheit.jsp&quot; method=&quot;get&quot;&gt;
	&lt;input type=&quot;text&quot; name=&quot;celsius&quot;&gt;
	&lt;input type=&quot;submit&quot; value=&quot;Ok&quot;&gt;
&lt;/form&gt;
</pre>
				<p>In de fahrenheit.jsp pagina maak je de attributen aan die je
					nodig hebt:
				<ul>
					<li>een int celsius</li>
					<li>een int fahrenheit</li>
					<li>eventueel een String tekst die kan dienen als tekst met de
						conversie, of als foutmelding indien gebruiker geen goede invoer
						(geheel getal) heeft ingevoerd</li>
				</ul>
				<pre class="code">
&lt;%
int celsius;
int fahr;
String tekst = &quot;&quot;;
try {
	celsius = Integer.parseInt(request.getParameter(&quot;celsius&quot;));
	fahr = Math.round(celsius * 1.8f + 32);
	//alternatief
	//fahr = (int) Math.round(celsius * 1.8 + 32);
	tekst = celsius + &quot; graden Celsius is &quot; + fahr + &quot; graden Fahrenheit&quot;;
}
catch(NumberFormatException e) {
	tekst = &quot;Foute invoer, u moet een geheel getal invoeren&quot;;
}
finally {
	
}
%&gt;
&lt;h2&gt;Conversie van Celsius naar Fahrenheit&lt;/h2&gt;
&lt;p&gt;&lt;%= tekst %&gt;&lt;/p&gt;
</pre>
				<h3>De methode round() van de klasse Math</h3>
				<p>Zoek in de Java API de klasse Math. Bij de methoden zie je
					dat er twee methoden round() bestaan. Het bestaan van twee methoden
					met dezelfde naam, maar met verschillende parameters noemen we
					overloading.</p>
				<img class="imgfullwidth" src="<c:url value="/AO/JSP_Java_DB/images/apiMath.jpg"/>"
					alt="de methode round van klasse Math">
				<p>De eerste methode vereist als parameter een double, en heeft
					als terugkeerwaarde een long. Een long is de 64-bit grote broer van
					int. Om van een long een int te maken moet je hem typecasten (zie
					code). Typecasten is alleen nodig wanneer er eventueel informatie
					verloren kan gaan. Je geeft als het ware te kennen aan de compiler
					dat je als programmeur accepteert dat er eventueel informatie
					verloren gaat.</p>
				<p>De tweede methode heeft als terugkeerwaarde een int, maar
					vraagt als parameter een float. De float is het kleine - wat minder
					precieze - 32-bit broertje van double. Als je in Java een decimaal
					gebruikt, gaat Java er van uit dat je een double wilt gebruiken. Om
					een float te gebruiken kun je een f achter de decimaal zetten.</p>
			</div>
		</div>
		<div class="opdrachten" id="opg11">
			<h2>Opdracht 11</h2>
			<p>Schrijf een webpagina waarin de bezoeker getallen kan invoeren
				en bijgehouden wordt welk getal het hoogst is en welk getal het
				laagst is.</p>

			<h3>Hoogste en laagste</h3>
			<p>Voer een geheel getal in</p>
			<form action="/AO/jsp/deel2#opg11" method="get">
				<input type="text" name="getal_HL" title="getal invoer"> <input type="submit"
					name="knop11" value="Ok"> <br>
				<%
					int laagste;
					int hoogste;
					String waarschuwing = "";
					if (request.getParameter("laagste") == null) {
						laagste = Integer.MAX_VALUE;
						hoogste = Integer.MIN_VALUE;
					} else {
						laagste = Integer.parseInt(request.getParameter("laagste"));
						hoogste = Integer.parseInt(request.getParameter("hoogste"));
					}

					try {
						int invoer = Integer.parseInt(request.getParameter("getal_HL"));
						if (invoer < laagste) {
							laagste = invoer;
						}
						if (invoer > hoogste) {
							hoogste = invoer;
						}
					} catch (NumberFormatException e) {
						waarschuwing = "U moet een geheel getal invoeren";
					} finally {

					}
				%>
				<input type="hidden" name="hoogste" value="<%=hoogste%>"> <input
					type="hidden" name="laagste" value="<%=laagste%>">

			</form>
			<br>
			<%
				if (request.getParameter("knop11") != null) {
			%>
			<div class="fout">
				<%=waarschuwing%>
			</div>
			<%
				}
			%>

			<%
				if (laagste != Integer.MAX_VALUE && hoogste != Integer.MIN_VALUE) {
			%>
			<p>
				Laagste getal:
				<%=laagste%>
			</p>
			<p>
				Hoogste getal:
				<%=hoogste%>
			</p>

			<%
				}
			%>


			<!-- <div class="toonknopcontainer">
							<button class="toonknop" id="toon11" onclick="toon('uitw11')">Toon uitwerking</button>
						</div> -->

			<div class="uitwerking" id="uitw11">
				<p>
					Je hebt twee int variabelen nodig om te kunnen bepalen wat het
					laagste en het hoogste getal is dat door de gebruiker is ingevoerd.
					Om deze een initi&euml;le waarde te geven kun je gebruik maken van
					respectievelijk Integer.MAX_VALUE en Integer.MIN_VALUE. Dezen geven
					de maximale respectievelijk minimale waarden die een int in Java
					aan kan nemen. <span class="letop">Let op:</span> dit zijn geen
					methoden maar zogenaamde &quot;static&quot; attributen die meteen
					op de klasse kunnen worden aangeroepen. Eerder hebben we een
					dergelijk attribuut gebruikt bij de klasse Calendar in opdracht 3.
					Bekijk de klasse Integer in de API. Je vindt de attributen onder
					&quot;Field Summary&quot;.
				</p>
				<p>Net als in opgave 9 kun je in deze opgave ook met verborgen
					inputvelden werken om de laagste en de hoogste waarde opnieuw aan
					het request mee te geven.</p>
				<pre class="code">
  &lt;body&gt;
      
      &lt;%
      int laagste;
      int hoogste;
      String waarschuwing = &quot;&quot;;
      if (request.getParameter(&quot;laagste&quot;) == null) {
          laagste = Integer.MAX_VALUE;
          hoogste = Integer.MIN_VALUE;
      }
      else {
          laagste = Integer.parseInt(request.getParameter(&quot;laagste&quot;));
          hoogste = Integer.parseInt(request.getParameter(&quot;hoogste&quot;));
      }

      try {
          int invoer = Integer.parseInt(request.getParameter(&quot;getal&quot;));
          if (invoer &lt; laagste) {
              laagste = invoer;
          }
          if (invoer &gt; hoogste) {
              hoogste = invoer;
          }
        }
      catch(NumberFormatException e){
          waarschuwing = &quot;U moet een geheel getal invoeren&quot;;
      }
      finally {

      }

%&gt;
      &lt;h1&gt;Hoogste en laagste&lt;/h1&gt;
      &lt;form action=&quot;index.jsp&quot; method=&quot;get&quot;&gt;
          &lt;input type=&quot;text&quot; name=&quot;getal&quot;&gt;
          &lt;input type=&quot;submit&quot; name=&quot;knop&quot; value=&quot;Ok&quot;&gt;
          
          &lt;input type=&quot;hidden&quot; name=&quot;hoogste&quot; value=&quot;&lt;%= hoogste %&gt;&quot;&gt;
          &lt;input type=&quot;hidden&quot; name=&quot;laagste&quot; value=&quot;&lt;%= laagste %&gt;&quot;&gt;
          
          &lt;% if (request.getParameter(&quot;knop&quot;) != null) { %&gt;
          &lt;p&gt;&lt;%= waarschuwing %&gt; &lt;/p&gt;
          &lt;% if (laagste != Integer.MAX_VALUE) { %&gt;
              &lt;p&gt;Laagste getal: &lt;%= laagste %&gt; &lt;/p&gt;
              &lt;p&gt;Hoogste getal: &lt;%= hoogste %&gt; &lt;/p&gt;
          &lt;% }
          }%&gt;

      &lt;/form&gt;
  &lt;/body&gt;
</pre>
			</div>

		</div>
		<div class="opdrachten">
			<h2>Opdracht 12</h2>
			<p>Schrijf een webpagina waarin de graden in Fahrenheit worden
				omgerekend naar graden in Celsius of omgekeerd. De webpagina bevat
				twee tekstvelden en de knop Omrekenen. Als er op de knop Omrekenen
				wordt geklikt wordt de uitkomst van de berekening in het juiste
				tekstvak gezet en wordt het andere tekstvak leeggemaakt. De formules
				zijn: Fahrenheit = Celsius * 1.8 + 32 en Celsius = (Fahrenheit - 32)
				/ 1.8. Er is altijd een tekstvak met invoer en een tekstvak dat leeg
				is. Zo weet de pagina of er van Celsius naar Fahrenheit of van
				Fahrenheit naar Celsius moet worden omgerekend. Maak naast JSP
				gebruik van HTML en CSS bij het uitvoeren van deze opdracht.</p>

			<%
				String celsValue = "";
				String fahrValue = "";
				String warning = "";
				if (request.getParameter("knop12") != null) {
					try {
						if (!request.getParameter("cels").equals("")
								&& !request.getParameter("fahr").equals("")) {
							warning = "Voer slechts &#233;&#233;n waarde in!";
						} else if (!request.getParameter("cels").equals("")) {
							int cels = Integer.parseInt(request
									.getParameter("cels"));
							int fahr = Math.round(cels * 1.8f + 32);
							fahrValue += fahr;
						} else if (!request.getParameter("fahr").equals("")) {
							int fahr = Integer.parseInt(request
									.getParameter("fahr"));
							int cels = Math.round((fahr - 32) / 1.8f);
							celsValue += cels;
						}
					} catch (NumberFormatException e) {
						warning = "Voer een geheel getal in";
					}
				}
			%>
			<h3 id="opg12">Fahrenheit en Celsius omrekenen</h3>
			<div id="gradeninvoer">
				<div id="gradeninvoer_naam">
					<p>Graden</p>
				</div>
				<form action="/AO/jsp/deel2#opg12" method="get">
					<div class="invoer_arg">
						<p>Celsius</p>
						<input type="text" name="cels" value="<%=celsValue%>">
					</div>
					<div class="invoer_arg">
						<p>Fahrenheit</p>
						<input type="text" name="fahr" value="<%=fahrValue%>">
					</div>
					<div id="gradeninvoer_knoppen">
						<input type="submit" name="knop12" value="Omrekenen">
					</div>
				</form>
				<%
					if (!warning.equals("")) {
				%>
				<div id="graden_foutmelding">
					<p class="fout"><%=warning%></p>
				</div>
				<%
					}
				%>
			</div>
			<!-- <div class="toonknopcontainer">
								<button class="toonknop" id="toon12" onclick="toon('uitw12')">Toon uitwerking</button>
						</div> -->

			<div class="uitwerking" id="uitw12">

				<pre class="code">
&lt;body&gt;
  &lt;%
  String celsValue = &quot;&quot;;
  String fahrValue = &quot;&quot;;
  int cels;
  int fahr;
  String warning = &quot;&quot;;
  if (request.getParameter(&quot;knop&quot;) != null) {
    try {
      if (!request.getParameter(&quot;cels&quot;).equals(&quot;&quot;) &amp;&amp;
       !request.getParameter(&quot;fahr&quot;).equals(&quot;&quot;)) {
        warning = &quot;Voer slechts &#233;&#233;n waarde in!&quot;;
      }
      else if (!request.getParameter(&quot;cels&quot;).equals(&quot;&quot;)) {
        cels = Integer.parseInt(request.getParameter(&quot;cels&quot;));
        fahr = Math.round(cels * 1.8f + 32);
        fahrValue += fahr;
      }
      else if (!request.getParameter(&quot;fahr&quot;).equals(&quot;&quot;)) {
        fahr = Integer.parseInt(request.getParameter(&quot;fahr&quot;));
        cels = Math.round((fahr - 32)/1.8f);
        celsValue += cels;
      }
    }
    catch(NumberFormatException e) {
      warning = &quot;Voer een geheel getal in&quot;;
    }
   }
   %&gt;
        
  &lt;h1&gt;Fahrenheit en Celsius omrekenen&lt;/h1&gt;
  &lt;form action=&quot;index.jsp&quot; method=&quot;get&quot;&gt;
    &lt;table id=&quot;graden&quot;&gt;
      &lt;tr&gt;
        &lt;th&gt;Celsius&lt;/th&gt;
        &lt;th&gt;Fahrenheit&lt;/th&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td&gt;&lt;input type=&quot;text&quot; name=&quot;cels&quot; value=&quot;&lt;%=celsValue%&gt;&quot;&gt;&lt;/td&gt;
        &lt;td&gt;&lt;input type=&quot;text&quot; name=&quot;fahr&quot; value=&quot;&lt;%=fahrValue%&gt;&quot;&gt;&lt;/td&gt;
        &lt;td&gt;&lt;input type=&quot;submit&quot; name=&quot;knop&quot; value=&quot;Omrekenen&quot;&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;% if (request.getParameter(&quot;knop&quot;) != null) { %&gt;
      &lt;tr&gt;
        &lt;td colspan=&quot;2&quot; class=&quot;fout&quot;&gt;&lt;%= warning %&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;% } %&gt;
    &lt;/table&gt;

  &lt;/form&gt;
&lt;/body&gt;
</pre>
				<h3>Uitleg</h3>
				<p>In deze uitwerking gebruiken we 2 int variabelen om de
					berekening van Celsius en Fahrenheit te maken. Daarnaast gebruiken
					we twee Strings om de tekstvakken een waarde (value) te geven.</p>
				<p>
					Je mag <span class="letop">nooit</span> twee Strings met elkaar
					vergelijken met == of !=. In plaats daarvan gebruik je de methode
					equals(Oject obj). Deze geeft &quot;true&quot; terug als de
					objecten hetzelfde zijn. Met het uitroepteken kun je true en false
					omkeren.
				</p>
				<p>
					De coderegel if
					(!request.getParameter(&quot;cels&quot;).equals(&quot;&quot;)) {
					betekent dus:<br> Geef &quot;true&quot; terug als de parameter
					met de naam &quot;cels&quot; <span class="letop">niet</span> gelijk
					is aan een lege String...
				</p>
			</div>
		</div>
		<div class="opdrachten">
			<h2>Opdracht 13</h2>
			<p>Schrijf een webpagina die een rekenmachine bevat. De
				rekenmachine kan optellen, aftrekken, vermenigvuldigen en delen. De
				bezoeker van de webpagina kan twee getallen invoeren en drukt op een
				knop om de gewenste berekening te laten uitvoeren. De uitkomst van
				de berekening wordt in het eerste tekstvak getoond zodat de
				gebruiker met de uitkomst verder kan rekenen. De rekenmachine zou er
				als volgt uit kunnen zien:</p>

			<%
				double opg13Getal1;
				double opg13Getal2;
				String uitkomst13 = "";
				String opg13Boodschap = "";

				if (request.getParameter("functie") != null) {
					if (request.getParameter("arg1").equals("")
							|| request.getParameter("arg2").equals("")) {
						opg13Boodschap = "Voer twee getallen in";
					} else {
						try {
							opg13Getal1 = Double.parseDouble(request
									.getParameter("arg1"));
							opg13Getal2 = Double.parseDouble(request
									.getParameter("arg2"));
							if (request.getParameter("functie").equals("+")) {
								uitkomst13 += (opg13Getal1 + opg13Getal2);
							} else if (request.getParameter("functie").equals("-")) {
								uitkomst13 += (opg13Getal1 - opg13Getal2);
							} else if (request.getParameter("functie").equals("*")) {
								uitkomst13 += (opg13Getal1 * opg13Getal2);
							} else {
								if (request.getParameter("functie").equals("/")) {
									uitkomst13 += (opg13Getal1 / opg13Getal2);
								}
							}
						} catch (NumberFormatException e) {
							opg13Boodschap = "Je mag alleen (decimale) getallen invoeren";
						} finally {
						}
					}
				}
			%>
			<!-- nieuwe rekenmachine -->
			<div id="rekenmachine">
				<div id="rekenmachine_naam">
					<p id="opg13">Rekenmachine</p>
				</div>
				<form action="/AO/jsp/deel2#opg13" method="get">
					<div class="invoer_arg">
						<p>Eerste getal</p>
						<input type="text" name="arg1" value="<%=uitkomst13%>">
					</div>
					<div class="invoer_arg">
						<p>Tweede getal</p>
						<input type="text" name="arg2" value="">
					</div>
					<div id="reken_knoppen">
						<div class="knop_container_2">
							<input type="submit" name="functie" value="+">
						</div>
						<div class="knop_container_2">
							<input type="submit" name="functie" value="-">
						</div>
						<div class="knop_container_2">
							<input type="submit" name="functie" value="*">
						</div>
						<div class="knop_container_2">
							<input type="submit" name="functie" value="/">
						</div>
					</div>
				</form>
				<div id="reken_foutmelding">
					<p class="foutboodschap"><%=opg13Boodschap%></p>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/AO/JSP_Java_DB/includes/bottom.html"%>
<script>
	$(document).ready(function() {
		$("li#deel-2").addClass("selected");
	});
</script>
</html>
<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

	<%@ include file="/AO/JSP_Java_DB/includes/zijmenu.jsp"%>


	<div class="col-md-9">
		<h2>Werken met JSP</h2>

		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je:</p>
			<ul>
				<li>Eclipse met de App Engine plugin hebt ge&iuml;nstalleerd</li>
				<li>jsp pagina&#39;s in Eclipse kunt maken</li>
				<li>weet hoe je java code schrijft tussen de jsp tags <span
					class="jsp"><b>&lt;%</span></b> en <span class="jsp"><b>%&gt;</b></span></li>
				<li>weet hoe je de jsp expressie <b><span class="jsp">&lt;%=</span>
						variabele <span class="jsp">%&gt;</span></b> in je html code gebruikt
				</li>
				<li>met bovenstaande volop geoefend hebt met de opdrachten in
					dit hoofdstuk</li>
				<li>een online portfolio op App Engine hebt gedeployed</li>
			</ul>



		</div>





		<!-- inhoud -->

		<img src="/AO/JSP_Java_DB/images/jsp.png">
		<h3>Benodigde voorkennis</h3>
		<p>
			Uitgangspunt is dat je de cursussen <a
				href="/AO/inleiding-java/h1" target="_blank">Inleiding
				Java</a>, <a href="/AO/BlueJ/intro"
				target="_blank">BlueJ</a> en <a
				href="/AO/htmlcss/h1" target="_blank">HTML/CSS</a>
			hebt voltooid.
		</p>

		<h3>Ontwikkelomgeving</h3>
		<p>
			In deze cursus gebruiken we de IDE <a
				href="https://eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/lunasr2"
				target="_blank">Eclipse</a>. Om apps op App Engine te deployen kun
			je de <a
				href="https://cloud.google.com/appengine/docs/java/tools/eclipse#Getting_Eclipse"
				target="_blank">App Engine plugin</a> installeren. Je mag uiteraard
			een andere IDE gebruiken, maar daarvoor mag je geen ondersteuning
			verwachten.
		</p>

		<div class="opdrachten">
			<h2>Opdracht 1</h2>
			<p>Met z&rsquo;n vieren (Jan, Ali, Jeannette en jij) hebben
				jullie een karwei verricht en daarmee 113 euro verdiend. Schrijf een
				webpagina waarin je een berekening maakt om het geld zo eerlijk
				mogelijk te verdelen. In het venster van de webpagina komen de vier
				namen onder elkaar te staan met daarachter het bedrag dat een ieder
				krijgt.</p>



			<div class="toonknopcontainer">
				<button class="toonknop" id="toon1" onclick="toon('uitw1')">Toon
					uitwerking</button>
			</div>

			<div class="uitwerking" id="uitw1">
				<p>In JSP kun je Java ouput in HTML-code genereren met
					&quot;out.println(&quot;html code &quot;)&quot;. Om er voor te
					zorgen dat de regels onder elkaar komen moet je aan het eind van
					iedere regel een &lt;br&gt; plaatsen. De gegenereerde HTML code
					wordt vervolgens door de browser weergegeven.</p>
				<pre class="code">
<span class="jsp">&lt;%</span>  
double bedrag = 113;
out.println(&quot;Jan: &amp;euro; &quot; + (bedrag / 4) + &quot;&lt;br&gt;&quot;);
out.println(&quot;Ali: &amp;euro; &quot; + (bedrag / 4) + &quot;&lt;br&gt;&quot;) ;
out.println(&quot;Jeanette: &amp;euro; &quot; + (bedrag / 4)  + &quot;&lt;br&gt;&quot;);
out.println(&quot;Piet: &amp;euro; &quot; + (bedrag / 4)  + &quot;&lt;br&gt;&quot;);
<span class="jsp">%&gt;</span>
</pre>


				<%
					double bedrag = 113;
					out.println("Jan: &euro; " + bedrag / 4 + "<br>");
					out.println("Ali: &euro; " + bedrag / 4 + "<br>");
					out.println("Jeanette: &euro; " + bedrag / 4 + "<br>");
					out.println("Piet: &euro; " + bedrag / 4 + "<br>");
				%>

				<p>
					Nadeel van deze methode is dat je alle html code inclusief speciale
					tekens als output moet genereren. Dit wordt al heel snel heel
					onoverzichtelijk. Een andere wat simpeler manier is om Java
					variabelen direct in HTML te gebruiken door gebruik te maken van de
					<span class="jsp"><b>&lt;%=</b></span> &quot;java variabele&quot; <span
						class="jsp"><b>%&gt;</b></span> jsp expressie. Je kunt
					bijvoorbeeld de variabele bedrag declareren en deze vervolgens
					direct in een gewone html tabel gebruiken.
				</p>


				<pre class="code">
<span class="comment">&lt;!-- jsp code --&gt;</span>
<span class="codeplus"><span class="jsp">&lt;%</span>  double bedrag = 113.0; <span
						class="jsp">%&gt;</span></span>

        <span class="comment">&lt;!-- html code  --&gt;</span>
        &lt;table border=&quot;1&quot;&gt;
            &lt;thead&gt;
                &lt;tr&gt;
                    &lt;th&gt;Naam&lt;/th&gt;
                    &lt;th&gt;Totaal &amp;euro; <span class="codeplus"><span
						class="jsp">&lt;%=</span> bedrag <span class="jsp">%&gt;</span></span>&lt;/th&gt;
                &lt;/tr&gt;
            &lt;/thead&gt;
            &lt;tbody&gt;
                &lt;tr&gt;
                    &lt;td&gt;Jan&lt;/td&gt;
                    &lt;td&gt;&amp;euro; <span class="codeplus"><span
						class="jsp">&lt;%=</span> bedrag/4 <span class="jsp">%&gt;</span></span>&lt;/td&gt;
                &lt;/tr&gt;
                &lt;tr&gt;
                    &lt;td&gt;Ali&lt;/td&gt;
                    &lt;td&gt;&amp;euro; <span class="codeplus"><span
						class="jsp">&lt;%=</span> bedrag/4 <span class="jsp">%&gt;</span></span>&lt;/td&gt;
                &lt;/tr&gt;
                &lt;tr&gt;
                    &lt;td&gt;Jeannette&lt;/td&gt;
                    &lt;td&gt;&amp;euro; <span class="codeplus"><span
						class="jsp">&lt;%=</span> bedrag/4 <span class="jsp">%&gt;</span></span>&lt;/td&gt;
                &lt;/tr&gt;
                &lt;tr&gt;
                    &lt;td&gt;Piet&lt;/td&gt;
                    &lt;td&gt;&amp;euro; <span class="codeplus"><span
						class="jsp">&lt;%=</span> bedrag/4 <span class="jsp">%&gt;</span></span>&lt;/td&gt;
                &lt;/tr&gt;
            &lt;/tbody&gt;
        &lt;/table&gt;
</pre>

				<table border="1">
					<thead>
						<tr>
							<th>Naam</th>
							<th>Totaal &euro; <%=bedrag%></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Jan</td>
							<td>&euro; <%=bedrag / 4%></td>
						</tr>
						<tr>
							<td>Ali</td>
							<td>&euro; <%=bedrag / 4%></td>
						</tr>
						<tr>
							<td>Jeannette</td>
							<td>&euro; <%=bedrag / 4%></td>
						</tr>
						<tr>
							<td>Piet</td>
							<td>&euro; <%=bedrag / 4%></td>
						</tr>
					</tbody>
				</table>
				<p>Verschillende programmeurs gebruiken verschillende stijlen
					van programmeren. Doordat Java en HTML code door elkaar heen worden
					gebruikt, kan je code snel onleesbaar worden. Het is dan ook zaak
					om je code zo overzichtelijk mogelijk te houden.</p>



			</div>
		</div>

		<div class="opdrachten">

			<%
				int minuut = 60;
				int uur = minuut * 60;
				int dag = uur * 24;
				int week = dag * 7;
				int jaar = dag * 365;
			%>




			<h2>Opdracht 2</h2>
			<p>Schrijf een webpagina, waarin berekend wordt hoeveel seconden
				er in een minuut, een uur, een dag, een week en een jaar gaan. Maak
				gebruik van een tabel om de gegevens in het venster van de browser
				te plaatsen.</p>
			<table border="1">
				<thead>
					<tr>
						<th>Eenheid</th>
						<th>Aantal seconden</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Minuut</td>
						<td><%=minuut%></td>
					</tr>
					<tr>
						<td>Uur</td>
						<td><%=uur%></td>
					</tr>
					<tr>
						<td>Dag</td>
						<td><%=dag%></td>
					</tr>
					<tr>
						<td>Week</td>
						<td><%=week%></td>
					</tr>
					<tr>
						<td>Jaar</td>
						<td><%=jaar%></td>
					</tr>

				</tbody>
			</table>
			<br>
			<!-- <div class="toonknopcontainer">
							<button class="toonknop" id="toon2" onclick="toon('uitw2')">Toon uitwerking</button>
						</div> -->

			<div class="uitwerking" id="uitw2">
				<p>Je begint met bovenin je jsp pagina de benodigde variabelen
					te declareren en een waarde te geven:</p>


				<pre class="code">
&lt;% 
int minuut = 60;
int uur = minuut * 60;
int dag = uur * 24;
int week = dag * 7;
int jaar = dag * 365;
%&gt;
</pre>
				<p>Vervolgens maak je een tabel waarin je de variabelen tussen
					je HTML code plaatst met de JSP expressie &lt;%= .... %&gt;</p>

				<pre class="code">
 &lt;body&gt;
     &lt;table border=&quot;1&quot; cellpadding=&quot;5&quot;&gt;
         &lt;thead&gt;
             &lt;tr&gt;
                 &lt;th&gt;Eenheid&lt;/th&gt;
                 &lt;th&gt;Aantal seconden&lt;/th&gt;
             &lt;/tr&gt;
         &lt;/thead&gt;
         &lt;tbody&gt;
             &lt;tr&gt;
                 &lt;td&gt;Minuut&lt;/td&gt;
                 &lt;td&gt;&lt;%= minuut %&gt;&lt;/td&gt;
             &lt;/tr&gt;
             &lt;tr&gt;
                 &lt;td&gt;Uur&lt;/td&gt;
                 &lt;td&gt;&lt;%= uur %&gt;&lt;/td&gt;
             &lt;/tr&gt;
             &lt;tr&gt;
                 &lt;td&gt;Dag&lt;/td&gt;
                 &lt;td&gt;&lt;%= dag %&gt;&lt;/td&gt;
             &lt;/tr&gt;
             &lt;tr&gt;
                 &lt;td&gt;Week&lt;/td&gt;
                 &lt;td&gt;&lt;%= week %&gt;&lt;/td&gt;
             &lt;/tr&gt;
             &lt;tr&gt;
                 &lt;td&gt;Jaar&lt;/td&gt;
                 &lt;td&gt;&lt;%= jaar %&gt;&lt;/td&gt;
             &lt;/tr&gt;
             
         &lt;/tbody&gt;
     &lt;/table&gt;

 &lt;/body&gt;
</pre>
				<p>Het resultaat is een tabel waarin het aantal seconden wordt
					berekend</p>




			</div>



		</div>

		<div class="opdrachten">
			<h2>Opdracht 3</h2>

			<p>Verwelkom de bezoeker van je webpagina met een
				&quot;Goedemorgen&quot;, &quot;Goedemiddag&quot; of
				&quot;Goedenavond&quot; afhankelijk van het tijdstip waarop de
				bezoeker de webpagina bezoekt. Geef ook het huidig uur.</p>
			<p>Voorbeeld uitwerking:</p>
			<%@page import="java.util.Calendar"%>
			<%@page import="java.util.TimeZone"%>
			<%
				Calendar nu = Calendar.getInstance();
				TimeZone tz = TimeZone.getTimeZone("Europe/Brussels");
				nu.setTimeZone(tz);
				int uurNu = nu.get(Calendar.HOUR_OF_DAY);
			%>
			<%
				if (uurNu < 12) {
			%>
			<h3>Goedemorgen</h3>
			<h4>
				Huidig uur:
				<%=uurNu%>
			</h4>
			<%
				} else if (uurNu < 18) {
			%>
			<h3>Goedemiddag</h3>
			<h4>
				Huidig uur:
				<%=uurNu%>
			</h4>
			<%
				} else {
			%>
			<h3>Goedenavond</h3>
			<h4>
				Huidig uur:
				<%=uurNu%>
			</h4>
			<%
				}
			%>
			<p>
				<span class="letop">Tip:</span> Maak gebruik van de Java klasse <a
					href="http://docs.oracle.com/javase/7/docs/api/java/util/Calendar.html"
					target=_"blank"> Calendar</a>. Maak een instantie van Calendar door
				de <em>static</em> methode Calendar.<a
					href="http://docs.oracle.com/javase/7/docs/api/java/util/Calendar.html#getInstance()">getInstance()</a>
				aan te roepen. Dit levert de huidige datum/tijd op. Om het uur van
				de dag op te vragen kun je gebruik maken van de <em>constante</em> <a
					href="http://docs.oracle.com/javase/7/docs/api/java/util/Calendar.html#HOUR_OF_DAY"
					target="_blank">HOUR_OF_DAY</a> van de klasse Calendar.
			</p>


			<pre class="code">
<span class="jsp">&lt;%</span>  
Calendar nu = Calendar.getInstance();
int huidigUur = nu.get(Calendar.HOUR_OF_DAY);
    
<span class="comment">//hier komt de overige java code</span>
    
<span class="jsp">%&gt;</span>
</pre>


			<!-- <div class="toonknopcontainer">
							<button class="toonknop" id="toon3" onclick="toon('uitw3')">Toon uitwerking</button>
						</div> -->

			<div class="uitwerking" id="uitw3">
				<p>De java.util.Calendar klasse moet ge&iuml;mporteerd worden om
					de juiste tijd op te kunnen vragen:</p>


				<pre class="code">
&lt;%@page import=&quot;java.util.Calendar&quot;%&gt;
</pre>
				<p>Doe dit handmatig als NetBeans het niet automatisch heeft
					gedaan. Nu kun je de volgende variabelen declareren en de benodigde
					waardes geven:</p>

				<pre class="code">
&lt;%  Calendar nu = Calendar.getInstance();
    int uur = nu.get(Calendar.HOUR_OF_DAY);
    String groet = &quot;&quot;;
    if (uur &lt; 12) {
      groet = &quot;Goedemorgen&quot;;
	}
    else {
      groet = &quot;Goedemiddag&quot;;
    }
%&gt;
    &lt;h1&gt;&lt;%= groet %&gt;&lt;/h1&gt;
    &lt;p&gt;Huidig uur: &lt;%= uur %&gt;&lt;/p&gt;
</pre>

				<p>
					Als uur kleiner is dan 12 (ochtend) moet er Goedemorgen komen te
					staan, anders Goedemiddag. Hiervoor gebruik je een if... else
					statement. <span class="letop">Merk op</span> hoe je Java en HTML
					code door elkaar heen kunt gebruiken!
				</p>







			</div>


		</div>
		<div class="opdrachten">
			<h2>Opdracht 4</h2>
			<p>Geef de rij van Fibonacci. De eerste twee getallen van de rij
				zijn 1 en de volgende zijn steeds de som van de twee voorgangers. 1,
				1, 2, 3, 5, 8, 13, 21, enz.</p>
			<p>
				De rij van Fibonacci voegt steeds een nieuw getal toe dat de som is
				van de twee voorgaande getallen. Om de rij van Fibonacci te maken
				hebben we dus drie variabelen nodig. De twee getallen die bij elkaar
				moeten worden opgeteld en de som ervan. Om een echt lange reeks te
				maken kun je het primitieve type <b>long</b> gebruiken. Om aan te
				geven dat een getal van het type long is moet je <b>L</b> achter het
				getal zetten. Anders denkt java dat het een int is.
			</p>
			<pre class="code">
<span class="jsp">&lt;%</span>
long arg0 = 0L;
long arg1 = 1L;
long som = arg0 + arg1;
long maxWaarde = 900000000000000000L;
<span class="jsp">%&gt;</span>
</pre>

			<p>
				In een lus krijgt <b>som</b> steeds de waarde van arg0 + arg1. Nadat
				deze waarde is toegekend moet <b>som</b> worden weergegeven in HTML.
				Het eerste argument (<b>arg0</b>) krijgt de waarde van het tweede (<b>arg1</b>)
				en het tweede argument krijgt de waarde van som, waarna de lus zich
				herhaalt.
			</p>
			<p>Voorbeeld uitwerking:</p>
			<%
				long arg0 = 0L;
				long arg1 = 1L;
				long som = arg0 + arg1;
				long maxWaarde = 900000000000000000L;
				/* DecimalFormatSymbols dfs = new DecimalFormatSymbols();
				dfs.setGroupingSeparator('.');
				DecimalFormat df = new DecimalFormat("###,###.##", dfs); */
			%>
			<h3>De rij van Fibonacci</h3>
			<p><%=som%>,
				<%
				while (som < maxWaarde) {
					som = arg0 + arg1;
					arg0 = arg1;
					arg1 = som;
			%>

				<%=som%>,

				<%
					}
				%>
				<b>en zo voort...</b>
			</p>


			<!-- <div class="toonknopcontainer">
							<button class="toonknop" id="toon4" onclick="toon('uitw4')">Toon uitwerking</button>
						</div> -->

			<div class="uitwerking" id="uitw4">
				<p>De rij van Fibonacci voegt steeds een nieuw getal toe dat de
					som is van de twee voorgaande getallen. Om de rij van Fibonacci te
					maken hebben we dus drie variabelen nodig. De twee getallen die bij
					elkaar moeten worden opgeteld en de som ervan.</p>
				<p>
					In een lus krijgt <b>som</b> steeds de waarde van <b>arg0 +
						arg1</b>. Het eerste argument krijgt de waarde van het tweede en het
					tweede argument krijgt de waarde van som.
				</p>

				<pre class="code">
&lt;%
 long arg0 = 0L;
 long arg1 = 1L;
 long som = 1L;
 long maxWaarde = 900000000000000000L;
%&gt;


&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;
        &lt;title&gt;Fibonacci&lt;/title&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;h3&gt;De rij van Fibonacci&lt;/h3&gt;
        &lt;p&gt;1, 
        &lt;% while (som &lt; maxWaarde) {
            som = arg0 + arg1;
            arg0 = arg1;
            arg1 = som; %&gt;
            &lt;%= som %&gt;, 
      
       &lt;% } %&gt;
        en zo voort... &lt;/p&gt;
   &lt;/body&gt;
&lt;/html&gt;
</pre>

			</div>






		</div>

		<div class="opdrachten">
			<h2>Opdracht 5</h2>
			<p>Schrijf een webpagina waarin een schaakbord op het scherm
				wordt getekend. Een schaakbord heeft 8 bij 8 vakken om en om zwart
				en wit.</p>
			<p>
				<span class="letop">Aanwijzingen</span>
			</p>
			<ul>
				<li>bekijk de html en css code van onderstaand schaakbord met
					de functie <em>&quot;element inspecteren&quot;</em> van je browser
				</li>
				<li>gebruik mbv Java twee lussen (loops) om de rijen en de
					kolommen te maken</li>
				<li>bedenk een algoritme om de cellen om de beurt zwart en wit
					te maken</li>
			</ul>

			<h3>Schaakbord</h3>
			<table id="schaakbord">
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
			<br>


			<!-- <div class="toonknopcontainer">
							<button class="toonknop" id="toon5" onclick="toon('uitw5')">Toon uitwerking</button>
						</div> -->

			<div class="uitwerking" id="uitw5">
				<h3>De gebruikte CSS code</h3>

				<pre class="code">
&lt;style type=&quot;text/css&quot;&gt;
  table#schaakbord td {
      width: 30px;
      height: 30px;
  }
  
  #schaakbord td.zwart {
      background-color: black;
  }
  
  #schaakbord td.wit {
      background-color: white;
  }
  
  table#schaakbord {
      border: 1px solid black;
      border-collapse: collapse;
  }
&lt;/style&gt;
</pre>

				<h3>De gebruikte JSP code</h3>

				<pre class="code">
&lt;h3&gt;Schaakbord&lt;/h3&gt;
&lt;table id=&quot;schaakbord&quot;&gt;
    &lt;% for (int i = 0; i &lt; 8; i++) { %&gt;
    &lt;tr&gt;
       &lt;% for (int j = 0; j &lt; 8; j++) { 
           if ((i + j) % 2 == 0) { %&gt;
           	&lt;td class=&quot;zwart&quot;&gt;&lt;/td&gt;
           &lt;% } 
           else { %&gt;
           	&lt;td class=&quot;wit&quot;&gt;&lt;/td&gt;
           &lt;% } 
    }%&gt;
    &lt;/tr&gt;
   &lt;% } %&gt;
&lt;/table&gt;
</pre>

				<h3>Alternatieve uitwerking</h3>
				<p>Er is iets voor te zeggen om je Java en HTML code zoveel
					mogelijk gegroepeerd bij elkaar te houden. Dit kun je bijvoorbeeld
					doen door de HTML code in een String op te nemen en die vervolgens
					in je HTML op te nemen. Let er dan wel op dat je bepaalde tekens
					zoals aanhalingstekens moet &quot;escapen&quot; met \ (backslash).</p>
				<pre class="code">
&lt;!DOCTYPE html&gt;
&lt;html&gt;

&lt;%@page contentType=&quot;text/html&quot; pageEncoding=&quot;UTF-8&quot;%&gt;
&lt;% 
    String velden = &quot;&quot;;
    for (int i = 0; i &lt; 8; i++) { 
        velden += &quot;&lt;tr&gt;&quot;;
        for (int j = 0; j &lt; 8; j++) { 
           if ((i + j) % 2 == 0) {
           	velden += &quot;&lt;td class=\&quot;zwart\&quot;&gt;&lt;/td&gt;&quot;;
            } 
           else {
           	velden += &quot;&lt;td class=\&quot;wit\&quot;&gt;&lt;/td&gt;&quot;;
            } 
        }
      velden += &quot;&lt;/tr&gt;&quot;;
   } 
  
%&gt;

    &lt;head&gt;
       
     &lt;title&gt;Schaakbord&lt;/title&gt;

    &lt;/head&gt;
    &lt;body&gt;
        &lt;h1&gt;Schaakbord&lt;/h1&gt;
        &lt;table id=&quot;schaakbord&quot;&gt;
         	&lt;%= velden %&gt;
        
        &lt;/table&gt;
       
    &lt;/body&gt;
&lt;/html&gt;

</pre>


			</div>

		</div>

		<div class="opdrachten">
			<h2>Opdracht 6</h2>
			<p>Zet de tafel van vijf in het venster van de browser. Uiteraard
				maak je gebruik van een lus.</p>
			<h3>De tafel van 5</h3>
			<%
				for (int i = 1; i <= 10; i++) {
			%>
			<%=i%>
			x 5 =
			<%=i * 5%>
			<br>
			<%
				}
			%>
			<br>
			<!-- <div class="toonknopcontainer">
							<button class="toonknop" id="toon6" onclick="toon('uitw6')">Toon uitwerking</button>
						</div> -->

			<div class="uitwerking" id="uitw6">

				<pre class="code">
&lt;body&gt;
    &lt;h3&gt;De tafel van 5&lt;/h3&gt;
    &lt;% for (int i = 1; i &lt;= 10; i++) { %&gt;
    &lt;%= i %&gt; x 5 = &lt;%= i * 5 %&gt; &lt;br&gt;
    &lt;% } %&gt;
&lt;/body&gt;

</pre>

				<h3>De tafel van 5</h3>
				<%
					for (int i = 1; i <= 10; i++) {
				%>
				<%=i%>
				x 5 =
				<%=i * 5%>
				<br>
				<%
					}
				%>

			</div>



		</div>

		<div class="opdrachten">
			<h2>Opdracht 7</h2>
			<P>Maak een webpagina met daarop een vermenigvuldigingstabel. In
				een vermenigvuldigingstabel staan de getallen die met elkaar
				vermenigvuldigd worden op de eerste regel en in de linkerkolom. In
				de cel, waarin kolom en regel elkaar kruisen, staat de uitkomst van
				de vermenigvuldiging van de twee getallen.</P>

			<h3>Vermenigvuldigingstabel</h3>
			<div class="table_wrapper">
				<table id="xtabel">
					<%
						for (int i = 1; i <= 10; i++) {
					%>
					<tr>
						<%
							for (int j = 1; j <= 10; j++) {
									if (i == 1 || j == 1) {
						%>
						<th><%=i * j%></th>
						<%
							} else {
						%>
						<td><%=i * j%></td>
						<%
							}
								}
						%>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<br>

			<!-- <div class="toonknopcontainer">
							<button class="toonknop" id="toon7" onclick="toon('uitw7')">Toon uitwerking</button>
						</div> -->

			<div class="uitwerking" id="uitw7">
				<pre class="code">
&lt;%@page contentType=&quot;text/html&quot; pageEncoding=&quot;UTF-8&quot;%&gt;
&lt;%
    String cellen = &quot;&quot;;
    for (int rij = 1; rij &lt;= 10; rij++){
        cellen += &quot;&lt;tr&gt;&quot;;
        for (int kolom = 1; kolom &lt;= 10; kolom++) {
            if (rij == 1 || kolom == 1) {
                cellen += &quot;&lt;th&gt;&quot; + (rij * kolom) + &quot;&lt;/th&gt;&quot;;
            }
            else {
                cellen += &quot;&lt;td&gt;&quot; + (rij * kolom) + &quot;&lt;/td&gt;&quot;;
            }
        }
        cellen += &quot;&lt;/tr&gt;&quot;;
    }
%&gt;


&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;
        &lt;title&gt;xtabel&lt;/title&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;h1&gt;Vermenigvuldigingstabel&lt;/h1&gt;
        &lt;table id=&quot;xtabel&quot;&gt;
            &lt;%= cellen %&gt;
        &lt;/table&gt;
    &lt;/body&gt;
&lt;/html&gt;
</pre>


			</div>


		</div>


	</div>
	<%@ include file="/AO/JSP_Java_DB/includes/bottom.html"%>
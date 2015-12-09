<%@ include file="/AO/JSP_Java_DB/includes/pagetop.jsp"%>
<%@ page import="jspcursus.Graden"%>
<%@ page import="jspcursus.autoshop.Auto"%>
<%@ page import="jspcursus.autoshop.AutoLijst"%>
<%@ page import="jspcursus.Rekenmachine"%>
<%@ page import="mvsite.student.*"%>
<%@ page import="java.util.ArrayList"%>


<%

	if (user != null) { 
if (request.getAttribute("check") == null) {
	response.sendRedirect("/jsp_deel_3");
} else {
%>


<div class="col-md-9">
	<h2>Java klassen</h2>

	<!-- Leerdoelen -->
	<div class="bs-callout bs-callout-warning">
		<h2>Leerdoelen</h2>
		<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
			je weet:</p>
		<ul>
			<li>hoe je java klassen in je web app kunt maken en gebruiken</span></li>

		</ul>



	</div>





	<!-- inhoud -->
	<div class="opdrachten" id="opg14">
		<h2>Opdracht 14</h2>
		<p>Maak dezelfde pagina als in opdracht 12, maar maak nu gebruik
			van een klasse die de berekeningen uitvoert in plaats van dat de
			berekeningen in JSP worden uitgevoerd. Maak naast JSP gebruik van
			HTML en CSS bij het uitvoeren van deze opdracht.</p>



		<div class="toonknopcontainer">
			<button class="toonknop" id="toon14" onclick="toon('uitw14')">Toon
				uitwerking</button>
		</div>

		<div class="uitwerking" id="uitw14">
			<p>In Eclipse maak je in je projectstructuur een java klasse.
				Klassen bevinden zich in zogenaamde &quot;packages&quot; in de map
				&quot;src&quot; (source).</p>
			<img src="/AO/JSP_Java_DB/images/project.png"
				alt="Java klasse in Eclipse project">
			<h3>De java klasse</h3>
			<p>We maken een java klasse met een constructor en twee methoden
				om van Celsius naar Fahrenheit en vice versa te rekenen. We geven
				aan de methoden een String mee als parameter. Deze String moet naar
				een int worden geconverteerd met de methode Integer.parseInt().
				Zoals we hebben gezien werpt deze methode een NumberFormatException
				op als de conversie niet lukt. Door achter de methode &quot;throws
				NumberFormatException&quot; te zetten geven we aan dat deze
				exception moet worden opgegooid als de methodes worden aangeroepen
				met een onjuiste parameter(geen int). Later in de jsp gebruiken we
				deze exception om een foutmelding te maken.</p>


			<pre class="code">
package graden;

public class Graden {

	private int uitkomst;
	
	public Graden() {
		
	}
	<span class="comment">//Exception opwerpen voor foute invoer</span>
	public int naarCels(String sFahr) <span class="codeplus">throws NumberFormatException</span> {
		int fahr = Integer.parseInt(sFahr);
		uitkomst = Math.round((fahr -32)/1.8f);
		return uitkomst;
	}
	
	public int naarFahr(String sCels) throws NumberFormatException {
		int cels = Integer.parseInt(sCels);
		uitkomst = Math.round(cels * 1.8f + 32);
		return uitkomst;
	}
}

</pre>


			<h3>De JSP pagina</h3>
			<p>In de JSP pagina willen we de klasse die we net hebben gemaakt
				gebruiken om de berekening uit te voeren. Hiertoe moeten we de
				klasse importeren.</p>

			<pre class="code">
&lt;%@page import=&quot;graden.Graden&quot; %&gt;
</pre>
			<p>Nu kunnen we een instantie van Graden aanmaken en daarop de
				twee methoden aanroepen. Als parameters geven we de String mee die
				de methode request.getParameter(String s) teruggeeft.</p>

			<pre class="code">
&lt;%
<span class="codeplus">Graden g = new Graden();</span>
String celsValue = &quot;&quot;;
String fahrValue = &quot;&quot;;
String warning = &quot;&quot;;
<span class="comment">//check of er op knop is geklikt</span>
if (request.getParameter(&quot;knop&quot;) != null) {
  try {
    <span class="comment">//er mag maar &eacute;&eacute;n input veld zijn ingevuld</span>
    if (!request.getParameter(&quot;cels&quot;).equals(&quot;&quot;) 
     && !request.getParameter(&quot;fahr&quot;).equals(&quot;&quot;)) {
       warning = &quot;Voer slechts &amp;eacute;&amp;eacute;n waarde in!&quot;;
    }
    <span class="comment">//gebruiker heeft Celsius ingevoerd</span>
    else if (!request.getParameter(&quot;cels&quot;).equals(&quot;&quot;)) {
      <span class="codeplus">int fahr = g.naarFahr(request.getParameter(&quot;cels&quot;));</span>
      fahrValue += fahr;
    }
    <span class="comment">//gebruiker heeft Fahrenheit ingevoerd</span>
    else if (!request.getParameter(&quot;fahr&quot;).equals(&quot;&quot;)) {
      <span class="codeplus">int cels = g.naarCels(request.getParameter(&quot;fahr&quot;));</span>
      celsValue += cels;
    }
  }
  <span class="comment">//foute of geen invoer werpt Exception op</span>
  <span class="codeplus">catch(NumberFormatException e</span>) {
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
      &lt;td&gt;&lt;input type=&quot;text&quot; name=&quot;cels&quot; value=&quot;<span
					class="codeplus">&lt;%=celsValue%&gt;</span>&quot;&gt;&lt;/td&gt;
      &lt;td&gt;&lt;input type=&quot;text&quot; name=&quot;fahr&quot; value=&quot;<span
					class="codeplus">&lt;%=fahrValue%&gt;</span>&quot;&gt;&lt;/td&gt;
      &lt;td&gt;&lt;input type=&quot;submit&quot; name=&quot;knop&quot; value=&quot;Omrekenen&quot;&gt;&lt;/td&gt;
    &lt;/tr&gt;
    
    &lt;% if (request.getParameter(&quot;knop&quot;) != null) { %&gt;
      &lt;tr&gt;
        &lt;td colspan=&quot;2&quot; class=&quot;fout&quot;&gt;<span
					class="codeplus">&lt;%= warning %&gt;</span>&lt;/td&gt;
      &lt;/tr&gt;
    &lt;% } %&gt;
  &lt;/table&gt;

&lt;/form&gt;


</pre>
		</div>

	</div>

	<div class="opdrachten" id="opg15">
		<h2>Opdracht 15</h2>
		<p>Maak dezelfde pagina met de rekenmachine als in opdracht 13,
			maar maak nu gebruik van een klasse die de berekeningen uitvoert in
			plaats van dat de berekeningen in JSP worden uitgevoerd. Maak naast
			JSP gebruik van HTML en CSS bij het uitvoeren van deze opdracht.</p>
		<script src="/AO/JSP_Java_DB/includes/jquery-1.11.2.js"></script>
		<script>
			$(document)
					.ready(
							function() {
								$(document)
										.on(
												'click',
												'#reken_functie_plus',
												function() {
													var functie = $(
															"#reken_functie_plus")
															.val();
													var arg1 = $("#arg1").val();
													var arg2 = $("#arg2").val();

													$
															.get(
																	"/rekenmachine?arg1="
																			+ arg1
																			+ "&arg2="
																			+ arg2
																			+ "&functie="
																			+ functie,
																	function(
																			responseText) {
																		$(
																				"#inhoud_rekenmachine")
																				.html(
																						responseText);
																	});
												});
								$(document)
										.on(
												'click',
												'#reken_functie_min',
												function() {
													var functie = $(
															"#reken_functie_min")
															.val();
													var arg1 = $("#arg1").val();
													var arg2 = $("#arg2").val();

													$
															.get(
																	"/rekenmachine?arg1="
																			+ arg1
																			+ "&arg2="
																			+ arg2
																			+ "&functie="
																			+ functie,
																	function(
																			responseText) {
																		$(
																				"#inhoud_rekenmachine")
																				.html(
																						responseText);
																	});
												});
								$(document)
										.on(
												'click',
												'#reken_functie_maal',
												function() {
													var functie = $(
															"#reken_functie_maal")
															.val();
													var arg1 = $("#arg1").val();
													var arg2 = $("#arg2").val();

													$
															.get(
																	"/rekenmachine?arg1="
																			+ arg1
																			+ "&arg2="
																			+ arg2
																			+ "&functie="
																			+ functie,
																	function(
																			responseText) {
																		$(
																				"#inhoud_rekenmachine")
																				.html(
																						responseText);
																	});
												});
								$(document)
										.on(
												'click',
												'#reken_functie_delen',
												function() {
													var functie = $(
															"#reken_functie_delen")
															.val();
													var arg1 = $("#arg1").val();
													var arg2 = $("#arg2").val();

													$
															.get(
																	"/rekenmachine?arg1="
																			+ arg1
																			+ "&arg2="
																			+ arg2
																			+ "&functie="
																			+ functie,
																	function(
																			responseText) {
																		$(
																				"#inhoud_rekenmachine")
																				.html(
																						responseText);
																	});
												});

							});
		</script>

		<div id="inhoud_rekenmachine">
			<div id="rekenmachine">
				<div id="rekenmachine_naam">
					<p>Rekenmachine</p>
				</div>

				<div class="invoer_arg">
					<p>Eerste getal</p>
					<input type="text" id="arg1" value="">
				</div>
				<div class="invoer_arg">
					<p>Tweede getal</p>
					<input type="text" id="arg2" value="">
				</div>
				<div id="reken_knoppen">
					<div class="knop_container_2">
						<button type="button" id="reken_functie_plus" value="plus">+</button>
					</div>
					<div class="knop_container_2">
						<button type="button" id="reken_functie_min" value="min">-</button>
					</div>
					<div class="knop_container_2">
						<button type="button" id="reken_functie_maal" value="maal">X</button>
					</div>
					<div class="knop_container_2">
						<button type="button" id="reken_functie_delen" value="delen">/</button>
					</div>

				</div>

			</div>
		</div>








		<!--  		<div class="toonknopcontainer">
							<button class="toonknop" id="toon15" onclick="toon('uitw15')">Toon uitwerking</button>
						</div>  -->

		<div class="uitwerking" id="uitw15">
			<p>In onderstaande code zijn iets andere keuzes gemaakt dan in de
				vorige opgave. Zoek de verschillen!</p>

			<h3>Java</h3>
			<pre class="code">
package rekenmachine;

<span class="javadoc">/**
 *Geeft double als uitkomst terug voor rekenmachine
 *@author AO ROC Flevoland pdv
 *
 */</span>
public class Rekenmachine {
  double uitkomst = 0;
	
 <span class="javadoc">/**
  *Geeft uitkomst berekening afhankelijk van functie
  *@param double arg0
  *@param double arg1
  *@param String functie bepaalt type berekening
  *@return double uitkomst berekening
  */</span>
  public double bereken(double arg0, double arg1, String functie) {
    switch (functie) {
      case &quot;+&quot;: uitkomst = arg0 + arg1;
                break;

      case &quot;-&quot;: uitkomst = arg0 - arg1;
                break;

      case &quot;x&quot;: uitkomst = arg0 * arg1;
                break;

      case &quot;/&quot;: uitkomst = arg0 / arg1;
                break;
    }
    return uitkomst;
  }
}


</pre>


			<h3>JSP</h3>

			<pre class="code">
&lt;%
<span class="codeplus">Rekenmachine rm = new Rekenmachine();</span>
String uitkomst = &quot;&quot;;
String foutboodschap = &quot;&quot;;


if (request.getParameter(&quot;functie&quot;) != null) {
  if (request.getParameter(&quot;arg1&quot;).equals(&quot;&quot;) || 
    request.getParameter(&quot;arg2&quot;).equals(&quot;&quot;)) {
      foutboodschap = &quot;Voer &lt;em&gt;twee&lt;/em&gt; getallen in&quot;;
  }
  else {
    try {
      double getal1 = Double.parseDouble(request.getParameter(&quot;arg1&quot;));
      double getal2 = Double.parseDouble(request.getParameter(&quot;arg2&quot;));
      String functie = request.getParameter(&quot;functie&quot;);
      <span class="codeplus">uitkomst += rm.bereken(getal1, getal2, functie);</span>
    }
    catch(NumberFormatException e) {
      foutboodschap = &quot;Je mag alleen (decimale) getallen invoeren&quot;;
    }
  }
}
%&gt;

    &lt;form action=&quot;index.jsp&quot; method=&quot;get&quot;&gt;
      
      &lt;table id=&quot;rekenmachine&quot;&gt;
        
        &lt;thead&gt;
          
          &lt;tr id=&quot;kop&quot;&gt;
            &lt;th colspan=&quot;4&quot;&gt;Rekenmachine&lt;/th&gt;
          &lt;/tr&gt;
          
        &lt;/thead&gt;
        
        &lt;tbody&gt;
          
          &lt;tr&gt;
            &lt;td class=&quot;getallabels&quot; colspan=&quot;2&quot;&gt;Eerste getal&lt;/td&gt;
            &lt;td class=&quot;getallabels&quot; colspan=&quot;2&quot;&gt;Tweede getal&lt;/td&gt;
          &lt;/tr&gt;

          &lt;tr id=&quot;invoer&quot;&gt;
            &lt;td colspan=&quot;2&quot;&gt;
              &lt;input type=&quot;text&quot; name=&quot;arg1&quot; value=&quot;<span
					class="codeplus">&lt;%= uitkomst %&gt;</span>&quot;
            &lt;/td&gt;
            &lt;td colspan=&quot;2&quot;&gt;
              &lt;input type=&quot;text&quot; name=&quot;arg2&quot; value=&quot;&quot;&gt;
            &lt;/td&gt;
          &lt;/tr&gt;

          &lt;tr id=&quot;knoppen&quot; &gt;
            &lt;td&gt;
              &lt;div class=&quot;knopcontainer&quot;&gt;
                &lt;input type=&quot;submit&quot; name=&quot;functie&quot; value=&quot;+&quot;&gt;
              &lt;/div&gt;
           &lt;/td&gt;
            &lt;td&gt;
              &lt;div class=&quot;knopcontainer&quot;&gt;
                &lt;input type=&quot;submit&quot; name=&quot;functie&quot; value=&quot;-&quot;&gt;
              &lt;/div&gt;
            &lt;/td&gt;
            &lt;td&gt;
              &lt;div class=&quot;knopcontainer&quot;&gt;
                &lt;input type=&quot;submit&quot; name=&quot;functie&quot; value=&quot;x&quot;&gt;
              &lt;/div&gt;
            &lt;/td&gt;
            &lt;td&gt;
              &lt;div class=&quot;knopcontainer&quot;&gt;
                &lt;input type=&quot;submit&quot; name=&quot;functie&quot; value=&quot;/&quot;&gt;
              &lt;/div&gt;
            &lt;/td&gt;
          &lt;/tr&gt;
          
          &lt;tr&gt;
            &lt;td colspan=&quot;4&quot; class=&quot;fout&quot;&gt;<span
					class="codeplus">&lt;%= foutboodschap %&gt;</span>&lt;/td&gt;
          &lt;/tr&gt;

      &lt;/table&gt;
      
    &lt;/form&gt;
  
  &lt;/body&gt;
&lt;/html&gt;


</pre>
			<p>
				<span class="letop">Merk op</span> dat er bij het programmeren vaak
				meerdere oplossingen mogelijk zijn. Iedere programmeur ontwikkelt in
				zekere zin zijn eigen stijl. Let er wel op dat je probeert zo
				&quot;zuinig&quot; mogelijk te programmeren en je code
				overzichtelijk te houden. Sommige bedrijven hanteren strenge
				stijlregels om hun code uniform te houden.
			</p>


		</div>


	</div>

	<script>
		$(document).ready(
				function() {

					$("#knop_merk_prijs").click(
							function() {
								var merk = $("#merk").val();
								var minprijs = $("#minprijs").val();
								var maxprijs = $("#maxprijs").val();
								$.get("/autoshop?merk=" + merk + "&minprijs="
										+ minprijs + "&maxprijs=" + maxprijs,
										function(responseText) {
											$("#autoselectie").html(
													responseText);
										});
							});

				});
	</script>

	<%
		AutoLijst al = new AutoLijst();
				ArrayList<Auto> lijst = al.getLijst();
	%>

	<div class="opdrachten" id="zelftoets">
		<h2>Toets</h2>
		<p>Maak een webpagina volgens onderstaand voorbeeld waarin auto's
			of andere produkten worden vertoond en waarbij de gebruiker kan
			selecteren op merk of minimum- en/of maximumprijs.</p>


		<label>Kies Merk</label> <select id="merk">
			<option value="alle">Alle merken</option>
			<%
				for (String merk : al.getMerken()) {
			%>
			<option value="<%=merk%>"><%=merk%></option>
			<%
				}
			%>
		</select><br> <label>Minimum prijs</label> <input type="text"
			id="minprijs"> <label>Maximum prijs</label> <input
			type="text" id="maxprijs"><br> <input type="button"
			id="knop_merk_prijs" value="OK">


		<div id="autoselectie">

			<%
				for (Auto auto : lijst) {
			%>
			<div class="autokader">
				<img src="<%=auto.getFoto()%>"
					alt="<%=auto.getMerk()%><%=auto.getType()%>">
				<p class="merktype"><%=auto.getMerk()%>
					<%=auto.getType()%></p>
				<p class="prijs">
					&euro;
					<%=auto.getPrijsFormat()%></p>
			</div>
			<%
				}
			%>

		</div>
		<div class="toonknopcontainer">
			<button class="toonknop" id="toonzelftoets"
				onclick="toon('uitwzelftoets')">Toon uitwerking</button>
		</div>

		<div class="uitwerking" id="uitwzelftoets">
			<p>Om je op weg te helpen kun je gebruik maken van de twee
				onderstaande Java klassen.</p>
			<pre class="code">
package jspcursus;

import java.text.DecimalFormat;

public class Auto {
    private final String merk;
    private final String type;
    private final int prijs;
    private final String fotourl;
    
    
    public Auto(String merk, String type, int prijs, String fotourl) {
        this.merk = merk;
        this.type = type;
        this.prijs = prijs;
        this.fotourl = fotourl;
    }
    
    public String getMerk() {
        return merk;
    }
    
    public String getType() {
        return type;
    }
    
    public int getPrijs() {
    	
        return prijs;
    }
    
    public String getFoto() {
        return fotourl;
    }
    
    
    <span class="javadoc">/**
      *
      * @return geeft prijs als geformatteerde String
      */</span>
    public String getPrijsFormat() {
    	DecimalFormat df = new DecimalFormat(&quot;#,##0.--&quot;);
    	double prijs = (double) this.getPrijs();
    	String sPrijs = df.format(prijs);
    	return sPrijs;
    }

</pre>

			<pre class="code">
package jspcursus;

import java.util.ArrayList;

<span class="javadoc">/**
 * Klasse met een lijst van auto&#039;s
 * @author piet
 */</span>
public class AutoLijst {
    private ArrayList&lt;Auto&gt; autolijst;
    
    <span class="javadoc">/**
     * Constructor die de lijst aanmaakt en auto&#039;s toevoegt
     */</span>
    public AutoLijst() {
        autolijst = new ArrayList&lt;Auto&gt;();
        Auto ford1 = new Auto(&quot;Ford&quot;, &quot;Fiesta&quot;, 23999, 
          &quot;images/autos/fordfiesta.jpg&quot;);
        autolijst.add(ford1);
        Auto ford2 = new Auto(&quot;Ford&quot;, &quot;Focus&quot;, 18995, 
          &quot;images/autos/fordfocus.jpg&quot;);
        autolijst.add(ford2);
        Auto opel1 = new Auto(&quot;Opel&quot;, &quot;Astra&quot;, 14895, 
          &quot;images/autos/opelastra.jpg&quot;);
        autolijst.add(opel1);
        Auto opel2 = new Auto(&quot;Opel&quot;, &quot;Insignia&quot;, 65450, 
          &quot;images/autos/opelinsignia.jpg&quot;);
        autolijst.add(opel2);
        Auto subaru1 = new Auto(&quot;Subaru&quot;, &quot;Forester&quot;, 34750, 
          &quot;images/autos/subaruforester.jpg&quot;);
        autolijst.add(subaru1);
        Auto subaru2 = new Auto(&quot;Subaru&quot;, &quot;Impreza&quot;, 28345, 
          &quot;images/autos/subaruimpreza.jpg&quot;);
        autolijst.add(subaru2);
        Auto mercedes1 = new Auto(&quot;Mercedes&quot;, &quot;E 63&quot;, 110995, 
          &quot;images/autos/mercedede63.png&quot;);
        autolijst.add(mercedes1);
        Auto mercedes2 = new Auto(&quot;Mercedes&quot;, &quot;CLA 45&quot;, 190780, 
          &quot;images/autos/mercedescla45.jpg&quot;);
        autolijst.add(mercedes2);
        Auto ferrari1 = new Auto(&quot;Ferrari&quot;, &quot;612 GTO&quot;, 350500, 
          &quot;images/autos/ferrari612.jpg&quot;);
        autolijst.add(ferrari1);
        Auto citroen1 = new Auto(&quot;Citroen&quot;, &quot;2CV&quot;, 459, 
          &quot;images/autos/citroen2cv.jpg&quot;);
        autolijst.add(citroen1);
        Auto mini1 = new Auto(&quot;Mini&quot;, &quot;Cooper&quot;, 34495, 
          &quot;images/autos/minicooper.jpg&quot;);
        autolijst.add(mini1);
     }
    
    <span class="javadoc">/**
     * 
     * @return geeft de lijst met auto&#039;s
     */</span>
    public ArrayList&lt;Auto&gt; getLijst() {
        return autolijst;
    }
    
    
    
    <span class="javadoc">/**
     * Ten behoeve van het select merk input veld
     * @return een lijst met alle unieke merken
     */</span>
    public ArrayList&lt;String&gt; getMerken() {
        ArrayList&lt;String&gt; merken = new ArrayList&lt;String&gt;();
        for (Auto auto: autolijst) {
            String merk = auto.getMerk();
            if (!merken.contains(merk)) {
                merken.add(merk);
            }
        }
        return merken;
    }
}

</pre>

		</div>

	</div>

	<div class="opdrachten" id="zelftoetsstudenten">
		<h2>Uitwerking studenten</h2>
		<!-- <div id="ninjalevels">
						
							<img alt="whitebelt" src="/images/white_belt.png">
							<img alt="greenbelt" src="/images/green_belt.png">
							<img alt="blackbelt" src="/images/black_belt.png">
							<img alt="master" src="/images/master.png">
						
						
					</div> -->



		<h3>Criteria voor de Ninja-levels</h3>
		<p>De definitieve criteria zijn nog onderwerp van gesprek, er
			kunnen derhalve geen rechten aan deze pagina worden ontleend</p>

		<div class="ninja_level_uitleg">
			<img class="ninja_img_uitleg" alt="greenbelt"
				src="/images/green_belt.png">
			<ul>
				<li>Het onderdeel &quot;programmeren&quot; van de proeve van
					bekwaamheid jaar 1 is als voldoende beoordeeld</li>
			</ul>
		</div>

		<div class="ninja_level_uitleg">
			<img class="ninja_img_uitleg" alt="blackbelt"
				src="/images/black_belt.png">
			<ul>
				<li>de HTML van het selectieveld &quot;Merk&quot; wordt
					automatisch gevuld met unieke merken. Default is &quot;alle
					merken&quot;</li>
				<li>bij de inputvelden &quot;prijs&quot; hoeft maar
					&eacute;&eacute;n van beide velden door gebruiker te worden
					ingevuld (twee mag uiteraard ook)</li>
				<li>de auto&#039;s verschijnen netjes naast en onder elkaar, de
					pagina elementen schalen afhankelijk van de schermgrootte</li>
				<li>de prijzen van de produkten zijn geformatteerd volgens de
					Nederlandse standaard (1.000.000,-)</li>
				<li>er kan een combinatie van Merk(en) en prijzen worden
					geselecteerd</li>
				<li>de pagina heeft een overzichtelijke lay-out en een wervende
					vormgeving</li>
				<li>de pagina staat online in een produktieomgeving (zoals
					Google App Engine)</li>
				<li>de broncode van de web-app is &quot;Open Source&quot; en is
					te vinden op <a href="https://github.com/" target="_blank">GitHub</a>
					inclusief een readme bestand met een Engelstalige
					gebruiksaanwijzing
				</li>
			</ul>
		</div>
		<div class="ninja_level_uitleg">
			<img class="ninja_img_uitleg" alt="master" src="/images/master.png">
			<ul>
				<li>alle vereisten zwarte band</li>
				<li>de inputvelden prijs zijn vervangen door een
					&quot;slider&quot; waarmee zowel minimum- als maximumprijs kan
					worden aangepast (<a
					href="http://demos.jquerymobile.com/1.3.0-rc.1/docs/demos/widgets/sliders/rangeslider.html"
					target="_blank">voorbeeld</a>)
				</li>
				<li>er kunnen nu ook meerdere merken worden geselecteerd</li>

				<li>de pagina is gekoppeld aan een database en er is
					functionaliteit toegevoegd zodat de eigenaar van de website zijn
					voorraad op gemakkelijke wijze kan beheren.</li>
				<li>De auto-divs worden met <a
					href="http://api.jquery.com/jquery.ajax/">JQuery / AJAX</a>
					ververst zonder dat de pagina hoeft te worden herladen
				</li>

			</ul>
		</div>
		<div id="studenten">
			<%
				ArrayList<Student> sLijst = new StudentLijst().getLijst();
						for (Student st : sLijst) {
							if (st.getWebpage() == null) {
			%>
			<a
				href="pvb_jaar1_2014/<%=st.getHeleNaam().replace(" ", "")%>/index.jsp"
				target="_blank">
				<div class="studentkader">
					<img src="<%=st.getAvatar()%>">
					<p class="naamstudent"><%=st.getHeleNaam()%></p>
				</div>
			</a>

			<%
				} else {
			%>

			<a href="<%=st.getWebpage()%>" target="_blank">
				<div class="studentkader">

					<img src="<%=st.getAvatar()%>">

					<p class="naamstudent"><%=st.getHeleNaam()%></p>
				</div>
			</a>


			<%
				}
						}
			%>
		</div>
	</div>



</div>
<%@ include file="/includes/bottom.html"%>

<%
	}
	}
%>

<%@ include file="/AO/JSP_Java_DB/includes/pagetop.jsp" %>

    <!-- JQuery stylesheets voor sport app -->
	<link href="/AO/JSP_Java_DB/jqueryUI/jquery-ui.min.css" type="text/css" rel="stylesheet">
   	<link href="/AO/JSP_Java_DB/jqueryUI/jquery-ui.structure.min.css" type="text/css" rel="stylesheet">
   	<link href="/AO/JSP_Java_DB/jqueryUI/jquery-ui.theme.min.css" type="text/css" rel="stylesheet">
   	
   	<!-- pepper grinder theme -->
   	<link href="https://code.jquery.com/ui/1.7.3/themes/pepper-grinder/jquery-ui.css" type="text/css" rel="stylesheet">

<%@ page import="jspcursus.sport.vereniging.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>



<%
if (user != null) {  
	pageContext.setAttribute("user", user);
	
	if (request.getAttribute("via_servlet") == null) {
		response.sendRedirect("/sport");
	}
		
%>
<input type="hidden" id="email_gebruiker" value="<%= user.getEmail() %>">
<div class="col-md-10">
    <h2>Databases</h2>

      <!-- Leerdoelen -->
      <div class="bs-callout bs-callout-warning">
   	<h2>Leerdoelen</h2>
	<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
	<ul>
		<li>met behulp van Java, JSP, CSS, een database en eventueel JavaScript een web applicatie met een 
		database kunt ontwikkelen</li>
		
	</ul>

      </div>

      <!-- inhoud -->
      
      
	<h2>Introductie</h2>
	<p>Bij dit onderdeel ga je een web-applicatie maken voor een sportvereniging waarmee  hun ledenadministratie
	op een webpagina wordt beheerd. Je maakt gebruik van Java, JSP, CSS, een database en eventueel JavaScript.</p>
	<div class="opdrachten" id="voorbeeld_sport">
		<h2>Voorbeeld uitwerking</h2>
		<div class="sporttabel" id="ledenoverzicht">
			<div id="tabs_sport">
				<ul>
					<li><a href="#tabs_sport-0">Info</a></li>
					<li><a href="#tabs_sport-1">Leden</a></li>
					<li><a href="#tabs_sport-2">Teams</a></li>
				</ul>
				<div id="tabs_sport-0">
					<img src="/AO/JSP_Java_DB/images/sportLogo.png" id="sport_logo">
					<p>Demo app sportvereniging (under construction). Kies een tab voor overzicht en beheer van 
					leden en teams. Probeer gerust uit!</p>
				</div>
				<div id="tabs_sport-1" class="sport_content">
					<img src="/AO/JSP_Java_DB/images/sportLogo.png" id="sport_logo">
					<div id="sport_tab-1_content" class="sport_content">
						<img id="loading_spinner" src="/AO/JSP_Java_DB/images/loading_spinner.gif">
					</div>
				</div>
				<div id="tabs_sport-2">
					<img src="/AO/JSP_Java_DB/images/sportLogo.png" id="sport_logo">
					<div id="sport_tab-2_content" class="sport_content">
						<img id="loading_spinner" src="/AO/JSP_Java_DB/images/loading_spinner.gif">
					</div>
				</div>
			</div>
		</div>		
	</div>	
	
	<h3>Ontwikkelomgeving installeren</h3>
	<p>Zet je ontwikkel- en produktieomgeving op in App Engine. App Engine heeft een gratis (NoSQL) datastore die we gebruiken 
	om de database te implementeren. Mocht je liever met een traditionele relationele database werken, dan kun je 
	<a href="sport?sql=true">hier</a> terecht.</p>  
	
	
	<p>Voor deze opdracht gebruik je:
	<ul>
		<li>een geschikte IDE. We gaan er van uit dat je Eclipse met de 
		<a href="https://cloud.google.com/appengine/docs/java/tools/eclipse#Installing_the_Google_Plugin_for_Eclipse" 
		target="_blank">App Engine plugin</a> gebruikt, maar er is ook een goed functionerende 
		(niet offici&euml;le) <a href="https://code.google.com/p/nb-gaelyk-plugin/downloads/list" target="_blank">plugin</a> 
		voor NetBeans beschikbaar, mocht je daar liever mee werken.</li>
	</ul>
	<h3>Opzetten van het project</h3>
	<p>Maak in je <a href="https://appengine.google.com/" target="_blank">App Engine console</a> een nieuwe applicatie en 
	geef het een ID. Start in Eclipse een nieuw app engine project en koppel het aan je gekozen ID.</p>
	<p>Om je project overzichtelijk te houden en &quot;<a href="http://nl.wikipedia.org/wiki/Spaghetticode" 
	target="_blank">spaghetti code</a>&quot; te vermijden, gaan we het opzetten volgens het veelgebruikte <a href="#">
	Model-View-Controller</a> ontwerp patroon.. Maak in de map &quot;src&quot; 3 packages, volgens onderstaand voorbeeld.</p>
	<img src="/AO/JSP_Java_DB/images/project_mvc.png">
	<h3>Model laag</h3>
	<p>De &quot;model&quot; laag bestaat uit klassen die een afspiegeling zijn van iets uit de werkelijkheid. In 
	ons project hebben we te maken met een vereniging met spelers en teams.</p>
	<img src="/AO/JSP_Java_DB/images/model_klassen.png">
	<p>Maak de klasse &quot;Lid&quot;, geef hem een aantal attributen zoals roepnaam, tussenvoegsels en 
	achternaam. Ook hebben we een unieke sleutel nodig om het lid straks gemakkelijk te kunnen 
	identificeren. Hiervoor zou je bijvoorbeeld een e-mail adres kunnen gebruiken, aangezien deze altijd 
	uniek is. Tot slot maken we
	een standaard constructor, get en set methoden (getters en setters) en een methode die de gehele 
	naam van het lid teruggeeft. </p>
	
<pre class="code">
public class Lid {
    private String spelerscode, roepnaam, 
        tussenvoegsels, achternaam, email;
    
    <span class="comment">//lege constructor</span>
    public Lid() {
        this.spelerscode = "";
        this.roepnaam = "";
        this.tussenvoegsels = "";
        this.achternaam = "";
        this.email = "";
    }

    <span class="comment">/**
     * constructor maakt lid-object
     * @param roepnaam
     * @param tussenvoegsels
     * @param achternaam
     * @param email
     */</span>
    public Lid (String roepnaam,
                String tussenvoegsels, 
                String achternaam,
                String email) {
        
        this.roepnaam = roepnaam;
        this.tussenvoegsels = tussenvoegsels;
        this.achternaam = achternaam;
        this.email = email;
        this.spelerscode = email;  
    }
    
    <span class="comment">/********* GETTERS EN SETTERS ************/</span>
    
    public String getSpelerscode() {
        return spelerscode;
    }
    
    public void setSpelerscode(String spelerscode) {
        this.spelerscode = spelerscode;
    }
    
    public String getRoepnaam() {
        return roepnaam;
    }

    public void setRoepnaam(String roepnaam) {
        this.roepnaam = roepnaam;
    }

    public String getTussenvoegsels() {
        return tussenvoegsels;
    }

    public void setTussenvoegsels(String tussenvoegsels) {
        this.tussenvoegsels = tussenvoegsels;
    }

    public String getAchternaam() {
        return achternaam;
    }

    public void setAchternaam(String achternaam) {
        this.achternaam = achternaam;
    }
    
    <span class="comment">/**
     *@return samengevoegde naam
     *
     */</span>
    public String getNaam() {
        String naam;
        if (tussenvoegsels.equals("")) {
            naam = roepnaam + " " + achternaam;
        } else {
            naam = roepnaam + " " + tussenvoegsels + " " + achternaam;
        }
        return naam;
    }
}
</pre>	
	
	
	<p>Het eerste wat onze app moet kunnen is nieuwe leden aanmaken, ze opslaan in de database 
	en ze daaruit weer ophalen. Maak een jsp pagina (bijvoorbeeld index.jsp) met een formulier 
	en de benodigde invoervelden met gegevens waarmee een nieuw lid kan worden aangemaakt.</p>
	<p>
	
	<input type="text" name="roepnaam" placeholder="roepnaam">(roepnaam)<br>
	<input type="text" name="tussenvoegsels" placeholder="tussenvoegsels">(tussenvoegsels)<br>
	<input type="text" name="achternaam" placeholder="achternaam">(achternaam)<br>
	<input type="text" name="email" placeholder="e-mail">(e-mail)<br>
	<input type="submit" name="verzend_nieuw_lid_knop" value="verstuur">
	
	</p>
		
	<h3>Servlets</h3>
	<p>Als je een html formulier naar de server stuurt moet die ergens worden opgevangen en verwerkt. 
	Hiervoor gebruiken we een 
	<a href="http://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpServlet.html" 
	target="_blank">Servlet</a>.</p>
	
	<p>Maak in je package &quot;control&quot; een java-klasse bijvoorbeeld genaamd 
	&quot;SportServlet&quot;. Zorg dat je klasse een uitbreiding van HttpServlet wordt volgens onderstaand 
	voorbeeld.</p>
	
<pre class="code">
public class SportServlet extends <span class="codeplus">HttpServlet</span> {
}
	</pre>	
	<p>Klik op de foutmeldingen die Eclipse geeft en importeer de benodigde klassen uit de 
	&quot;javax.servlet&quot; packages</p>
	<p>In de servlet gaan we twee methoden uit de superklasse &quot;overriden&quot;. Klik in Eclipse 
	op het menu-item &quot;Source&quot; en kies de optie &quot;Override/Implement methods...&quot; Zorg dat de 
	methoden doGet en doPost worden ge&iuml;mplementeerd in je klasse. Zie voorbeeld.</p>
<pre class="code">
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        <span class="comment">//deze methode gaat alle requests afhandelen</span>    
    }
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        <span class="comment">//stuur door naar doGet</span>
        doGet(req, resp);
    }
    
</pre>	
	
	<p>Om het jezelf gemakkelijk te maken hoef je maar &eacute;&eacute;n van de twee methoden uit te werken 
	en de ander naar deze methode door te sturen. Je hoeft je dan geen zorgen meer te maken over wanneer get en 
	post worden gebruikt.</p>
	<p>Om requests naar een servlet te sturen heeft de servlet een adres (url) nodig. Je kunt de url van 
	een servlet &quot;mappen&quot; in het web-xml bestand dat zich in de map WEB-INF van je war directory bevindt.</p>
<pre class="code">
&lt;servlet&gt;
    &lt;servlet-name&gt;Sport&lt;/servlet-name&gt;
    &lt;servlet-class&gt;control.SportServlet&lt;/servlet-class&gt;
&lt;/servlet&gt;
&lt;servlet-mapping&gt;
    &lt;servlet-name&gt;Sport&lt;/servlet-name&gt;
    <span class="codeplus">&lt;url-pattern&gt;/sport&lt;/url-pattern&gt;</span>
&lt;/servlet-mapping&gt;
</pre>
	
	<p>Nu kun je het html formulier naar de servlet sturen als gebruiker op de verzend knop klikt.</p>

<pre class="code">
&lt;form <span class="codeplus">action=&quot;/sport&quot;</span> method=&quot;get&quot;&gt;
    &lt;input type=&quot;text&quot; name=&quot;roepnaam&quot; placeholder=&quot;roepnaam&quot;&gt;(roepnaam)&lt;br&gt;
    &lt;input type=&quot;text&quot; name=&quot;tussenvoegsels&quot; placeholder=&quot;tussenvoegsels&quot;&gt;(tussenvoegsels)&lt;br&gt;
    &lt;input type=&quot;text&quot; name=&quot;achternaam&quot; placeholder=&quot;achternaam&quot;&gt;(achternaam)&lt;br&gt;
    &lt;input type=&quot;text&quot; name=&quot;email&quot; placeholder=&quot;e-mail&quot;&gt;(e-mail)&lt;br&gt;
    &lt;input type=&quot;submit&quot; name=&quot;verzend_nieuw_lid_knop&quot; value=&quot;verstuur&quot;&gt;
&lt;/form&gt;
</pre>	
	<p>In je servlet gebruik je de meegestuurde parameters om een object van de klasse Lid aan te maken. Eerst check je 
	of er daadwerkelijk op de knop is geklikt, vervolgens vraag je de parameters op en maak je een lid aan.</p>
	
<pre class="code">
public void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
    if (req.getParameter(&quot;verzend_nieuw_lid_knop&quot;) != null) {
        String roepnaam = req.getParameter(&quot;roepnaam&quot;);
        String tussenvoegsels = req.getParameter(&quot;tussenvoegsels&quot;);
        String achternaam = req.getParameter(&quot;achternaam&quot;);
        String email = req.getParameter(&quot;email&quot;);
        <span class="codeplus">Lid lid = new Lid(roepnaam, tussenvoegsels, achternaam, email)</span>;
    }
}
</pre>
	<h3>Datastore</h3>
	<p>Het lid-object willen we opslaan in de database. In je package sportIO maak je een klasse die 
	verantwoordelijk wordt voor alle database transacties. In dit geval gebruiken we de datastore van 
	App Engine. Om toegang tot de datastore te krijgen heb je een object van DatastoreService nodig.
	Objecten worden in datastore opgeslagen als Entities. Als je een entity aanmaakt geef je de naam 
	van de tabel (met hoofdletter) waarin hij wordt opgeslagen en een unieke sleutel waarmee je hem kunt identificeren. 
	In ons geval gebruiken we daarvoor het attribuut spelerscode. Nadat je de 
	entity hebt aangemaakt kun je hem properties meegeven. Dit zijn de attributen van je lid-object die 
	bewaard moeten worden.</p>
	
<pre class="code">
public class SportIO {
    private DatastoreService <span class="codeplus">datastore</span>;
	
    <span class="comment">//constructor</span>
    public SportIO() {
        datastore = <span class="codeplus">DatastoreServiceFactory.getDatastoreService()</span>;
    }
    
    <span class="comment">//methode om lid toe te voegen</span>
    public void voegLidToe(Lid lid) {
        <span class="comment">//Maak entity mbv tabelnaam en unieke sleutel</span>
        Entity ent = <span class="codeplus">new Entity(&quot;Lid&quot;, lid.getSpelerscode())</span>;
        ent.<span class="codeplus">setProperty</span>(&quot;roepnaam&quot;, lid.getRoepnaam());
        ent.setProperty(&quot;tussenvoegsels&quot;, lid.getTussenvoegsels());
        ent.setProperty(&quot;achternaam&quot;, lid.getAchternaam());
        ent.setProperty(&quot;email&quot;, lid.getEmail());
        ent.setProperty(&quot;spelerscode&quot;, lid.getSpelerscode());
        <span class="codeplus">datastore.put(ent)</span>;
    }
}
</pre>	
	<p>In je servlet maak je een object van de SportIO klasse en gebruikt de methode die we net 
	hebben gemaakt om het lid op te slaan. Nadat het lid is toegevoegd wordt gebruiker naar de index.jsp 
	pagina terug geleid (zie code). Later gaan we dit veranderen.</p>
<pre class="code">
<span class="comment">/*  SportServlet.java */</span>
public void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
    <span class="codeplus">SportIO io = new SportIO()</span>;
    if (req.getParameter(&quot;verzend_nieuw_lid_knop&quot;) != null) {
        String roepnaam = req.getParameter(&quot;roepnaam&quot;);
        String tussenvoegsels = req.getParameter(&quot;tussenvoegsels&quot;);
        String achternaam = req.getParameter(&quot;achternaam&quot;);
        String email = req.getParameter(&quot;email&quot;);
        Lid lid = new Lid(roepnaam, tussenvoegsels, achternaam, email);
        <span class="codeplus">io.voegLidToe(lid)</span>;
        <span class="codeplus">resp.sendRedirect(&quot;/index.jsp&quot;)</span>;
    }
}
</pre>	
	<div class="bs-callout bs-callout-warning">
		<h3>Test</h3>
		<p>Als het goed is kun je nu met behulp van het html formulier leden aan je datastore toevoegen. Om 
		te testen of het werkt moet je de app deployen en kun je een aantal leden toevoegen. In de app engine 
		console kun je controleren of er Entities zijn toegevoegd in de Datastore Viewer.</p>
		<img src="/AO/JSP_Java_DB/images/datastore_viewer.png">
	</div>
	<h3>Alle entities ophalen en vertonen</h3>
	<p>De volgende stap is om je opgeslagen leden uit datastore op te vragen en op een jsp pagina te vertonen. 
	Hiervoor moet je in SportIO een nieuwe methode maken die middels een query alle entities uit de tabel Lid 
	ophaalt, hun properties opvraagt (let op de typecasting!), ze omzet naar java objecten en ze in een lijst - 
	bijvoorbeeld een ArrayList - stopt die de methode teruggeeft.</p>

<pre class="code">
<span class="comment">/*  SportIO.java */</span>
public ArrayList&lt;Lid&gt; getAlleLeden() {
    ArrayList&lt;Lid&gt; leden = new ArrayList&lt;Lid&gt;();
    <span class="codeplus">Query q = new Query(&quot;Lid&quot;);</span>
    <span class="codeplus">PreparedQuery resultaten = datastore.prepare(q);</span>
    for (Entity ent: resultaten.<span class="codeplus">asIterable()</span>) {
        Lid lid = new Lid();
        lid.setRoepnaam( <span class="codeplus">(String)</span> ent.getProperty(&quot;roepnaam&quot;) );
        lid.setTussenvoegsels( (String) ent.getProperty(&quot;tussenvoegsels&quot;) );
        lid.setAchternaam( (String) ent.getProperty(&quot;achternaam&quot;) );
        lid.setEmail( (String) ent.getProperty(&quot;email&quot;) );
        lid.setSpelerscode( (String) ent.getProperty(&quot;spelerscode&quot;) );
        leden.add(lid);
    }
    return leden;
}
</pre>	
	<p>In je servlet kun je de methode aanroepen op het io object.</p>
<pre class="code">
<span class="comment">/*  SportServlet.java */</span>
public void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
    SportIO io = new SportIO();
    if (req.getParameter(&quot;verzend_nieuw_lid_knop&quot;) != null) {
        String roepnaam = req.getParameter(&quot;roepnaam&quot;);
        String tussenvoegsels = req.getParameter(&quot;tussenvoegsels&quot;);
        String achternaam = req.getParameter(&quot;achternaam&quot;);
        String email = req.getParameter(&quot;email&quot;);
        Lid lid = new Lid(roepnaam, tussenvoegsels, achternaam, email);
        io.voegLidToe(lid);
        <span class="codeplus">resp.sendRedirect(&quot;/sport&quot;);</span>
    }
    else {
    	<span class="codeplus">ArrayList&lt;Lid&gt; leden = <span class="jsp">io.getAlleLeden()</span>;</span>
    	<span class="codeplus">req.<span class="jsp">setAttribute(&quot;leden&quot;, leden</span>);</span>
    	<span class="codeplus">RequestDispatcher disp = req.getRequestDispatcher("/overzicht_leden.jsp");</span>
        <span class="codeplus">disp.forward(req, resp);</span>
    }
}
</pre>	
	<h3>Uitleg</h3>
	<p>Nadat de servlet het lid aan de datastore heeft toegevoegd, leidt hij de gebruiker terug 
	naar zichzelf, maar dit keer worden er geen parameters meegestuurd zodat het if statement wordt 
	overgeslagen en hij dus in het else statement komt. Hier wordt de ArrayList met leden opgevraagd en 
	als attribuut aan het req object gekoppeld met de methode <em>setAttribute()</em>. De servlet stuurt 
	vervolgens een jsp pagina met het attribuut &quot;leden&quot; terug naar de browser van de 
	gebruiker met behulp van een RequestDispatcher object. In de jsp pagina kun je het attribuut nu 
	gebruiken (zie code). Let op dat je de nodige java klassen in de pagina importeert.</p>

<pre class="code">
<span class="comment">&lt;!-- overzicht_leden.jsp --&gt;</span>
<span class="codeplus"><span class="jsp">&lt;%@</span> page import=&quot;jspcursus.sport.vereniging.*&quot; <span class="jsp">%&gt;</span>
<span class="jsp">&lt;%@</span> page import=&quot;java.util.ArrayList&quot; <span class="jsp">%&gt;</span></span>

<span class="jsp">&lt;%</span>
if (request.getAttribute(&quot;leden&quot;) == null) {
    <span class="codeplus">response.sendRedirect(&quot;/sport&quot;)</span>
} else { <span class="jsp">
    <span class="codeplus"> ArrayList&lt;Lid&gt; leden = <span class="jsp">(ArrayList&lt;Lid&gt;) request.getAttribute(&quot;leden&quot;</span>)</span>;
%&gt;</span>

&lt;h1&gt;Ledenoverzicht&lt;/h1&gt;
<span class="jsp">&lt;%</span>  <span class="codeplus">for (Lid lid: leden)</span> { <span class="jsp">%&gt;</span>
        <span class="codeplus"><span class="jsp">&lt;%=</span> lid.getNaam() <span class="jsp">%&gt;</span></span>&lt;br&gt;
<span class="jsp">&lt;%</span>  }
}   <span class="jsp">%&gt;</span>
</pre>	
	<p>Met bovenstaande code zorg je er voor dat gebruiker altijd via de servlet op de pagina komt en 
	er dus altijd een attribuut leden is dat nodig is om de lijst met leden op het scherm te zetten.</p>
	
	<div class="bs-callout bs-callout-warning">
		<h3>Test</h3>
		<p>Als het goed is kan je app nu de ingevoerde leden tonen.</p>
	</div>
	
	<h3>Een enkele entity ophalen</h3>
	<p>Om een enkele entity uit de datastore te halen kun je z&#39;n key gebruiken, 
	in ons geval de spelerscode. Eclipse zal aangeven dat je een EntityNotFoundException moet afvangen 
	(try/catch block) of doorgeven (throws declaratie) aan de klasse die de methode aanroept. In onderstaande 
	uitwerking is er voor gekozen om de Exception af te vangen. Mocht de entity, om wat voor reden dan ook, niet 
	(meer) beschikbaar zijn dan geeft de methode null terug.</p>
	
<pre class="code">
<span class="comment">/*  SportIO.java */</span>
public Lid getLid(String spelerscode)  {
    Lid lid = null;
    <span class="codeplus">Key k = KeyFactory.createKey("Lid", spelerscode)</span>;
    try {
        <span class="codeplus">Entity ent = datastore.get(k)</span>;
        lid = new Lid();
        lid.setRoepnaam( <span class="codeplus">(String)</span> ent.getProperty(&quot;roepnaam&quot;) );
        lid.setTussenvoegsels( (String) ent.getProperty(&quot;tussenvoegsels&quot;) );
        lid.setAchternaam( (String) ent.getProperty(&quot;achternaam&quot;) );
        lid.setEmail( (String) ent.getProperty(&quot;email&quot;) );
        lid.setSpelerscode( (String) ent.getProperty(&quot;spelerscode&quot;) );
    } catch (EntityNotFoundException e) {
        <span class="comment">// TODO Auto-generated catch block</span>
        e.printStackTrace();
    }
    return lid;
}
</pre>	
	<p>De methode kan gebruikt worden om de gegevens van een enkel lid op het scherm te tonen. Verander je 
	jsp pagina zodat achter ieder lid een link komt die naar onze servlet leidt. Om een enkel lid op te vagen 
	hebben we z&#39;n spelerscode nodig dus die sturen we mee als parameter. Geef ook een parameter mee 
	zodat in de servlet kan worden bepaald wat de bedoeling is.</p>
<pre class="code">
<span class="comment">&lt;!-- overzicht_leden.jsp --&gt;</span>

<span class="jsp">&lt;%</span> ArrayList&lt;Lid&gt; leden = (ArrayList&lt;Lid&gt;) request.getAttribute(&quot;leden&quot;);
    for (Lid lid: leden) { <span class="jsp">%&gt;</span>
        <span class="jsp">&lt;%=</span> lid.getNaam() <span class="jsp">%&gt;</span>
        &lt;a href=<span class="codeplus">&quot;/sport?haal_lid=&amp;spelerscode=<span class="jsp">&lt;%= </span>lid.getSpelerscode() <span class="jsp">%&gt;</span>&quot;</span>&gt;naar lid&lt;/a&gt;&lt;br&gt;
<span class="jsp">&lt;%</span>  }
}   <span class="jsp">%&gt;</span>

</pre>
		
	<p>In je servlet vang je het request op, haalt het lid uit de database en stuur hem door naar een 
	nieuwe jsp pagina (die we nog moeten maken).</p>
<pre class="code">
<span class="comment">/*  SportServlet.java */</span>
public void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
    SportIO io = new SportIO();
    if (req.getParameter(&quot;verzend_nieuw_lid_knop&quot;) != null) {
        ...
    }
    <span class="codeplus">else if (req.getParameter(&quot;haal_lid&quot;) != null) {</span>
        <span class="codeplus">String spelerscode = req.getParameter(&quot;spelerscode&quot;);</span>
        <span class="codeplus">Lid lid = <span class="jsp">io.getLid(spelerscode);</span></span>
        <span class="codeplus">req.setAttribute(&quot;lid&quot;, lid);</span>
    	<span class="codeplus">RequestDispatcher disp = req.getRequestDispatcher("/lid.jsp");</span>
        <span class="codeplus">disp.forward(req, resp);</span>
    }
    else {
    	...
    }
}
</pre>		
	<p>In bovenstaande code wordt een pagina genaamd lid.jsp naar gebruiker gestuurd. Op deze pagina worden 
	de gegevens van het meegestuurde lid getoond. Maak deze pagina. Later gaan we deze pagina 
	gebruiken om gegevens van een lid te kunnen wijzigen of het lid te verwijderen, dus maken we een formulier met inputvelden waarin we de 
	gegevens van het lid vertonen en twee knoppen met toepasselijke namen. Om deze pagina te kunnen maken heeft hij het attribuut &quot;lid&quot; nodig. 
	Als dit attribuut ontbreekt (== null) kun je de gebruiker terug sturen naar het ledenoverzicht.</p>
	
<pre class="code">
<span class="comment">&lt;!--  lid.jsp  --&gt;</span>
<span class="jsp">&lt;%</span> 
if (request.getAttribute(&quot;lid&quot;) == null) {
    response.sendRedirect(&quot;/sport&quot;);
} else {  
    <span class="codeplus"> Lid lid = (Lid) request.getAttribute(&quot;lid&quot;)</span>; 
<span class="jsp">%&gt; </span>
    
&lt;form action=&quot;/sport&quot;  method=&quot;get&quot;&gt;
    &lt;input type=&quot;text&quot; 
       name=&quot;roepnaam&quot; 
       <span class="codeplus">value=&quot;<span class="jsp">&lt;%=</span> lid.getRoepnaam() <span class="jsp">%&gt;</span>&quot;</span>&gt;(roepnaam)&lt;br&gt;
    &lt;input type=&quot;text&quot; 
       name=&quot;tussenvoegsels&quot; 
       <span class="codeplus">value=&quot;<span class="jsp">&lt;%=</span> lid.getTussenvoegsels() <span class="jsp">%&gt;</span>&quot;</span>&gt;(tussenvoegsels)&lt;br&gt;
    &lt;input type=&quot;text&quot; 
       name=&quot;achternaam&quot; 
       <span class="codeplus">value=&quot;<span class="jsp">&lt;%=</span> lid.getAchternaam() <span class="jsp">%&gt;</span>&quot;</span>&gt;(achternaam)&lt;br&gt;
    &lt;input type=&quot;text&quot; 
       name=&quot;email&quot; 
       <span class="codeplus">value=&quot;<span class="jsp">&lt;%=</span> lid.getEmail() <span class="jsp">%&gt;</span>&quot;</span>&gt;(email)&lt;br&gt;
    &lt;input type=&quot;hidden&quot; 
       name=&quot;spelerscode&quot; 
       <span class="codeplus">value=&quot;<span class="jsp">&lt;%=</span> lid.getSpelerscode() <span class="jsp">%&gt;</span>&quot;</span>&gt;
    &lt;input type=&quot;submit&quot; 
       <span class="codeplus">name=&quot;wijzig_lid_knop&quot;</span> 
       value=&quot;wijzig&quot;&gt;
    &lt;input type=&quot;submit&quot; 
       <span class="codeplus">name=&quot;verwijder_lid_knop&quot;</span> 
       value=&quot;verwijder&quot;&gt;
&lt;/form&gt;
<span class="jsp">&lt%</span> } <span class="jsp">%&gt;</span>
</pre>	 
	<div class="bs-callout bs-callout-warning">
		<h3>Test</h3>
		<p>Je kunt nu de gegevens van een lid in een apart venster tonen.</p>
	</div>
	<h3>Een lid verwijderen en wijzigen</h3>
	<p>In datastore kun je een lid als volgt verwijderen en wijzigen.</p>
<pre class="code">
<span class="comment">/*  SportIO.java */</span>
public void verwijderLid(String spelerscode) {
    Key k = KeyFactory.createKey("Lid", spelerscode );
    <span class="codeplus">datastore.delete(k)</span>;
}

<span class="comment">//wijzigen == toevoegen</span>
public void wijzigLid(Lid lid) {
    <span class="codeplus">this.voegLidToe(lid);</span>
}
</pre>	
	<p>Maak deze methodes aan in je SportIO klasse. Gebruik de methodes in je servlet zodat een 
	lid wordt gewijzigd of verwijderd als gebruiker op &eacute;&eacute;n van de knoppen klikt 
	die we aan het formulier hebben toegevoegd. Nadat een lid is gewijzigd of verwijderd kun je 
	de bezoeker terug sturen naar het ledenoverzicht.</p>
	<div class="bs-callout bs-callout-warning">
		<h3>Test</h3>
		<p>Zorg dat je gegevens van een speler kunt wijzigen en een lid kunt verwijderen.</p>
	</div>
	
	<h3>Gegevens types</h3>
	<p>Tot nu toe hebben we alleen strings opgeslagen, maar je kunt uiteraard ook andere types opslaan. Zie 
	<a href="https://cloud.google.com/appengine/docs/java/datastore/entities#Java_Properties_and_value_types" 
	target="_blank">overzicht.</a></p>
	
	<div class="bs-callout bs-callout-warning">
		<h3>Test</h3>
		<p>Geef je leden een attribuut &quot;geboortedatum&quot; van het type 
		<a href="http://docs.oracle.com/javase/7/docs/api/java/util/Date.html" target="_blank">Date.</a> 
		en zorg dat het als Date wordt opgeslagen in datastore. Ook kun je een attribuut &quot;spelersnummer&quot; maken en 
		opslaan. Let op dat integers in datastore als long worden opgeslagen!</p>
	</div>

	<h3>Resultaten filteren</h3>
	<p>Om alleen entities met een bepaalde property te selecteren kun je (een) filter(s) maken en aan 
	je query meegeven. Onze app moet een overzicht kunnen geven van spelers van een bepaald 
	team en teams van een bepaalde speler. Om dit mogelijk te maken maak je in datastore een 
	tabel &quot;Teamspeler&quot;.</p>
	
<pre class="code">
public void setTeamspeler(Team team, Lid lid) {
    Entity e = new Entity(&quot;Teamspeler&quot;, team.getTeamcode() + lid.getSpelerscode());
    e.setProperty(&quot;teamcode&quot;, team.getTeamcode());
    e.setProperty(&quot;spelerscode&quot;, lid.getSpelerscode());
    datastore.put(e);
}
</pre>	
	
	
	<p>Nu kun je met behulp van een filter alle spelers van een bepaald team opvragen. Lees meer over <a 
	href="https://cloud.google.com/appengine/docs/java/datastore/queries" target="_blank">datastore 
	queries en filters</a>.</p>
	
<pre class="code">
public ArrayList&lt;Lid&gt; getTeamspelers(Team team)  {
    ArrayList&lt;Lid&gt; teamleden = new ArrayList&lt;Lid&gt;();
    <span class="codeplus">Filter teamcodeFilter =  new FilterPredicate(</span>
                       <span class="codeplus">"teamcode"</span>, <span class="comment">//naam van property in datastore</span> 
                       <span class="codeplus">FilterOperator.EQUAL,</span> <span class="comment">//gelijk aan</span>
                       <span class="codeplus">team.getTeamcode())</span>; <span class="comment">//attribuut van team</span>
                       
    Query q = new Query("Teamspeler").<span class="codeplus">setFilter(teamcodeFilter)</span>;
    PreparedQuery pq = datastore.prepare(q);
		
    for (Entity result: pq.asIterable()) {
        Lid lid = null;
        try {
            String spelerscode = (String) result.getProperty(&quot;spelerscode&quot;)
            lid = this.getLid(spelerscode);
            teamleden.add(lid);
            
        } catch (EntityNotFoundException e) {
            <span class="comment">// TODO Auto-generated catch block</span>
            e.printStackTrace();
        }
    }		
    return teamleden;
}
</pre>	

	<div class="bs-callout bs-callout-warning">
		<h3>Test</h3>
		<p>Maak in je app een overzicht van teams, met dezelfde functionaliteit als je overzicht van 
		spelers. Zorg er voor dat je spelers aan een team kan toevoegen en verwijderen en per team een overzicht van 
		spelers kunt opvragen. Ook moet je per speler een overzicht kunnen maken van teams waar de speler 
		in zit.</p>
	</div>

	<h3>Resultaten sorteren</h3>
	<p>Met de volgende code wordt het overzicht van spelers oplopend gesorteerd op achtereenvolgens 
	roepnaam en achternaam. 
	 Let op dat het even kan duren voor datastore de gesorteerde resultaten terug geeft.</p>
	
<pre class="code">
public ArrayList&lt;Lid&gt; getLedenLijst() {
    ArrayList&lt;Lid&gt; leden = new ArrayList&lt;Lid&gt;();
    Query q = new Query("Lid")
        <span class="codeplus">.addSort("roepnaam", SortDirection.ASCENDING)</span>
        .addSort("achternaam", SortDirection.ASCENDING);
    PreparedQuery pq = datastore.prepare(q);
    <span class="comment">//zie eerdere code</span>
    ...
}		
</pre>	
	<div class="bs-callout bs-callout-warning">
		<h3>Test</h3>
		<p>Sorteer de resultaten van je ledenlijst op verschillende properties zoals naam, geboortedatum etc.</p>
	</div>
</div>
<%@ include file="/includes/bottom.html" %>

   	<!-- JQuery UI JavaScript voor sportapp -->
    <script src="/AO/JSP_Java_DB/jqueryUI/jquery-ui.min.js"></script>
    
    <!-- JQuery voor sportapp UNDER CONSTRUCTION -->
    <script src="/AO/JSP_Java_DB/includes/sportapp.js"></script>
<% } %>
<%@ include file="/AO/JSP_Java_DB/includes/pagetop.jsp" %>
<%@ page import="jspcursus.sport.vereniging.*" %>
<%@ page import="java.util.ArrayList" %>


<%
	if (user != null) {  
		pageContext.setAttribute("user", user);
		
		if (request.getAttribute("leden") == null)  {
			response.sendRedirect("/sport");
		}
		
		else { 
			ArrayList<Lid> ledenlijst = (ArrayList<Lid>) request.getAttribute("leden");
			ArrayList<Team> teamlijst = (ArrayList<Team>) request.getAttribute("teams"); 
			String ledentabel = "";
			String teamtabel = "";
			
			if (ledenlijst.isEmpty()) {
	 			ledentabel = "<p>Er zijn nog geen leden ingevoerd</p>";
	 		}
	 		
	 		else {
	 			ledentabel = "<table id=\"ledentabel\"\n"
	 					+ "<tr>\n"
	 					+ "<th>Naam</th>\n"
	 					+ "<th>Adres</th>\n"
	 					+ "<th>Postcode</th>\n"
	 					+ "<th>Woonplaats</th>\n"
	 					+ "<th>Telefoon</th>\n"
	 					+ "<th>Geboortedatum</th>\n"
	 					+ "<th>Geslacht</th>\n"
	 					+ "<th colspan=3>Beheer</th>\n"
	 					+ "</tr>";
	 		    for (Lid lid: ledenlijst) { 
	 		    	ledentabel += "<tr>\n"
	 		    		+ "<td>" + lid.getNaam() + "</td>\n"
	 		    		+ "<td>" + lid.getAdres() + "</td>\n"
	 		    		+ "<td>" + lid.getPostcode() + "</td>\n"
	 		    		+ "<td>" + lid.getWoonplaats() + "</td>\n"
	 		    		+ "<td>" + lid.getTelefoon() + "</td>\n";
	 		        
	 		        if (lid.getGeboortedatum().equals("01-01-1900")) {
	 		        	ledentabel += "<td>niet (correct) ingevoerd</td>\n";
	 		        }
	  		        else {
	 		        	ledentabel += "<td>" + lid.getGeboortedatum() + "</td>\n";
	 		        }
	 		        
	 		        ledentabel += "<td>" + lid.getGeslacht() + "</td>\n"
	 		        	+ "<td><input type=\"button\" onclick=\"openWijzigLid(\'" + lid.getSpelerscode() + "\')\" value=\"wijzig\"></td>\n"
	 		        	+ "<td><input type=\"button\" onclick=\"openVerwijderLid(\'" + lid.getSpelerscode() + "\')\" value=\"verwijder\"></td>\n"
		        		+ "<td><input type=\"button\" onclick=\"openTeamsLid(\'" + lid.getSpelerscode() + "\')\" value=\"teams\"></td>\n"
	 		        	+ "</tr>\n";
	 		    }
	 		    ledentabel += "</table>\n";
	 		}
	    	
	    	if (teamlijst.isEmpty()) {
				teamtabel = "<p>Er zijn nog geen teams ingevoerd</p>";
			}
			
			else {
				teamtabel = "<table id=\"teamlijst\">\n"
						+ "<tr>\n"
						+ "<th>Teamcode</th>\n"
						+ "<th>Teamomschrijving</th>\n"
						+ "<th colspan=3>Beheer</th>\n"
						+ "</tr>\n";
				
				for (Team team: teamlijst) {
					teamtabel += "<tr>\n"
						+ "<td>" +  team.getTeamcode() + "</td>\n"
						+ "<td>" + team.getOmschrijving() + "</td>\n"
						+ "<td><input type=\"button\" onclick=\"openWijzigTeam(\'" + team.getTeamcode() + "\')\" value=\"wijzig\"></td>\n"
						+ "<td><input type=\"button\" onclick=\"openVerwijderTeam(\'" + team.getTeamcode() + "\')\" value=\"verwijder\"></td>\n"
						+ "<td><input type=\"button\" onclick=\"openLedenVanTeam(\'" + team.getTeamcode() + "\')\" value=\"leden\"></td>\n"

						+ "</tr>";
				}
				teamtabel += "</table>";
			}
			
		
		
%>	
      
      <div class="col-md-10">
      <h2>Databases</h2>
  
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	    	<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
			<ul>
				<li>met behulp van Java, JSP, CSS, MySQL en eventueel JavaScript een web applicatie met een 
				database kunt ontwikkelen</li>
				
			</ul>
	    
	       
	          
        </div>
        
      
        
        
        
        <!-- inhoud -->
        
		<h2>Introductie</h2>
					<p>Bij dit onderdeel ga je een web-applicatie maken voor een sportvereniging waarmee  hun ledenadministratie
					op een webpagina wordt beheerd. Je maakt gebruik van Java, JSP, CSS, SQL en eventueel JavaScript.</p>
					
					<div class="opdrachten" id="voorbeeld_sport">
						
						<h2>Voorbeeld uitwerking</h2>
						<p>Probeer gerust uit. Om je wijzigingen te laden, moet de pagina soms (nog) worden ververst!</p>
							
						<div class="sporttabel" id="ledenoverzicht">
							<h3>Leden</h3>
							<%= ledentabel %>
							<div class="voegtoeknop">
								<button onclick="openNieuwLid()">Lid toevoegen</button>
							</div>
						</div>
							
						<div class="sporttabel" id="teamoverzicht">
							<h3>Teams</h3>
							<%= teamtabel %>
							<div class="voegtoeknop">
								<button onclick="openNieuwTeam()">Team toevoegen</button>
							</div>
							
						</div>
							
					</div>	
					
					<h3>Ontwikkelomgeving installeren</h3>
					<p>Zet je ontwikkelomgeving op in NetBeans en MySQL. In dit 
					<a href="https://drive.google.com/folderview?id=0B_plfM9Z75S4N0xBTlRpMERxQkk&usp=sharing">zip bestand</a> vind 
					je alle bestanden die je mag  gebruiken inclusief een aantal NetBeans/MySQL voorbeeldprojecten en een SQL script. 
					De benodigde MySQL driver kun je 
					<a href="http://dev.mysql.com/downloads/connector/j">hier</a> vinden.</p>
					
					
					<p>Voor deze opdracht gebruik je:
					<ul>
						<li>een MySQL database. In de zip file vind je een sql script dat je kunt gebruiken om de database te maken en een 
						aantal records toe te voegen.</li>
						<li>een geschikte IDE. We gaan er van uit dat je NetBeans gebruikt, maar een andere mag uiteraard ook. </li>
						<li>de Java Database Connectivity (JDBC) driver. Om de driver te gebruiken moet hij beschikbaar zijn voor je applicatie. 
						Dit kan op verschillende manieren. Het gemakkelijkst is om het jar bestand uit het pakket naar de jre/lib/ext map van je 
						JDK te kopi&euml;ren.</li>
					</ul>
					<h3>Voorbeeldprojecten</h3>
					<p>In de zip file vind je een aantal voorbeeldprojecten. Deze zijn bijgeleverd om het je wat gemakkelijker te maken. 
					De voorbeeldprojecten maken gebruik van een bijgeleverd Connection.java bestand en de klasse 
					TConnection (jar). 
					Voor een overzicht van de functionaliteit van TConnection zie <a href="/AO/JSP_Java_DB/TConnection.html" target="_blank">javadoc</a>.
					</p>
					<img src="/AO/JSP_Java_DB/images/ScreenShot_2_005.jpg">
					
					
					<h3>Verbinding maken met de database</h3>
					<p>Als je gebruik maakt van bijgeleverde (T)Connection klassen kun je volstaan met de code uit de voorbeeldprojecten. 
					Onderstaande uitleg is bedoeld voor studenten die willen leren hoe ze zelf een connectie met de database kunnen maken.</p>
					<h4>Je driver automatisch laden</h4>
					<p>Om gegevens uit je database op te halen of te wijzigen heb je een &quot;Connection&quot; object nodig. Deze kun je als volgt 
					<em>instanti&euml;ren</em>:<br>
					
<pre class="code">
<span class="comment">//benodigde klassen uit java.sql package</span>
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Voorbeeld {
    <span class="comment">//declaratie</span>
    private Connection dbc;
    
    .....
    .....
    
    <span class="comment">/**
     *Deze methode wordt gebruikt om
     *verbinding met de database <strong>sport</strong>
     *te maken.
     *@return 0 indien succesvol, -1 indien mislukt
    */</span>
    private int maakConnectie() {
        int ret = 0;
        try {
            Class.forName(&quot;com.mysql.jdbc.Driver&quot;);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            ret = -1;
        }
        
       String dbURL = &quot;jdbc:mysql://localhost:3306/sport&quot;;
       String username = &quot;root&quot;;
       String password = &quot;&quot;;
       try {
           <span class="codeplus">this.dbc = DriverManager.getConnection(dbURL, username, password)</span>;
       } catch (SQLException e) {
           ret = -1;
           e.printStackTrace();
       }
       return ret;
    }
</pre>					
					 
					<h3>Gegevens ophalen en lezen</h3>
					<p>Met de volgende code maak je een <em>result set</em> die uit &eacute;&eacute;n rij en &eacute;&eacute;n kolom bestaat:<br>
<pre class="code">
<span class= "comment">//haal de gewenste gegevens uit database</span>
int i = maakConnectie();
if (i != -1) {
    Statement statement = dbc.createStatement();
    ResultSet rs = statement.<span class="codeplus">executeQuery</span>( 
        &quot;SELECT woonplaats FROM Speler &quot; +
        &quot;WHERE spelerscode = &#39;15041989jjans&#39;&quot; );
    <span class= "comment">//lees het resultaat</span>
    <span class= "comment">//aangezien er maar &eacute;&eacute;n rij is...</span>
    rs.first(); 
    String woonplaats = rs.getString(&quot;woonplaats&quot;);
    <span class="comment">sluit database connecties</span>
    statement.close();
    rs.close(); 
    this.dbc.close();
}



</pre>					
					<p>Vaak zal een result set uit meerdere rijen en kolommen bestaan:</p>
					
<pre class="code">
<span class= "comment">//haal de gewenste gegevens uit database</span>
Statement statement = dbc.createStatement();
ResultSet rs = statement.executeQuery(
    &quot;SELECT * FROM Speler&quot; ); 
}
<span class= "comment">//lees rijen van resultset tot einde tabel</span>
<span class= "comment">//methode next() geeft als retourwaarde een boolean</span>
while (rs.next() ) {
    <span class= "comment">//@param naam van kolom als argument</span>
    <span class="codeplus">int</span> nummer = rs.<span class="codeplus">getInt</span>(&quot;spelersnummer&quot;);
    <span class= "comment">//@param index van kolom als argument</span> 
    <span class="codeplus">String</span> woonplaats = rs.<span class="codeplus">getString</span>(8);
    <span class= "comment">//enz. enz.</span>
} 
</pre>						
					
					<p>Raadpleeg de <a href="http://docs.oracle.com/javase/7/docs/api/java/sql/ResultSet.html" target="_blank">Java API</a> voor een
					overzicht van alle methoden van ResultSet.</p>
					
					<h3>Gegevens in je database veranderen</h3>
					
					<h4>Een rij aan de database toevoegen</h4>
<pre class="code">
String query = 
	&quot;INSERT INTO team (teamcode, teamomschrijving) &quot; +
	&quot;VALUES (&#39;H1&#39;, &#39;Heren &eacute;&eacute;n&#39;)&quot;;
Statement statement = dbc.createStatement;
int aantalRijenToegevoegd = statement.<span class= "codeplus">executeUpdate</span>(query);	        
</pre>					
					<h4>Een rij updaten</h4>
<pre class="code">
String query = 
	&quot;UPDATE team SET &quot; +
	&quot;teamomschrijving = &#39;heren een&#39;&quot; +
	&quot;WHERE teamcode = &#39;H1&#39;&quot;;
Statement statement = dbc.createStatement;
int aantalRijenGewijzigd = statement.<span class= "codeplus">executeUpdate</span>(query);	        
</pre>						
					<h4>Een rij verwijderen</h4>
					
<pre class="code">
String query = 
	&quot;DELETE FROM speler &quot; +
	&quot;WHERE spelerscode = &#39;15041989jjans&#39;&quot;;
Statement statement = dbc.createStatement;
int aantalRijenVerwijderd = statement.<span class= "codeplus">executeUpdate</span>(query);	        
</pre>					
					<h3>Prepared Statements</h3>
					<P>Vaak zul je SQL statements vaker gebruiken. Met &quot;Prepared Statements&quot; kun je het gebruik 
					effici&euml;nter maken. De database server hoeft het statement maar &eacute;&eacute;n keer op juistheid te 
					controleren. Bovendien bieden ze - mits juist gebruikt - bescherming tegen zogenaamde &quot;SQL injections&quot; van hackers..</P>
					<h4>Een result set opvragen</h4>
<pre class="code">
String preparedSQL = "SELECT * FROM speler WHERE spelerscode = <span class="codeplus">?</span>";
<span class="codeplus">PreparedStatement ps = dbc.prepareStatement(preparedSQL)</span>;
<span class="codeplus">ps.setString(1, spelerscode)</span>;
ResultSet rs = ps.executeQuery();
</pre>					
					<h4>Data veranderen</h4>
<pre class="code">
String preparedSQL = &quot;UPDATE speler SET &quot; +
                    &quot; roepnaam = ?, &quot; +        <span class="comment">//1</span>
                    &quot; tussenvoegsels = ?, &quot; +  <span class="comment">//2</span>
                    &quot; achternaam = ?, &quot; +      <span class="comment">//3</span>
                    &quot; adres = ?, &quot; +           <span class="comment">//4</span>
                    &quot; postcode = ?, &quot; +        <span class="comment">//5</span>
                    &quot; woonplaats = ? &quot; +       <span class="comment">//6</span>
                    &quot;WHERE spelerscode = ?&quot;;   <span class="comment">//7</span>
            
PreparedStatement ps = dbc.prepareStatement(preparedSQL);
ps.setString(1, this.roepnaam);
ps.setString(2, this.tussenvoegsels);
ps.setString(3, this.achternaam);
ps.setString(4, this.adres);
ps.setString(5, this.postcode);
ps.setString(6, this.woonplaats);
ps.setString(7, this.spelerscode);
ps.executeUpdate();
</pre>							
				
					<h4>Een rij invoegen</h4>
					
<pre class="code">
String preparedQuery = &quot;INSERT INTO team (teamcode, &quot; +
                &quot;teamomschrijving) &quot; +
                &quot;VALUES (?, ?)&quot;;

PreparedStatement ps = dbc.prepareStatement(preparedQuery);
ps.setString(1, this.teamcode);
ps.setString(2, this.teamomschrijving);
int aantalRijenToegevoegd = ps.executeUpdate();
</pre>					
				
				
				
				
					
					<div class="opdrachten" id="appengine_datastore_uitleg">
						<h2>App Engine Datastore</h2>
						<p>Om de app te deployen met App Engine kun je gebruik maken van de gratis (NoSQL) 
						&quot;<a href="https://developers.google.com/appengine/docs/java/datastore/" target="_blank">Datastore</a>&quot;.</p>
						
						<p>Om je op weg te helpen kun je gebruik maken van onderstaande klasse die dezelfde tabelstructuur hanteert als 
						in de MySQL uitwerking. <span class="letop">Merk op</span> 
						dat deze klasse verantwoordelijk is voor alle transacties met de datastore. Het is gebruikelijk om klassen 
						die connectie maken met een database te scheiden van andere klassen. Dit is niet alleen veiliger, maar maakt je 
						applicatie ook gemakkelijker onderhoudbaar. Je hoeft alleen maar je database klasse(n) aan te passen wanneer je 
						bijvoorbeeld een andere database wilt gaan implementeren.</p>
						<p>Je kunt de &quot;entities&quot; in je datastore inzien/deleten met de Datastore Viewer in je App Engine console.</p>
						<img class="imgfullwidth" src="/AO/JSP_Java_DB/images/aeconsole.jpg" alt="app engine console">
						
						
<pre class="code">
<span class="javadoc">//ToDo: aanpassen</span>
package jspcursus.sport.dataIO;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

<span class="javadoc">//ToDo: aanpassen</span>
import jspcursus.sport.vereniging.Lid;
import jspcursus.sport.vereniging.Team;

<span class="javadoc">//Benodigde klassen importeren uit app engine api</span>
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate;

<span class="javadoc">
/**
  *klasse die alle transacties met datastore afhandelt
  *@author roc-dev pdv
*/
</span>
public class SportIO {

  <span class="comment">/**********MAAK OBJECT DATASTORESERVICE**********/</span>
  
  private DatastoreService <span class="codeplus">datastore;</span>
	
  public SportIO() {
    <span class="codeplus">datastore</span> = <span class="codeplus">DatastoreServiceFactory.getDatastoreService()</span>;
  }
  
  <span class="comment">/**********GEGEVENS OPSLAAN*VERWIJDEREN*WIJZIGEN**********/</span>
	
  public void <span class="codeplus">voegLidToe(Lid lid)</span> {
    <span class="comment">// maak een entity</span>
    <span class="comment">// parameters: Zelfgekozen typenaam (<a href="https://cloud.google.com/appengine/docs/java/datastore/entities#Java_Kinds_and_identifiers" target="_blank">Kind</a>) en unieke zelfgekozen sleutel (Key)</span>
    String naam = "Lid";
    String sleutel = lid.getSpelerscode();
    <span class="codeplus"><span class="jsp">Entity</span> e = new Entity(naam, sleutel)</span>;
    
    <span class="comment">//set <em>properties</em> van je entity</span>
    <span class="codeplus"><span class="jsp">e</span>.setProperty</span>(&quot;spelerscode&quot;, lid.getSpelerscode());
    e.setProperty(&quot;lidnr&quot;, lid.getNr());
    e.setProperty(&quot;roepnaam&quot;, lid.getRoepnaam());
    e.setProperty(&quot;tussenvoegsels&quot;, lid.getTussenvoegsels());
    e.setProperty(&quot;achternaam&quot;, lid.getAchternaam());
    e.setProperty(&quot;adres&quot;, lid.getAdres());
    e.setProperty(&quot;postcode&quot;, lid.getPostcode());
    e.setProperty(&quot;woonplaats&quot;, lid.getWoonplaats());
    e.setProperty(&quot;telefoon&quot;, lid.getTelefoon());
    e.setProperty(&quot;geslacht&quot;, lid.getGeslacht());
    
    <span class="comment">// als lid een attribuut van type <em>Date</em> heeft</span>
    e.setProperty(&quot;geboortedatum&quot;, lid.getGeboortedatum());
 
    <span class="comment">//bewaar Entity</span>
    <span class="codeplus">datastore.<span class="jsp">put(e)</span></span>;
  }
  
  
  public void <span class="codeplus">verwijderLid(Lid lid)</span> {
    <span class="comment">//Om een single-entity uit de datasore te selecteren heb je z&#39;n Key nodig</span>
    <span class="comment">//deze maak je met de entity-naam (Kind) en je zelfgekozen sleutel </span>
    <span class="codeplus"><span class="jsp">Key</span> lidKey = KeyFactory.createKey(&quot;Lid&quot;, lid.getSpelerscode())</span>;
    datastore.<span class="codeplus">delete(<span class="jsp">lidKey</span>)</span>;
  }
  
	
  <span class="comment">// wijzigen in datastore == toevoegen</span>
  public void <span class="codeplus">wijzigLid(Lid lid)</span> {
    <span class="codeplus">this</span>.voegLidToe(lid);
  }
  
  <span class="comment">/**********EEN ENKELE ENTITY MBV KEY OPHALEN**********/</span>
  
  <span class="comment">//haal lid uit datastore obv spelerscode</span>
  public <span class="codeplus">Lid getLid(String spelerscode)</span> {
    Lid lid = new Lid();
    <span class="comment">Maak een sleutel</span>
    <span class="codeplus">Key sleutel = KeyFactory.createKey(&quot;Lid&quot;, spelerscode);</span>
    Entity res = null;
    try {
        <span class="codeplus">Entity res = datastore.get(sleutel)</span>;
        <span class="comment">//haal properties op met res.getProperty(&quot;naamVanProperty&quot;)</span>
        <span class="comment">//retourwaarde = <em>Object</em> dus <em>typecasting</em> nodig</span>
        lid.setSpelerscode(<span class="codeplus">(String) res.getProperty(&quot;spelerscode&quot;)</span>);
        <span class="comment">//int wordt opgeslagen als long in datastore</span>
        long l = (long) res.getProperty(&quot;lidnr&quot;);
        <span class="comment">//typecasten naar int</span>
        int lidnummer = (int) l;
        lid.setNr(lidnummer);
        lid.setRoepnaam((String) res.getProperty(&quot;roepnaam&quot;));
        lid.setTussenvoegsels((String) res.getProperty(&quot;tussenvoegsels&quot;));
        lid.setAchternaam((String) res.getProperty(&quot;achternaam&quot;));
        lid.setAdres((String) res.getProperty(&quot;adres&quot;));
        lid.setPostcode((String) res.getProperty(&quot;postcode&quot;));
        lid.setWoonplaats((String) res.getProperty(&quot;woonplaats&quot;));
        lid.setTelefoon((String) res.getProperty(&quot;telefoon&quot;));
        lid.setGeboortedatum((Date) res.getProperty(&quot;geboortedatum&quot;));
        lid.setGeslacht((String) res.getProperty(&quot;geslacht&quot;));
    } catch (EntityNotFoundException e) {
        e.printStackTrace();
    }
    <span class="codeplus">return lid></span>;
  }
  
  <span class="comment">/**********EEN LIJST VAN ENTITIES OPHALEN**********/</span>
  
  public <span class="codeplus">ArrayList&lt;Lid&gt; getLedenLijst()</span> {
    ArrayList&lt;Lid&gt; leden = new ArrayList&lt;Lid&gt;();
    
    <span class="comment">//haal alle entities van type &quot;Lid&quot;</span>
    <span class="codeplus">Query q = new Query(&quot;Lid&quot;)</span>;
    <span class="codeplus">PreparedQuery pq = datastore.prepare(q)</span>;
    
    <span class="comment">//loop door resultaten </span>
    for (Entity result: <span class="codeplus">pq.asIterable()</span>) {
      Lid lid = new Lid();
      long l = (long) result.getProperty(&quot;lidnr&quot;);
      int spelersnr = (int) l;
      lid.setNr(spelersnr);
      String spelerscode = (String) result.getProperty(&quot;spelerscode&quot;);
      lid.setSpelerscode(spelerscode);
      String roepnaam = (String) result.getProperty(&quot;roepnaam&quot;);
      lid.setRoepnaam(roepnaam);
      String tussenvoegsels = (String) result.getProperty(&quot;tussenvoegsels&quot;);
      lid.setTussenvoegsels(tussenvoegsels);
      String achternaam = (String) result.getProperty(&quot;achternaam&quot;);
      lid.setAchternaam(achternaam);
      String adres = (String) result.getProperty(&quot;adres&quot;);
      lid.setAdres(adres);
      String postcode = (String) result.getProperty(&quot;postcode&quot;);
      lid.setPostcode(postcode);
      String woonplaats = (String) result.getProperty(&quot;woonplaats&quot;);
      lid.setWoonplaats(woonplaats);
      String telefoon = (String) result.getProperty(&quot;telefoon&quot;);
      lid.setTelefoon(telefoon);
      SimpleDateFormat sdf = new SimpleDateFormat(&quot;dd-MM-yyyy&quot;);
      Date gebDatum = (Date) result.getProperty(&quot;geboortedatum&quot;);
      String geboortedatum = sdf.format(gebDatum);
      lid.setGeboortedatum(geboortedatum);
      String geslacht = (String) result.getProperty(&quot;geslacht&quot;);
      lid.setGeslacht(geslacht);

      leden.add(lid);
    }
    <span class="codeplus">return leden</span>;
  }
	
  public void voegTeamToe(Team team) {
    Entity ent = new Entity(&quot;Team&quot;, team.getTeamcode());
    ent.setProperty(&quot;teamcode&quot;, team.getTeamcode());
    ent.setProperty(&quot;teamomschrijving&quot;, team.getOmschrijving());
    datastore.put(ent);
  }
  
  public void verwijderTeam(Team team) {
    Key teamKey = KeyFactory.createKey(&quot;Team&quot;, team.getTeamcode());
    datastore.delete(teamKey);
  }
	
  public void wijzigTeam(Team team) {
    voegTeamToe(team);
  }
	
  public Team getTeam(String teamcode) throws EntityNotFoundException {
    Team team = new Team();
    Key k = KeyFactory.createKey(&quot;Team&quot;, teamcode);
    Entity res;
    res = datastore.get(k);
    team.setTeamcode((String) res.getProperty(&quot;teamcode&quot;));
    team.setOmschrijving((String) res.getProperty(&quot;teamomschrijving&quot;));
    return team;
  }
  
  <span class="comment">/**********LIJST RESULTATEN GESORTEERD**********/</span>
  
  <span class="comment">//resultaten oplopend gesorteerd op property teamcode</span>
  public ArrayList&lt;Team&gt; getTeamLijst() {
    ArrayList&lt;Team&gt; teams = new ArrayList&lt;Team&gt;();
    Query q = new Query(&quot;Team&quot;)<span class="codeplus">.addSort(&quot;teamcode&quot;, SortDirection.ASCENDING)</span>;
    PreparedQuery pq = datastore.prepare(q);

    for (Entity result: pq.asIterable()) {
      Team team = new Team();
      String tc = (String) result.getProperty(&quot;teamcode&quot;);
      team.setTeamcode(tc);
      String to = (String) result.getProperty(&quot;teamomschrijving&quot;);
      team.setOmschrijving(to);
      teams.add(team);
    }
    return teams;
  }
	
  public void setTeamspeler(Team team, Lid lid) {
    Entity e = new Entity(&quot;Teamspeler&quot;, team.getTeamcode() 
      + lid.getSpelerscode());
    e.setProperty(&quot;teamcode&quot;, team.getTeamcode());
    e.setProperty(&quot;spelerscode&quot;, lid.getSpelerscode());
    datastore.put(e);
  }
	
  public void verwijderTeamspeler(Team team, Lid lid) {
    Key k = KeyFactory.createKey(&quot;Teamspeler&quot;, 
      team.getTeamcode() + lid.getSpelerscode());
    datastore.delete(k);
  }
  
  <span class="comment">/**********QUERY FILTEREN OP PROPERTY**********/</span>
  
  
  public <span class="codeplus">ArrayList&lt;Lid&gt; getSpelersVanTeam(Team team)</span> 
    throws EntityNotFoundException {
    
    ArrayList&lt;Lid&gt; teamleden = new ArrayList&lt;Lid&gt;();
    
    <span class="comment">//voeg filter toe aan query</span>
    <span class="codeplus"><span class="jsp">Filter</span> teamcodeFilter =  new FilterPredicate(&quot;teamcode&quot;,</span>
      <span class="codeplus"><span class="jsp">FilterOperator.EQUAL</span>, team.getTeamcode())</span>;
    Query q = new Query(&quot;Teamspeler&quot;).<span class="codeplus">setFilter(<span class="jsp">teamcodeFilter</span>)</span>;
    PreparedQuery pq = datastore.prepare(q);

    for (Entity result: pq.asIterable()) {
      Lid lid = this.getLid( (String) result.getProperty(&quot;spelerscode&quot;));
      teamleden.add(lid);
    }
    return teamleden;
  }
	
  public ArrayList&lt;Team&gt; getTeamsVanSpeler( Lid lid) 
    throws EntityNotFoundException{
    
    ArrayList&lt;Team&gt; teamsVanSpeler = new ArrayList&lt;Team&gt;();
    Filter spelerscode =  new FilterPredicate(&quot;spelerscode&quot;, 
      FilterOperator.EQUAL, lid.getSpelerscode());
    Query q = new Query(&quot;Teamspeler&quot;).setFilter(spelerscode);
    PreparedQuery pq = datastore.prepare(q);
    for (Entity result: pq.asIterable()) {
      Team team = this.getTeam( (String) result.getProperty(&quot;teamcode&quot;));
      teamsVanSpeler.add(team);
    }
    return teamsVanSpeler;
  }

}
</pre>
					
						</div>
				
				
				
				
				
				
		</div>


	
    </div>
  </div>
</div>
	
<% } } %>

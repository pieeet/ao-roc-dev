<%@ include file="/AO/JSP_Java_DB/includes/pagetop.jsp" %>
<%@ page import="jspcursus.sport.vereniging.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>



<%
	if (user != null) {  
		pageContext.setAttribute("user", user);

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
					op een webpagina wordt beheerd. Je maakt gebruik van Java, JSP, CSS, MySQL en eventueel JavaScript.</p>
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
									<img src="/AO/JSP_Java_DB/images/sportLogo.png" width="90%">
									<p>Demo app sportvereniging (under construction). Kies een tab voor overzicht en beheer van 
									leden en teams. Probeer gerust uit!</p>
								</div>
								<div id="tabs_sport-1" class="sport_content">
									<img src="/AO/JSP_Java_DB/images/sportLogo.png" width="90%">
									<div id="sport_tab-1_content" class="sport_content">
										<img id="loading_spinner" src="/AO/JSP_Java_DB/images/loading_spinner.gif">
									</div>
					
								</div>
								<div id="tabs_sport-2">
									<img src="/AO/JSP_Java_DB/images/sportLogo.png" width="90%">
									<div id="sport_tab-2_content" class="sport_content">
										<img id="loading_spinner" src="/AO/JSP_Java_DB/images/loading_spinner.gif">
									</div>
									
								</div>
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
						Kopieer de driver naar de map Web pages/WEB-INF/lib in je bestands explorer.</li>
					</ul>
					<h3>Voorbeeldprojecten</h3>
					<p>In de zip file vind je een aantal voorbeeldprojecten. Deze zijn bijgeleverd om het je wat gemakkelijker te maken. 
					De voorbeeldprojecten zijn opgezet in NetBeans en maken gebruik van een bijgeleverd Connection.java bestand en de klasse 
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
			
				
		</div>


	
    </div>
  </div>
</div>
	<link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Roboto' rel='stylesheet' type='text/css'>
<!-- Latest compiled and minified Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<script src="/AO/InlJava/includes/inlJava.js" type="text/javascript"></script>
<script src="/AO/JSP_Java_DB/includes/jsp.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	<!-- JQuery stylesheets voor sport app -->
<link href="/AO/JSP_Java_DB/jqueryUI/jquery-ui.min.css" type="text/css" rel="stylesheet">
   	<link href="/AO/JSP_Java_DB/jqueryUI/jquery-ui.structure.min.css" type="text/css" rel="stylesheet">
   	<link href="/AO/JSP_Java_DB/jqueryUI/jquery-ui.theme.min.css" type="text/css" rel="stylesheet">
   	<link href="/styles/stijl_3.css" type="text/css" rel="stylesheet">
   
   	<!-- JQuery UI JavaScript voor sportapp -->
    <script src="/AO/JSP_Java_DB/jqueryUI/jquery-ui.min.js"></script>
    
    <!-- JQuery voor sportapp UNDER CONSTRUCTION -->
    <script src="/AO/JSP_Java_DB/includes/sportapp.js"></script>
</body>

<!-- afsluiters user && leden != null -->
<% }  %>

<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

	<%@ include file="/AO/BlueJ/includes/zijmenu.jsp"%>


	<div class="col-md-9">
		<h2>Klassen</h2>
		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>

			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je de volgende begrippen kent en kunt gebruiken:</p>
			<ul>
				<li>klassendiagram</li>
				<li>namen van klassen, attributen en methoden</li>
				<li>case-sensitive</li>
				<li>public en private</li>
				<li>projectNaam</li>
				<li>gebruik van de constructor en keyword &quot;this&quot;</li>
				<li>gebruik verschillende soorten methoden</li>
				<li>getters en setters</li>
				<li>commentaar</li>

			</ul>

		</div>


		<p>
			In dit hoofdstuk ga je aan de slag met de <i>klassen</i> Bankrekening
			en Leerling. De broncode van de klassen vind je in het werkboek.
			Klassen hebben i.h.a. attributen en methoden. Door middel van
			zogenaamde getters en setters kun je de waarde van attributen
			respectievelijk opvragen en be&iuml;nvloeden.
		</p>
		<h3>Klassendiagram</h3>
		<p>
			Een klassendiagram gebaseerd op de <a
				href="http://nl.wikipedia.org/wiki/Unified_Modeling_Language">Unified
				Modeling Language (UML)</a> bestaat uit een kop met de naam van de
			klasse, een onderdeel met de attributen en een onderdeel met de
			methoden. De naam van de klasse begint altijd met een hoofdletter.
			Attributen beginnen met een kleine letter en de methoden - <span
				class="letop">afgezien van de constructor</span> - beginnen ook met
			een kleine letter.
		</p>
		<table class="klassendiagram">
			<tr>
				<th>Bankrekening</th>
			</tr>
			<tr>
				<td>saldo<br> naam<br> nummer
				</td>
			</tr>
			<tr>
				<td>Bankrekening()<br> getSaldo()<br> neemOp()<br>
					stort()
				</td>
			</tr>
		</table>

		<div class="opdrachten" id="opdracht">
			<h2>Opdracht</h2>
			<p>In de laatste opdracht van hoofdstuk 4 heb je een applicatie
				gemaakt volgens onderstaand schema.</p>
			<img src="images/wedstrijddiagram.png" width=600>
			<p>Maak dezelfde opdracht maar nu met Eclipse. Maak de volgende
				klassen:</p>
			<ul>
				<li>Datum met 3 attributen van het type int (dag, maand en
					jaar)</li>
				<li>Speler met 2 attributen (String naam en Datum
					geboortedatum)</li>
				<li>Team met 3 attributen (String naam en twee spelers van het
					type Speler)</li>
				<li>Wedstrijd met 4 attributen (Datum wedstrijdDatum, 2 teams
					en een String uitslag)</li>
				<li>Een Applet die er ongeveer als volgt uitziet:<br> <img
					src="images/wedstrijdapplet.png" width=500>
			</ul>
			<h3>Aanwijzingen</h3>
			<p>
				Als je in Eclipse een klasse maakt en deze een aantal attributen
				geeft, kun je vervolgens automatisch de constructor en de <em>&quot;getters&quot;</em>
				en de <em>&quot;setters&quot;</em> aanmaken. Dit kan je enorm veel
				typewerk besparen.
			</p>
			<img src="images/eclipse.jpg" width=500>

			<h3>Constructor</h3>
			<p>
				Een constructor maakt een object van een klasse. Bij het aanmaken
				van het object moeten de attributen een waarde krijgen. Dit doe je
				met behulp van <em>parameters</em>.
			</p>
			<pre class="code">
public class Speler {
    String naam;
    Datum geboortedatum;
    
    <span class="comment">// constructor</span>
    public Speler(<span class="codeplus">String naam, Datum geboortedatum</span>) {
        <span class="codeplus">this</span>.naam = naam;
        <span class="codeplus">this</span>.geboortedatum = geboortedatum;
    }
    ...
</pre>
			<p>
				Met het keyword <em>this</em> geef je aan dat het om een attribuut
				van de eigen klasse gaat.
			</p>
			<p>
				Als je van een klasse een object maakt roep je de constructor aan
				met het keyword <em>new</em>. De benodigde parameters die je in de
				constructor hebt gedefinieerd kun je op verschillende manieren
				meegeven.
			</p>
			<pre class="code">
<span class="codeplus">Datum datum = <span class="jsp">new</span> Datum(12, 1, 1987)</span>;
Speler speler1 = <span class="jsp">new</span> Speler(&quot;Pietje&quot;, <span
					class="codeplus">datum</span>);						
</pre>
			<p>In bovenstaande code wordt eerst een datum-object gemaakt dat
				vervolgens wordt meegegeven als parameter bij het maken van het
				speler-object. Het volgende codefragment laat zien dat dit ook in
				&eacute;&eacute;n keer kan.</p>
			<pre class="code">
Speler speler1 = <span class="jsp">new</span> Speler(&quot;Pietje&quot;, <span
					class="codeplus"><span class="jsp">new</span> Datum(12, 1, 1987)</span>);						
</pre>
			<p>Als je een object maar &eacute;&eacute;n keer nodig hebt, is
				de tweede methode wel zo effici&euml;nt.</p>

			<h3>Getters</h3>
			<p>Een getter is een methode die de waarde van een attribuut
				teruggeeft bijvoorbeeld:</p>
			<pre class="code">
public class Team {
    private String naam;
    private Speler speler1;
    private Speler speler2;
   
    <span class="comment">//constructor</span>
    public Team(String naam, Speler speler1, Speler speler2) {
        this.naam = naam;
        this.speler1 = speler1;
        this.speler2 = speler2;
    }
    
    <span class="comment">/****** Getters ******/</span>
    
    public <span class="codeplus">String getNaam()</span> {
        <span class="codeplus">return naam</span>;
    }
    
    public <span class="codeplus">Speler</span> getSpeler1() {
        <span class="codeplus">return speler1</span>;
    }
    
    public <span class="codeplus">Speler</span> getSpeler2() {
        <span class="codeplus">return speler2</span>;
    }
}

</pre>
			<p>
				Een getter heeft altijd een <em>terugkeerwaarde</em>. De
				terugkeerwaarde (in bovenstaande code gemarkeerd) kan van een
				primitief type zijn (bijvoorbeeld een int), een string of een object
				(bijvoorbeeld van type Speler). Je kunt met getters bijvoorbeeld de
				naam van de spelers van een team opvragen.
			</p>
			<pre class="code">
Team <span class="codeplus">team1</span> = new Team(&quot;Heren 1&quot;,
	new Speler(&quot;Pietje&quot;, new Datum(12, 1, 1987)),
	new Speler(&quot;Jantje&quot;, new Datum(6, 7, 1992)) );
	
String naamSpeler1VanTeam1 = <span class="codeplus">team1.getSpeler1().getNaam()</span>;
String naamSpeler2VanTeam1 = <span class="codeplus">team1.getSpeler2().getNaam()</span>;
</pre>
			<h3>Setters</h3>
			<p>Met een setter kun je een attribuut een waarde geven of de
				waarde ervan veranderen. De klasse wedstrijd bijvoorbeeld heeft de
				volgende setter.</p>
			<pre class="code">
public <span class="codeplus">void setUitslag(String uitslag)</span> {
    this.uitslag = uitslag;
}
</pre>
			<p>Setters hebben geen terugkeerwaarde (void) en
				&eacute;&eacute;n parameter die de waarde bevat die het attribuut
				moet krijgen.</p>

			<pre class="code">
team1 = new Team(&quot;4A&quot;, new Speler(&quot;Jantje&quot;, new Datum(20, 1, 1987)), 
        new Speler(&quot;Pietje&quot;, new Datum(15,1, 1988)));
team2 = new Team(&quot;4B&quot;, new Speler(&quot;Klaas&quot;, new Datum(3, 10, 1977)), 
        new Speler(&quot;Melvin&quot;, new Datum(8, 11, 1991)));
wedstrijd = new Wedstrijd(new Datum(20,1,2015), team1, team2);
wedstrijd.<span class="codeplus">setUitslag(&quot;5-3&quot;)</span>;
</pre>
			<h3>De methode toString</h3>
			<p>
				Iedere klasse stamt af van de klasse <a
					href="http://docs.oracle.com/javase/7/docs/api/java/lang/Object.html"
					target="_blank">&quot;Object&quot;</a> en erft o.m. al haar
				methoden. E&eacute;n van de methoden is toString() die een string
				representatie van een object geeft. Om een string van een datum te
				maken zou je de volgende code kunnen gebruiken:
			</p>
			<pre class="code">
Datum datum = new Datum(1, 1, 2015);
String datumString = &quot;&quot; + datum.getDag() + &quot;-&quot; + datum.getMaand(); + &quot;-&quot; + datum.getJaar();
</pre>
			<p>Om te vermijden dat je bovenstaande code keer op keer moet
				aanmaken, kun je ook in de klasse Datum de methode toString()
				&quot;overriden&quot;</p>

			<pre class="code">
@Override
public String toString() {
    return &quot;&quot; + dag + &quot;-&quot; +maand + &quot;-&quot; + jaar;
}
</pre>
			<p>Als je dit hebt gedaan kun je voortaan als volgt van een datum
				de gewenste string maken. Je hoeft de methode niet aan te roepen
				omdat java dat vanzelf doet als ze van een object een string moet
				maken.</p>

			<pre class="code">
Datum datum = new Datum(1, 1, 2015);
String datumString = &quot;&quot; + datum; 
</pre>

		</div>

		<div class="toonknopcontainer">
			<button class="toonknop" id="toon1" onclick="toon('uitw1')">Toon
				uitwerking</button>
		</div>

		<div class="uitwerking" id="uitw1">
			<h3>De klasse Datum</h3>
			<pre class="code">
package sportwedstrijd;

public class Datum {
	int dag;
	int maand;
	int jaar;
	
	public Datum(int dag, int maand, int jaar) {
		this.dag = dag;
		this.maand = maand;
		this.jaar = jaar;
	}

	public int getDag() {
		return dag;
	}

	public void setDag(int dag) {
		this.dag = dag;
	}

	public int getMaand() {
		return maand;
	}

	public void setMaand(int maand) {
		this.maand = maand;
	}

	public int getJaar() {
		return jaar;
	}

	public void setJaar(int jaar) {
		this.jaar = jaar;
	}

	@Override
	public String toString() {
		return &quot;&quot; + dag + &quot;-&quot; +maand + &quot;-&quot; + jaar;
	}

}
</pre>

			<h3>De klasse Speler</h3>
			<pre class="code">
package sportwedstrijd;

public class Speler {
	String naam;
	Datum geboortedatum;
	
	public Speler(String naam, Datum geboortedatum) {
		this.naam = naam;
		this.geboortedatum = geboortedatum;
	}

	public String getNaam() {
		return naam;
	}

	public void setNaam(String naam) {
		this.naam = naam;
	}

	public Datum getGeboortedatum() {
		return geboortedatum;
	}

	public void setGeboortedatum(Datum geboortedatum) {
		this.geboortedatum = geboortedatum;
	}

}


</pre>
			<h3>De klasse Team</h3>

			<pre class="code">
package sportwedstrijd;

public class Team {
	String naam;
	Speler speler1;
	Speler speler2;
	
	public Team(String naam, Speler speler1, Speler speler2) {
		this.naam = naam;
		this.speler1 = speler1;
		this.speler2 = speler2;
	}

	public String getNaam() {
		return naam;
	}

	public void setNaam(String naam) {
		this.naam = naam;
	}

	public Speler getSpeler1() {
		return speler1;
	}

	public void setSpeler1(Speler speler1) {
		this.speler1 = speler1;
	}

	public Speler getSpeler2() {
		return speler2;
	}

	public void setSpeler2(Speler speler2) {
		this.speler2 = speler2;
	}

}

</pre>

			<h3>De klasse Wedstrijd</h3>
			<pre class="code">
package sportwedstrijd;

public class Wedstrijd {
	Datum wedstrijddatum;
	Team team1;
	Team team2;
	String uitslag;
	
	public Wedstrijd(Datum wedstrijddatum, Team team1, Team team2) {
		this.wedstrijddatum = wedstrijddatum;
		this.team1 = team1;
		this.team2 = team2;
	}

	public String getUtslag() {
		return uitslag;
	}

	public void setUitslag(String uitslag) {
		this.uitslag = uitslag;
	}

	public Datum getWedstrijddatum() {
		return wedstrijddatum;
	}

	public void setWedstrijddatum(Datum wedstrijddatum) {
		this.wedstrijddatum = wedstrijddatum;
	}

	public Team getTeam1() {
		return team1;
	}

	public void setTeam1(Team team1) {
		this.team1 = team1;
	}

	public Team getTeam2() {
		return team2;
	}

	public void setTeam2(Team team2) {
		this.team2 = team2;
	}

}
</pre>

			<h3>De Applet</h3>

			<pre class="code">
package sportwedstrijd;

import java.applet.Applet;
import java.awt.Graphics;

public class Overzicht extends Applet {
	Team team1;
	Team team2;
	Wedstrijd wedstrijd; 
	
	public void init() {
		setSize(400, 400);
		team1 = new Team(&quot;4A&quot;, new Speler(&quot;Jantje&quot;, new Datum(20, 1, 1987)), 
				new Speler(&quot;Pietje&quot;, new Datum(15,1, 1988)));
		team2 = new Team(&quot;4B&quot;, new Speler(&quot;Klaas&quot;, new Datum(3, 10, 1977)), 
				new Speler(&quot;Melvin&quot;, new Datum(8,11, 1991)));
		wedstrijd = new Wedstrijd(new Datum(20,1,2015), team1, team2);
		wedstrijd.setUitslag(&quot;5-3&quot;);
	}
	
	public void paint(Graphics g) {
		g.drawString(&quot;Datum wedstrijd: &quot; + wedstrijd.getWedstrijddatum(), 20, 20);
		g.drawString(&quot;Spelers team 1:&quot;, 20, 50);
		g.drawString(&quot;-&quot; + team1.getSpeler1().getNaam(), 20, 70);
		g.drawString(&quot;-&quot; + team1.getSpeler2().getNaam(), 20, 90);
		g.drawString(&quot;Spelers team 2:&quot;, 20, 120);
		g.drawString(&quot;-&quot; + team2.getSpeler1().getNaam(), 20, 140);
		g.drawString(&quot;-&quot; + team2.getSpeler2().getNaam(), 20, 160);
		g.drawString(&quot;Uitslag: &quot; + wedstrijd.getUitslag(), 20, 200);
	}
}
</pre>

		</div>

	</div>
</div>
<%@ include file="/AO/BlueJ/includes/bottom.html"%>
</html>
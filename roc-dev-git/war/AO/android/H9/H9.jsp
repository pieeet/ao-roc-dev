<%@ include file="/AO/android/includes/pagetop.jsp"%>


<%
	if (user != null) {
%>


<div class="col-md-9">
	<h2>Takenlijst</h2>

	<!-- Leerdoelen -->
	<div class="bs-callout bs-callout-warning">
		<h2>Leerdoelen</h2>
		<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
			je:</p>
		<ul>
			<li></li>
		</ul>
	</div>
	<h3>Introductie</h3>
	<p>In dit hoofdstuk gaan we een takenlijst maken. Als gebruiker de
		app start vertoont de Takenlijst Activity een lijst met taken. Iedere
		taak heeft een check-box waarmee kan worden aangegeven dat de taak
		voltooid is, een text view met de naam van de taak en een tekst view
		met voor optionele notities.</p>
	<div class="img_met_bijschrift">
		<p>De Takenlijst Activity</p>
		<img src="takenlijst_1.png">
	</div>
	<div class="img_met_bijschrift">
		<p>Voeg toe / wijzig taak</p>
		<img src="takenlijst_2.png">
	</div>
	<div class="img_met_bijschrift">
		<p>Tab layout</p>
		<img src="takenlijst_3.png">
	</div>
	<p>De takenlijst werkt met twee verschillende lijsten: persoonlijk
		en zakelijk. De gebruiker kan op een tab klikken of &quot;swipen&quot;
		om van lijst te wisselen.</p>
	<p>Als gebruiker taken aanvinkt zijn ze voltooid. Door op het
		prullenbak icoontje in de menu balk te klikken, worden ze uit de lijst
		op het scherm verwijderd. Als gebruiker op een taak klikt opent het
		edit venster zodat de taak achteraf gewijzigd kan worden.</p>
	<p>Door op het + icoontje te klikken kan een taak worden
		toegevoegd. Voor taken toevoegen en taken wijzigen kan dezelfde
		activity worden gebruikt. Als gebruiker klaar is met de taak bewerken,
		kan hij op het &#10004; icoontje in de menu balk klikken.</p>
	<p>De app heeft verschillende gegevens nodig:</p>
	<ul>
		<li>de lijstnamen voor de tabs</li>
		<li>gegevens van een taak:
			<ul>
				<li>de lijst waar de taak bij hoort</li>
				<li>de naam van de taak</li>
				<li>de eventuele notitie</li>
				<li>al of niet voltooid</li>
			</ul>
		</li>
	</ul>
	<h3>Introductie SQLite</h3>
	<p>Zoals de naam al zegt is SQLite een lichtgewicht (ca 350 KB) SQL
		(relationele) database die de meeste, maar niet alle standaard SQL
		functies implementeert. De SQLite bibliotheek is ge&iuml;nstalleerd op
		ieder Android toestel. Je hoeft niets te installeren of te
		configureren.</p>
	<p>Wanneer je een SQLite databse maakt wordt deze opgeslagen in een
		enkel bestand op het toestel. Dit bestand kan alleen door de app zelf
		benaderd worden. SQLite is gratis, open source en wordt ondersteund
		door de meeste browsers en besturingssystemen. Om die redenen wordt
		het veel gebruikt als &quot;embedded&quot; database.</p>
	<h4>Verschillen met andere databases</h4>
	<p>SQLite verschilt op een aantal onderdelen met andere (SQL)
		databases:</p>
	<ul>
		<li>SQLite draait niet op een server die wordt benaderd door
			client apps. Het is ingebed (embedded) als onderdeel van de client
			app.</li>
		<li>SQLite ondersteunt slecht drie data types: TEXT, INTEGER en
			REAL. Deze data types komen overeen met de java data types: String,
			long en double. Als je andere data types wilt opslaan (zoals
			Data/Time of boolean), dan moet je ze converteren naar
			&eacute;&eacute;n van de bovenstaande. Je kunt bijvoorbeeld Date naar
			text converteren als je deze wilt opslaan en terug converteren naar
			Date als je hem uit de database ophaalt.</li>
		<li>SQLite is &quot;weakly typed&quot;, dat wil zeggen dat je in
			een kolom niet alleen maar data van &eacute;&eacute;n bepaald type
			mag opslaan. Dus als je een kolom hebt gedefinieerd met INTEGERS, kun
			je daar nog steeds Strings in opslaan. Bij het programmeren moet je
			dus opletten dat je de juiste data types opslaat aangezien andere
			types niet geweigerd worden.</li>
	</ul>

	<h3>Opzetten van de takenlijst database</h3>
	<p>Onderstaande tekening toont een diagram voor de takenlijst
		database.</p>
	<img src="erd.png">
	<p>We kunnen volstaan met twee tabellen: de lijst tabel en de taak
		tabel. De tabellen zijn aan elkaar gerelateerd met een
		&eacute;&eacute;n op meer relatie. Een lijst kan meerdere taken
		bevatten, maar een taak heeft maar &eacute;&eacute;n lijst.</p>
	<p>De Lijst tabel heeft maar twee kolommen: de _id kolom fungeert
		als sleutel voor iedere rij en de kolom naam bewaart de naam van de
		lijst.</p>
	<p>De Taak tabel heeft 6 kolommen. Ook hier een _id voor de
		sleutel. Vervolgens een kolom die bewaart bij welke lijst de taak
		hoort. De taak_naam en notitie kolommen bewaren naam en notitie. De
		date_afgerond bewaart de datum/tijd waarop de taak is afgerond.
		Hieruit kan worden afgeleid of de taak wel of niet is afgerond.</p>
	<p>In de kolom verborgen kun je een boolean waarde bewaren die
		bepaalt of de (afgeronde) taak wel of niet moet worden getoond.</p>

	<h4>Tabellen maken</h4>
	<p>Onderstaande SQL statements cre&euml;ren de twee tabellen:</p>
	<pre class="code">
CREATE TABLE Lijst (
	_id INTEGER PRIMARY KEY AUTOINCREMENT,
	lijst_naam TEXT NOT NULL UNIQUE
)

CREATE TABLE Taak (
	_id INTEGER PRIMARY KEY AUTOINCREMENT,
	lijst_id INTEGER NOT NULL,
	taak_naam TEXT NOT NULL,
	notitie TEXT,
	date_afgerond TEXT,
	verborgen TEXT
)
</pre>
	<h4>Tabellen deleten</h4>
	<p>Met Onderstaande statement kun je de tabellen wissen</p>
	<pre class="code">
DROP TABLE IF EXISTS Lijst
DROP TABLE IF EXISTS Taak
</pre>
	<h4>Veelgebruikte kolom attributen</h4>
	<table>
		<tr>
			<th>Attribuut</th>
			<th>Beschrijving</th>
		</tr>
		<tr>
			<td>PRIMARY KEY</td>
			<td>Definieert de primaire sleutel. Een primary key kolom
				vereist dat iedere rij een waarde moet hebben en dat iedere waarde
				uniek is.</td>
		<tr>
			<td>AUTOINCREMENT</td>
			<td>Maakt dat de waarde automatisch wordt gegenereerd als een
				nieuwe rij wordt ingevoerd. In combinatie met type INTEGER zorgt er
				voor dat nieuwe waarde &eacute;&eacute;n hoger wordt dan de vorige</td>
		</tr>
		<tr>
			<td>NOT NULL</td>
			<td>Specificeert dat er een waarde moet worden ingevoerd</td>
		</tr>
		<tr>
			<td>UNIQUE</td>
			<td>Iedere ingevoerde waarde moet uniek zijn, met andere woorden
				er mogen geen waardes hetzelfde zijn</td>
		</tr>
	</table>

	<h3>
		De <em>business</em> objecten voor de takenlijst
	</h3>
	<p>
		Onderstaande java klassen tonen de java <em>business</em> objecten van
		de takenlijst app. Deze objecten gebruiken we om dezelfde data die we
		in de tabellen opslaan om te zetten naar java objecten. Wanneer met
		databases wordt gewerkt is het gebruikelijk om klassen te maken die
		dezelfde data kunnen bevatten die in de tabellen wordt opgeslagen.
		Eventueel kunnen aanvullende methodes worden gemaakt om de data te
		bewerken.
	</p>
	<pre class="code">
<span class="comment">//De Lijst klasse</span>
public class Lijst {
    private int id;
    private String naam;

    public Lijst() {}

    public Lijst(String naam) {
        this.naam = naam;
    }

    public Lijst(int id, String naam) {
        this.id = id;
        this.naam = naam;
    }

    public String getNaam() {
        return naam;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return naam;
    }
}
</pre>
	<pre class="code">
<span class="comment">//De Taak klasse</span>
public class Taak {
    private int taakId;
    private int lijstId;
    private String naam;
    private String notitie;
    private long datumMillisVoltooid;
    private int verborgen;

    public static final int TRUE = 1;
    public static final int FALSE = 0;

    public Taak() {
        naam = "";
        notitie = "";
        datumMillisVoltooid = 0L;
        verborgen = 0;
    }

    public Taak(int lijstId, String naam, String notitie, long datumMillisVoltooid, int verborgen) {
        this.lijstId = lijstId;
        this.naam = naam;
        this.notitie = notitie;
        this.datumMillisVoltooid = datumMillisVoltooid;
        this.verborgen = verborgen;
    }

    public Taak(int taakId, int lijstId, String naam, String notitie, long datumMillisVoltooid,
                int verborgen) {
        this.taakId = taakId;
        this.lijstId = lijstId;
        this.naam = naam;
        this.notitie = notitie;
        this.datumMillisVoltooid = datumMillisVoltooid;
        this.verborgen = verborgen;
    }

    public int getTaakId() {
        return taakId;
    }

    public void setTaakId(int taakId) {
        this.taakId = taakId;
    }

    public int getLijstId() {
        return lijstId;
    }

    public void setLijstId(int lijstId) {
        this.lijstId = lijstId;
    }

    public String getNaam() {
        return naam;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }

    public String getNotitie() {
        return notitie;
    }

    public void setNotitie(String notitie) {
        this.notitie = notitie;
    }

    public long getDatumMillisVoltooid() {
        return datumMillisVoltooid;
    }

    public void setDatumMillisVoltooid(long datumMillisVoltooid) {
        this.datumMillisVoltooid = datumMillisVoltooid;
    }

    public int getVerborgen() {
        return verborgen;
    }

    public void setVerborgen(int verborgen) {
        this.verborgen = verborgen;
    }
}
</pre>
	<p>
		De Lijst en Taak klassen hebben allebei drie constructors. Een default
		constructor zonder parameters. Een constructor zonder id attribuut.
		Deze wordt gebruikt als een nieuwe lijst of taak aan de database moet
		worden toegevoegd. De id wordt immers automatisch aangemaakt als een
		object aan database wordt toegevoegd. Wanneer echter een rij gegevens
		uit de databse wordt opgehaald en naar een java klasse moet worden
		omgezet is er wel sprake van een bestaand id.<br> De Taak klasse
		heeft twee int constanten TRUE en FALSE gedefinieerd. Deze worden
		gebruikt om het int attribuut <em>verborgen</em> een waarde te geven.
		True en false zijn op deze wijze tot int constanten omgezet.
	</p>
	<p>Als een taak als voltooid wordt gemarkeerd wordt de datum/tijd
		van dat moment gebruikt als tijdstip waarop de taak is voltooid. Bij
		een nog niet voltooide taak is deze waarde 0. Je kunt een datum
		natuurlijk als String opslaan, maar dan kun je er niet mee rekenen.
		Aangezien we de milliseconden van de huidige datum/tijd (gerekend
		vanaf 1 januari 1970) van het systeem kunnen opvragen gebruiken we
		deze om de waarde van het tijdstip van voltooiing van de taak op te
		slaan als INTEGER in de database en als long in het java object.</p>
	<p>
	<h3>Een database klasse maken</h3>
	<p>Nu we de business klassen hebben gemaakt kunnen we een database
		klasse gaan maken. Deze klasse herbergt alle database code voor de
		app. Mocht je later een andere database willen implementeren, dan hoef
		je alleen maar een nieuwe database klasse te maken.</p>
	<h4>Constanten definieren</h4>
	<p>Het is gebruikelijk om in een databse klasse onveranderlijke
		gegevens op te slaan in constanten. Deze constanten zijn gemakkelijk
		op te roepen in je IDE en je voorkomt op die manier typefouten. We
		gaan constanten defini&euml;ren waarbij we het eerder gemaakte ERD als
		uitgangspunt nemen. We hebben straks ook de kolomnummers nodig
		(beginnend met 0), dus die slaan we ook op in constanten.</p>

	<pre class="code">
public class TakenlijstDB {
    
    <span class="comment">//database constanten om de tabellen te creëren of droppen</span>
    public static final String DB_NAAM  = "takenlijst.db";
    public static final int DB_VERSIE = 1;

    <span class="comment">//Lijst-tabel constanten</span>
    public static final String LIJST_TABEL = "Lijst";

    public static final String LIJST_ID = "_id";
    public static final int LIJST_ID_COL = 0;

    public static final String LIJST_NAAM = "lijst_naam";
    public static final int LIJST_NAAM_COL = 1;

    <span class="comment">//Taak-tabel constanten</span>
    public static final String TAAK_TABEL = "Taak";

    public static final String TAAK_ID = "_id";
    public static final int TAAK_ID_COL = 0;

    public static final String TAAK_LIJST_ID = "lijst_id";
    public static final int TAAK_LIJST_ID_COL = 1;

    public static final String TAAK_NAAM = "taak_naam";
    public static final int TAAK_NAAM_COL = 2;

    public static final String TAAK_NOTITIE = "taak_notitie";
    public static final int TAAK_NOTITIE_COL = 3;

    public static final String TAAK_AFGEROND = "taak_afgerond";
    public static final int TAAK_AFGEROND_COL = 4;

    public static final String TAAK_VERBORGEN = "taak_verborgen";
    public static final int TAAK_VERBORGEN_COL = 5;
</pre>
	<h4>Statements die de database cre&euml;ren</h4>
	<p>Nu we de tabellen, kolomnamen en -nummers in constanten hebben
		gedefinieerd kunnen we de CREATE TABLE en DROP TABLE statements gaan
		maken straks nodig zijn om de Lijst en Taak tabellen aan te maken of
		te wissen:</p>

	<pre class="code">
    <span class="comment">//CREATE and DROP TABLE constanten</span>
    public static final String CREATE_LIJST_TABLE =
            "CREATE TABLE " + LIJST_TABEL + " (" +
                    LIJST_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    LIJST_NAAM + " TEXT NOT NULL UNIQUE);";

    public static final String CREATE_TAAK_TABLE =
            "CREATE TABLE " + TAAK_TABEL + " (" +
                    TAAK_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    TAAK_LIJST_ID + " INTEGER NOT NULL, " +
                    TAAK_NAAM + " TEXT NOT NULL, " +
                    TAAK_NOTITIE + " TEXT, " +
                    TAAK_AFGEROND + " INTEGER, " +
                    TAAK_VERBORGEN + " INTEGER);";

    public static final String DROP_LIJST_TABEL =
            "DROP TABLE IF EXISTS " + LIJST_TABEL;

    public static final String DROP_TAAK_TABEL =
            "DROP TABLE IF EXISTS " + TAAK_TABEL;
	
</pre>
	<h4>De database cre&euml;ren</h4>
	<p>Om de database daadwerkelijk te cre&euml;ren maken we een
		binnenklasse die de klasse SQLiteOpenHelper klasse uitbreidt. Om een
		beginnetje te maken voegen we meteen handmatig wat rijen aan de
		tabellen toe. Met \n kun je een regeleinde in de notitie invoegen.</p>
	<pre class="code">
    class DBHelper extends <span class="codeplus">SQLiteOpenHelper</span> {

        public DBHelper(Context context, String name, 
        		SQLiteDatabase.CursorFactory factory, int version) {
            super(context, name, factory, version);
        }

        @Override
        public void onCreate(SQLiteDatabase db) {
            db.execSQL(CREATE_LIJST_TABLE);
            db.execSQL(CREATE_TAAK_TABLE);

            db.execSQL("INSERT INTO lijst VALUES (1, 'Persoonlijk')");
            db.execSQL("INSERT INTO lijst VALUES (2, 'Zakelijk')");
            //paar default taken invoeren
            db.execSQL("INSERT INTO listview_taak VALUES (1, 1, 'Rekeningen betalen', " +
            "'internet<span class="codeplus">\n</span>electra<span
			class="codeplus">\n</span>krant', 0, 0)");
            db.execSQL("INSERT INTO listview_taak VALUES (2, 1, 'Naar kapper', " +
                    "'', 0, 0)");
        }

        @Override
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            Log.d("Takenlijst", "upgraden db versie van " +
            oldVersion + " naar " + newVersion);
            db.execSQL(DROP_LIJST_TABEL);
            db.execSQL(DROP_TAAK_TABEL);
            onCreate(db);
        }
    }	
	</pre>
	<p>De klasse begint met een constructor die vier argumenten aan de
		superklasse (SQLiteOpenHelper) doorgeeft. Na de constructor vervangt
		(override) de klasse de onCreate methode van de superklasse. De
		methode wordt alleen uitgevoerd als de gespecificeerde database niet
		op het toestel wordt aangetroffen. De eerste twee statements in de
		methode roepen de execSQL methode aan op de database die als argument
		aan de methode wordt meegegeven. Als argumenten worden de CREATE TABLE
		constanten meegegeven die we eerder hebben gemaakt en die de twee
		tabellen aanmaken.</p>
	<p>De volgende vier statements voegen een aantal rijen toe aan de
		tabellen. Deze fungeren als voorbeeld en voor testdoeleinden</p>
	<p>Na de onCreate methode wordt de onUpgrade methode gemaakt.
		Hiermee wordt de database vervangen als een nieuwere versie
		beschikbaar is. Tijdens de ontwikkelingsfase is het gebruikelijk om de
		oude database te wissen en de database opnieuw aan te maken. Dit wist
		echter alle data. Als de app in produktie is zou dit tot onaangename
		verrassingen kunnen leiden. In dat geval is het beter om ALTER TABLE
		statements te gebruiken om bijvoorbeeld een kolom aan een tabel toe te
		voegen.</p>
	<p>
		De execSQL methode van de SQLiteDatabase klasse kan gebruikt worden om
		SQL statements zoals CREATE TABLE en DROP TABLE uit te voeren of een
		aantal voorbeeld rijen in te voegen, maar kan uit
		veiligheidsoverwegingen beter niet gebruikt worden om invoer van
		gebruikers in een tabel in te voeren. In dat geval kunnen beter
		statements gebruikt worden die zogenaamde <a
			href="http://www.w3schools.com/sql/sql_injection.asp" target="+blank">SQL
			injections</a> verhinderen. Deze zullen we later in dit hoofdstuk
		tegenkomen.
	</p>
	<h3>Een database connectie openen en sluiten</h3>
	<p>Om een connectie met de database te openen heb je een instantie
		van de klasse SQLiteDatabase nodig. Deze instantie komt in twee
		smaken: eentje die alleen kan lezen en een die zowel kan lezen als
		schrijven. Om deze te maken heb je een instantie van de zopas gemaakte
		DBHelper klasse nodig. Nadat de db taken zijn uitgevoerd moet je de
		connectie sluiten om te vermijden dat er allerlei connecties actief
		blijven. Voeg aan je TakenlijstDB klasse de volgende code toe:</p>
	<pre class="code">
    <span class="comment">//declareer database en databaseHelper objecten</span>
    private SQLiteDatabase db;
    private DBHelper dbHelper;

    <span class="comment">//constructor instantieert dbHelper</span>
    public TakenlijstDB(Context context) {
        dbHelper = new DBHelper(context, DB_NAAM, null, DB_VERSIE);
    }

    <span class="comment">//hulpmethodes (private) die de database connectie openen</span>
    private void openReadableDB() {
        db = dbHelper.getReadableDatabase();
    }
    private void openWritableDB() {
        db = dbHelper.getWritableDatabase();
    }

    private void closeDB() {
        if (db != null) {
            db.close();
        }
    }

    private void closeCursor(Cursor cursor) {
        if (cursor != null) {
            cursor.close();
        }
    }	
	</pre>
	<h3>Public methodes toevoegen</h3>
	<p>De klasse moet natuurlijk taken kunnen ophalen en vertonen of
		nieuwe taken aan de database toevoegen. Daarvoor hebben we public
		methodes nodig die op een object van de klasse kunnen worden
		aangeroepen. Laten we beginnen met methodes te maken die gegevens uit
		de database ophalen.</p>
	<h3>Gegevens uit de database ophalen</h3>
	<pre class="code">
	<span class="comment">//haal taken van bepaalde lijst</span>
	public ArrayList&lt;Taak&gt; getTaken(String lijstNaam) {
        String where = TAAK_LIJST_ID + "= ? AND " +
                TAAK_VERBORGEN + "!= 1";
        int listID = getLijst(lijstNaam).getId();
        String[] whereArgs = { Integer.toString(listID)};
        this.openReadableDB();
        Cursor cursor = db.query(TAAK_TABEL, null, where, whereArgs, null, null, null);
        ArrayList&lt;Taak&gt; taken = new ArrayList&lt;&gt;();
        while (cursor.moveToNext()) {
            Taak taak = getTaakVanCursor(cursor);
            if (taak.getVerborgen() != 1) {
                taken.add(taak);
            }
        }
        closeCursor(cursor);
        closeDB();
        return taken;
    }
    
    <span class="comment">//haal taak met id</span>
    public Taak getTaak(long id) {
        String where = TAAK_ID + "= ?";
        String[] whereArgs = { Long.toString(id) };
        this.openReadableDB();
        Cursor cursor = db.query(TAAK_TABEL, null, where, whereArgs, null, null, null);
        cursor.moveToFirst();
        Taak taak = getTaakVanCursor(cursor);
        closeCursor(cursor);
        closeDB();
        return taak;
    }
    
    <span class="comment">//haal alle lijsten</span>
    public ArrayList&lt;Lijst&gt; getLijsten() {
        this.openReadableDB();
        Cursor cursor = db.query(LIJST_TABEL, null, null, null, null, null, null);
        ArrayList&lt;Lijst&gt; lijsten = new ArrayList<>();
        while (cursor.moveToNext()) {
            Lijst l = new Lijst();
            l.setId(cursor.getInt(LIJST_ID_COL));
            l.setNaam(cursor.getString(LIJST_NAAM_COL));
            lijsten.add(l);
        }
        this.closeCursor(cursor);
        this.closeDB();
        return lijsten;
    }
    
    <span class="comment">//haal lijst met naam</span>
    public Lijst getLijst(String naam) {
        String where = LIJST_NAAM + "= ?";
        String[] whereArgs = { naam };
        openReadableDB();
        Cursor cursor = db.query(LIJST_TABEL, null,
                where, whereArgs, null, null, null);
        Lijst lijst = null;
        cursor.moveToFirst();
        lijst = new Lijst(cursor.getInt(LIJST_ID_COL),
                cursor.getString(LIJST_NAAM_COL));
        this.closeCursor(cursor);
        this.closeDB();
        return lijst;
    }
    
    <span class="comment">//haal lijst met id</span>
    public Lijst getLijst(long id) {
        String where = LIJST_ID + "= ?";
        String[] whereArgs = { id };
        openReadableDB();
        Cursor cursor = db.query(LIJST_TABEL, null,
                where, whereArgs, null, null, null);
        Lijst lijst = null;
        cursor.moveToFirst();
        lijst = new Lijst(cursor.getInt(LIJST_ID_COL),
                cursor.getString(LIJST_NAAM_COL));
        this.closeCursor(cursor);
        this.closeDB();
        return lijst;
    }
    
    <span class="comment">//hulpmethode</span>
    private Taak getTaakVanCursor(Cursor cursor) {
        if (cursor == null || cursor.getCount() == 0){
            return null;
        } else {
            try {
                Taak taak = new Taak();
                taak.setTaakId(cursor.getInt(TAAK_ID_COL));
                taak.setLijstId(cursor.getInt(TAAK_LIJST_ID_COL));
                taak.setNaam(cursor.getString(TAAK_NAAM_COL));
                taak.setNotitie(cursor.getString(TAAK_NOTITIE_COL));
                taak.setDatumMillisVoltooid(cursor.getInt(TAAK_AFGEROND_COL));
                taak.setVerborgen(cursor.getInt(TAAK_VERBORGEN_COL));
                return taak;
            } catch(Exception e) {return null;}
        }
    }
	</pre>
	<h3>Meerdere rijen uit een tabel ophalen</h3>
	<p>
		De methode getTaken haalt alle taken van een bepaalde lijst op. Als
		argument wordt de naam van de lijst meegegeven. De methode query van
		de klasse SQLiteDatabase accepteert de volgende argumenten en heeft
		als terugkeerwaarde een object van de klasse <a
			href="http://developer.android.com/reference/android/database/Cursor.html"
			target="_blank">Cursor</a>
	</p>
	<pre class="code">
	Cursor cursor = db.query(tabel, kolommen, selectie, 
		selectieArgumenten, groupBy, having, orderBy);
	</pre>
	<p>Alle argumenten bestaan uit strings of string arrays. Als je een
		argument niet wilt gebruiken kun je null gebruiken.</p>
	<p>Enkele methoden van de Cursor klasse:</p>
	<ul>
		<li><b>moveToFirst()</b>: gaat naar de eerste rij in de cursor</li>
		<li><b>moveToNext()</b>: gaat naar de volgende rij</li>
		<li><b>close()</b>: sluit de cursor</li>
	</ul>
	<h3>Een enkele rij ophalen</h3>
	<p>De methode getTaak toont hoe je een enkele taak uit een tabel
		ophaalt, waarbij het id als argument wordt gebruikt. De methode werkt
		hetzelfde als meerdere rijen ophalen. Allereerst wordt de WHERE
		voorwaarde gedefinieerd. Ook hier bestaat dit uit &eacute;&eacute;n
		parameter, in dit geval de ID van de taak. Nadat de argumenten voor de
		WHERE voorwaarde (in dit geval de id die naar een String wordt
		geconverteerd) zijn gedefinieerd in de whereArgs array wordt de query
		methode aangeroepen om een cursor te verkrijgen. De moveToFirst
		methode zet de cursor op de eerste (in dit geval enige) rij van de
		resultaten te zetten. Met de hulpmethode getTaakVanCursor om de
		gegevens van de rij naar een java object (Taak) om te zetten. Tot slot
		wordt de cursor en de database connectie gesloten.</p>
	<h3>Data ophalen met een cursor</h3>
	<p>Met de cursor kan de data uit een rij van een tabel worden
		opgehaald met de methoden:</p>
	<ul>
		<li>getInt(kolomIndex)</li>
		<li>getDouble(kolomIndex)</li>
		<li>getString(kolomIndex)</li>
	</ul>
	<p>Bovenstaande methoden accepteren alleen het nummer van de kolom,
		dus niet de kolomnaam.</p>

	<h3>Gegevens in de database toevoegen, wijzigen en verwijderen</h3>
	<p>Onderstaande code laat zien hoe je een taak toevoegt, wijzigt en
		verwijdert:</p>
	<pre class="code">
    public long voegTaakToe(Taak taak) {
        ContentValues cv = this.maakContenValues(taak);
        this.openWritableDB();
        long rijId = db.insert(TAAK_TABEL, null, cv);
        this.closeDB();
        return rijId;
    }

    public int updateTaak(Taak taak) {
        ContentValues cv = this.maakContenValues(taak);
        String where = TAAK_ID + &quot;= ?&quot;;
        String[] whereArgs = { String.valueOf(taak.getTaakId()) };
        this.openWritableDB();
        int rijCount = db.update(TAAK_TABEL, cv, where, whereArgs);
        Log.d(&quot;takenlijst&quot;, &quot;rijCount = &quot; + rijCount);
        this.closeDB();
        return rijCount;
    }

    private ContentValues maakContenValues(Taak taak) {
        ContentValues cv = new ContentValues();
        cv.put(TAAK_LIJST_ID, taak.getLijstId());
        cv.put(TAAK_NAAM, taak.getNaam());
        cv.put(TAAK_NOTITIE, taak.getNotitie());
        cv.put(TAAK_AFGEROND, taak.getDatumMillisVoltooid());
        cv.put(TAAK_VERBORGEN, taak.getVerborgen());
        return cv;
    }

    public int deleteTaak(long id) {
        String where = TAAK_ID + &quot;= ?&quot;;
        String[] whereArgs = { String.valueOf(id)};
        this.openWritableDB();
        int rijCount = db.delete(TAAK_TABEL, where, whereArgs);
        this.closeDB();
        return rijCount;
    }
	</pre>
	<p>
		Om gegevens aan de database toe te voegen of te wijzigen kun je een
		object van de klasse <a
			href="http://developer.android.com/reference/android/content/ContentValues.html"
			target="_blank">ContentValues</a> gebruiken om de waardes die je naar
		de database wilt schrijven in op te slaan. Aangezien de id van een
		taak door de database zelf met het AUTO_INCREMENT attribuut wordt
		aangemaakt, hoeft dit niet te worden meegegeven.
	</p>
	<p>De gebruikte methodes van de SQLiteDatabase klasse:</p>
	<ul>
		<li>insert(tabel, kolommen, contentValues)</li>
		<li>update(tabel, contentValues, where, whereArgs)</li>
		<li>delete(tabel, where, wherArgs)
	</ul>
	<p>De gebruikte methode van de ContentValues klasse:</p>
	<ul>
		<li>put(kolomnaam, waarde)</li>
	</ul>
</div>
<%@ include file="/includes/bottom.html"%>

<%
	}
%>
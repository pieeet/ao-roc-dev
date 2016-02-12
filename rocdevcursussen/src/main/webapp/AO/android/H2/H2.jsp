<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">
	<%@ include file="/AO/android/includes/zijmenu.jsp"%>


	<div class="col-md-9">
		<h2>2 Fooi Calculator</h2>

		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je:</p>
			<ul>
				<li>een scherm kunt maken met TextViews, EditText velden en
					Buttons</li>
				<li>weet hoe en waarom je elementen een id geeft</li>
				<li>weet hoe je width, height, margin, padding en TextSize
					gebruikt</li>
				<li>weet hoe je verschillende types invoervelden (EditText)
					maakt</li>
				<li>weet hoe je views in je java klassen kunt aanroepen</li>
				<li>weet hoe je tekst uit een invoerveld kunt aanroepen</li>
				<li>weet hoe je een OnClickListener en een
					OnEditorActionListener gebruikt</li>
				<li>weet hoe je waardes kunt bewaren als je app onPause() gaat
					en weer inlaadt als hij wordt hervat</li>
			</ul>

		</div>

		<!-- inhoud -->
		<img src="/AO/android/H2/fooi_calcs.png">
		<p>In dit hoofdstuk gaan we een app maken die op basis van een
			rekeningbedrag en een fooipercentage de fooi en het totaalbedrag
			berekent. De standaard fooi is 15%. Gebruiker kan dit percentage door
			op de min- of plusknop te drukken met &eacute;&eacute;n procentpunt
			verlagen respectievelijk verhogen.</p>

		<h2>De opbouw van het scherm (activity_fooi_calculator.xml)</h2>
		<p>
			De default layout die studio aanmaakt bij een nieuw project is <em>&quot;RelativeLayout&quot;</em>.
			Deze layout positioneert de elementen op het scherm relatief ten
			opzichte van elkaar.
		</p>
		<p>Het scherm van de fooi calculator heeft 10 elementen (widgets):</p>
		<ul>
			<li>7 elementen van het type TextView</li>
			<li>1 element van het type EditText</li>
			<li>2 elementen van het type Button</li>
		</ul>

		<h3>id&#39;s</h3>
		<p>Om de elementen relatief ten opzichte van elkaar te
			positioneren moeten ze identificeerbaar zijn met een &quot;id&quot;.
			Dezelfde id&#39;s hebben we straks nodig in de Java klasse, dus is
			het zaak om ze een id te geven waaruit op te maken is welk element
			het is en wat voor type element het is. Je kunt id&#39;s zowel in de
			Design-tab als de Text-tab aanmaken.</p>
		<img src="/AO/android/H2/widgetId.jpg" width=600>

		<h3>width en height</h3>
		<p>Studio geeft aan de width en height properties van de layout
			standaard de waarde &quot;match_parent&quot;. Dit betekent dat de
			layout schermvullend is. De widgets krijgen standaard de waarde
			&quot;wrap_content&quot; Dit betekent dat de elementen precies groot
			genoeg worden om hun inhoud te bevatten. Meestal kun je dit zo laten.</p>

		<h3>margin, padding en textSize</h3>
		<p>
			Margin en padding worden uitgedrukt in <b>dp</b>
			(density-independant-pixels). TextSize in <b>sp</b>
			(scale-independant-pixels).
		<p>Afmetingen (dimensies) kunnen worden opgeslagen in het bestand
			values/dimens.xml. Reden om dimensies in aparte bestanden op te slaan
			is dat je op die manier verschillende files voor verschillende
			devices (telefoon, tablet, tv etc) kunt maken.</p>

		<h3>EditText</h3>
		<p>Met een EditText element kan gebruiker tekst invoeren. De
			grootte van het invoerveld kan worden aangegeven met de property ems
			(em is de breedte van de letter m). De property inputType bepaalt
			o.m. wat voor toetsenbord er verschijnt. Voor de fooi calculator kun
			je het best Number (Decimal) gebruiken.
		<pre class="code">
&lt;EditText
        android:id=&quot;@+id/rekeningBedragEditText&quot;
        android:layout_width=&quot;wrap_content&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:layout_alignBaseline=&quot;@+id/rekeningBedragLabel&quot;
        android:layout_marginLeft=&quot;5dp&quot;
        android:layout_toRightOf=&quot;@+id/rekeningBedragLabel&quot;
        <span class="codeplus">android:ems=&quot;8&quot;</span>
        <span class="codeplus">android:inputType=&quot;numberDecimal&quot;</span>
        android:text=&quot;@string/rekening_bedrag&quot;
        android:textSize=&quot;20sp&quot; &gt;

        &lt;requestFocus /&gt;
&lt;/EditText&gt;
</pre>


		<div class="opdrachten">
			<h2>Opdracht 2.1</h2>
			<p>Maak de User Interface van de fooi calculator app met een
				Relative Layout. Maak eerst de strings aan in strings.xml.
				Experimenteer met de elementen in de Design Tab en bekijk de
				properties in de Text tab die studio heeft aangemaakt.</p>
		</div>
		<div class="toonknopcontainer">
			<button class="toonknop" id="toon2_1" onclick="toon('uitwerking2_1')">Toon
				uitwerking</button>
		</div>
		<div class="uitwerking" id="uitwerking2_1">
			<%@ include file="uitwerking2_1.html"%>
		</div>

		<h2>De java klasse (FooiCalculatorActivity.java)</h2>
		<p>Studio heeft een java klasse aangemaakt die je kunt vinden in
			de map java/[packagenaam]. De klasse is een uitbreiding (extensie)
			van ActionBarActivity. Omdat we nog geen Action Bar gebruiken kun je
			dit veranderen in Activity.</p>
		<pre class="code">
public class FooiCalculatorActivity extends <span class="codeplus">Activity</span> {
</pre>

		<p>In de klasse hebben we de volgende elementen uit de user
			interface nodig:</p>
		<ul>
			<li>het EditText veld om gebruikersinvoer op te halen</li>
			<li>de TextView waarin het percentage wordt getoond en waarvan
				de tekst veranderd wordt als gebruiker op &eacute;&eacute;n van de
				knoppen drukt</li>
			<li>de twee knoppen (min en plus)</li>
			<li>de TextView met het fooibedrag</li>
			<li>de TextView met het totaalbedrag</li>
		</ul>
		<p>Ook hebben we het fooipercentage nodig om mee te rekenen.</p>



		<p>Declareer de variabelen:</p>
		<pre class="code">
public class FooiCalculatorActivity extends Activity {
    private EditText rekeningBedragEditText;
    private TextView procentTextView;
    private Button procentPlusButton;
    private Button procentMinButton;
    private TextView fooiTextView;
    private TextView totaalTextView;
    private double fooiPercentage = 15.0;
</pre>
		<p>
			Als een app wordt gestart wordt de methode <b>onCreate()</b>
			aangeroepen. In deze methode gaan we de verschillende views
			initialiseren. Dit doen we met de methode <a
				href="http://developer.android.com/reference/android/view/View.html#findViewById(int)"
				target="_blank">&quot;findViewById&quot;</a>. met als argument
			R.id.[naam id]. Deze methode geeft een object van het type View
			terug. Door te typecasten geef je aan om wat voor soort type View het
			gaat. De id komt overeen met de id die je in de xml file aan het
			element hebt gegeven. Merk op dat het nu handig is als de naam van je
			id &quot;betekenisvol&quot; is en het type View bevat.
		</p>

		<pre class="code">
@Override
protected void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
  setContentView(R.layout.activity_fooi_calculator);

  <span class="comment">//maak referenties naar de widgets</span>
  rekeningBedragEditText = <span class="codeplus">(EditText) findViewById(R.id.rekeningBedragEditText);</span>
  procentTextView = <span class="codeplus">(TextView) findViewById(R.id.procentTextView);</span>
  procentPlusButton = <span class="codeplus">(Button) findViewById(R.id.procentPlusButton);</span>
  procentMinButton = <span class="codeplus">(Button) findViewById(R.id.procentMinButton);</span>
  fooiTextView = <span class="codeplus">(TextView) findViewById(R.id.fooiTextView);</span>
  totaalTextView = <span class="codeplus">(TextView) findViewById(R.id.totaalTextView);</span>
}
</pre>
		<p>
			De bedoeling van de app is dat als gebruiker een bedrag invoert en
			bevestigt, het fooibedrag en totaalbedrag worden vertoond. Als
			gebruiker op &eacute;&eacute;n van de knoppen drukt, moet het
			percentage veranderen en de berekening worden aangepast. Om niet
			steeds dezelfde code te hoeven schrijven maken we een hulpmethode <b>berekenEnToon()</b>
			die we straks gaan gebruiken in de action listeners.
		</p>
		<pre class="code">
private void berekenEnToon() {

        <span class="comment">// haal rekening bedrag op</span>
        String rekeningBedragString = rekeningBedragEditText.getText().toString();
        double rekeningBedrag;
        if (rekeningBedragString.equals(&quot;&quot;)) {
            rekeningBedrag = 0.0;
        } else {
            rekeningBedrag = Double.parseDouble(rekeningBedragString);
        }

        <span class="comment">// bereken fooi en totaal</span>
        double fooiBedrag = rekeningBedrag * (fooiPercentage/100);
        double totaalBedrag = rekeningBedrag + fooiBedrag;

        <span class="comment">// toon geformatteerde bedragen</span>
        DecimalFormat df = new DecimalFormat(&quot;&euro; ###,###.00&quot;);
        <span class="codeplus">fooiTextView.setText(df.format(fooiBedrag));</span>
        <span class="codeplus">totaalTextView.setText(df.format(totaalBedrag));</span>
        <span class="codeplus">procentTextView.setText(&quot;&quot; + (int) fooiPercentage + &quot;%&quot;);</span>
}
</pre>

		<h3>De action listeners</h3>
		<p>We hebben twee typen ActionListeners nodig voor de app:</p>
		<ul>
			<li>een listener van het type <a
				href="http://developer.android.com/reference/android/widget/TextView.OnEditorActionListener.html"
				target="_blank">OnEditorActionListener</a> voor het invoerveld
			</li>
			<li>een listener van het type <a
				href="http://developer.android.com/reference/android/view/View.OnClickListener.html"
				target="_blank">OnClickListener</a> voor de knoppen
			</li>
		</ul>
		<p>Om de listeners te maken kunnen we de twee interfaces
			implementeren in onze klasse. Voeg de volgende regels toe aan je
			import statements en je klassedefinitie:</p>

		<pre class="code">
<span class="codeplus">import android.view.inputmethod.EditorInfo;</span>
<span class="codeplus">import android.view.View.OnClickListener;</span>
<span class="codeplus">import android.widget.TextView.OnEditorActionListener;</span>

public class FooiCalculatorActivity extends Activity
        <span class="codeplus">implements OnEditorActionListener, OnClickListener</span> {
</pre>

		<p>De implementatie van deze &quot;interfaces&quot; vereist dat je
			twee methoden implementeert:</p>
		<ul>
			<li>de methode <b>onEditorAction()</b> van de
				OnEditorActionListener interface
			</li>
			<li>de methode <b>onClick()</b> van de OnClickListener interface
			</li>
		</ul>
		<p>
			In deze methodes kun je de hulpmethode <b>berekenEnToon()</b>
			aanroepen om de berekening te maken en de scherm elementen aan te
			passen.
		</p>
		<p>
			In de methode <b>onEditorAction()</b> moet eerst worden bepaald wat
			de gebruiker heeft gedaan. Hiervoor kun je constanten van de klasse <a
				href="http://developer.android.com/reference/android/view/inputmethod/EditorInfo.html"
				target="_blank">EditorInfo</a> gebruiken.
		</p>
		<p>
			In de methode <b>onClick()</b> moet eerst het id van de knop worden
			opgevraagd om te bepalen wat er moet gebeuren.
		</p>
		<pre class="code">
@Override
public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
    if (actionId == EditorInfo.IME_ACTION_DONE ||
            actionId == EditorInfo.IME_ACTION_UNSPECIFIED) {
        <span class="codeplus">berekenEnToon();</span>
    }
    return false;
}

@Override
public void onClick(View v) {
    switch (v.getId()) {
        case R.id.procentMinButton:
            fooiPercentage--;
            <span class="codeplus">berekenEnToon();</span>
            break;
        case R.id.procentPlusButton:
            fooiPercentage++;
            <span class="codeplus">berekenEnToon();</span>
            break;
    }
}
</pre>
		<p>
			Nu kunnen we de listeners aan de views koppelen in de <b>onCreate()</b>
			methode. Omdat onze klasse de listener interfaces implementeert kan
			dit met het keyword <b>this</b> worden gedaan.
		</p>
		<pre class="code">
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_fooi_calculator);

    <span class="comment">//maak referenties naar de widgets</span>
    rekeningBedragEditText = (EditText) findViewById(R.id.rekeningBedragEditText);
    procentTextView = (TextView) findViewById(R.id.procentTextView);
    procentPlusButton = (Button) findViewById(R.id.procentPlusButton);
    procentMinButton = (Button) findViewById(R.id.procentMinButton);
    fooiTextView = (TextView) findViewById(R.id.fooiTextView);
    totaalTextView = (TextView) findViewById(R.id.totaalTextView);

    <span class="comment">//koppel de Listeners</span>
    <span class="codeplus">rekeningBedragEditText.setOnEditorActionListener(<b>this</b>);</span>
    <span class="codeplus">procentMinButton.setOnClickListener(<b>this</b>);</span>
    <span class="codeplus">procentPlusButton.setOnClickListener(<b>this</b>);</span>
}
</pre>

		<div class="opdrachten">
			<h2>Opdracht 2.2</h2>
			<p>Verander met bovenstaande aanwijzingen de java klasse en test
				de app.</p>
		</div>

		<div class="opdrachten">
			<h2>Opdracht 2.3</h2>
			<p>Maak een app waar gebruiker een bedrag kan invoeren.
				Afhankelijk van het bedrag wordt de korting berekend:</p>
			<ul>
				<li>bedrag &lt; 100: 0%</li>
				<li>bedrag &gt;= 100 en bedrag &lt; 200: 10%</li>
				<li>bedrag &gt;= 200: 20%</li>
			</ul>
			<p>De app toont het kortingspercentage, het kortingbedrag en het
				totaalbedrag</p>
			<h4>Voorbeeld</h4>
			<img src="/AO/android/H2/rekeningKorting2.jpg" alt="screenshot app">


		</div>

		<h2>Waardes opslaan met SharedPreferences</h2>
		<p>Als je app gestart is en de gebruiker krijgt een telefoontje,
			dan gaat hij in de pauzestand (onPause). Dit gebeurt ook als
			gebruiker de schermori&euml;ntatie verandert. Wanneer de app wordt
			hervat, wordt de methode onResume() aangeroepen.</p>
		<img src="/AO/android/H2/lifecycle.png">
		<p>
			Om te voorkomen dat steeds gegevens verloren gaan, moeten we deze
			ergens opslaan. Hiervoor gebruiken we <a
				href="http://developer.android.com/reference/android/content/SharedPreferences.html"
				target="_blank">SharedPreferences</a>.
		</p>
		<p>In onze fooi calculator willen we twee waardes bewaren als de
			app op pauze gaat: de string met het rekeningbedrag en het
			fooipercentage.</p>
		<p>Declareer een object van het type SharedPreferences en zorg er
			voor dat de waardes die je wilt bewaren globaal gedeclareerd zijn.</p>

		<pre class="code">
public class MainActivity extends Activity
        implements OnEditorActionListener, OnClickListener {
    ...
    ...

    <span class="comment">// declareer het SharedPreferences object</span>
    private SharedPreferences bewaardeWaardes;

    <span class="comment">// declareer de variabelen die moeten worden bewaard</span>
    private String rekeningBedragString = &quot;&quot;;
    private int fooiPercentageInt = 15;
    
    ...
</pre>

		<p>
			Het SharedPreferences object instantieer je in de methode <b>onCreate()</b>
			op de volgende wijze:
		</p>

		<pre class="code">
bewaardeWaardes = getSharedPreferences("BewaardeWaardes", MODE_PRIVATE);
</pre>
		<p>Het eerste argument is de naam van het bestand dat wordt
			gemaakt en het tweede argument maakt dat het bestand alleen voor de
			eigen applicatie beschikbaar is.</p>
		<p>
			We willen dat de waardes opgeslagen worden als de app onPause()
			aanroept om op de pauzestand te gaan. Dus moeten we deze methode van
			de superklasse &quot;overriden&quot;. In deze methode hebben we een <a
				href="http://developer.android.com/reference/android/content/SharedPreferences.Editor.html"
				target="_blank">Editor</a> nodig die de waardes van de variabelen
			aan het bestand kan toevoegen. let op, je kunt de meeste primitieve
			waardes bewaren, maar geen doubles!
		</p>
		<pre class="code">
@Override
public void onPause() {
    <span class="comment">// bewaar de variabelen</span>
    Editor editor = bewaardeWaardes.edit();
    editor.putString("rekeningBedragString", rekeningBedragString);
    editor.putInt("fooiPercentage", fooiPercentageInt);
    editor.commit();

    super.onPause();
}
</pre>
		<p>Als de app weer wordt hervat, wordt de methode onResume()
			aangeroepen, dus die gaan we ook overriden. Daarbij moeten de
			bewaarde gegevens worden geladen.</p>

		<pre class="code">
@Override
public void onResume() {
    super.onResume();

    <span class="comment">// ken de waardes toe aan de variabelen</span>
    rekeningBedragString = bewaardeWaardes.getString("rekeningBedragString", "");
    fooiPercentage = bewaardeWaardes.getInt("fooiPercentage", 15);

    <span class="comment">// zorg dat het bedrag in het scherm wordt vertoond</span>
    rekeningBedragEditText.setText(rekeningBedragString);

    <span class="comment">// berekenEnToon</span>
    berekenEnToon();
}
</pre>

		<div class="opdrachten">
			<h2>Opdracht 2.4</h2>
			<p>Zorg er voor dat je fooi calculator waardes opslaat als hij op
				pauze gaat en weer laadt als hij wordt hervat.</p>
		</div>

	</div>
</div>

<%@ include file="/AO/android/includes/bottom.html"%>

</html>
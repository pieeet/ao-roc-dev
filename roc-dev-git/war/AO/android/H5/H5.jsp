<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">
	<%@ include file="/AO/android/includes/zijmenu.jsp"%>


	<div class="col-md-9">
		<h2>5 Menu&#39;s en instellingen</h2>

		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je:
			<ul>
				<li>een menu kunt maken met strings en iconen</li>
				<li>menu items als <em>action-items</em> in je menubalk kunt
					tonen of kunt verbergen in het <em>options-menu</em></li>
				<li>weet hoe je het menu aanmaakt in een java activity met de
					methode <em>onCreateOptionsMenu</em>
				</li>
				<li>weet hoe je acties aam een menu item koppelt met de methode
					<em>onOptionsItemSelected</em>
				</li>
				<li>weet hoe je een <em>Toast</em> maakt
				</li>
				<li>weet hoe je een nieuwe activity start</li>
				<li>een <em>Dialog</em> activity kunt maken en starten
				</li>
				<li>weet hoe je een instellingen scherm kunt maken met de
					klasse <em>Preference</em>
				</li>
				<li>weet hoe je een <em>CheckBoxPreference</em> en een <em>ListPreference</em>
					aan het instellingenscherm toevoegt
				</li>
				<li>weet hoe je je instellingen in categorie&euml;n kunt
					groeperen</li>
				<li>weet hoe je een item in je instellingen kunt in- en
					uitschakelen</li>

			</ul>
		</div>



		<!-- Studeeraanwijzingen -->
		<div class="bs-callout bs-callout-info">
			<h2>Studeeraanwijzingen</h2>
			<p>Uitgangspunt bij dit hoofdstuk is dat je Android API 11 of
				hoger als minimum sdk hanteert. Oudere versies gebruiken andere
				methodes die hier niet worden behandeld.</p>
			<p>Maak van je fooi calculator java klasse een subklasse van
				ActionBarActivity</p>
			<pre class="code">
public class FooiCalculatorActivity <span class="codeplus">extends ActionBarActivity</span>
</pre>
			<p>Als het goed is importeert studio zelf de hiervoor benodigde
				klasse</p>
			<pre class="code">
import android.support.v7.app.ActionBarActivity;
</pre>
			<p>Je moet nu in je styles.xml een Theme.AppCompat thema
				gebruiken, bijvoorbeeld:</p>
			<pre class="code">
&lt;style name=&quot;AppTheme&quot; <span class="codeplus">parent=&quot;Theme.AppCompat.Light.DarkActionBar&quot;&gt;</span>
        <span class="comment">&lt;!-- Customize your theme here. --&gt;</span>
&lt;/style&gt;
</pre>
		</div>



		<!-- inhoud -->
		<p>We gaan in dit hoofdstuk een menu aan de fooi calculator
			toevoegen. Een menu bestaat uit menu-items die op verschillende wijze
			kunnen worden weergegeven. Ons menu bestaat uit twee items:
			instellingen en info.</p>

		<div class="opdrachten">
			<h2>Opdracht 5.1</h2>
			<h3>strings in je action bar</h3>
			<p>
				Maak in je fooi calculator een menu met twee items: instellingen en
				info.<br> Voeg in je strings.xml twee nieuwe strings voor de
				menu-items toe.
			</p>

			<pre class="code">
&lt;string name=&quot;menu_instellingen&quot;&gt;Instellingen&lt;/string&gt;
&lt;string name=&quot;menu_info&quot;&gt;Info&lt;/string&gt;
</pre>


			<p>Als het goed is heeft studio een map res/menu aangemaakt met
				daarin een xml bestand. Open dit bestand en zorg dat de inhoud er
				als onderstaand uit ziet. Wijzig de verwijzing naar de context
				(gemarkeerd) afhankelijk van de naam van je Activity klasse.</p>

			<pre class="code">
&lt;menu xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    xmlns:app=&quot;http://schemas.android.com/apk/res-auto&quot;
    xmlns:tools=&quot;http://schemas.android.com/tools&quot; tools:context=&quot;.<span
					class="codeplus">FooiCalculatorActivity</span>&quot;&gt;
    &lt;item
        android:id=&quot;@+id/menu_instellingen&quot;
        android:title=&quot;@string/menu_instellingen&quot;
        app:showAsAction=&quot;<span class="codeplus">ifRoom</span>&quot;
    /&gt;
    &lt;item
        android:id=&quot;@+id/menu_info&quot;
        android:title=&quot;@string/menu_info&quot;
        app:showAsAction=&quot;ifRoom&quot;
   /&gt;
&lt;/menu&gt;
</pre>

			<p>De twee strings worden - mits er genoeg ruimte op het scherm
				is (ifRoom) - vertoond als &quot;action-items&quot;</p>
			<img src="/AO/android/H5/menu1.jpg">
		</div>

		<div class="opdrachten">
			<h2>Opdracht 5.2</h2>
			<h3>iconen</h3>
			<p>Zorg dat de menu-strings uit de vorige opdrachten worden
				vervangen door iconen.</p>
			<p>
				Gebruik onderstaande plaatjes of zoek in je Android SDK naar
				geschikte iconen in bijvoorbeeld de map<br> <b>\&lt;locatie
					sdk&gt;\sdk\platforms\android-19\data\res\drawable-xhdpi</b><br>
				Ook kun je op het internet - bijvoorbeeld <a
					href="https://developer.android.com/design/downloads/index.html"
					target="_blank">hier</a> - veel pakketten met iconen voor
				verschillende resoluties vinden.
			</p>
			<img src="/AO/android/H5/ic_settings_new.png"
				class="ninja_img_uitleg"><img
				src="/AO/android/H5/ic_about.png" class="ninja_img_uitleg">
			<p>Kopieer de plaatjes in &eacute;&eacute;n van de
				&quot;drawable&quot; mappen&quot; van je project. Bovenstaande
				plaatjes zijn geschikt voor xhdpi. Voor deze oefening hoef je niet
				verschillende plaatjes voor verschillende resoluties te maken, maar
				als een app werkelijk &quot;in produktie&quot; gaat ga je dat
				natuurlijk wel doen.
			<p>Voeg nu de volgende regels code toe aan je menu.xml:</p>

			<pre class="code">
    &lt;item
        android:id=&quot;@+id/menu_instellingen&quot;
        android:title=&quot;@string/menu_instellingen&quot;
        <span class="codeplus">android:icon=&quot;@drawable/ic_settings_new&quot;</span>
        app:showAsAction=&quot;ifRoom&quot;
    /&gt;
    &lt;item
        android:id=&quot;@+id/menu_info&quot;
        android:title=&quot;@string/menu_info&quot;
        <span class="codeplus">android:icon=&quot;@drawable/ic_about&quot;</span>
        app:showAsAction=&quot;ifRoom&quot;
   /&gt;
</pre>
			<p>In plaats van de strings worden nu automatisch de iconen in je
				action bar weergegeven.</p>
			<img src="/AO/android/H5/menu2.jpg">

			<p>Items die weinig worden gebruikt kunnen beter worden verborgen
				in het &quot;options menu&quot;. Ook kun je aangeven dat een item
				altijd (always) moet worden getoond.</p>
			<pre class="code">
    &lt;item
        android:id=&quot;@+id/menu_instellingen&quot;
        android:title=&quot;@string/menu_instellingen&quot;
        android:icon=&quot;@drawable/ic_settings_new&quot;
        app:showAsAction=&quot;<span class="codeplus">always</span>&quot;
    /&gt;
   &lt;item
        android:id=&quot;@+id/menu_info&quot;
        android:title=&quot;@string/menu_info&quot;
        android:icon=&quot;@drawable/ic_about&quot;
        app:showAsAction=&quot;<span class="codeplus">never</span>&quot;
   /&gt;
</pre>

			<img src="/AO/android/H5/menu3.jpg">
			<p>In het options menu wordt standaard de titel-string
				weergegeven en niet het icoon.</p>
		</div>
		<h3>Een aantal attributen van een menu-item</h3>
		<table>
			<tr>
				<th>Naam</th>
				<th>Beschrijving</th>
			</tr>
			<tr>
				<th>title</th>
				<td>Specificeert de tekst van het item</td>
			</tr>
			<tr>
				<th>icon</th>
				<td>Specificeert het icoon van het item</td>
			</tr>
			<tr>
				<th>showAsAction</th>
				<td>Specificeert of een item in de Action Bar wordt vertoond</td>
			</tr>
			<tr>
				<th>orderInCategory</th>
				<td>Bepaalt de volgorde waarin de items worden getoond, het
					laagste nummer wordt eerst getoond</td>
			</tr>
		</table>
		<h3>Weergeven van het menu</h3>
		<p>In de java klasse van je activity wordt het menu aangemaakt met
			de volgende methode. Deze methode is al door studio voor je
			aangemaakt.</p>
		<pre class="code">
@Override
public boolean onCreateOptionsMenu(Menu menu) {
    <span class="comment">// Inflate the menu; this adds items to the action bar if it is present.</span>
    getMenuInflater().inflate(R.menu.menu_fooi_calculator, menu);
    return true;
}
</pre>
		<div class="opdrachten">
			<h2>Opdracht 5.3</h2>
			<p>
				Natuurlijk moet er iets gebeuren als de gebuiker &eacute;&eacute;n
				van de opties selecteert. De basis van deze methode is ook al door
				studio voor je gemaakt met de methode <b>onOptionsItemSelected(MenuItem
					item)</b>. Met de volgende code kun je een &quot;<a
					href="http://developer.android.com/reference/android/widget/Toast.html"
					target="_blank">Toast</a>&quot; maken. Dit is een pop-up view met
				een korte boodschap die gedurende korte (LENGTH_SHORT: standaard 2
				seconden) of lange tijd (LENGTH_LONG: standaard 3,5 seconden) wordt
				vertoond.
			</p>

			<pre class="code">
@Override
public boolean onOptionsItemSelected(MenuItem item) {
    <span class="comment">// bepaal welk menu-item is geselecteerd</span>
   switch (item.getItemId() ) {
       case R.id.menu_instellingen:
           Toast.makeText(this, &quot;Instellingen&quot;, Toast.LENGTH_SHORT).show();
           return true;
       case R.id.menu_info:
           Toast.makeText(this, &quot;Info&quot;, Toast.LENGTH_SHORT).show();
           return true;
       default:
           return super.onOptionsItemSelected(item);
   }
}
</pre>


		</div>
		<h3>Een nieuwe Activity starten</h3>
		<p>Als een app meerdere activities heeft worden menu&#39;s vaak
			gebruikt om tussen de schermen te navigeren.</p>

		<div class="opdrachten">
			<h2>Opdracht 5.4</h2>
			<p>Als de gebruiker in het menu op &quot;info&quot; drukt, wordt
				er een nieuwe Activity van het type &quot;Dialog&quot; gestart
				waarin informatie over de app wordt weergegeven.</p>
			<img src="/AO/android/H5/info_dialog.jpg">
			<ol>
				<li>Kies File, new..., Activity, Blank Activity en noem hem
					InfoActivity</li>
				<li>Open de aangemaakte InfoActivity klasse. Omdat het Dialog
					scherm geen ActionBar heeft kunnen alle verwijzingen ernaar worden
					weggehaald:<br> <pre class="code">
import android.app.Activity;
import android.os.Bundle;

public class InfoActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_info); 
    }
}
</pre>
				</li>

				<li>Maak de nodige strings aan in strings.xml</li>
				<li>Open in de map layout activity_info.xml. Je kunt de
					volgende code gebruiken:<br> <pre class="code">
&lt;RelativeLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    xmlns:tools=&quot;http://schemas.android.com/tools&quot;
    android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot;
    tools:context=&quot;.InfoActivity&quot; &gt;


    &lt;TextView
    	<span class="comment">//er van uitgaande dat je een label stijl hebt</span>
        style=&quot;@style/Label&quot;
        android:id=&quot;@+id/info_label&quot;
        android:text=&quot;@string/menu_info&quot;
    /&gt;

    &lt;TextView
        android:text=&quot;@string/info&quot;
        android:layout_below=&quot;@+id/info_label&quot;/&gt;

&lt;/RelativeLayout&gt;
</pre>
				</li>
				<li>Maak in je styles.xml een nieuw thema dat een Dialog thema
					erft, bijvoorbeeld:<br> <pre class="code">
&lt;style name=&quot;DialogTheme&quot; parent=&quot;Theme.AppCompat.Light.Dialog&quot; /&gt;
</pre>
				</li>
				<li>Open het AndroidManifest, je nieuwe activity is toegevoegd.
					Pas aan volgens onderstaand voorbeeld<br> <pre class="code">
&lt;activity
    android:name=&quot;com.rocdev.InfoActivity&quot;<span
							class="comment">//afhankelijk van je project</span>
    android:label=&quot;@string/menu_info&quot;
    android:theme=&quot;@style/DialogTheme&quot;&gt;
&lt;/activity&gt;
</pre>
				</li>

				<li>Ga naar de FooiCalculatorActivity klasse en zorg dat je
					nieuwe Activity wordt gestart als gebruiker op het info menu-item
					drukt. Je hebt hiervoor een <em>&quot;intent&quot;</em> nodig. Een
					<a
					href="http://developer.android.com/reference/android/content/Intent.html"
					target="_blank">intent</a> is een object dat een voorgenomen
					operatie beschrijft. In dit geval beschrijft de intent welke
					activity moeten worden gestart. Het intent object kan vervolgens
					worden gebruikt als argument in de <em>startActivity</em> methode.<br>

					<pre class="code">
@Override
public boolean onOptionsItemSelected(MenuItem item) {
    <span class="comment">// bepaal welk menu-item is geselecteerd</span>
   switch (item.getItemId() ) {
       case R.id.menu_instellingen:
           Toast.makeText(this, &quot;Instellingen&quot;, Toast.LENGTH_SHORT).show();
           return true;
       case R.id.menu_info:
           <span class="codeplus">Intent info = new Intent(getApplicationContext(), InfoActivity.class)</span>
           <span class="codeplus">startActivity(info);</span>
           return true;
       default:
           return super.onOptionsItemSelected(item);
   }
}
</pre>
			</ol>



		</div>
		<div class="opdrachten">
			<h2>Opdracht 5.5</h2>
			<p>Maak eenzelfde activity voor wanneer de gebruiker op
				&quot;Instellingen&quot; klikt.</p>
		</div>

		<h3>Instellingen</h3>
		<p>
			Voor de meeste activities gebruik je subklassen van de View klasse om
			je UI te bouwen. In deze cursus hebben we bijvoorbeeld voor het maken
			van de fooi calculator gebruik gemaakt van de TextView, EditText en
			Button klassen. Voor het maken van instellingen gebruik je subklassen
			van de klasse &quot;<a
				href="http://developer.android.com/reference/android/preference/Preference.html"
				target="_blank">Preference</a>&quot; om je scherm te maken.
		</p>

		<div class="opdrachten">
			<h2>Opdracht 5.6</h2>
			<p>Maak voor de fooi calculator een instellingen scherm waar
				gebruiker de volgende zaken kan instellen:</p>
			<ul>
				<li>of het fooipercentage moet worden onthouden of niet</li>
				<li>welk type afronding default moet worden gebruikt</li>
			</ul>
			<h4>Voorbeeld uitwerking</h4>
			<img src="/AO/android/H5/settings1.jpg"><img
				src="/AO/android/H5/settings2.jpg">

			<ol>
				<li>Maak in de map res een resource-directory genaamd xml. In
					deze directory maak je een XML resource file genaamd
					preferences.xml. Open het bestand en voeg de volgende code toe.
					Uiteraard moet je ook de strings aanmaken.<br> <pre
						class="code">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
<span class="codeplus">&lt;PreferenceScreen</span> xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;&gt;

	<span class="codeplus">&lt;CheckBoxPreference</span>
		android:key=&quot;pref_bewaar_percentage&quot;
		android:title=&quot;@string/bewaar_percentage_titel&quot;
		android:summary=&quot;@string/bewaar_fooi_percentage_beschrijving&quot;
		android:defaultValue=&quot;true&quot; /&gt;

	
	<span class="codeplus">&lt;ListPreference</span>
		android:key=&quot;pref_afronding&quot;
		android:title=&quot;@string/afronding_titel&quot;
		android:summary=&quot;@string/afronding_beschrijving&quot;
		android:dialogTitle=&quot;@string/afronding_titel&quot;
		android:entries=&quot;<span class="codeplus">@array/afronding_opties</span>&quot;
		android:entryValues=&quot;<span class="codeplus">@array/afronding_waardes</span>&quot;
		android:defaultValue=&quot;0&quot; /&gt;

&lt;/PreferenceScreen&gt;
</pre> <br>
					<h4>Uitleg</h4>
					<p>Het root-element van het preference screen is het
						PreferenceScreen element. Binnen dit element kunnen zich
						&eacute;&eacute;n of meer preferences bevinden.</p>
					<p>
						De CheckBoxPreference is het eerste item uit het voorbeeld.
						Preferences werken met een <em>key</em> attribuut om ze te
						identificeren (vergelijkbaar met id). Iedere preference heeft een
						<em>key</em> - <em>value</em> combinatie die wordt opgeslagen in
						een SharedPreferences bestand (zie H2). Een CheckBoxPreference
						waarde is van het type boolean (true of false).
					</p>
					<p>Het ListPreference element is het tweede item. Als gebruiker
						hierop drukt, verschijnt er een dialoog venster met een lijst met
						opties. Om deze lijst te maken moet je twee arrays in je
						strings.xml file maken. E&eacute;n voor de opties die in het
						scherm worden getoond en &eacute;&eacute;n voor de waardes van de
						opties. Als gebruiker een optie heeft gekozen, dan wordt de waarde
						van die optie samen met de key opgeslagen in het automatisch
						aangemaakte SharedPreferences bestand.</p>
				</li>
				<li>Maak de arrays in strings.xml<br> <pre class="code">
&lt;string-array name=&quot;afronding_opties&quot;&gt;
    &lt;item&gt;Geen&lt;/item&gt;
    &lt;item&gt;Fooi&lt;/item&gt;
    &lt;item&gt;Totaal&lt;/item&gt;
&lt;/string-array&gt;
&lt;string-array name=&quot;afronding_waardes&quot;&gt;
    &lt;item&gt;0&lt;/item&gt;
    &lt;item&gt;1&lt;/item&gt;
    &lt;item&gt;2&lt;/item&gt;
&lt;/string-array&gt;
</pre>
				</li>


				<li>Maak een &quot;Fragment&quot; klasse. Kijk <a
					href="http://developer.android.com/guide/topics/ui/settings.html#Fragment"
					target="_blank">hier</a> voor nadere uitleg. Fragments worden
					uitgebreid in het volgende hoofdstuk behandeld.<br> <pre
						class="code">
public class InstellingenFragment extends <span class="codeplus">PreferenceFragment</span> {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.preferences);
    }
}
</pre>
				</li>
				<li>Maak een settings Activity klasse die het zojuist gemaakte
					Fragment gebruikt.<br> <pre class="code">
public class InstellingenActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        <span class="comment">//toon fragment</span>
        getFragmentManager().beginTransaction()
                .replace(android.R.id.content, <span class="codeplus">new InstellingenFragment()</span>).commit();
    }
}
</pre>
				</li>
				<li>Nu moet je de preferences in je fooicalculator java klasse
					laden. In hoofdstuk 2 heb je al een SharedPreferences object
					gebruikt om waardes op te slaan. Ditzelfde object kunnen we hier
					gebruiken, alleen moet hij op een iets andere manier
					ge&iuml;nstantieerd worden, zodat ook de waardes uit de
					instellingen gebruikt kunnen worden. Ook hebben we een nieuw
					attribuut nodig van het type boolean om te bepalen of het
					fooipercentage bewaard moet worden of niet.<br> <pre
						class="code">
<span class="comment">//declaratie attributen</span>
private SharedPreferences prefs;
private boolean <span class="codeplus">bewaarFooiProcent = true;</span>

<span class="comment">//set de default waardes in preference bestand in methode onCreate</span>
<span class="codeplus">PreferenceManager.setDefaultValues(this, R.xml.preferences, false)</span>;

<span class="comment">//maak het SharedPreferences object in methode onCreate</span>
<span class="codeplus">prefs = PreferenceManager.getDefaultSharedPreferences(this)</span>;
 
</pre>
				</li>
				<li>Gebruik de &quot;bewaar percentage&quot; preference en de
					afronding preferences in de onResume methode<br> <pre
						class="code">
@Override
public void onResume() {
    super.onResume();
    <span class="codeplus">bewaarFooiProcent = prefs.getBoolean(&quot;pref_bewaar_percentage&quot;, true);</span>
    if (bewaarFooiProcent) {
        fooiPercentageInt = prefs.getInt(&quot;fooiPercentageInt&quot;, 15);
    } else {
        fooiPercentageInt = 15;
    }
    <span class="codeplus">afronding = Integer.parseInt(prefs.getString(&quot;pref_afronding&quot;, &quot;0&quot;));</span>
    rekeningBedragString = prefs.getString(&quot;rekeningBedragString&quot;, &quot;&quot;);
    rekeningBedragEditText.setText(rekeningBedragString);
    fooiTextView.setText(&quot;&quot; + fooiPercentageInt + &quot;%&quot;);
    fooiPercentage = (double) fooiPercentageInt;
    berekenEnToon();
}
</pre>
				</li>
				<li>Tot slot moet de instellingen-activity gestart worden als
					gebruiker instellingen selecteert:<br> <pre class="code">
public boolean onOptionsItemSelected(MenuItem item) {
    <span class="comment">// bepaal welk menu-item is geselecteerd</span>
   switch (item.getItemId() ) {
       case R.id.menu_instellingen:
           <span class="codeplus">Intent instellingen = new Intent(getApplicationContext(), InstellingenActivity.class);</span>
           <span class="codeplus">startActivity(instellingen);</span>
           return true;
       case R.id.menu_info:
           startActivity(new Intent(getApplicationContext(), InfoActivity.class));
           return true;
       default:
           return super.onOptionsItemSelected(item);
   }
}
</pre> ...en moet de juiste afronding RadioButton gechecked worden in de
					methode berekenEnToon.<br> <pre class="code">
if (afronding == AFROND_FOOI) {
    fooiBedrag = Math.round(fooiBedrag);
    <span class="codeplus">afrondFooiRadioButton.setChecked(true);</span>
}
double totaalBedrag = rekeningBedrag + fooiBedrag;
if (afronding == AFROND_TOTAAL) {
    totaalBedrag = Math.round(totaalBedrag);
    <span class="comment">//pas fooi aan aan de afronding</span>
    fooiBedrag = totaalBedrag - rekeningBedrag;
    <span class="codeplus">afrondTotaalRadioButton.setChecked(true);</span>
}
if (afronding == AFROND_GEEN) {
    <span class="codeplus">afrondGeenRadioButton.setChecked(true);</span>
}
</pre>

				</li>
			</ol>

		</div>
		<h3>Meer instellingen</h3>
		<p>Je weet nu hoe je met instellingen kunt werken. We gaan deze
			vaardigheden uitbreiden voor het geval je apps gaat maken die meer
			instellingen hebben of waarvoor wat ingewikkelder vereisten gelden.</p>
		<h4>Instellingen groeperen</h4>
		<p>Als je veel instellingen hebt is het overzichtelijker om ze te
			groeperen in categorie&euml;n:</p>

		<div class="opdrachten">
			<h2>Opdracht 5.7</h2>
			<p>Maak nog een list-preference waarmee gebruiker de default fooi
				kan instellen op respectievelijk 10%, 15% of 20%. Maak vervolgens
				twee categorie&euml;n: Fooi percentage en Afronden. Zie voorbeeld.</p>
			<img src="/AO/android/H5/settings3.jpg">
			<ol>
				<li>Zet volgens onderstaand voorbeeld categorie&euml;n om je
					preferences:<br> <pre class="code">
&lt;PreferenceCategory
    android:title=&quot;@string/bewaar_fooi_percentage_titel&quot;
    android:key=&quot;pref_procent_categorie&quot;&gt;

    &lt;CheckBoxPreference
        android:key=&quot;pref_bewaar_percentage&quot;
        android:title=&quot;@string/pref_bewaar_fooi_percentage&quot;
        android:summary=&quot;@string/bewaar_fooi_percentage_beschrijving&quot;
        android:defaultValue=&quot;true&quot; /&gt;

    &lt;ListPreference
        android:key=&quot;pref_default_fooi&quot;
        android:title=&quot;@string/pref_default_fooi_percentage&quot;
        android:summary=&quot;@string/default_fooi_percentage_beschrijving&quot;
        android:entries=&quot;@array/default_fooi_opties&quot;
        android:entryValues=&quot;@array/default_fooi_waardes&quot;&gt;
    &lt;/ListPreference&gt;

&lt;/PreferenceCategory&gt;

</pre>
				</li>
				<li>Verander je java code. Als gebruiker er voor gekozen heeft
					om het fooipercentage <em>niet</em> te onthouden, moet het gekozen
					default fooipercentage worden gebruikt (in de methode <em>onResume</em>).
				</li>
			</ol>
			<h3>Preferences in- en uitschakelen</h3>
			<p>Het standaard fooi-percentage is alleen relevant als het
				fooi-percentage niet wordt onthouden. We kunnen er voor zorgen dat
				het alleen wordt ingeschakeld als de CheckBox is aangevinkt. Om dit
				mogelijk te maken moeten we de instellingen enigszins aanpassen. In
				plaats van bewaren kan gebruiker er nu voor kiezen om het percentage
				te vergeten. Wel zo logisch.</p>
			<img src="/AO/android/H5/settings4.jpg" width=300>

			<div class="opdrachten">
				<h2>Opdracht 5.8</h2>
				<p>Verander de code van het preferences bestand zodat de
					gebruiker aan kan vinken dat het fooipercentage moet worden
					vergeten in plaats van onthouden. Dit heeft enige gevolgen voor je
					java code! Zorg ervoor dat de standaard fooi lijst alleen
					geselecteerd kan worden als de bovenliggende checkbox is aangevinkt
					volgens bovenstaande afbeelding.</p>
				<pre class="code">
&lt;CheckBoxPreference
    android:key=&quot;<span class="codeplus">pref_bewaar_percentage&quot;</span>
    android:title=&quot;@string/pref_bewaar_fooi_percentage&quot;
    android:summary=&quot;@string/bewaar_fooi_percentage_beschrijving&quot;
    android:defaultValue=&quot;false&quot; /&gt;

&lt;ListPreference
    android:key=&quot;pref_default_fooi&quot;
    <span class="codeplus">android:dependency=&quot;pref_bewaar_percentage&quot;</span>
    android:title=&quot;@string/pref_default_fooi_percentage&quot;
    android:summary=&quot;@string/default_fooi_percentage_beschrijving&quot;
    android:entries=&quot;@array/default_fooi_opties&quot;
    android:entryValues=&quot;@array/default_fooi_waardes&quot;&gt;
&lt;/ListPreference&gt;
</pre>

			</div>
			<h3>Met Java preferences veranderen</h3>
			<p>Het kan voorkomen dat je een item juist wilt activeren als een
				checkbox niet aangevinkt is en wilt de-activeren als het wel is
				aangevinkt. Hiervoor heb je java nodig die de het standaard gedrag
				overruled.</p>
			<img src="/AO/android/H5/settings5.jpg"><img
				src="/AO/android/H5/settings6.jpg">



			<pre class="code">
import android.content.SharedPreferences;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;

public class InstellingenFragment extends PreferenceFragment
        <span class="codeplus">implements OnSharedPreferenceChangeListener {</span>
    private SharedPreferences prefs;
    private boolean onthoudProcent;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.preferences);
        prefs = PreferenceManager.getDefaultSharedPreferences(getActivity());
    }

    @Override
    public void onResume() {
        super.onResume();
        onthoudProcent = prefs.getBoolean(&quot;pref_bewaar_percentage&quot;, true);
        this.setDefaultProcentPreference(onthoudProcent);
        <span class="codeplus">prefs.registerOnSharedPreferenceChangeListener(this);</span>
    }

    private void setDefaultProcentPreference(boolean onthoudProcent) {
        <span class="codeplus">Preference defaultProcent = findPreference(&quot;pref_default_fooi&quot;);</span>
        <span class="codeplus">if (onthoudProcent)  {</span>
            <span class="codeplus">defaultProcent.setEnabled(false);</span>
        <span class="codeplus">} else {</span>
            <span class="codeplus">defaultProcent.setEnabled(true);</span>
        }
    }

    @Override
    public void onPause() {
        prefs.unregisterOnSharedPreferenceChangeListener(this);
        super.onPause();
    }

    @Override
    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {
        if (key.equals(&quot;pref_bewaar_percentage&quot;)) {
            onthoudProcent = prefs.getBoolean(key, true);
        }
        this.setDefaultProcentPreference(onthoudProcent);
    }
}

</pre>

			<h4>Uitleg</h4>
			<p>volgt nog....</p>

		</div>
	</div>
</div>
<%@ include file="/AO/android/includes/bottom.html"%>
</html>
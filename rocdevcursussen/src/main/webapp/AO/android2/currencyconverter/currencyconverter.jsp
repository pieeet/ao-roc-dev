<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 24-04-16
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android2/includes/zijmenu.jsp" %>

    <div class="col-md-9">


        <h2>5 Currency Converter</h2>
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het maken van deze app wordt van je verwacht dat
                je:</p>
            <ul>
                <li>een Spinner kunt maken</li>
                <li>een ListView kunt maken</li>
                <li>met behulp van ArrayAdapters de items van een Spinner en een ListView kunt vullen
                </li>
                <li>een listener aan de items van een Spinner kunt koppelen met behulp van de methode
                    setOnItemSelectedListener
                </li>
                <li>weet hoe de structuur van een json object er uitziet</li>
                <li>data van een eenvoudige json api kunt binnenhalen</li>
                <li>een achtergrond thread start met de AsyncTask klasse</li>
                <li>weet hoe je een app meertalig maakt met behulp van de strings.xml bestanden</li>

            </ul>
        </div>

        <div class="opdrachten">

            <h2>Opdracht</h2>
            <p>Bekijk onderstaand filmpje en maak de app.</p>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/M1LjBE7E634"
                        allowfullscreen></iframe>
            </div>
            <h2>Gebruikte methodes/klassen</h2>

            <h3>Een Spinner</h3>
            <p>Met een <a href="http://developer.android.com/guide/topics/ui/controls/spinner.html" target="_blank">spinner</a>
                kan gebruiker een keuze maken uit een aantal dropdown items. De items van een spinner worden aangemaakt
                met een ArrayAdapter. Hiervoor heb je een string-array of een ArrayList met strings nodig waar de item
                strings
                in zitten. In onderstaand codefragment wordt een ArrayAdapter gemaakt met behulp van de volgende
                paramaters:</p>

            <ol>
                <li>de context (this)</li>
                <li>een standaard layout uit de Android resources</li>
                <li>een ArrayList genaamd currencies met daarin de Strings van de valuta</li>
            </ol>


<pre class="code">
Spinner spinner = (Spinner) findViewById(R.id.spinner);
ArrayAdapter&lt;String&gt; adapter = new ArrayAdapter&lt;&gt;(
        <span class="codeplus">this</span>,
        <span class="codeplus">android.R.layout.simple_spinner_item</span>,
        <span class="codeplus">currencies</span>);
adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
spinner.<span class="codeplus">setAdapter(adapter)</span>;
</pre>

            <h4>Een listener aan een spinner koppelen</h4>
            <p>De bedoeling van een spinner is dat de gebruiker een item kan selecteren. Hiervoor moet je de methode
                setOnItemSelectedListener op het spinnerobject aanroepen:</p>

<pre class="code">
spinner.<span class="codeplus">setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()</span> {
    @Override
    public void onItemSelected(AdapterView<?> parent, View view, <span class="codeplus">int position</span>, long id) {
        <span class="comment">//TODO zorg dat juiste currency wordt gekozen mbv position param</span>
    }

    @Override
    public void onNothingSelected(AdapterView<?> parent) {

    }
});
</pre>
            <p>In de methode onItemSelected kun je de paramater position gebruiken om te bepalen op welk item is
                geklikt.</p>
            <h3>Een ListView</h3>
            <p>Een <a href="http://developer.android.com/guide/topics/ui/layout/listview.html"
                      target="_blank">ListView</a>
                is een <a href="http://developer.android.com/reference/android/view/ViewGroup.html" target="_blank">ViewGroup</a>
                met items waar je doorheen kan scrollen. De items worden net als bij een spinner
                gemaakt met een
                <a href="http://developer.android.com/reference/android/widget/Adapter.html" target="_blank">Adapter</a>.
            </p>
            <p>In onderstaand filmpje
                uit de cursus <a href="https://www.udacity.com/course/developing-android-apps--ud853" target="_blank">developing
                    Android Apps</a> van Udacity wordt uitgelegd waarom een adapter wordt gebruik en waarom dit effici&euml;nter
                is
                dan bijvoorbeeld een LinearLayout in een ScrollView plaatsen, wat hetzelfde effect zou hebben.</p>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/-VPM6ICgCk8" frameborder="0"
                        allowfullscreen></iframe>
            </div>

            <p>Onderstaand codefragment toont hoe je met behulp van een ArrayList met Strings een adapter maakt en
                aan een ListView koppelt. De parameters zijn, afgezien van de gebruikte layout hetzelfde als bij de
                spinner.</p>

<pre class="code">
ArrayList&lt;String&gt; <span class="codeplus">listItems</span> = new ArrayList&lt;&gt;();
<span class="comment">//TODO vul list met items</span>
ArrayAdapter&lt;String&gt; listViewAdapter = new ArrayAdapter&lt;String&gt;(
            <span class="codeplus">this</span>,
            <span class="codeplus">android.R.layout.simple_list_item_1</span>,
            <span class="codeplus">listItems</span>);
listView.<span class="codeplus">setAdapter(listViewAdapter)</span>;
</pre>

            <h3>JSON objecten</h3>
            <p>De currency converter maakt gebruik van de json api van <a href="http://fixer.io/" target="_blank">fixer.io</a>.
                Je kunt bijvoorbeeld een get-request naar de volgende url sturen om de beschikbare wisselkoersen afgezet
                tegen de Amerikaanse Dollar op te halen:</p>
<pre class="code">
http://api.fixer.io/latest<span class="codeplus">?base=USD</span>
</pre>
            <p>Het resultaat is een String met de structuur van een JSON object</p>
<pre class="code">
<span class="codeplus">{</span>
   &quot;base&quot;:&quot;USD&quot;,
   &quot;date&quot;:&quot;2016-04-22&quot;,
   &quot;rates&quot;:<span class="codeplus">{</span>
      &quot;AUD&quot;:1.2936,
      &quot;BGN&quot;:1.7365,
      &quot;BRL&quot;:3.5708,
      &quot;CAD&quot;:1.2734,
      &quot;CHF&quot;:0.97585,
      ...
      ...
   <span class="codeplus">}</span>
<span class="codeplus">}</span>
</pre>
            <p>Een JSON object begint en eindigt met een accolade. Daartussen zie je zogenaamde key-value pairs. De key
                is een string waarmee de value kan worden opgehaald. De eerste twee (&quot;base&quot; en
                &quot;date&quot;) in bovenstaand
                resultaat zijn gewone key-value pairs waarbij de values strings zijn. De derde (&quot;rates&quot;) is
                ook een key-value pair, alleen is
                de value
                ervan op zijn beurt weer een JSON object met zijn eigen key-value pairs. Op deze manier kunnen JSON
                objecten
                in JSON objecten worden <em>genest.</em></p>

            <p>Het JSON object wordt binnengehaald als een string. Hiermee kun je eenvoudig een object van de
                <a href="http://developer.android.com/reference/org/json/JSONObject.html" target="_blank">JSONObject</a>
                klasse maken met behulp van &eacute;&eacute;n van zijn constructors:
            </p>
<pre class="code">
JSONObject jsonObject = null;
try {
    jsonObject = new JSONObject(<span class="codeplus">jsonString</span> );
} catch (JSONException e) {
    e.printStackTrace();
}
</pre>

            <p>We kunnen nu verschillende values opvragen met behulp van hun keys.</p>
<pre class="code">
String date = jsonObject.<span class="codeplus">getString(&quot;date&quot;)</span>;
JSONObject rates = jsonObject.<span class="codeplus">getJSONObject(&quot;rates&quot;)</span>;
Double usd = rates.<span class="codeplus">getDouble(&quot;USD&quot;)</span>;
</pre>

            <h3>De AsyncTask klasse</h3>
            <h4>De werking van threads</h4>
            <p>Standaard werkt een Android app met &eacute;&eacute;n thread:
                de &quot;UI thread&quot;. Deze thread toont de user interface die
                wacht op (luistert naar) events die plaatsvinden als gebruiker iets
                doet. De user interface hoort altijd te reageren op een handeling. Je
                wilt dus niet dat de app bevriest tot een bepaalde taak is
                uitgevoerd. Tijdrovende taken zoals het ophalen en verwerken van data
                moeten in een aparte thread worden afgehandeld.</p>
            <img src="/AO/android2/currencyconverter/thread.png">

            <h4>Asynchrone taken starten</h4>
            <p>
                Een asynchrone taak (asynchronous task) is een taak die in een aparte
                thread op de achtergrond draait. Omdat Android apps dit soort taken
                vaak gebruiken heeft het Android framework hiervoor een speciale
                klasse: <a
                    href="http://developer.android.com/reference/android/os/AsyncTask.html"
                    target="_blank">AsyncTask</a> die het makkelijk maakt om dit soort
                taken uit te voeren. De klasse heeft een aantal methoden die je kunt
                gebruiken:
            </p>
            <ol>
                <li><a
                        href="http://developer.android.com/reference/android/os/AsyncTask.html#onPreExecute()"
                        target="_blank">onPreExecute()</a>: deze methode kan iets doen voor
                    de thread wordt gestart.
                </li>
                <li><a
                        href="http://developer.android.com/reference/android/os/AsyncTask.html#execute(Params...)"
                        target="_blank"> execute(Params... params)</a> deze methode start de
                    thread
                </li>
                <li><a
                        href="http://developer.android.com/reference/android/os/AsyncTask.html#doInBackground(Params...)"
                        target="_blank"> doInBackground(Params... params)</a>: deze methode
                    bevat de code die op de achtergrond wordt uitgevoerd. De return-waarde wordt aan de methode
                    onPostExecute meegegeven
                </li>
                <li><a
                        href="http://developer.android.com/reference/android/os/AsyncTask.html#publishProgress(Progress...)"
                        target="_blank"> publishProgress(Progress... values)</a>: publiceert
                    de voortgang vanuit de achtergrondtaak. Deze methode zorgt er voor
                    dat de volgende methode wordt gestart in de UI thread
                </li>
                <li><a
                        href="http://developer.android.com/reference/android/os/AsyncTask.html#onProgressUpdate(Progress...)"
                        target="_blank"> onProgressUpdate(Progress... values)</a>: hiermee
                    kun je bijvoorbeeld een voortgangsindicator in de UI maken.
                <li><a
                        href="http://developer.android.com/reference/android/os/AsyncTask.html#onPostExecute(Result)"
                        target="_blank"> onPostExecute (Result result)</a>: deze methode
                    doet iets nadat doInBackground() is ge&euml;indigd. De result parameter
                    is de return-waarde van doInBackground()
            </ol>
            <img src="/AO/android2/currencyconverter/AsyncTask.png">

            <p>De methoden van AsyncTask kennen drie soorten parameters:</p>
            <ol>
                <li>params: dit zijn de parameters die worden meegegeven aan de
                    methode execute(Params... params) en die door de methode
                    doInBackground(Params... params) kunnen worden gebruikt. De parameter <em>params</em> is altijd een
                    array van objecten, ook al wordt er maar &eacute;&eacute;n object meegegeven.
                </li>
                <li>values: dit zijn de parameters die worden meegegeven aan de
                    methode publishProgress(Progress... values) en die door de methode
                    onProgressUpdate(Progress... values) kunnen worden gebruikt. De parameter <em>values</em> is
                    ook hier een array van objecten.
                </li>
                <li>result: de waarde die de methode doInBackground teruggeeft
                    en die door de methode onPostExecute(Result result) kan worden
                    gebruikt.
                </li>
            </ol>
            <p>Om AsyncClass te gebruiken moet je er een binnenklasse van maken.
                Daarbij moet je aangeven uit wat voor type objecten de bovengenoemde
                parameters bestaan. Onderstaande code laat zien hoe een AsyncTask binnenklasse
                er uitziet, waarbij alleen de (verplichte) methode doInBackground en de methode onPostExecute zijn
                gebruikt.:</p>
<pre class="code">
class DownloadTaak <span class="codeplus">extends AsyncTask&lt;String, Void, String&gt;</span> {
    @Override
    protected String doInBackground(<span class="codeplus">String... params</span> ) {
        String url = <span class="codeplus">params[0]</span>;
        String result = &quot;&quot;;
        <span class="comment">//TODO  definieer IO taak</span>
        return <span class="codeplus">result</span>;
    }
    @Override
    protected void onPostExecute(String <span class="codeplus">result</span>) {
        <span class="comment">//TODO  ververs UI</span>
    }
}

<span class="comment">//start de thread bijvoorbeeld in de onCreate methode</span>
@Override
protected void onCreate(Bundle savedInstanceState) {
    ...
    ...
    String url = BASE_URL + &quot;USD&quot;;
    new DownloadTaak.<span class="codeplus">execute(url)</span>;
}
</pre>


            <h3>Meertalige apps maken</h3>
            <p>In Android sla je strings op in een strings.xml resource bestand in de map values. Dit wordt vooral
                gedaan om je app geschikt te maken voor meerdere talen. Je kunt namelijk meerdere strings.xml bestanden
                maken
                en bij het maken ervan aangeven voor welke taal het bestand bedoeld is met de qualifier <em>locale</em>.
                Je hoeft dan alleen de string waardes
                te veranderen. De taal van je app wordt dan aangepast aan de ingestelde taal van de gebruiker.</p>
            <img src="/AO/android2/currencyconverter/strings_dutch.png" alt="strings.xml nederlands">


        </div>
    </div>
</div>

<%@ include file="/AO/android2/includes/bottom.html" %>
<script>
    $(document).ready(function() {
        $("li#currencyconverter").addClass("selected");
    })
</script>
</html>
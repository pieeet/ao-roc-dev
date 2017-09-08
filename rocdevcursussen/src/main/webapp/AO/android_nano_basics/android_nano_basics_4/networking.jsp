<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 11-12-16
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android_nano_basics/includes/zijmenu.jsp" %>

    <div class="col-md-9">

        <h2>
            <a href="https://www.udacity.com/course/android-basics-nanodegree-by-google--nd803"
               target="_blank">Android for beginners Nanodegree</a></h2>
        <h3>Android Basics: <a
                href="https://www.udacity.com/course/android-basics-networking--ud843"
                target="_blank">Networking</a></h3>
        <p>Benodigde tijd: ca 40 uur</p>

        <div class="bs-callout bs-callout-warning">
            <h3>Leerdoelen</h3>
            <p>Na het voltooien van deze cursus kun je:</p>
            <ul>
                <li>data van een <strong>API</strong> gebruiken</li>
                <li><strong>JSON</strong> data gebruiken</li>
                <li>in Java <strong>JSON Objecten</strong> en <strong>JSON Arrays</strong> maken</li>
                <li>een <strong>Date</strong> object maken met behulp van de <strong>Unix</strong> tijd in
                    milliseconden
                </li>
                <li>Datum en tijd strings maken met de klasse <strong>SimpleDateFormat</strong></li>
                <li>op verschillende manieren een <strong>substring</strong> uit een string halen</li>
                <li><strong>permissions</strong> in het <strong>Android Manifest</strong> van de app declareren</li>
                <li>verbinding met een web server tot stand brengen met een <strong>HttpURLConnection</strong></li>
                <li>binnekomende data-streams kunt uitlezen met een <strong>InputStreamReader</strong> en een
                    <strong>BufferedReader</strong></li>
                <li><strong>Exceptionsafvangen (catch)</strong> met een
                    <strong>try/catch/finally block</strong></li>
                <li>taken in een achtergrond <strong>thread</strong> uitvoeren met de <strong>AsyncTask</strong> en
                    de AsyncTaskLoader klassen
                </li>
                <li>een <strong>Empty State View</strong> gebruiken</li>
                <li>checken of het apparaat verbonden is met een netwerk met de
                    <strong>ConnectivityManager</strong> klasse
                </li>
                <li><strong>menu-items</strong> aan het <strong>options-menu</strong> toevoegen</li>
                <li>een <strong>PreferenceFragment</strong> in een SettingsActivity maken</li>
                <li>kleine hoeveelheden data opslaan in <strong>SharedPreferences</strong></li>
                <li>een <strong>Uri.Builder</strong> gebruiken om een URL met <strong>query parameters</strong> te
                    bouwen
                </li>

            </ul>

        </div>


        <div class="opdrachten">
            <h2>Project 1 Book Listing App</h2>
            <p>The goal is to design and create the structure of a Book Listing app which would allow a user
                to get a list of published books on a given topic. You will be using the google books api in
                order to fetch results and display them to the user.
                Voor meer info zie
                <a href="https://classroom.udacity.com/courses/ud843/lessons/c013e654-996a-41f6-92ee-5a303e74e8f7/concepts/ace02bc1-ca18-4a41-8416-3fb8019a5f84"
                   target="_blank">Project Overview</a>.</p>
        </div>
        <div class="opdrachten">
            <h2>Project 2 News App</h2>
            <p>The goal is to create a News feed app which gives a user regularly-updated news from the internet
                related to a particular topic, person, or location. The presentation of the information as well as the
                topic is up to you.
                Voor meer info zie
                <a href="https://classroom.udacity.com/courses/ud843/lessons/6752095343239847/concepts/78222105900923"
                   target="_blank">Project Overview</a>.</p>
            <p>Voorbeeld <a
                    href="https://play.google.com/store/apps/details?id=com.rocdev.guardianreader">roc-dev</a></p>
        </div>

        <h3>JSON objecten</h3>
        <p>Als je het volgende &quot;get-request&quot; vanuit een browser verstuurt ktijg je een String met een JSON
            object terug met diverse wisselkoersen afgezet tegen de Amerikaanse Dollar. Om het resultaat beter leesbaar
            te maken kun je een <a href="http://jsonparseronline.com/" target="_blank">online JSON parser</a>
            gebruiken:</p>
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
    jsonObject = new JSONObject(<span class="codeplus">jsonString</span>);
} catch (JSONException e) {
    e.printStackTrace();
}
</pre>

        <p>We kunnen nu de verschillende values opvragen met behulp van hun keys.</p>
        <pre class="code">
String date = jsonObject.<span class="codeplus">getString</span>(<span class="codeplus">&quot;date&quot;</span>);
JSONObject rates = jsonObject.<span class="codeplus">getJSONObject</span>(<span
                class="codeplus">&quot;rates&quot;</span>);
Double australianDollar = rates.<span class="codeplus">getDouble</span>(<span class="codeplus">&quot;AUD&quot;</span>);
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
    String url = http://api.fixer.io/latest?base=USD;
    new DownloadTaak.<span class="codeplus">execute(url)</span>;
}
</pre>

        <h3>Een AsyncTaskLoader gebruiken</h3>
        <p>Als data vanuit een achtergrond thread in een User Interface moet worden getoond kun je beter een
            Loader gebruiken. Zorg dat de
            Activity waarin de data moet worden geladen de Interface LoaderManager.LoaderCallbacks&lt;D&gt;
            implementeert, waarbij de D staat voor de data die wordt gebruikt. In de Earthquake app van de Udacity
            cursus was D een List met Earthquakes. Zie codefragment.</p>

        <pre class="code">
public class EarthquakeActivity extends AppCompatActivity
        implements LoaderManager.<span class="codeplus">LoaderCallbacks&lt;List&lt;Earthquake&gt;&gt;</span>  {
        </pre>

        <p>Je moet nu drie methoden implementeren:</p>
        <ul>
            <li>onCreateLoader: deze methode instantieert een custom Loader (die je zelf moet maken) en geeft hem
                door aan:
            </li>
            <li>onLoadFinished</li>
            <li>onLoaderReset</li>
        </ul>
        <p>De custom loader maak je door een subklasse van AsyncTaskLoader&lt;D&gt; te maken.</p>
        <pre class="code">
public class EarthquakeLoader extends <span class="codeplus">AsyncTaskLoader&lt;List&lt;Earthquake&gt;&gt;</span> {

    private String <span class="codeplus">mUrl</span>;

    <span class="comment">/**
     * Constructor
     * @param context de Activity
     * @param url de earthquake api url waarvan data wordt opgehaald
     */</span>
    public EarthquakeLoader(Context context, String url) {
        super(context);
        <span class="codeplus">mUrl</span> = url;
    }

    <span class="comment">
    /**
     * De background taak
     * @return lijst met Earthquakes
     */</span>
    @Override
    public List&lt;Earthquake&gt; loadInBackground() {
        return QueryUtils.extractEarthquakes(<span class="codeplus">mUrl</span>);
    }

    @Override
    protected void onStartLoading() {
        forceLoad();
    }
}
        </pre>

        <p>In de onCreateLoader methode kun je nu een object van je custom loader maken. Als de data is geladen, wordt
            de methode onLoadFinished aangeroepen.</p>

        <pre class="code">
    @Override
    public Loader&lt;List&lt;Earthquake&gt;&gt; onCreateLoader(int id, Bundle args) {
        <span class="comment">//TODO bouw een uri</span>
        return new <span class="codeplus">EarthquakeLoader(this, uri.toString())</span>;
    }

    @Override
        public void onLoadFinished(Loader&lt;List&lt;Earthquake&gt;&gt; loader, <span class="codeplus">List&lt;Earthquake&gt; data</span>) {
        adapter.clear();
        if (data != null) {
            adapter.addAll(<span class="codeplus">data</span>);
        }
    }

    @Override
    public void onLoaderReset(Loader&lt;List&lt;Earthquake&gt;&gt; loader) {
        adapter.clear();
    }
        </pre>

        <p>In je onCreate methode kun je de loader starten. Je moet een loaderId meegeven. Dit is
            een int getal dat je zelf mag kiezen, het tweede argument is een Bundle argumenten.
            Deze :</p>
        <pre class="code">
getLoaderManager().initLoader(LOADER_ID, null, this);</pre>


    </div>
</div>
<%@ include file="/AO/android_nano_basics/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#networking").addClass("selected");
    })
</script>
</html>
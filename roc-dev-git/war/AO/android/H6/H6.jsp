<%@ include file="/AO/android/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-10">
      	<h2>6 RSS Reader</h2>
  
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
        	<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:
			<ul>
				<li>weet wat een RSS feed is en hoe je die kunt gebruiken om artikelen van een bron te publiceren in een 
				RSS reader</li>
				<li>weet wat een thread is</li>
				<li>weet wanneer je naast de UI thread een andere thread moet starten</li>
				<li>weet hoe je vanuit een activity een thread kunt starten door een subklasse te maken van de klasse AsyncTask</li>
				<li>begrijpt hoe je <em>generics</em> gebruikt bij de definitie van de AsyncTask klasse zodat de klasse met verschillende 
				typen objecten voor  1) de parameters, 2) de values en 3) de result kan werken</li>
				<li>begrijpt hoe je input van het internet kunt downloaden en naar een bestand kan schrijven</li>
				<li>begrijpt hoe je xml bestanden kunt lezen</li>
				<li>weet hoe je de SimpleAdapter klasse gebruikt om data in een ListView object te tonen</li>
				<li>weet hoe je met behulp van een intent een nieuwe activity start en aan het intent object data kunt toevoegen 
				met de putExtra methode</li>
				<li>weet hoe je de data van een intent kunt opvragen met getXxxExtra methoden</li>
				<li>weet hoe je vanuit je app de standaard browser en de telefoon-app kunt starten</li>
				
				
			</ul>
        </div>
        
        <p>In dit hoofdstuk maken we een begin met een app die  een 
        <a href="http://nl.wikipedia.org/wiki/Really_Simple_Syndication" target="_blank">RSS feed</a> vertoont. De app toont een overzicht van 
        recente artikelen van de bron. Als je op een artikel klikt krijg je een korte samenvatting te zien. Van daaruit kun je het artikel openen met de 
        standaard browser.</p>
        <div class="img_met_bijschrift">
        	<p>ItemsActivity</p>
        	<img src="items_activity.jpg">
        </div>
        <div class="img_met_bijschrift">
        	<p>ItemActivity</p>
        	<img src="item_activity.jpg">
        </div>
        <div class="img_met_bijschrift">
        	<p>Browser</p>
        	<img src="artikel.jpg">
        </div>
        
        
        
        <p style="clear:left">De gebruikte feed kun je <a href="http://www.nrc.nl/tech/rss.php?n=np">hier</a> vinden. Je kunt uiteraard ook  een 
         feed van een andere bron gebruiken. Een rss-feed is een 
        xml bestand volgens een vaste structuur. Voor onze feed gebruiken we een beperkt aantal elementen uit het xml bron-bestand:</p>
        <ul>
        	<li>Binnen de <em>&lt;channel&gt;</em> tag:
        	<ul>
        		<li><em>&lt;title&gt;</em>: hiermee wordt de naam van de feed bovenin het scherm getoond</li></ul></li>
        	<li>Binnen de <em>&lt;item&gt;</em> tag:
        	<ul>
        		<li><em>&lt;pubDate&gt;</em>: de datum/tijd van de publicatie</li>
        		<li><em>&lt;title&gt;</em>: de titel van een item</li>
        		<li><em>&lt;description&gt;</em>: De samenvatting van het artikel</li>
        		<li><em>&lt;link&gt;</em>: de link naar het artikel</li>
        	</ul>
        	</li>
        </ul>
        <h2>De user interface (UI)</h2>
        <p>De plaatjes hierboven tonen de user interface. Het startscherm - de Items Activity - toont de titel van de feed met 
        daaronder een lijst van artikelen. 
        Ieder artikel heeft een publikatiedatum en een titel.</p>
        <p>Als gebruiker op een artikel klikt wordt de Item Activity van het artikel geopend die meer informatie geeft over het 
        gekozen artikel. Deze activity heeft een titel, publicatiedatum, een beschrijving en een link naar het originele artikel. Als 
        gebruiker op deze link klikt wordt de default browser van het toestel geopend. Dit vindt buiten de app plaats. Met de &quot;terug-knop&quot; 
        kan de gebruiker terugkeren naar de app.</p>
        
        <p>Voor het scherm dat de lijst met items toont kun je een verticale linear layout gebruiken met daarbinnen een TextView voor 
        de titel en een ListView voor de lijst met items. De uiteindelijke lijst wordt door java code aangemaakt.</p>
        <p>Voor de items in de lijst maak je een aparte view. Ook deze krijgt een verticale linear layout.</p>
        <p>Tot slot maak je een view die &eacute;&eacute;n item toont.</p>
        
        
<pre class="code">
<span class="comment">&lt;!-- **** activity_items.xml **** --&gt;</span>

&lt;LinearLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    xmlns:tools=&quot;http://schemas.android.com/tools&quot;
    android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot;
    tools:context=&quot;.ItemsActivity&quot;
    android:orientation=&quot;vertical&quot;&gt;

    &lt;TextView
        android:id=&quot;@+id/titleTextView&quot;
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:background=&quot;#FFAC83&quot;
        android:padding=&quot;7dp&quot;
        android:text=&quot;@string/items_title&quot;
        android:textSize=&quot;22sp&quot; /&gt;

    &lt;ListView
        android:id=&quot;@+id/itemsListView&quot;
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;match_parent&quot; /&gt;

&lt;/LinearLayout&gt;
</pre>

<pre class="code">
<span class="comment">&lt;!-- **** listview_item.xml **** --&gt;</span>

&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;LinearLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    android:orientation=&quot;vertical&quot; android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot;&gt;

    &lt;TextView
        android:layout_width=&quot;wrap_content&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:layout_marginLeft=&quot;10dp&quot;
        android:layout_marginTop=&quot;5dp&quot;
        android:text=&quot;@string/item_pub_date&quot;
        android:id=&quot;@+id/pubDateTextView&quot; /&gt;

    &lt;TextView
        android:layout_width=&quot;wrap_content&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:layout_marginLeft=&quot;10dp&quot;
        android:layout_marginRight=&quot;10dp&quot;
        android:text=&quot;@string/item_title&quot;
        android:textSize=&quot;24sp&quot;
        android:id=&quot;@+id/titleTextView&quot; /&gt;

&lt;/LinearLayout&gt;

</pre>

<pre class="code">
<span class="comment">&lt;!-- **** activity_item.xml **** --&gt;</span>

&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;ScrollView xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    android:layout_width=&quot;fill_parent&quot;
    android:layout_height=&quot;fill_parent&quot;
    android:orientation=&quot;vertical&quot; &gt;

    &lt;LinearLayout
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:orientation=&quot;vertical&quot; &gt;

        &lt;TextView
            android:id=&quot;@+id/titleTextView&quot;
            android:layout_width=&quot;match_parent&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:paddingLeft=&quot;7dp&quot;
            android:paddingRight=&quot;7dp&quot;
            android:paddingTop=&quot;5dp&quot;
            android:text=&quot;@string/item_title&quot;
            android:textSize=&quot;24sp&quot;
            android:textStyle=&quot;bold&quot; /&gt;

        &lt;TextView
            android:id=&quot;@+id/pubDateTextView&quot;
            android:layout_width=&quot;match_parent&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:paddingLeft=&quot;7dp&quot;
            android:paddingTop=&quot;5dp&quot;
            android:text=&quot;@string/item_pub_date&quot; /&gt;

        &lt;TextView
            android:id=&quot;@+id/descriptionTextView&quot;
            android:layout_width=&quot;match_parent&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:paddingLeft=&quot;7dp&quot;
            android:paddingRight=&quot;7dp&quot;
            android:paddingTop=&quot;5dp&quot;
            android:text=&quot;@string/item_description&quot;
            android:textSize=&quot;18sp&quot; /&gt;

        &lt;TextView
            android:id=&quot;@+id/linkTextView&quot;
            android:layout_width=&quot;match_parent&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_marginTop=&quot;10dp&quot;
            android:paddingLeft=&quot;7dp&quot;
            android:paddingTop=&quot;5dp&quot;
            android:text=&quot;@string/item_link&quot;
            android:textColor=&quot;@color/blue&quot;
            android:textSize=&quot;18sp&quot; /&gt;

    &lt;/LinearLayout&gt;
&lt;/ScrollView&gt;
</pre>        
        
        
        <div class="opdrachten">
        	<h2>Opdracht 1</h2>
        	<p>Maak de twee Activities en maak in je java klassen referenties naar de verschillende views.</p>
        </div>
        
        
        
        <h2>Model</h2>
        <p>Model klassen representeren dingen uit de werkelijkheid. Voor onze reader maken we een klasse RSSFeed en een klasse RSSItem 
        met de attributen die we nodig hebben.</p>
        
        <h3>RSSFeed</h3>
        <p>Benodigde attributen</p>
        <ul>
        	<li>de naam van de feed (het title element in de feed)</li>
        	<li>een ArrayList met de RSSItems (de item elementen in de feed). Maak ook een methode<em>void addItem(RSSItem item)</em> die een 
        	RSSItem kan toevoegen aan 
        	de lijst en een methode <em>RSSItem getItem(int position)</em> die  een RSSItem met behulp van een parameter index nummer 
        	uit de lijst haalt.</li>
        </ul>
<pre class="code">
public class RSSFeed {
    private String title = null;
    private String pubDate = null;
    private ArrayList&lt;RSSItem&gt; items;


    public RSSFeed() {
        items = new ArrayList&lt;RSSItem&gt;();
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setPubDate(String pubDate) {
        this.pubDate = pubDate;
    }

    public String getPubDate() {
        return pubDate;
    }


    public int addItem(RSSItem item) {
        items.add(item);
        return items.size();
    }

    public RSSItem getItem(int index) {
        return items.get(index);
    }

    public ArrayList&lt;RSSItem&gt; getAllItems() {
        return items;
    }
}
</pre>        
        <h3>RSSItem</h3>
        <p>Benodigde attributen</p>
        <ul>
        	<li>title: de titel van het item</li>
        	<li>pubDate: publicatiedatum</li>
        	<li>description: de samenvatting</li>
        	<li>link: de link naar het artikel op het web</li>
        </ul>
        
<pre class="code">
public class RSSItem {

    private String title = null;
    private String description = null;
    private String link = null;
    private String pubDate = null;


    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getLink() {
        return link;
    }

    public void setPubDate(String pubDate) {
        this.pubDate = pubDate;
    }

    public String getPubDate() {
        return pubDate;
    }
}
</pre>        
        
        

        
        
        
        <h2>Threads</h2>
        <p>De app leest data uit het xml bestand dat van het internet wordt binnengehaald. De data wordt opgeslagen in een bestand dat vervolgens 
        door de app wordt gelezen. In een Android app moet je taken als deze in een thread uitvoeren zodat de user interface niet &quot;bevriest&quot;.</p>
        
        <h3>De werking van threads</h3>
        <p>Standaard werkt een Android app met &eacute;&eacute;n thread: de &quot;UI thread&quot;. Deze thread toont de user interface die wacht op 
        (luistert naar) 
         events die plaatsvinden als gebruiker iets doet. De user interface hoort altijd te reageren op een handeling. Je wilt dus 
        niet dat de gebruiker moet wachten tot een bepaalde taak is uitgevoerd. Tijdrovende taken zoals het ophalen en verwerken van data horen dus 
        in een aparte thread plaats te vinden.</p>
        <img src="thread.png">
        
        <h3>Asynchrone taken starten</h3>
        <p>Een asynchrone taak (asynchronous task) is een taak die in een aparte thread op de achtergrond draait. Omdat Android apps 
        dit soort taken vaak gebruiken heeft het Android framework hiervoor een speciale klasse: 
        <a href="http://developer.android.com/reference/android/os/AsyncTask.html" target="_blank">AsyncTask</a> die het makkelijk 
        maakt om dit soort taken uit te voeren. De klasse heeft een aantal methoden die je kunt gebruiken:</p>
        <ol>
        	<li><a href="http://developer.android.com/reference/android/os/AsyncTask.html#onPreExecute()" target="_blank">onPreExecute()</a>: deze 
        	methode kan iets doen voor de thread wordt gestart.</li>
        	<li><a href="http://developer.android.com/reference/android/os/AsyncTask.html#execute(Params...)" target="_blank">
        	execute(Params... params)</a> deze methode start de thread</li>
        	<li><a href="http://developer.android.com/reference/android/os/AsyncTask.html#doInBackground(Params...)" target="_blank">
        	doInBackground(Params... params)</a>: deze methode bevat de code die op de achtergrond wordt uitgevoerd.</li>
        	<li><a href="http://developer.android.com/reference/android/os/AsyncTask.html#publishProgress(Progress...)" target="_blank">
        	publishProgress(Progress... values)</a>: publiceert de voortgang vanuit de achtergrondtaak. Deze methode zorgt er voor dat 
        	de volgende methode wordt gestart in de UI thread</li>
        	<li><a href="http://developer.android.com/reference/android/os/AsyncTask.html#onProgressUpdate(Progress...)" target="_blank">
        	onProgressUpdate(Progress... values)</a>: hiermee kun je bijvoorbeeld een voortgangsindicator in de UI maken.
        	<li><a href="http://developer.android.com/reference/android/os/AsyncTask.html#onPostExecute(Result)" target="_blank">
        	onPostExecute (Result result)</a>: deze methode doet iets nadat doInBackground() is ge&euml;indigd. De values krijgen hun waarde 
        	met het resultaat van doInBackground()
        </ol>
        <img src="AsyncTask.png">
        
        <p>De methoden van AsyncTask kennen drie soorten parameters:</p>
        <ol>
        	<li>params: dit zijn de parameters die worden meegegeven aan de methode execute(Params... params) en die door de methode 
        	doInBackground(Params... params) kunnen worden gebruikt</li>
        	<li>values: dit zijn de parameters die worden meegegeven aan de methode publishProgress(Progress... values) en die door de 
        	methode onProgressUpdate(Progress... values) kunnen worden gebruikt</li>
        	<li>result: de waarde die de methode doInBackground teruggeeft en die door de methode onPostExecute(Result result) kan
        	worden gebruikt</li>
        </ol>
        <p>Om AsyncClass te gebruiken moet je er een subklasse van maken. Daarbij moet je aangeven uit wat voor type objecten de bovengenoemde 
         parameters bestaan. Onderstaand voorbeeld laat zien hoe je de klasse kunt maken voor de feed-reader.</p>
         
<pre class="code">
import android.os.AsyncTask;
...

public class ItemsActivity extends Activity {

    private static final String URL_STRING = 
            &quot;http://www.nrc.nl/tech/rss.php?n=np&quot;;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_items);
        DownloadFeed df = new DownloadFeed();
        df.<span class="codeplus">execute(URL_STRING)</span>;
    }
    
    <span class="comment">//binnenklasse</span>
    class DownloadFeed extends <span class="codeplus">AsyncTask&lt;String, Void, String&gt;</span> {
        
        @Override
        protected String doInBackground(<span class="codeplus">String... params</span>) {
            <span class="comment">//get parameter</span>
            String urlString = <span class="codeplus">params[0]</span>;
            
             <span class="comment">//ToDo download feed en schrijf naar bestand</span>
             
             <span class="comment">//geef String terug</span>
             return "De feed is gedownload";
        }
        
        @Override
        protected void onPostExecute(<span class="codeplus">String result</span>) {
            Context context = <span class="codeplus">ItemsActivity.this</span>;
            Toast.makeText(context, result, Toast.LENGTH.LONG).show();
        }
    }
</pre>       
        
        <p>In bovenstaand voorbeeld is er voor gekozen om een binnenklasse te maken die een subklasse is van AsyncTask. 
        Dit is vrij gebruikelijk. Bij het maken van de klasse geef je tussen vishaken aan welke typen parameters de klasse gaat 
        gebruiken. In dit geval bestaan de params uit Strings, de values uit Void en de result is een String. Klassen 
        die op deze manier worden gemaakt, maken gebruik van zogenaamde 
        <a href="http://en.wikipedia.org/wiki/Generics_in_Java" target="_blank">generics</a>. Eerder ben je dit al eens 
        tegengekomen bij de ArrayList waarbij je tussen de vishaken moest aangeven wat voor type objecten de lijst bevat.</p>
        
        <h4>params</h4>
        <p> In dit geval is er voor gekozen om de String met de link naar de feed mee te geven aan de methode execute(). 
        De methode doInBackground() accepteert een array van strings. Tussen de haakjes staat (String... params). Dit betekent 
        dat je &eacute;&eacute;n of meer Strings of een array van 
        strings mag meegeven. Wat je ook doet, het resultaat is altijd een array. Omdat we in dit geval maar met &eacute;&eacute;n parameter 
        werken, kun je deze opvragen met params[0].</p>
        
        <h4>values</h4>
        <p>In bovenstaande uitwerking wordt de voortgang niet bijgehouden. Als je een generic type niet gebruikt moet je dit aangeven met 
        <a href="http://docs.oracle.com/javase/7/docs/api/java/lang/Void.html" target="_blank">Void</a> (let op de hoofdletter!).</p>
        
        <h4>result</h4>
        <p>doInBackground() geeft een String terug, die als result wordt gebruikt in de methode onPostExecute(), die er in dit geval 
        een Toast van maakt die het result (<em>&quot;De feed is gedownload&quot;</em>) laat zien. Om een 
        Toast te maken heb je een Context object nodig. Vanuit een binnenklasse kun je de context opvragen met de naam van de 
        buitenklasse gevolgd door een punt en het keyword <em>this</em></p>
        
        <h3>Mogelijke klasse declaraties</h3>
        <p>Onderstaande code geeft een aantal mogelijke declaraties van een DownloadFeed klasse die de AsyncTask klasse uitbreidt:</p>
        
<pre class="code">
<span class="comment">/*params: array van Strings
 *values: array van Integers
 *result: een string
 */</span>
Class DownloadFeed extends AsyncTask&lt;<span class="codeplus">String</span>, <span class="codeplus">Integer</span>, <span class="codeplus">String</span>&gt: {...}

<span class="comment">/*params: array van URL&#39;s
 *values: worden niet gebruikt
 *result: een string
 */</span>
Class DownloadFeed extends AsyncTask&lt;<span class="codeplus">URL</span>, <span class="codeplus">Void</span>, <span class="codeplus">String</span>&gt: {...}

<span class="comment">/*params: worden niet gebruikt
 *values: worden niet gebruikt
 *result: wordt niet gebruikt
 */</span>
Class DownloadFeed extends AsyncTask&lt;<span class="codeplus">Void</span>, <span class="codeplus">Void</span>, <span class="codeplus">Void</span>&gt: {...}

<span class="comment">/*params: array van Strings
 *values: array van Integers
 *result: een object van RSSFeed
 */</span>
Class DownloadFeed extends AsyncTask&lt;<span class="codeplus">String</span>, <span class="codeplus">Integer</span>, <span class="codeplus">RSSFeed</span>&gt: {...}
</pre>        
        
        <p>Let op dat wanneer je primitieve waardes wilt gebruiken je de corresponderende 
        <a href="http://en.wikipedia.org/wiki/Primitive_wrapper_class" target="_blank">wrapper klassen</a>  
        gebruikt!</p>
      
        <h2>Werken met files</h2>
        <p>Nu je weet hoe je threads maakt en uitvoert ben je klaar om code te leren schrijven die door de thread wordt uitgevoerd. Vaak 
        moet dit soort code data van bestanden lezen en/of naar bestanden schrijven. De feed reader bijvoorbeeld moet een RSS feed van het 
        internet lezen en de data die we gaan gebruiken naar een xml bestand schrijven. Vervolgens moet het dit xml bestand kunnen lezen en 
        de data omzetten naar java objecten.</p>
        
        <p>Onderstaande code toont een klasse die data van het internet download en in een bestand (news_feed.xml) opslaat.</p>
        
<pre class="code">
<span class="comment">//ToDo importeer benodigde klassen</span>

<span class="comment">/**
 * @author roc-pdev
 */</span>
public class FileIO{

    private final String URL_STRING = "http://www.nrc.nl/tech/rss.php";
    private final String FILENAME = "news_feed.xml";
    private Context context;
    
    <soan class="comment">/**
    *constructor
    *@param Context tbv methode openFileOutput(...);
    *
    */</soan>
    public FileIO(Context context) {
        this.context = context;
    }

    public void downloadFile() {
        try{
            <span class="comment">// maak URL object mbv string</span>
            URL url = new URL(URL_STRING);

            <span class="comment">// maak object InputStream mbv URL</span>
            InputStream in = url.openStream();

            <span class="comment">// maak object OutputStream mbv Context</span>
            FileOutputStream out =
                    context.openFileOutput(FILENAME, Context.MODE_PRIVATE);

            <span class="comment">// lees de input en schrijf de output</span>
            byte[] buffer = new byte[1024];
            int bytesRead = in.read(buffer);
            while (bytesRead != -1) {
                out.write(buffer, 0, bytesRead);
                bytesRead = in.read(buffer);
            }
            out.close();
            in.close();
        }
        catch (IOException e) {
            Log.e("News reader", e.toString());
        }
    }
}
</pre>        
        
        <p>De code begint met twee constanten voor de url van de feed en de naam van het bestand. Je kunt alleen de 
        naam van het bestand aangeven, het pad naar het bestand bepaalt Android. Vervolgens wordt er een try/catch 
        block gebruikt om eventuele I/O exceptions af te vangen.</p>
        <p>Binnen het try block wordt er eerst een URL object gemaakt met behulp van de url string. Op dit URL object 
        kun je met de openStream methode een InputStream object maken die de data kan lezen.<p>
        <p>Om data van internet te lezen moet je in je AndroidManifest een permissie toevoegen op hetzelfde niveau 
        als het application element.</p>
        
<pre class="code">
    &lt;uses-permission android:name=&quot;android.permission.INTERNET&quot; /&gt;
    &lt;application&gt;
        ...
    &lt;/application&gt;
</pre>
           <p>Nadat het bestand is opgeslagen moet het bestand gelezen worden en naar een RSSFeed object worden geparsed. 
           Om een xml file te lezen heb je een xml parser nodig. Maak daarvoor de onderstaande methode in je FileIO klasse.</p>
           
           
           
           
<pre class="code">
    public RSSFeed readFile() {
        try {
            <span class="comment">// maak een XML reader object</span>
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser parser = factory.newSAXParser();
            XMLReader xmlreader = parser.getXMLReader();

            <span class="comment">// maak een content handler (Klasse moet nog gemaakt worden)</span>
            RSSFeedHandler feedHandler = new RSSFeedHandler();
            xmlreader.setContentHandler(feedHandler);

            <span class="comment">// lees het bestand mbv een FileInputStream object</span>
            FileInputStream in = context.openFileInput(FILENAME);

            <span class="comment">// parse de data mbv InputSource object</span>
            InputSource is = new InputSource(in);
            xmlreader.parse(is);

            <span class="comment">// maak een feed object mbv handler</span>
            RSSFeed feed = feedHandler.getFeed();
            return feed;
        }
        catch (Exception e) {
            Log.e("News reader", e.toString());
            return null;
        }
    }
</pre>           
          <p>Bovenstaande methode heeft een feed handler nodig. Deze klasse is een uitbreiding 
          van DefaultHandler en krijgt als attribuut een RSSFeed en een methode 
          om hem op te vragen.</p>
          
<pre class="code">
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

<span class="comment">/**
 * Created by roc-pdev on 7-3-2015.
 *</span>
public class RSSFeedHandler extends DefaultHandler {
    private RSSFeed feed;
    private RSSItem item;

    private boolean feedTitleIsGelezen = false;

    private boolean isTitle = false;
    private boolean isDescription = false;
    private boolean isLink = false;
    private boolean isPubDate = false;

    public RSSFeed getFeed() {
        return feed;
    }

    @Override
    public void startDocument() throws SAXException {
        feed = new RSSFeed();
        item = new RSSItem();
    }

    @Override
    <span class="comment">/**
     * @param qName: Qualified name
     */</span>
    public void startElement(String namespaceURI, String localName,
            <span class="codeplus">String qName</span>, Attributes atts) throws SAXException {

        if (qName.equals(&quot;item&quot;)) {
            item = new RSSItem();
            return;
        }
        else if (qName.equals(&quot;title&quot;)) {
            isTitle = true;
            return;
        }
        else if (qName.equals(&quot;description&quot;)) {
            isDescription = true;
            return;
        }
        else if (qName.equals(&quot;link&quot;)) {
            isLink = true;
            return;
        }
        else if (qName.equals(&quot;pubDate&quot;)) {
            isPubDate = true;
            return;
        }
    }
    
    @Override
    public void characters(char ch[], int start, int length)
    {
        String s = new String(ch, start, length);
        if (isTitle) {
            if (feedTitleIsGelezen == false) {
                feed.setTitle(s);
                feedTitleIsGelezen = true;
            }
            else {
                item.setTitle(s);
            }
            isTitle = false;
        }
        else if (isLink) {
            item.setLink(s);
            isLink = false;
        }
        else if (isDescription) {
            item.setDescription(s);
            isDescription = false;
        }
        else if (isPubDate) {
            item.setPubDate(s);
            isPubDate = false;
        }
    }

    @Override
    public void endElement(String namespaceURI, String localName,
                           String qName) throws SAXException
    {
        if (qName.equals(&quot;item&quot;)) {
            feed.addItem(item);
            return;
        }
    }
}


</pre>          

          <p>Eerst wordt de methode <b>startDocument()</b> aangeroepen. Vervolgens de methode <b>startElement()</b> die wordt gestart als 
          de xml reader een element ( &lt; &gt; ) tegenkomt. We hebben alleen de elementen nodig die we gebruiken in de  
          feed reader: de title van de feed, de items en per item de title van het item, de pubDate, de description en de link. Hiervoor worden 
          booleans gebruikt die op true worden gezet wanneer de methode ze tegenkomt. als de methode een nieuw item tegenkomt wordt er een 
          nieuw item-object gemaakt. Nadat de methode startElement 
          een element heeft gevonden wordt de methode <b>characters(...)</b> gestart die een string maakt van de tekst van het betreffende 
          element en deze bewaart in het feed of het item object. Omdat title zowel in de feed als 
          in het item voorkomt moeten we eerst bepalen waar hij bij hoort. Als hij nog niet gelezen is (feedTitleIsGelezen == false), 
          dan is het de title van de feed en wordt hij in het feed object bewaard. Op dat moment is hij gelezen, dus wordt hij op true gezet. 
          Als de feed title al is gelezen 
          (feedTitleIsGelezen == true), dan hoort hij bij het item en wordt 
          hij in het item object bewaard. Tot slot wordt de methode <b>endElement(...)</b> aangeroepen. Deze zoekt naar eind tags zoals &lt;/item&gt;.
          Net als bij de startElement methode gebruiken we de derde parameter (qName) om te bepalen of het om een item element gaat. Als 
          dat zo is dan wordt het item aan de lijst met items van de RSSFeed toegevoegd.</p>
          
          <p>We zijn nu zo ver dat we in onze ItemsActivity klasse de feed kunnen downloaden en lezen:</p>
          
<pre class="code">
public class ItemsActivity extends Activity {

    private RSSFeed feed;
    <span class="codeplus">private FileIO io;</span>

    private TextView titleTextView;
    private ListView itemsListView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_items);
        
        titleTextView = (TextView) findViewById(R.id.titleTextView);
        itemsListView = (ListView) findViewById(R.id.itemsListView);

        <span class="codeplus">io = new FileIO(this.getApplicationContext());</span>
        <span class="codeplus">new DownloadFeed().execute();</span>
    }
    
    <span class="comment">//thread die de feed download</span>
    <span class="codeplus"">class DownloadFeed extends AsyncTask&lt;Void, Void, Void&gt;</span> {
        @Override
        protected Void doInBackground(Void... params) {
            <span class="codeplus">io.downloadFile();</span>
            return null;
        }

        <span class="comment">// lees bestand nadat het is gedownload</span>
        @Override
        protected void onPostExecute(Void result) {
            <span class="codeplus">new ReadFeed().execute()</span>;
        }
    }
    
    <span class="comment">//thread die het xml bestand leest</span>
    <span class="codeplus">class ReadFeed extends AsyncTask&lt;Void, Void, Void&gt;</span> {

        @Override
        protected Void doInBackground(Void... params) {
            <span class="codeplus">feed = io.readFile();</span>
            return null;
        }

        <span class="comment">// nadat de feed gelezen is</span>
        @Override
        protected void onPostExecute(Void result) { 
            <span class="comment">// ToDo update display</span>
        }
    }
}
</pre>          
           <h2>De lijst maken met een adapter</h2>
           <p>In <a href="../H3/H3.jsp#spinners">hoofdstuk 3</a> heb je geleerd hoe je met behulp van een adapter een array van strings in een spinner kon tonen. Voor de 
           RSS reader gebruiken we een adapter om de ListView widget aan te maken. Hiervoor gebruiken we de 
           <a href="http://developer.android.com/reference/android/widget/SimpleAdapter.html" target="_blank">SimpleAdapter</a> klasse.
           De constructor van SimpleAdapter vraagt 5 parameters:</p>
           <ol>
           		<li>de context: in dit geval <em>this</em> (de Activity)</li>
           		<li>data: een lijst (arrayList) met Map&lt;String, ?&gt; objecten. In een map kun je zogenaamde 
           		&quot;Key - Value paren&quot; opslaan. In dit geval gebruiken we een 
           		<a href="http://docs.oracle.com/javase/7/docs/api/java/util/HashMap.html" target="_blank">HashMap</a> waar 
           		de title en pubDates van een item worden opgeslagen. De map-objecten moeten alle keys bevatten die in de 
           		parameter <em>from</em> worden gespecificeerd. Bij het maken van een map moet je aangeven wat voor soort objecten je 
           		er in gaat stoppen.</li>
           		<li>resource: een integer met het id van de layout voor de listview items</li>
           		<li>from: een array van strings met de namen van de keys die in de maps worden gebruikt</li>
           		<li>to: een array van integers met de id&#39;s van de widgets die de teksten moeten vertonen</li>
           </ol>
           
<pre class="code">
public class ItemsActivity extends Activity {

    ...

    public void updateDisplay() {
        if (feed == null) {
            titleTextView.setText(&quot;RSS feed niet beschikbaar feed&quot;);
            return;
        }

        <span class="comment">// maak title van feed</span>
        titleTextView.setText(feed.getTitle());

        <span class="comment">// haal de items voor de feed</span>
        ArrayList&lt;RSSItem&gt; items = feed.getAllItems();

        <span class="comment">// maak <em>data</em> variabele</span>
        ArrayList&lt;HashMap&lt;String, String&gt;&gt; <span class="codeplus">data</span> =
                new ArrayList();
        for (RSSItem item : items) {
            HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
            map.put(&quot;date&quot;, item.getPubDate());
            map.put(&quot;title&quot;, item.getTitle());
            data.add(map);
        }

        <span class="comment">// maak <em>resource</em>, <em>from</em> en <em>to</em> variabelen</span>
        int <span class="codeplus">resource</span> = R.layout.listview_item;
        String[] <span class="codeplus">from</span> = {&quot;date&quot;, &quot;title&quot;};
        int[] <span class="codeplus">to</span> = {R.id.pubDateTextView, R.id.titleTextView};

        <span class="comment">// maak en set de adapter</span>
        SimpleAdapter adapter =
                new SimpleAdapter(this, data, resource, from, to);
        itemsListView.setAdapter(adapter);
    }
       
}
</pre>           
          
          <p>Bovenstaande methode kun je nu aanroepen in de <em>onPostExecute</em> methode van de <em>ReadFeed</em> (binnen)klasse:</p>
          
<pre class="code">
 <span class="comment">// nadat de feed gelezen is</span>
 @Override
 protected void onPostExecute(Void result) {

     <span class="comment">// update het scherm van de activity</span>
     <span class="codeplus">ItemsActivity.this.updateDisplay();</span>
 }

</pre>          
          
          <h2>Event handling voor een adapter</h2>
          <p>Onderstaande code laat zien hoe je een event afhandelt dat plaatsvindt als gebruiker op &eacute;&eacute;n van de items 
          in de lijst klikt. Hiervoor moet je de 
          <a href="http://developer.android.com/reference/android/widget/AdapterView.OnItemClickListener.html" target="_blank">
          OnItemClickListener</a> interface implementeren die genest is in de AdapterView klasse. Je koppelt vervolgens de 
          event handler aan de widget waarop geklikt wordt door gebruiker, in ons geval &eacute;&eacute;n van de items in 
          de ListView widget.</p>
          
<pre class="code">
<span class="codeplus">import android.widget.AdapterView.OnItemClickListener;</span>
...
...

public class ItemsActivity extends Activity
        <span class="codeplus">implements OnItemClickListener</span> {
    ...
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        ...
        itemsListView = (ListView) findViewById(R.id.itemsListView);
        <span class="codeplus">itemsListView.setOnItemClickListener(this);</span>
        ...
    }
    
    ...
    @Override
    public void <span class="codeplus">onItemClick</span>(AdapterView&lt;?&gt; parent, View v,
                <span class="codeplus">int position</span>, long id) {

        <span class="comment">// get RSSItem mbv positie in lijst</span>
        <span class="codeplus">RSSItem item = feed.getItem(position);</span>
        
        <span class="comment">//ToDo maak een intent</span>
</pre>          
          <p>In de <em>onItemClick</em> methode gebruiken we de derde parameter (int position) om de positie van het geselecteerde item in de lijst 
          op te vragen. Als het goed is heb je in de klasse RSSFeed een methode gemaakt die een item met een bepaalde positie uit de lijst met 
          RSSItems terug geeft.</p>
          
          <h2>Een intent maken</h2>
          <p>Als je in de <em>Item<b>s</b> Activity</em> op een item klikt wil je dat de data van dat item in de <em>Item Activity</em> wordt getoond. Hiervoor moet je 
          een <em>intent</em> maken die data door kan geven van de Items Activity naar de Item Activity.</p>
          
          <p>Vanuit de Item Activity kun je vervolgens op een link klikken die het volledige artikel in de standaard browser toont. Ook 
          hiervoor maak je een intent die je toestel vertelt dat  de link in een web browser moet worden vertoond.</p>
          
          <h3>Data doorgeven tussen activities</h3>
          <p>Zoals we in hoofdstuk 5 hebben gezien is een 
          <a href="http://developer.android.com/reference/android/content/Intent.html" target="_blank">intent</a> een object dat beschrijft wat 
          er moet gebeuren. Vaak wordt er met een intent een andere activity gestart met de methode startActivity(intent). Om data door te 
          geven kun je de methode <em>putExtra()</em> 
          op het intent object aanroepen.</p>
          
 <pre class="code">
 @Override
 public void onItemClick(AdapterView&lt;?&gt; parent, View v,
                         int position, long id) {

     RSSItem item = feed.getItem(position);

     <span class="comment">// maak een intent</span>
     <span class="codeplus">Intent intent = new Intent(this, ItemActivity.class)</span>;

     intent.<span class="codeplus">putExtra(&quot;pubdate&quot;, item.getPubDate())</span>;
     intent.putExtra(&quot;title&quot;, item.getTitle());
     intent.putExtra(&quot;description&quot;, item.getDescription());
     intent.putExtra(&quot;link&quot;, item.getLink());

     this.<span class="codeplus">startActivity(intent)</span>;
 }
 </pre>
 
 		  <p>In de ItemActivity klasse kun je de data van de intent opvragen en aan de widgets koppelen:</p>
 		  
<pre class="code">

...

@Override
protected void onCreate(Bundle savedInstanceState) {
    
    ...
    <span class="comment">// get intent</span>
     <span class="codeplus">Intent intent = getIntent();</span>

     <span class="comment">// get data van de intent</span>
     String pubDate = intent.<span class="codeplus">getStringExtra(&quot;pubdate&quot;)</span>;
     String title = intent.getStringExtra(&quot;title&quot;);
     String description = intent.getStringExtra(&quot;description&quot;);

     <span class="comment">// vertoon de data op de widgets</span>
     pubDateTextView.setText(pubDate);
     titleTextView.setText(title);
     descriptionTextView.setText(description);
     
     <span class="comment">//ToDo maak onClickListener</span>
     
     <span class="comment">// set de listener</span>
     linkTextView.setOnClickListener(this);
}
 
</pre> 		  
 		           
          <p>Constructor en veelgebruikte methodes van de intent klasse. Voor volledig overzicht zie 
          <a href="http://developer.android.com/reference/android/content/Intent.html" target="_blank">Intent</a></p>
          <ul>
          		<li>Constructor: <em>Intent(context, class)</em> maakt een intent voor de gespecificeerde (Activity) klasse </li>
          		<li>data aan intent toevoegen: <em>putExtra(name, value)</em></li>
          		<li>string opvragen: <em>getStringExtra(name)</em></li>
          		<li>int opvragen: <em>getIntExtra(name, default)</em></li>
          </ul>
          
          <h3>De web browser starten</h3>
          <p>Als je op de link klikt moet de web browser starten. Hiervoor moet de OnClickListener interface en de 
          daarbij behorende methode onClick(View v) worden ge&iuml;mplementeerd. 
          Ook dit doe je met een intent waarbij je specificeert wat 
          voor actie moet plaatsvinden. In dat geval bepaalt Android welke app wordt gestart. Om een dergelijke intent te maken 
          gebruik je een andere constructor van de Intent klasse:</p>
          
          
          
<pre class="code">
public class ItemActivity extends Activity 
        <span class="codeplus">implements View.OnClickListener</span> {
    ...

    @Override
    public void onClick(View v) {
        <span class="comment">// get intent</span>
        Intent intent = getIntent();

        <span class="comment">// get Uri van link</span>
        String link = intent.getStringExtra(&quot;link&quot;);
        Uri viewUri = Uri.parse(link);

        <span class="comment">// maak intent and start hem</span>
        Intent viewIntent = new Intent(<span class="codeplus">Intent.ACTION_VIEW, viewUri</span>);
        startActivity(viewIntent);
    }
}
</pre>          
          <p>De eerste parameter (Intent.ACTION_VIEW) vertelt Android dat er een browser window gestart moet worden. De tweede parameter 
          geeft de <a href="http://en.wikipedia.org/wiki/Uniform_resource_identifier" target="_blank">uri</a> van het web adres dat de 
          browser moet openen. Let op het verschil tussen URI en URL! Het resultaat is dat Android de default web browser op het toestel opent.</p>
          
          <h3>Andere intent acties</h3>
          <p>Naast het openen van een web browser kun je ook andere apps op het toestel starten:</p>
          <ul>
          	<li><b>Intent.ACTION_DIAL</b>: in combinatie met een telefoonnummer opent deze intent de telefoon app met het nummer geselcteerd:<br>
<pre class="code">
<span class="comment">//maak een telefoonnummer uri</span>
String telNr = "tel:06-12345678";
Uri telUri = Uri.parse(telNr);

<span class="comment">//maak en start een intent</span>
Intent belIntent = new Intent(Intent.ACTION_DIAL, telUri);
startActivity(belIntent);
</pre>          
			</li>
			
          </ul>
          <div class="opdrachten">
          	<h2>Opdracht 3</h2>
          	<p>Je hebt nu alle componenten om de RSS reader te maken. </p>
          </div>
      </div>
<%@ include file="/includes/bottom.html" %>
	
<% } %>

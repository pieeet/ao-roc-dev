<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">
	<%@ include file="/AO/android/includes/zijmenu.jsp"%>

	<div class="col-md-9">
		<h2>Services en notificaties</h2>

		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je:</p>
			<ul>
				<li></li>
			</ul>
		</div>

		<p>
			Soms moet een Android app op de achtergrond een taak uitvoeren, zelfs
			als de app niet actief is. Om dat te doen kun je een <em>service</em>
			gebruiken. Wanneer de taak gereed is kun je een <em>notificatie</em>
			maken die de gebruiker een berichtje stuurt. In dit hoofdstuk breiden
			we de RSS reader uit zodat hij geregeld checkt of er een nieuwe feed
			beschikbaar is. Als dat het geval is wordt gebruiker gewaarschuwd met
			een notificatie.
		</p>
		<img src="<c:url value="/AO/android/H7/notificatie.jpg"/>">

		<h3>Een Application object maken</h3>
		<p>Voor je met services en notificaties aan de slag gaat is het
			goed om te leren hoe je een Application object kunt maken en
			gebruiken. Je kunt zo&#39;n object voor twee zaken gebruiken:</p>
		<ol>
			<li>je kunt data in een Application object stoppen die voor de
				hele app en al haar activities beschikbaar is</li>
			<li>je kunt code schrijven die eenmalig wordt uitgevoerd als de
				app wordt gestart in plaats van iedere keer wanneer een activity
				wordt gestart</li>
		</ol>
		<p>
			Onderstaande code laat zien hoe je een Application klasse maakt. Bij
			de start van de app wordt er een object van de klasse gemaakt met een
			attribuut waarin datum/tijd van de laatste update van de feed wordt
			opgeslagen in milliseconden. Dit gaan we later gebruiken om te kunnen
			bepalen of er een nieuwere versie beschikbaar is. Om te testen of
			alles goed werkt wordt in de methode onCreate een boodschap naar de
			log console (<a
				href="http://developer.android.com/tools/help/logcat.html"
				target="_blank">logcat</a>) gestuurd.
		</p>

		<pre class="code">
public class NewsReaderApp <span class="codeplus">extends Application</span> {

    private long feedMillis = -1;

    public void setFeedMillis(long feedMillis) {
        this.feedMillis = feedMillis;
    }

    public long getFeedMillis() {
        return feedMillis;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        Log.d(&quot;News reader&quot;, &quot;App is gestart&quot;);
        Log.d(&quot;News reader&quot;, &quot;FeedMillis: &quot; + feedMillis);
    }
}
</pre>

		<p>Als je een uitbreiding van de Application klasse maakt moet die
			worden geregistreerd in je AndroidManifest. Open je
			AndroidManifest.xml bestand en wijzig het application element als
			volgt:</p>

		<pre class="code">
&lt;application
    <span class="codeplus">android:name=&quot;.NewsReaderApp&quot;</span>
    android:allowBackup=&quot;true&quot;
    android:icon=&quot;@mipmap/ic_launcher&quot;
    android:label=&quot;@string/app_name&quot;
    android:theme=&quot;@style/AppTheme&quot; &gt;
</pre>

		<p>Nadat je de klasse hebt gemaakt en geregistreerd kun je een
			Application object maken met onderstaande code:</p>

		<pre class="code">
<span class="comment">//declareer variabele</span>
NewsReaderApp app;

<span class="comment">//instantieer variabele</span>
app = (NewsReaderApp) getApplication();

<span class="comment">//gebruik methodes van het object</span>
long feedMillis = app.getFeedMillis();
</pre>
		<h3>Een service maken</h3>
		<p>
			Onderstaande code laat zien hoe je een klasse maakt die een service
			start en de 4 methoden die je <em>moet</em> implementeren:
		</p>

		<pre class="code">
public class NewsReaderService <span class="codeplus">extends Service</span> {
    @Override
    public void onCreate() {
        <span class="comment">//code die wordt uitgevoerd wanneer de service wordt gecre&euml;erd</span>
    }
    
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        <span class="comment">//code die wordt uitgevoerd als  
        //de service wordt gestart met een aanroep naar de startService methode</span>
        <span class="codeplus">return START_STICKY;</span>
    }
    
    @Override
    public IBinder onBind(Intent intent) {
        <span class="comment">//methode moet worden ge&iuml;mplementeerd maar gaan we niet gebruiken</span>
        return null;
    }
    
    @Override
    public void onDestroy() {
        <span class="comment">//wordt uitgevoerd als service wordt be&euml;indigd</span>
    }
}
</pre>
		<p>De methode onStartCommand wordt uitgevoerd als de service wordt
			gestart. De methode heeft als terugkeerwaarde een int. De klasse
			Servive heeft een aantal int constanten die je kunt gebruiken om aan
			te geven wat er moet gebeuren als de service wordt gestopt door
			Android, bijvoorbeeld omdat er geheugen moet worden vrijgemaakt.</p>
		<ul>
			<li><b>START_STICKY:</b><br> herstart de service zonder het
				intent object opnieuw door te geven. Deze constante kun je gebruiken
				voor services die op de achtergrond blijvend moeten worden
				uitgevoerd en dus opnieuw worden gestart, zodra dat mogelijk is</li>
			<li><b>START_NOT_STICKY:</b><br> de service wordt niet
				geherstart.</li>
			<li><b>START_REDELIVER_INTENT</b><br> herstart de service
				waarbij het intent object opnieuw wordt doorgegeven</li>

		</ul>
		<p>Voordat je de service kan gebruiken moet je hem registreren in
			je AndroidManifest. Dit doe je door op hetzelfde niveau als je
			activity elementen een service element toe te voegen:</p>

		<pre class="code">
&lt;service
    android:name=&quot;.NewsReaderService&quot;
    android:exported=&quot;false&quot;&gt;
&lt;/service&gt;
&lt;activity
    ...
</pre>

		<p>Met de regel exported=&quot;false&quot; geef je aan dat de
			service alleen voor de eigen app gebruikt mag worden.</p>

		<h3>Een service starten en stoppen</h3>
		<p>Om een service te starten moet je eerst een Intent object
			maken. Dit object wordt als paramater meegegeven aan de methode
			startService. De methode startService is een methode van de Context
			klasse en kan vanuit iedere Activity of Application klasse wprden
			aangeroepen.</p>

		<p>Wanneer een service wordt gestart met de startService methode
			blijft hij oneindig doorlopen. Soms is dat wat je wilt. Om de service
			te stoppen kun je de methode stopService aanroepen. Je zou een menu
			item kunnen maken dat de gebruiker in staat stelt de service te
			stoppen om bijvoorbeeld batterij gebruik tegen te gaan of dataverkeer
			te beperken. Ook kan de service vanuit de eigen klasse worden
			be&euml;indigd met de methode stopSelf. Dit kun je doen als een
			service niet langer nodig is nadat een taak is be&euml;indigd.</p>
		<pre class="code">
<span class="comment">// maak intent object</span>
Intent intent = new Intent(this, NewsReaderService.class);
<span class="comment">// start de service</span>
startService(intent);
<span class="comment">// stop service vanuit activity of andere component</span>
stopService(intent);
<span class="comment">// stop service vanuit de service zelf</span>
stopSelf();
</pre>
		<h3>Een timer gebruiken</h3>
		<p>
			Onze RSS reader moet om de zoveel tijd checken of er een nieuwe feed
			beschikbaar is. Hiervoor gaan we een timer maken die om de zoveel
			tijd wordt gestart. Een timer is naast de AsyncTask klasse een andere
			manier om een thread te cre&euml;ren. Onderstaande code laat zien hoe
			je een timer in de NewsReaderService kunt maken. Om te testen of
			alles goed werkt wordt bij iedere taak een boodschap naar de log
			console (<a
				href="http://developer.android.com/tools/help/logcat.html"
				target="_blank">logcat</a>) gestuurd. Aangezien een service geen
			user interface heeft, is dit een gangbare manier van testen.
		</p>
		<pre class="code">			
public class NewsReaderService extends Service {
    <span class="codeplus">private Timer timer</span>;

    @Override
    public void onCreate() {
        Log.d(&quot;News reader&quot;, &quot;Service gecre&euml;erd&quot;);
        <span class="codeplus">startTimer()</span>;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Log.d(&quot;News reader&quot;, &quot;Service gestart&quot;);
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        <span class="comment">//methode moet ge&iuml;mplementeerd maar doet hier niks</span>
        return null;
    }

    @Override
    public void onDestroy() {
        Log.d(&quot;News reader&quot;, &quot;Service be&euml;indigd&quot;);
        <span class="codeplus">stopTimer()</span>;
    }

    <span class="codeplus">private void startTimer() {</span>
        timer = new Timer(true);
        TimerTaak taak = new TimerTaak();
        int vertraging = 1000 * 10;   <span class="comment">// start taak na 10 seconden</span>
        int interval = 1000 * 60 * 5; <span class="comment">// herhaal om de 5 minuten</span>
        <span class="codeplus">timer.schedule(taak, vertraging, interval)</span>;
    }

    <span class="codeplus">private void stopTimer() {</span>
        if (timer != null) {
            <span class="codeplus">timer.cancel()</span>;
        }
    }
    
    <span class="comment">//uitbreiding van abstracte klasse TimerTask</span>
    <span class="codeplus">class TimerTaak extends TimerTask</span> {
        <span class="comment">//methode run moet ge&iuml;mplementeerd worden</span>
        @Override
        public void <span class="codeplus">run()</span> {
            Log.d(&quot;News reader&quot;, &quot;Timer taak uitgevoerd&quot;);
        }
    }

}			
</pre>

		<p>Om de service te testen moet hij gestart worden. De meest
			logische plek om de service te starten is in de Application klasse
			die we aan het begin van dit hoofdstuk hebben gemaakt. Op die manier
			wordt de service gestart wanneer de app voor de eerste keer wordt
			opgestart.</p>

		<pre class="code">
<span class="comment">/* NewsReaderApp.java */</span>
...
    @Override
    public void onCreate() {
        super.onCreate();
        Log.d(&quot;News reader&quot;, &quot;App is gestart&quot;);
        Log.d(&quot;News reader&quot;, &quot;FeedMillis: &quot; + feedMillis);

        <span class="comment">// start service</span>
        <span class="codeplus">Intent service = new Intent(this, NewsReaderService.class);</span>
        <span class="codeplus">startService(service);</span>
    }
...
</pre>

		<p>Op je (virtual) device kun je zien welke services worden
			uitgevoerd:</p>
		<img src="/AO/android/H7/services.jpg">

		<h3>Een notificatie maken</h3>
		<p>We gaan er nu voor zorgen dat de srvice een notificatie maakt
			wanneer er een nieuwe feed beschikbaar is. Maak in je
			NewsReaderService klasse een nieuwe methode:</p>

		<pre class="code">
<span class="comment">/* NewsReaderService.java */</span>

private void sendNotification(String text) {
    <span class="comment">// maak de intent voor de notificatie</span>
    Intent notificationIntent = new Intent(this, ItemsActivity.class)
            <span class="codeplus">.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)</span>;

    <span class="comment">// maak een pending intent</span>
    int flag = PendingIntent<span class="codeplus">.FLAG_UPDATE_CURRENT</span>;
    PendingIntent pendingIntent =
            PendingIntent<span class="codeplus">.getActivity</span>(this, 0, notificationIntent, <span
				class="codeplus">flag</span>);

    <span class="comment">// maak variabelen voor de notificatie</span>
    int icon = R.drawable.notificatie_icon;
    CharSequence tickerText = &quot;nieuwe feed beschikbaar&quot;;
    CharSequence contentTitle = getText(R.string.app_name);
    CharSequence contentText = text;

    <span class="comment">// maak de notificatie en set de benodigde data</span>
    Notification notification =
         new NotificationCompat.Builder(this)
              .setSmallIcon(icon)
              .setTicker(tickerText)
              .setContentTitle(contentTitle)
              .setContentText(contentText)
              .setContentIntent(pendingIntent)
              .setAutoCancel(true)
              .build();

    <span class="comment">// maak een Notification Manager (system service)</span>
    NotificationManager manager = (NotificationManager)
            getSystemService(NOTIFICATION_SERVICE);
    <span class="comment">//maak unieke notificatie id</span>
    final int NOTIFICATION_ID = 1;
    <span class="comment">// verstuur notificatie</span>
    manager.notify(NOTIFICATION_ID, notification);
}
</pre>

		<h3>Pending Intent</h3>
		<p>
			Eerst maak je een notificatie intent die de ItemsActivity gaat
			starten. Deze intent opent de ItemsActivity van de feed reader
			wanneer de gebruiker op de notificatie klikt. Vervolgens verpak je
			deze intent in een zogenaamde pending intent. De pending intent wordt
			meegegeven aan de notificatie die door een NotificationManager object
			aan het Android systeem wordt doorgegeven. Aan beide intents kunnen
			zogenaamde flags worden meegegeven. In Android wordt een app bijna
			nooit helemaal be&euml;indigd, maar verdwijnt hij naar de <em>back
				stack</em> van waaruit hij opnieuw kan worden geactiveerd op het punt
			waar hij was gepauzeerd. Op die manier kun je verder gaan met de app
			waar je was gebleven.
		</p>

		<h4>Enkele constanten van de Intent klasse</h4>
		<ul>
			<li><b>FLAG_ACTIVITY_CLEAR_TOP</b><br> Als de activity op
				de achtergrond draait worden alle activities daarboven naar de
				achtergrond verplaatst zodat de activity bovenaan de stack wordt
				geplaatst en actief wordt. Deze flag wordt meestal gebruikt.</li>
			<li><b>FLAG_ACTIVITY_NEW_TASK</b><br> Er wordt een nieuwe
				activity gestart, oude activities blijven op de achtergrond draaien,
				zodat er meedere instanties van de activity actief zijn. Als je geen
				flags aan de intent meegeeft wordt deze optie gebruikt.</li>
		</ul>
		<h4>De gebruikte constante van de PendingIntent klasse</h4>
		<ul>
			<li><b>FLAG_UPDATE_CURRENT</b><br> Als de pending intent al
				bestaat wordt hij ge&uuml;pdate met de data van de nieuwe intent.
				Deze data wordt meegegeven met de putExtra methode (zie hoofdstuk
				6). .</li>
		</ul>

		<h3>De notificatie maken</h3>
		<p>
			Nadat je een pending intent hebt gemaakt kun je de notificatie maken,
			waarbij de pending intent wordt meegegeven als parameter. De
			notificatie wordt gemaakt met de binnenklasse <a
				href="http://developer.android.com/reference/android/support/v4/app/NotificationCompat.Builder.html"
				target="_blank">Builder</a> van de NotificationCompat klasse. Deze
			klasse bevindt zich in de support library die er voor zorgt dat
			notificaties compatible zijn met vroegere Android versies.
		</p>
		<p>Eerst maak je alle variabelen die je nodig hebt voor de
			notificatie:</p>
		<ul>
			<li>icon: het icoontje dat in de notificatiebalk verschijnt</li>
			<li>ticker tekst: een stukje tekst dat in de notificatiebalk
				verschijnt op het moment dat de notificatie wordt ontvangen</li>
			<li>content title: titel van de notificatie</li>
			<li>content text: de tekst van de notificatie, deze wordt als
				parameter meegegeven als de methode wordt aangeroepen.</li>
		</ul>
		<p>Vervolgens maak je de notificatie met de diverse methoden van
			de Builder klasse:</p>
		<ul>
			<li>setSmallIcon(int): geef het resource id van het icoon mee</li>
			<li>setTicker(CharSequence): set de ticker tekst</li>
			<li>setContentTitle(CharSequence)</li>
			<li>setContentText(CharSequence)</li>
			<li>setContentIntent(pendingIntent)</li>
			<li>setAutoCancel(boolean): indien true wordt de notificatie
				verwijderd nadat hij is geselecteerd</li>
			<li>build(): geeft een Notification object terug</li>
		</ul>

		<h3>System services</h3>
		<p>System services zijn beschikbaar vanuit het Android operating
			system. In de code hierboven werd een system service gebruikt om een
			notificatie aan te maken.</p>

		<pre class="code">
NotificationManager manager = (NotificationManager)
            <span class="codeplus">getSystemService(NOTIFICATION_SERVICE);</span>
</pre>
		<p>
			System services kunnen worden opgevraagd met de methode <em>getSystemService(naamVanService)</em>
			van de Context klasse.
		</p>
		<h4>Veelgebruikte system services</h4>
		<ul>
			<li><b>NOTIFICATION_SERVICE</b><br> geeft een <a
				href="http://developer.android.com/reference/android/app/NotificationManager.html"
				target="_blank">NotificationManager</a> object terug voor het
				vertonen en verwijderen van notificaties</li>
			<li><b>LOCATION_SERVICE</b><br> geeft een <a
				href="http://developer.android.com/reference/android/location/LocationManager.html"
				target="_blank">LocationManager</a> object terug voor het werken met
				GPS updates</li>
			<li><b>CONNECTIVITY_SERVICE</b><br> geeft een <a
				href="http://developer.android.com/reference/android/net/ConnectivityManager.html"
				target="_blank">ConnectivityManager</a> object terug voor het werken
				met netwerk connecties</li>
			<li><b>WIFI_SERVICE</b><br> geeft een <a
				href="http://developer.android.com/reference/android/net/wifi/WifiManager.html"
				target="_blank">WifiManager</a> object terug voor het werken met
				Wi-Fi connecties</li>
			<li><b>INPUT_METHOD_SERVICE</b><br> geeft een <a
				href="http://developer.android.com/reference/android/view/inputmethod/InputMethodManager.html"
				target="_blank">InputMethodManager</a> object terug voor het
				vertonen en verbergen van soft keyboards</li>
		</ul>

		<p>Om te checken of een nieuw gedownloade feed een later
			publicatietijdstip heeft dan de oude feed, breiden we de klasse
			RSSFeed uit met een methode die de tijd van een Date object in
			milliseconden teruggeeft. Om het Date object te maken kun je de
			klasse SimpleDateFormat gebruiken waar je een object van maakt met
			het patroon van de data zoals die in de RSS feed wordt gebruikt (zie
			code). Op het Date object kun je de methode getTime() aanroepen die
			de tijd in milliseconden teruggeeft.</p>

		<pre class="code">
<span class="comment">/* RSSFeed.java */</span>

public long getPubDateMillis() {
    SimpleDateFormat sdf =
            new SimpleDateFormat(&quot;EEE, dd MMM yyyy HH:mm:ss Z&quot;, Locale.US);
    try {
        Date date = sdf.parse(pubDate.trim());
        return date.getTime();
    }
    catch (ParseException e) {
        throw new RuntimeException(e);
    }
}
</pre>
		<p>Breid nu de run methode van de TimerTaak binnenklasse uit zodat
			de feed om de zoveel tijd wordt gedownload en er wordt gechecked of
			de feed in tussentijd is ge&uuml;pdate. Als dat het geval is wordt er
			een notificatie verstuurd.</p>
		<pre class="code">
<span class="comment">/* NewsReaderService.java */</span>

class TimerTaak extends TimerTask {

    @Override
    public void run() {
        Log.d(&quot;News reader&quot;, &quot;Timer taak uitgevoerd&quot;);

        <span class="codeplus">io.downloadFile();</span>
        Log.d(&quot;News reader&quot;, &quot;File gedownload&quot;);

        <span class="codeplus">RSSFeed newFeed = io.readFile();</span>
        Log.d(&quot;News reader&quot;, &quot;File gelezen&quot;);

        Log.d(&quot;News reader&quot;, &quot;new feedPubDate: &quot; + newFeed.getPubDateMillis());
        Log.d(&quot;News reader&quot;, &quot;app feedPubDate&quot; + app.getFeedMillis());

        <span class="comment">// als nieuwe feed nieuwer is dan de oude feed</span>
        <span class="codeplus">if (newFeed.getPubDateMillis() &gt; app.getFeedMillis())</span> {
            Log.d(&quot;News reader&quot;, &quot;Updated feed available.&quot;);

            <span class="comment">// update app object</span>
            <span class="codeplus">app.setFeedMillis(newFeed.getPubDateMillis());</span>

            <span class="comment">// verstuur notificatie</span>
            <span class="codeplus">sendNotification(&quot;Nieuwe feed beschikbaar.&quot;);</span>
        }
        else {
            Log.d(&quot;News reader&quot;, &quot;Updated feed NOT available.&quot;);
        }
    }
}
</pre>

		<h3>Checken van netwerk connectie</h3>
		<p>Om onnodig batterij gebruik te voorkomen gaan we eerst checken
			of er wel een netwerk connectie beschikbaar is voordat de feed wordt
			gedownload. Breid de methode downloadFile van de klasse FileIO als
			volgt uit:</p>
		<pre class="code">
<span class="comment">/* FileIO.java */ </span>

public void downloadFile() {

    <span class="comment">//maak NetworkInfo object</span>
    <span class="codeplus">ConnectivityManager cm = (ConnectivityManager)</span>
            <span class="codeplus">context.getSystemService(Context.CONNECTIVITY_SERVICE);</span>
    <span class="codeplus">NetworkInfo networkInfo = cm.getActiveNetworkInfo();</span>

    <span class="comment">//als er connectie is, download feed</span>
    <span class="codeplus">if (networkInfo != null && networkInfo.isConnected()) {</span>
        try{
            <span class="comment">// get the URL</span>
            URL url = new URL(URL_STRING);

            <span class="comment">// get the input stream</span>
            InputStream in = url.openStream();

            <span class="comment">// get the output stream</span>
            FileOutputStream out =
                    context.openFileOutput(FILENAME, Context.MODE_PRIVATE);

            <span class="comment">// read input and write output</span>
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

		<p>
			Met de methode getActiveNetworkInfo van de ConnectivityManager klasse
			vraag je een object van de <a
				href="http://developer.android.com/reference/android/net/NetworkInfo.html"
				target="_blank">NetworkInfo</a> klasse op. De NetworkInfo klasse
			heeft o.m. de volgende methoden:
		</p>
		<ul>
			<li><b>isConnected()</b><br> geeft een boolean terug als er
				een connectie is</li>
			<li><b>isRoaming()</b><br> geeft een boolean terug als er
				sprake is van roaming op een vreemd netwerk (en er mogelijk extra
				kosten voor datagebruik worden gemaakt)</li>
			<li><b>getTypeString()</b><br> geeft het type netwerk in
				string vorm (&quot;WIFI&quot; of &quot;MOBILE&quot;) terug</li>
		</ul>
		<p>Om de toestand van het netwerk op te vragen moet je in je
			Android Manifest een permissie toevoegen.</p>

		<pre class="code">
<span class="comment">/* AndroidManifest.xml */</span>
&lt;uses-permission android:name=&quot;android.permission.ACCESS_NETWORK_STATE&quot; /&gt;
</pre>
		<p>Tot slot maken we nog een paar aanpassingen in de ItemsActivity
			klasse. Maak de methode onResume die de milliseconden van de
			publicatiedatum van het app object opvraagt. Als dit -1 oplevert is
			de app voor het eerst gestart en moet de feed worden gedownload,
			gelezen en getoond. Anders moet de feed worden gelezen en getoond of
			slechts worden getoond.</p>

		<pre class="code">
<span class="comment">/* ItemsActivity.java</span>
public class ItemsActivity extends Activity
        implements OnItemClickListener {

    private RSSFeed feed;
    private FileIO io;
    <span class="codeplus">private NewsReaderApp app;</span>
    <span class="codeplus">private long feedPubDateMillis;</span>
    private TextView titleTextView;
    private ListView itemsListView;
    
     @Override
     protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_items);
        <span class="codeplus">app = (NewsReaderApp) getApplication();</span>
        io = new FileIO(this.getApplicationContext());
        titleTextView = (TextView) findViewById(R.id.titleTextView);
        itemsListView = (ListView) findViewById(R.id.itemsListView);
        itemsListView.setOnItemClickListener(this);
    }

    @Override
    protected void onResume() {
        super.onResume();
        <span class="comment">//feed date van app object</span>
        <span class="codeplus">feedPubDateMillis = app.getFeedMillis();</span>
        <span class="codeplus">if (feedPubDateMillis == -1) {</span>
            <span class="comment">//downloaden, lezen en vertonen</span>
            new DownloadFeed().execute();
        }
        else if (feed == null) {
            <span class="comment">//lezen en vertonen</span>
            new ReadFeed().execute();
        }
        else {
            <span class="comment">//alleen vertonen</span>
            updateDisplay();
        }
    }
    
    
    class DownloadFeed extends AsyncTask&lt;Void, Void, Void&gt; {
        @Override
        protected Void doInBackground(Void... params) {
            io.downloadFile();
            return null;
        }

        <span class="comment">// parameter == return doInBackground methode</span>
        @Override
        protected void onPostExecute(Void result) {
            Log.d(&quot;News reader&quot;, &quot;Feed downloaded: &quot; + new Date());
            new ReadFeed().execute();
        }
    }

    class ReadFeed extends AsyncTask&lt;Void, Void, Void&gt; {

        @Override
        protected Void doInBackground(Void... params) {
            feed = io.readFile();
            return null;
        }

        <span class="comment">// nadat de feed is gelezen</span>
        @Override
        protected void onPostExecute(Void result) {
            Log.d(&quot;News reader&quot;, &quot;Feed read: &quot; + new Date());
            <span class="codeplus">app.setFeedMillis(feed.getPubDateMillis());</span>
            <span class="comment">// update het display</span>
            ItemsActivity.this.updateDisplay();
        }
    }

    public void updateDisplay() {
        if (feed == null) {
            titleTextView.setText(&quot;Unable to get RSS feed&quot;);
            return;
        }

        <span class="comment">// feed titel</span>
        titleTextView.setText(feed.getTitle());

        <span class="comment">// feed items</span>
        ArrayList&lt;RSSItem&gt; items = feed.getAllItems();

        <span class="comment">// maak een List van Map&lt;String, ?&gt; objects</span>
        ArrayList&lt;HashMap&lt;String, String&gt;&gt; data =
                new ArrayList();
        for (RSSItem item : items) {
            HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
            map.put(&quot;date&quot;, item.getPubDateFormatted());
            map.put(&quot;title&quot;, item.getTitle());
            data.add(map);
        }

        <span class="comment">// maak resource, from, and to variables</span>
        int resource = R.layout.listview_item;
        String[] from = {&quot;date&quot;, &quot;title&quot;};
        int[] to = {R.id.pubDateTextView, R.id.titleTextView};

        <span class="comment">// maak de adapter</span>
        SimpleAdapter adapter =
                new SimpleAdapter(this, data, resource, from, to);
        itemsListView.setAdapter(adapter);

        Log.d(&quot;News reader&quot;, &quot;Feed displayed: &quot; + new Date());
    }

    @Override
    public void onItemClick(AdapterView&lt;?&gt; parent, View v,
                            int position, long id) {

        <span class="comment">// het betreffende item waarop geklikt is</span>
        RSSItem item = feed.getItem(position);

        <span class="comment">// maak een intent</span>
        Intent intent = new Intent(this, ItemActivity.class);

        intent.putExtra(&quot;pubdate&quot;, item.getPubDateFormatted());
        intent.putExtra(&quot;title&quot;, item.getTitle());
        intent.putExtra(&quot;description&quot;, item.getDescription());
        intent.putExtra(&quot;link&quot;, item.getLink());

        this.startActivity(intent);
    }
} 
</pre>
	</div>
</div>
<%@ include file="/AO/android/includes/bottom.html"%>
</html>
<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 19-11-16
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android_nano_basics/includes/zijmenu.jsp" %>

    <div class="col-md-9">

        <div class="bs-callout bs-callout-info">
            <h2>
                <a href="https://www.udacity.com/course/android-basics-nanodegree-by-google--nd803"
                   target="_blank">Android for beginners Nanodegree</a></h2>
            <h3>Android Basics: <a
                    href="https://www.udacity.com/course/android-basics-multiscreen-apps--ud839"
                    target="_blank">Multiscreen Apps</a></h3>
            <p>Benodigde tijd: ca 30 uur</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Leerdoelen</h3>
            <p>Na het voltooien van deze cursus kun je:</p>
            <ul>

                <li>een nieuwe <strong>Activity</strong> in je projectNaam maken</li>
                <li>met een <strong>explicit intent</strong> een andere Activity binnen je app starten</li>
                <li>op verschillende manieren een <strong>OnClickListener</strong> maken die click events op een view
                    afhandelt
                </li>
                <li>een onderscheid maken tussen <strong>primitieve data-types</strong> en <strong>objecten</strong>
                </li>
                <li><strong>arrays</strong> maken met waardes van een bepaald <strong>data-type</strong></li>
                <li>waardes aan een array toevoegen en gebruiken</li>
                <li><strong>Log Messages</strong> maken</li>
                <li>een <strong>ArrayList</strong> maken en weet je wat de verschillen zijn met een array</li>
                <li>objecten aan een ArrayList kunt toevoegen, verwijderen en gebruiken</li>
                <li><strong>child-views</strong> <strong>dynamisch (dynamically)</strong> aan een
                    <strong>LinearLayout</strong> toevoegen
                </li>
                <li>een <strong>while-loop</strong> en een <strong>for-loop</strong> maken</li>
                <li>een <strong>ListView</strong> en een <strong>GridView</strong> maken met een eenvoudige
                    <strong>ArrayAdapter</strong></li>
                <li>een custom java klasse maken met <strong>attributen (state)</strong>,
                    een <strong>constructor</strong> en <strong>get-methoden (getters)</strong></li>
                <li>een custom ArrayAdapter maken met behulp van een <a
                        href="https://github.com/udacity/ud839_CustomAdapter_Example" target="_blank">voorbeeld
                    projectNaam</a></li>
                <li>plaatjes voor verschillende schermresoluties aan je projectNaam toevoegen</li>
                <li>meerdere constructors maken (<strong>overloading</strong>)</li>
                <li>in java een <strong>ImageResource</strong> aan een ImageView meegeven</li>
                <li><strong>Constanten</strong> gebruiken</li>
                <li>met java een View zichtbaar (<strong>VISIBLE</strong>), onzichtbaar (<strong>INVISIBLE</strong>),
                    of geheel kunt wegnemen (<strong>GONE</strong>) met
                    constanten van de View klasse
                </li>
                <li><strong>conditionele</strong> statements maken met <strong>if</strong>, <strong>else</strong> en
                    <strong>else if</strong></li>
                <li>een <strong>OnItemClickListener</strong> aan een AdapterView (bijvoorbeeld ListView
                    of GridView) kunt koppelen
                </li>
                <li>een <strong>MediaPlayer</strong> object gebruiken om media (bijvoorbeeld geluid) af te spelen</li>
                <li><strong>Life Cycle callback</strong> methodes <strong>overriden</strong></li>
                <li>met een <strong>viewpager</strong> en <strong>fragments</strong> een layout met
                    <strong>Tabs</strong>
                    maken
                </li>

            </ul>

        </div>
        <h3>De Android Life Cycle</h3>
        <a href="https://developer.android.com/training/basics/activity-lifecycle/index.html" target="_blank">
            <img src="/AO/android_nano_basics/android_basics_3/lifecycle.png"></a>

        <h3>AdapterViews</h3>
        <p>Een <a href="http://developer.android.com/guide/topics/ui/layout/listview.html"
                  target="_blank">ListView</a>
            is een <a href="https://developer.android.com/reference/android/widget/AdapterView.html" target="_blank">AdapterView</a>
            met items waar je doorheen kan scrollen. De items worden gemaakt met een
            <a href="http://developer.android.com/reference/android/widget/Adapter.html" target="_blank">Adapter</a>.
        </p>
        <p>In onderstaand filmpje
            wordt uitgelegd waarom een adapter wordt gebruik en waarom dit effici&euml;nter
            is dan bijvoorbeeld een LinearLayout in een ScrollView plaatsen, wat hetzelfde effect zou hebben.</p>
        <div class="embed-responsive embed-responsive-16by9">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/-VPM6ICgCk8" frameborder="0"
                    allowfullscreen></iframe>
        </div>
        <p>Zie <a href="https://github.com/ROC-DEV/Adapters" target="_blank">voorbeeld</a> projectNaam waarin een ListView
            met zowel
            een <a href="https://developer.android.com/reference/android/widget/BaseAdapter.html"
                   target="_blank">BaseAdapter</a> als een <a
                    href="https://developer.android.com/reference/android/widget/ArrayAdapter.html" target="_blank">
                ArrayAdapter</a> is gebruikt.</p>
        <img src="/AO/android_nano_basics/images/adapter_result.png">
        <h3>Stap voor stap</h3>
        <h4>ListView en ListItem</h4>
        <p>In de layout file van je activity (<a
                href="https://github.com/ROC-DEV/Adapters/blob/master/app/src/main/res/layout/activity_main.xml"
                target="_blank">activity_main.xml</a>) gebruik je een ListView</p>
        <pre class="code">
<span class="comment"></span>
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;LinearLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot;
    android:orientation=&quot;vertical&quot;&gt;

    <span class="codeplus">&lt;ListView</span>
        android:id=&quot;@+id/autolist&quot;
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;match_parent&quot;/&gt;

&lt;/LinearLayout&gt;
</pre>

        <p>Maak een layout voor het listitem (<a
                href="https://github.com/ROC-DEV/Adapters/blob/master/app/src/main/res/layout/list_item.xml"
                target="_blank">
            list_item.xml</a>) dat gebruikt wordt in de ListView. In onderstaand
            voorbeeld is een horizontale LinearLayout gebruikt
            met twee TextViews. Geef beide TextViews een id. Om beide TextViews evenveel ruimte te geven kun je het
            attribuut <strong>weight</strong> gebruiken die in beide TextViews dezelfde waarde krijgen. Bij width moet
            je dan &quot;0dp&quot; gebruiken.</p>
        <pre class="code">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;LinearLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    android:orientation=&quot;horizontal&quot; android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot;
    android:padding=&quot;16dp&quot;&gt;

    &lt;TextView
        android:<span class="codeplus">id=&quot;@+id/merk&quot;</span>
        android:<span class="codeplus">layout_width=&quot;0dp&quot;</span>
        android:layout_height=&quot;wrap_content&quot;
        android:<span class="codeplus">layout_weight=&quot;1&quot;</span>
        android:textSize=&quot;20sp&quot;
        android:textStyle=&quot;bold&quot;/&gt;

    &lt;TextView
        android:<span class="codeplus">id=&quot;@+id/prijs&quot;</span>
        android:<span class="codeplus">layout_width=&quot;0dp&quot;</span>
        android:layout_height=&quot;wrap_content&quot;
        android:<span class="codeplus">layout_weight=&quot;1&quot;</span>
        android:textSize=&quot;20sp&quot;/&gt;

&lt;/LinearLayout&gt;
</pre>
        <h4>Model klassen</h4>
        <p>Om een adapter te maken heb je een lijst nodig met <strong>objecten</strong> die de relevante data bevat die
            je nodig hebt om listitems te maken. In dit geval het merk en de prijs van een auto. Hiervoor gebruiken we
            een
            zogenaamde model-klasse. Model klassen representeren iets uit de werkelijkheid - in dit geval een auto - en
            hebben altijd dezelfde basisstructuur.</p>
        <pre class="code">
<span class="comment">/**
 * model Klasse om data (merk en prijs) van een
 * auto in een object te bewaren
 */</span>

public class Auto {
    <span class="comment">// de attributen (eigenschappen) van een auto</span>
    private String <span class="codeplus">merk</span> ;
    private double <span class="codeplus">prijs</span>;

    <span class="comment">/**
     * Constructor aan te roepen met <strong>new</strong>
     * @param merk String voor het merk van een auto
     * @param prijs double voor de prijs van een auto
     */</span>
    public Auto(String <span class="parameter">merk</span>, double <span class="parameter">prijs</span> ) {
        this.<span class="codeplus">merk</span> = <span class="parameter">merk</span>;
        this.<span class="codeplus">prijs</span> = <span class="parameter">prijs</span>;
    }

    <span class="comment">/*************** GET-METHODEN (getters) ****************/</span>

    <span class="comment">/**
     * @return geeft merk van auto object
     */</span>
    public String getMerk() {
        return <span class="codeplus">merk</span>;
    }

    <span class="comment">/**
     * @return geeft prijs van auto object
     */</span>
    public double getPrijs() {
        return <span class="codeplus">prijs</span>;
    }
}
</pre>
        <p>Model-klassen voor objecten met veel attributen bevatten veel
            <a href="https://en.wikipedia.org/wiki/Boilerplate_code" target="_blank">boilerplate code</a>. Gelukkig
            wordt er - als je een moderne
            java IDE gebruikt - veel werk uit handen genomen. Onderstaand filmpje toont hoe je in Android studio op
            eenvoudige wijze een klasse Auto kunt maken.</p>
        <div class="embed-responsive embed-responsive-16by9">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/CldT41uYKjQ?rel=0" frameborder="0"
                    allowfullscreen></iframe>
        </div>
        <p>Nu kunnen we in MainActivity auto objecten maken en ze in een
            <a href="https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html" target="_blank">ArrayList</a>
            stoppen. Die hebben we straks namelijk nodig om een Adapter te maken. Vaak komt de data voor dit soort
            objecten
            uit een database, maar voor nu gaan we de objecten &quot;hard coderen&quot;.</p>

        <pre class="code">
public class MainActivity extends AppCompatActivity {

    <span class="comment">// Een ArrayList met auto&#39;s</span>
    <span class="codeplus">private ArrayList&lt;Auto&gt; autos;</span>

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        vulAutoLijst();
    }

    <span class="comment">// hulpmethode om lijst met een aantal auto&#039;s te vullen</span>
    private void vulAutoLijst() {
        <span class="comment">// Maak de ArrayList</span>
        <span class="codeplus">autos = new ArrayList&lt;&gt;();</span>
        <span class="comment">// Maak een auto object mbv constructor</span>
        <span class="codeplus">Auto auto = new Auto(&quot;Fiat&quot;, 5590.95);</span>
        <span class="comment">// Stop auto-object in de lijst</span>
        <span class="codeplus">autos.add(auto);</span>
        <span class="comment">// Dit kan ook sneller</span>
        autos.add(new Auto(&quot;Daihatsu&quot;, 4750.00));
        autos.add(new Auto(&quot;BMW&quot;, 8995.00));
        autos.add(new Auto(&quot;Honda&quot;, 2500.95));
    }
}</pre>
        <h4>Base- en ArrayAdapter</h4>
        <p>Met de autolijst kunnen we een adapter maken. Het gemakkelijkst is om een ArrayAdapter te maken, maar omdat
            dit een afstammeling is van de klasse BaseAdapter gaan we die laatste eerst gebruiken, zodat je wat meer
            inzicht krijgt wat er op de achtergrond gebeurt.</p>

        <pre class="code">
public class AutoLijstBaseAdapter extends <span class="codeplus">BaseAdapter</span> {


    private ArrayList&lt;Auto&gt; autoLijst;
    private LayoutInflater inflater;

    <span class="comment">// Constructor</span>
    public AutoLijstBaseAdapter(Context context, ArrayList&lt;Auto&gt; autoLijst) {
        this.autoLijst = autoLijst;
        <span class="comment">// Maak inflater mbv context (de Activity)</span>
        inflater = LayoutInflater.from(context);
    }

    <span class="comment">/**
     * @return  het aantal items in de lijst
     */</span>
    @Override
    public int getCount() {return autoLijst.size();}

    <span class="comment">/**
     * geeft de auto in de lijst
     * @param i indexpositie van item
     * @return het auto object
     */</span>
    @Override
    public Object getItem(int i) {return autoLijst.get(i);}

    <span class="comment">/**
     * geeft eventueel id
     * @param i indexpositie
     * @return 0 willekeurig getal, onze items hebben geen id
     */</span>
    @Override
    public long getItemId(int i) {return 0;}

    <span class="comment">/**
     * maakt view mbv data
     * @param position index betreffende auto
     * @param convertView eventueel recycle view
     * @param viewGroup niet gebruikt
     * @return de list item view met data van auto
     */</span>
    @Override
    public View getView(int position, View convertView, ViewGroup viewGroup) {
        View view = convertView;
        <span class="comment">// als convertView niet null is, kan de view gerecycled worden, als hij
        // wel null is moet de list_item layout worden &quot;ge-inflate&quot;</span>
        if (view == null) {
            <span class="codeplus">view = inflater.inflate(R.layout.list_item, null);</span>
        }
        <span class="comment">//Op een view kan de methode findViewById worden aangeroepen om
        // &quot;child-views&quot; op te vragen</span>
        <span class="codeplus">TextView merkTextView = (TextView) view.findViewById(R.id.merk);</span>
        <span class="codeplus">TextView prijsTextView = (TextView) view.findViewById(R.id.prijs);</span>
        <span class="comment">// haal auto uit lijst mbv position</span>
        <span class="codeplus">Auto auto = autoLijst.get(position);</span>
        <span class="comment">// Koppel auto-data aan de verschillende views</span>
        merkTextView.setText(<span class="codeplus">auto.getMerk()</span>);
        prijsTextView.setText(maakPrijsFormat(<span class="codeplus">auto.getPrijs()</span>));
        return view;
    }

    <span class="comment">// hulpmethode om van double prijs een geformatteerde String te maken</span>
    private String maakPrijsFormat(double prijs) {
        <span class="comment">// set scheidingstekens voor DecimalFormat</span>
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setDecimalSeparator(&#039;,&#039;);
        symbols.setGroupingSeparator(&#039;.&#039;);

        <span class="comment">// formatteer prijs string met scheidingstekens</span>
        DecimalFormat decimalFormat = new DecimalFormat(&quot;&euro; #,##0.00&quot;, symbols);
        return decimalFormat.format(prijs);
    }
}</pre>

        <p>Als je data zich in een <a href="https://developer.android.com/reference/java/util/List.html"
                                      target="_blank">List</a> (bijvoorbeeld een ArrayList) of een array bevindt, kun je
            een ArrayAdapter gebruiken. ArrayAdapter is een subklasse van BaseAdapter. Voor een ArrayAdapter heb je wat
            minder code nodig. Onderstaande ArrayAdapter toont de belangrijkste verschillen.</p>

        <pre class="code">
public class AutoLijstArrayAdapter extends <span class="codeplus">ArrayAdapter&lt;Auto&gt;</span> {

    <span class="comment">// we hebben geen ArrayList nodig</span>

    private LayoutInflater inflater;

    <span class="comment">/**
     * Geeft context en data door aan superklasse
     * @param context de Activity
     * @param autoList de data
     */</span>
    public AutoLijstArrayAdapter(Context context, List&lt;Auto&gt; autoList) {
        <span class="codeplus">super(context, 0, autoList);</span>
        inflater = LayoutInflater.from(context);
    }

    <span class="comment">/**
     *
     * @param position de betreffende auto uit lijst
     * @param convertView evr view die gerecycled kan worden
     * @param parent niet gebruikt
     * @return view met data
    */</span>
    @NonNull
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View view = convertView;
        if (view == null) {
            view = inflater.inflate(R.layout.list_item, null);
        }
        <span class="codeplus">Auto auto = getItem(position);</span>
        TextView merkTextView = (TextView) view.findViewById(R.id.merk);
        TextView prijsTextView = (TextView) view.findViewById(R.id.prijs);
        merkTextView.setText(auto.getMerk());
        prijsTextView.setText(maakPrijsFormat(auto.getPrijs()));
        return view;
    }

    <span class="comment">/**
     * hulpmethode om van double prijs een geformatteerde String te maken
     * @param prijs de prijs van de auto
     * @return gefomatteerde String
     */</span>
    private String maakPrijsFormat(double prijs) {
        // set scheidingstekens voor DecimalFormat
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setDecimalSeparator(&#039;,&#039;);
        symbols.setGroupingSeparator(&#039;.&#039;);

        // formatteer prijs string met scheidingstekens
        DecimalFormat decimalFormat = new DecimalFormat(&quot;&euro; #,##0.00&quot;, symbols);
        return decimalFormat.format(prijs);
    }
}
        </pre>

        <p>De laatste stap die we nog moeten zetten is in MainActivity een object van &eacute;&eacute;n van onze
            adapterklassen maken en deze aan de listview koppelen. Het eerste argument van de constructor is de
            context. De context is de Activity dus kun je this gebruiken. Het tweede argument is de lijst met auto&#39;s.</p>

        <pre class="code">
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        vulAutoLijst();

        <span class="comment">// Maak een referentie naar de ListView</span>
        ListView listView = (ListView) findViewById(R.id.autolist);

        <span class="comment">// Maak een BaseAdapter of een ArrayAdapter</span>
<span class="comment">//        AutoLijstBaseAdapter adapter = new AutoLijstBaseAdapter(this, autos);</span>
        AutoLijstArrayAdapter adapter = new AutoLijstArrayAdapter(<span class="codeplus">this</span> , autos);

        <span class="comment">// Koppel adapter aan ListView</span>
        listView.setAdapter(adapter);
    }</pre>


        <div class="opdrachten">
            <h2>Project</h2>
            <p>Maak een tour guide app die toeristen informatie geeft over attracties in jouw stad die jij hen aanraadt
                om te bezoeken. Voor meer info zie
                <a href="https://classroom.udacity.com/courses/ud839/lessons/6745394898239847/concepts/78297108220923#"
                   target="_blank">Project Overview</a>. </p></div>


    </div>


</div>
</div>
<%@ include file="/AO/android_nano_basics/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#multiscreen").addClass("selected");
    })
</script>
</html>
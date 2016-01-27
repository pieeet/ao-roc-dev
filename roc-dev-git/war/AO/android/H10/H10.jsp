<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">
<%@ include file="/AO/android/includes/zijmenu.jsp"%>


<div class="col-md-9">

	<h2>Tabs en custom adapters</h2>

	<!-- Leerdoelen -->
	<div class="bs-callout bs-callout-warning">
		<h2>Leerdoelen</h2>
		<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
			je:</p>
		<ul>
			<li>weet hoe je een tablayout met een viewpager kunt maken</li>
			<li>weet hoe je in een tablayout met fragments en listviews
				werkt</li>
			<li>weet hoe je een custom adapter kunt maken</li>
			<li>weet hoe je een layout klasse maakt</li>
			<li>weet hoe je een adapter voor een pager maakt</li>
			<li>weet hoe je listeners aan een tablayout en een pager koppelt</li>
			<li>weet hoe je iconen aan een menu toevoegt en de
				onOptionsItemSelected methode gebruikt</li>
		</ul>
	</div>
	<p>In het vorige hoofdstuk hebben we de database en business
		klassen voor een takenlijst app geschreven. In dit hoofdstuk gaan we
		deze klassen gebruiken om de data op een user interface te vertonen.
		We gaan dit doen met behulp van een TabLayout.
	</p>
	<h3>Tabs gebruiken</h3>
	<p>Allereerst gaan we een TabLayout gebruiken in combinatie met een
		zogenaamde ViewPager. Je kunt hiervoor de volgende code in de
		content_main.xml layout gebruiken:</p>
	<pre class="code">
<span class="comment">&lt;!-- content_main.xml --&gt;</span>

&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;RelativeLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    xmlns:tools=&quot;http://schemas.android.com/tools&quot;
    xmlns:app=&quot;http://schemas.android.com/apk/res-auto&quot; android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot;
    app:layout_behavior=&quot;@string/appbar_scrolling_view_behavior&quot;
    tools:showIn=&quot;@layout/activity_main&quot; tools:context=&quot;.MainActivity&quot;&gt;

    &lt;android.support.design.widget.TabLayout
        android:id=&quot;@+id/tab_layout&quot;
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:layout_below=&quot;@+id/toolbar&quot;
        android:background=&quot;?attr/colorPrimary&quot;
        android:elevation=&quot;6dp&quot;
        android:minHeight=&quot;?attr/actionBarSize&quot;
        android:theme=&quot;@style/ThemeOverlay.AppCompat.Dark.ActionBar&quot;/&gt;

    &lt;android.support.v4.view.ViewPager
        android:id=&quot;@+id/pager&quot;
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;fill_parent&quot;
        android:layout_below=&quot;@id/tab_layout&quot;/&gt;

&lt;/RelativeLayout&gt;
	</pre>

	<h3>De tablayout maken</h3>
	<p>De tablayout en viewpager kun je in je java klasse op de
		gebruikelijke manier opvragen. Om de tabs namen te kunnen geven hebben
		we de lijstnamen nodig die in de database zijn opgeslagen. We hebben
		dus ook een TakenlijstDB object nodig. Met behulp van dit object
		vragen we een ArrayList met de lijsten op. Met behulp van een for each
		loop kun je per lijst de naam opvragen waarmee je de teksten van de
		tabs maakt.</p>

	<pre class="code">
public class MainActivity extends AppCompatActivity {
    private TabLayout tabLayout;
    private TakenlijstDB db;
    private ViewPager pager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        db = new TakenlijstDB(getApplicationContext());
        <span class="codeplus">tabLayout = (TabLayout) findViewById(R.id.tab_layout)</span>;
        <span class="comment">//voeg de tabs toe</span>
        for (Lijst lijst: db.getLijsten()) {
            <span class="codeplus">TabLayout.Tab tab = tabLayout.newTab()</span>;
            <span class="codeplus">tab.setText(lijst.getNaam())</span>;
            <span class="codeplus">tabLayout.addTab(tab)</span>;
        }
        <span class="comment">gebruik de volle breedte van het scherm</span>
        tabLayout.setTabGravity(TabLayout.GRAVITY_FILL);
        <span class="codeplus">pager = (ViewPager) findViewById(R.id.pager);</span>
    }
    <span class="comment">// overige code</span>
}
	</pre>
	<h3>De ViewPager</h3>
	<p>
		Met een <a
			href="http://developer.android.com/training/animation/screen-slide.html"
			target="_blank">ViewPager</a> kun je de tab schermen maken en van tab
		wisselen. Voor we de pager maken, maken we eerst een layout en een
		klasse die de inhoud van de tabs weergeven. De layout heeft een
		verticale linear layout met daarin een ListView om de taken in een
		lijst weer te geven. De klasse is een uitbreiding van <a
			href="http://developer.android.com/guide/components/fragments.html"
			target="_blank">Fragment</a>.
	</p>

	<pre class="code">
<span class="comment">&lt;!-- fragment_takenlijst.xml --&gt;</span>
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;LinearLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot;
    android:orientation=&quot;vertical&quot;&gt;
    
    &lt;ListView
        android:id=&quot;@+id/takenlijst_listView&quot;
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;match_parent&quot;/&gt;

&lt;/LinearLayout&gt;
</pre>


	<pre class="code">
public class TakenlijstFragment extends Fragment {
    ListView taakListView;
    int tabPos;
    
    <span class="comment">// Lege public constructor</span>
    public LijstFragment() {}
    
    public void setTabPos(int tabPos) {
        this.tabPos = tabPos;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        <span class="comment">// referentie naar de layout</span>
        View view = inflater.inflate(R.layout.<span class="codeplus">fragment_takenlijst</span>, container, false);

        <span class="comment">// referentie naar de ListView in de layout</span>
        taakListView = (ListView) view.findViewById (R.id.<span
			class="codeplus">takenlijst_listView</span>);
        verversTakenlijst();
        return view;
    }

    public void verversTakenlijst() {

        <span class="comment">//get takenlijst voor de geselecteerde tab</span>
        Context context = getActivity().getApplicationContext();
        TakenlijstDB db = new TakenlijstDB(context);
        <span class="comment">//lijst id begint bij 1!!</span>
        Lijst lijst = db.getLijst(<span class="codeplus">tabPos + 1</span>);
        ArrayList&lt;Taak&gt; taken = db.getTaken(lijst.getNaam());
        
        <span class="comment">//TODO maak custom adapter</span>
    }

    @Override
    public void onResume() {
        super.onResume();
        refreshTaskList();
    }

}
	</pre>
	<h3>Een custom adapter maken</h3>
	<p>Nadat de app een lijst met taken uit de databse heeft geladen,
		moeten deze taken worden vertoond op de user interface. In vorige
		hoofdstukken hebben we daarvoor een simple adapter gebruikt. Aangezien
		een taak een checkbox heeft die een taak als voltooid markeert, moeten
		we een custom adapter maken.</p>

	<h4>De layout voor een taak item in de list view</h4>
	<p>Gebruik onderstaande code om een taak item voor de list view te
		maken:</p>

	<pre class="code">
<span class="comment">&lt;!-- listview_taak.xml --&gt;</span>

&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;RelativeLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot;&gt;
    &lt;CheckBox
        android:id=&quot;@+id/voltooidCheckBox&quot;
        android:layout_width=&quot;wrap_content&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:layout_margin=&quot;5dp&quot;
        android:layout_alignParentLeft=&quot;true&quot;
        android:layout_alignParentTop=&quot;true&quot;
        android:checked=&quot;false&quot; /&gt;

    &lt;TextView
        android:id=&quot;@+id/NaamTextView&quot;
        android:layout_width=&quot;wrap_content&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
        android:text=&quot;Taak&quot;
        android:layout_alignTop=&quot;@+id/voltooidCheckBox&quot;
        android:layout_toRightOf=&quot;@+id/voltooidCheckBox&quot;
        android:layout_toEndOf=&quot;@+id/voltooidCheckBox&quot; /&gt;

    &lt;TextView
        android:id=&quot;@+id/NotitiesTextView&quot;
        android:layout_width=&quot;wrap_content&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:text=&quot;Notities&quot;
        android:layout_below=&quot;@+id/NaamTextView&quot;
        android:layout_toRightOf=&quot;@+id/voltooidCheckBox&quot;
        android:layout_toEndOf=&quot;@+id/voltooidCheckBox&quot; /&gt;
        
&lt;/RelativeLayout&gt;	
	</pre>

	<h4>Een klasse voor een layout</h4>
	<p>
		Als een layout voor een List View widget complexe widgets als
		checkboxes bevat kun je als volgt een subklasse maken van een
		layoutklasse zoals <a
			href="http://developer.android.com/reference/android/widget/RelativeLayout.html"
			target="_blank">RelativeLayout</a>.
	</p>
	<pre class="code">
public class TaakLayout <span class="codeplus">extends RelativeLayout</span> implements View.OnClickListener {
    private CheckBox checkBox;
    private TextView naamTextView;
    private TextView notitieTextView;

    private Taak taak;
    private TakenlijstDB db;
    private Context context;


    public TaakLayout(Context context) { 
        super(context);
    }

    public TaakLayout(Context context, Taak taak) {
        super(context);
        this.context = context;
        db = new TakenlijstDB(context);

        <span class="comment">//inflate layout</span>
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        inflater.inflate(R.layout.listview_taak, this, true);

        <span class="comment">//maak referenties naar de widgets</span>
        checkBox = (CheckBox) findViewById(R.id.voltooidCheckBox);

        naamTextView = (TextView) findViewById(R.id.NaamTextView);
        notitieTextView = (TextView) findViewById(R.id.NotitiesTextView);
        naamTextView.setTextColor(Color.BLACK);
        notitieTextView.setTextColor(Color.BLACK);

        <span class="comment">//set Listeners</span>
        checkBox.setOnClickListener(this);
        this.setOnClickListener(this);

        <span class="comment">//set taak data op widgets</span>
        setTaak(taak);
    }

    public void setTaak(Taak taak) {
        this.taak = taak;
        naamTextView.setText(taak.getNaam());
        if (taak.getNotitie().equalsIgnoreCase(&quot;&quot;)) {
            notitieTextView.setVisibility(GONE);
        } else {
            notitieTextView.setText(taak.getNotitie());
        }
        if (taak.getDatumMillisVoltooid() > 0) {
            checkBox.setChecked(true);

        } else {
            checkBox.setChecked(false);
        }
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            <span class="comment">// er is op de checkbox geklikt</span>
            case R.id.voltooidCheckBox:
                if (checkBox.isChecked()) {
                    taak.setDatumMillisVoltooid(System.currentTimeMillis());
                } else {
                    taak.setDatumMillisVoltooid(0);
                }
                db.updateTaak(taak);
                break;
            <span class="comment">// er is op de taak geklikt</span>
            default:
                <span class="comment">//TODO intent naar wijzig taak activity maken</span>
        }
    }
}
	</pre>
	<h4>De custom adapter</h4>
	<p>
		Gebruik onderstaande code om een adapter klasse te maken die een
		subklasse is van de <a
			href="http://developer.android.com/reference/android/widget/BaseAdapter.html"
			target="_blank">BaseAdapter</a> klasse. De klasse heeft twee
		object-variabelen: de context en een ArrayList van taak objecten.
		Beiden attributen krijgen hun waarde als de constructor wordt
		aangeroepen.
	</p>
	<p>Na de constructor worden er 4 methoden van de Adapter klasse
		vervangen: (1) getCount(), (2) getItem(), (3) getItemId() en (4)
		getView(). Deze methoden zijn nodig om de taken in een ListView widget
		te plaatsen.</p>
	<p>De eerste drie zijn gemakkelijk te begrijpen. getCount() geeft
		het aantal items in de lijst. De getItem() methode geeft een Taak
		object op de gespecificeerde positie in de lijst terug. De methode
		getItemId() geeft het id van het item terug. Het item id is in dit
		geval hetzelfde als de positie in de lijst. De vierde methode geeft
		een TaakLayout object terug zoals die in de vorige klasse is
		gedefinieerd.</p>


	<pre class="code">
public class TakenlijstAdapter extends BaseAdapter {
    private Context context;
    private ArrayList&lt;Taak&gt; taken;

    public TakenLijstAdapter(Context context, ArrayList&lt;Taak&gt; taken) {
        this.context = context;
        this.taken = taken;
    }

    @Override
    public int getCount() {
        return taken.size();
    }

    @Override
    public Object getItem(int position) {
        return taken.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        TaakLayout taakLayout;
        Taak taak = taken.get(position);
        if (convertView == null) {
            taakLayout = new TaakLayout(context, taak);
        } else {
            taakLayout = (TaakLayout) convertView;
            taakLayout.setTaak(taak);
        }
        return taakLayout;
    }
}
	</pre>
	<h4>De adapter in de TakenlijstFragment klasse gebruiken</h4>
	<p>We kunnen nu de adapter gebruiken om de verversTakenlijst
		methode in de eerder gemaakte TakenlijstFragment klasse aan te vullen:</p>
	<pre class="code">
    public void verversTakenlijst() {

        <span class="comment">//get takenlijst voor huidige tab</span>
        Context context = getActivity().getApplicationContext();
        TakenlijstDB db = new TakenlijstDB(context);
        Lijst lijst = db.getLijst(tabPos + 1);
        ArrayList&lt;Taak&gt; taken = db.getTaken(lijst.getNaam());

        <span class="comment">//maak custom adapter</span>
        <span class="codeplus">TakenlijstAdapter adapter = new TakenlijstAdapter(context, taken);</span>
        <span class="codeplus">taakListView.setAdapter(adapter)</span>;
    }	
	</pre>
	<h4>De adapter voor de pager maken</h4>
	<p>
		De pager in MainActivity moet er voor zorgen dat in iedere tab een
		TakenlijstFragment wordt getoond dat overeenkomt met de betreffende
		takenlijst. Nu we alle bouwstenen hebben gemaakt kunnen we een adapter
		voor de pager maken. De adapter is een subklasse van <a
			href="http://developer.android.com/reference/android/support/v4/app/FragmentStatePagerAdapter.html"
			target="_blank">FragmentStatePagerAdapter</a>. De adapter heeft twee
		attributen: het aantal tabs en een <a
			href="https://docs.oracle.com/javase/7/docs/api/java/util/HashMap.html"
			target="_blank">HashMap</a> waar key-value paren in kunnen worden
		opgeslagen. Hierin worden de fragmenten opgeslagen waarbij de tab
		positie als key wordt gebruikt (zie code).
	</p>

	<pre class="code">
public class PagerAdapter extends FragmentStatePagerAdapter {
    int aantalTabs;
    HashMap&lt;Integer, TakenlijstFragment&gt; fragmenten = new HashMap&lt;&gt;();

    public PagerAdapter(FragmentManager fm, int aantalTabs) {
        super(fm);
        this.aantalTabs = aantalTabs;
    }

    @Override
    public Fragment getItem(int position) {
        TakenlijstFragment takenlijstFragment = new TakenlijstFragment();
        takenlijstFragment.setTabPos(position);
        fragments.put(Integer.valueOf(position), takenlijstFragment);
        return takenlijstFragment;
    }

    public TakenlijstFragment getFragment(int key) {
        return fragments.get(key);
    }

    @Override
    public int getCount() {
        return aantalTabs;
    }

}	
	</pre>
	<h4>De pager adapter gebruiken</h4>
	<p>Maak in MainActivity een object van de pager adapter en koppel
		hem aan de pager. Onderstaande code toont de gehele MainActivity
		klasse.</p>
	<pre class="code">
public class MainActivity extends AppCompatActivity {
    private TabLayout tabLayout;
    TakenlijstDB db;
    PagerAdapter adapter;
    ViewPager pager;
    int tabPos;    
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        db = new TakenlijstDB(getApplicationContext());
        tabLayout = (TabLayout) findViewById(R.id.tab_layout);
        <span class="comment">//voeg de tabs toe</span>
        for (Lijst lijst: db.getLijsten()) {
            TabLayout.Tab tab = tabLayout.newTab();
            tab.setText(lijst.getNaam());
            tab.setTag(lijst.getNaam());
            tabLayout.addTab(tab);
        }
        <span class="comment">//verdeel tabs over volle breedte van het scherm</span>
        tabLayout.setTabGravity(TabLayout.GRAVITY_FILL);
        pager = (ViewPager) findViewById(R.id.pager);
        <span class="codeplus">adapter = new PagerAdapter(getSupportFragmentManager(),</span>
                <span class="codeplus">tabLayout.getTabCount())</span>;
        <span class="codeplus">pager.setAdapter(adapter);</span>
        <span class="comment">// koppel PageChangeListener aan pager</span>
        <span class="codeplus">pager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(tabLayout));</span>
        <span class="comment">//Koppel OnTabSelectedListener aan tab layout</span>
        <span class="codeplus">tabLayout.setOnTabSelectedListener(new TabLayout.OnTabSelectedListener()</span> {

            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                tabPos = tab.getPosition();
                pager.setCurrentItem(tabPos);
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {
            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {
            }
        });

        if (savedInstanceState != null) {
            int tabPos = savedInstanceState.getInt("tabPos");
            pager.setCurrentItem(tabPos);
        }
    }
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        <span class="comment">// Inflate the menu; this adds items to the action bar if it is present.</span>
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        <span class="comment">// Handle action bar item clicks here. The action bar will</span>
        <span class="comment">// automatically handle clicks on the Home/Up button, so long</span>
        <span class="comment">// as you specify a parent activity in AndroidManifest.xml.</span>
        int id = item.getItemId();

        if (id == R.id.action_settings) {
            return true;
        }

        else if (id == R.id.menuAddTaak) {
            <span class="comment">//TODO Add / Edit taak activity maken</span>
        }

        else if (id == R.id.menuDelete) {
            <span class="comment">//verberg taken die afgerond zijn</span>
            TabLayout.Tab tab = tabLayout.getTabAt(tabLayout.getSelectedTabPosition());
            String lijstnaam = tab.getTag().toString();
            ArrayList&lt;Taak&gt; taken = db.getTaken(lijstnaam);
            for (Taak taak: taken) {
                if (taak.getDatumMillisVoltooid() > 0) {
                    taak.setVerborgen(Taak.TRUE);
                    db.updateTaak(taak);
                }
            }
            int tabIndex = pager.getCurrentItem();
            TakenlijstFragment huidigFragment = adapter.getFragment(tabIndex);
            huidigFragment.refreshTaskList();
        }
        return super.onOptionsItemSelected(item);
    }
}	
	</pre>
	<h3>Het menu maken</h3>
	<p>
		In de menubalk van de main activity moeten twee iconen komen: een
		prullenbak die er voor zorgt dat de voltooide items uit de lijst
		worden gehaald en een plus icoon waarmee de activity voor het maken
		van een nieuw taak wordt gestart. De gebruikte iconen kun je <a
			href="https://www.google.com/design/icons/index.html#ic_delete"
			target="_blank">hier</a> vinden
	</p>

	<pre class="code">
&lt;menu xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    xmlns:app=&quot;http://schemas.android.com/apk/res-auto&quot;
    xmlns:tools=&quot;http://schemas.android.com/tools&quot; tools:context=&quot;.MainActivity&quot;&gt;
    &lt;item android:id=&quot;@+id/action_settings&quot; android:title=&quot;@string/action_settings&quot;
        android:orderInCategory=&quot;100&quot; app:showAsAction=&quot;never&quot; /&gt;
        
    &lt;item
        android:id=&quot;@+id/menuAddTaak&quot;
        android:icon=&quot;@drawable/ic_add_white_48dp&quot;
        android:orderInCategory=&quot;1&quot;
        app:showAsAction=&quot;ifRoom&quot;
        android:title=&quot;add_taak&quot; /&gt;

    &lt;item
        android:id=&quot;@+id/menuDelete&quot;
        android:icon=&quot;@drawable/ic_delete_white_48dp&quot;
        android:orderInCategory=&quot;1&quot;
        app:showAsAction=&quot;ifRoom&quot;
        android:title=&quot;delete_taak&quot; /&gt;

&lt;/menu&gt;
	</pre>
	<p>De volgende code in de methode onOptionsItemSelected van
		MainActivity zorgt er voor dat de voltooide taken uit de lijst worden
		gehaald:</p>

	<pre class="code">
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.action_settings) {
            return true;
        }

        else if (id == R.id.menuAddTaak) {
            <span class="comment">//TODO Add / Edit taak activity maken</span>
        }

        else if (<span class="codeplus">id == R.id.menuDelete</span>) {
            <span class="comment">//verberg taken die afgerond zijn</span>
            TabLayout.Tab tab = tabLayout.getTabAt(tabLayout.getSelectedTabPosition());
            String lijstnaam = tab.getTag().toString();
            ArrayList&lt;Taak&gt; taken = db.getTaken(lijstnaam);
            for (Taak taak: taken) {
                <span class="codeplus">if (taak.getDatumMillisVoltooid() > 0) {</span>
                    <span class="codeplus">taak.setVerborgen(Taak.TRUE);</span>
                    <span class="codeplus">db.updateTaak(taak);</span>
                }
            }
            int currentIndex = pager.getCurrentItem();
            TakenlijstFragment huidigFragment = adapter.getFragment(currentIndex);
            huidigFragment.refreshTaskList();
        }
        return super.onOptionsItemSelected(item);
    }	
	</pre>
	<h3>Een taak toevoegen of wijzigen</h3>
	<p>Om nieuwe taken toe te voegen of bestaande taken te wijzigen
		moeten we een nieuwe Activity maken. De activity gebruikt een spinner
		om de lijst te kiezen waar de taak onder valt. Vervolgens zijn er twee
		EditText views waar gebruiker tekst in kan voeren. In de menu balk zie
		je twee iconen; een vinkje om de taak toe te voegen en een kruisje om
		te annuleren.</p>

	<img src="/AO/android/H10/taak_toevoegen.png">


	<pre class="code">
<span class="comment">//content_add_edit.xml</span>

&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;LinearLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    xmlns:tools=&quot;http://schemas.android.com/tools&quot;
    xmlns:app=&quot;http://schemas.android.com/apk/res-auto&quot; android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot; android:paddingLeft=&quot;@dimen/activity_horizontal_margin&quot;
    android:paddingRight=&quot;@dimen/activity_horizontal_margin&quot;
    android:paddingTop=&quot;@dimen/activity_vertical_margin&quot;
    android:paddingBottom=&quot;@dimen/activity_vertical_margin&quot;
    app:layout_behavior=&quot;@string/appbar_scrolling_view_behavior&quot;
    tools:showIn=&quot;@layout/activity_add_edit&quot;
    tools:context=&quot;com.rocdev.android.takenlijst.AddEditActivity&quot;
    android:orientation=&quot;vertical&quot;&gt;

    &lt;Spinner
        android:id=&quot;@+id/lijstSpinner&quot;
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;wrap_content&quot; /&gt;

    &lt;EditText
        android:id=&quot;@+id/naamEditText&quot;
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:hint=&quot;Naam taak&quot;&gt;

        &lt;requestFocus /&gt;

    &lt;/EditText&gt;

    &lt;EditText
        android:id=&quot;@+id/noitieEditText&quot;
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;0dp&quot;
        android:layout_weight=&quot;1&quot;
        android:gravity=&quot;top&quot;
        android:inputType=&quot;textMultiLine&quot;
        android:hint=&quot;Notities&quot; /&gt;

&lt;/LinearLayout&gt;
	</pre>
	<h4>De spinner</h4>
	<img src="/AO/android/H10/spinner.png">
	<p>De layout van de activity gebruikt een custom layout voor de
		spinner. Deze wordt gebruikt om de lijstnamen in de spinner te tonen.
		Hiervoor wordt een TextView met een zwarte tekstkleur en een
		tekstgrootte van 18 sp gebruikt.</p>
	<pre class="code">
<span class="comment">//spinner_list.xml</span>
	
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;TextView xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    android:layout_width=&quot;fill_parent&quot;
    android:layout_height=&quot;wrap_content&quot;
    android:padding=&quot;5dp&quot;
    android:textColor=&quot;@android:color/black&quot;
    android:textSize=&quot;18sp&quot;&gt;

&lt;/TextView&gt;	
	</pre>
	<h4>De layout voor het menu</h4>
	<p>Ook hier moeten in de menu-balk twee iconen komen die er voor
		zorgen dat de nieuwe of gewijzigde taak wordt bewaard of die de actie
		cancelled. De layout zit in de map menu.</p>
	<pre class="code">
<span class="comment">// menu/activity_add_edit.xml</span>	
	
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;menu xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    xmlns:app=&quot;http://schemas.android.com/apk/res-auto&quot;&gt;
    &lt;item android:id=&quot;@+id/menuSave&quot;
        app:showAsAction=&quot;ifRoom&quot;
        android:title=&quot;Bewaar&quot;
        android:icon=&quot;@drawable/ic_done_white_48dp&quot;
        android:orderInCategory=&quot;2&quot;&gt; &lt;/item&gt;

    &lt;item android:id=&quot;@+id/menuCancel&quot;
        app:showAsAction=&quot;ifRoom&quot;
        android:title=&quot;Cancel&quot;
        android:icon=&quot;@drawable/ic_clear_white_48dp&quot;
        android:orderInCategory=&quot;1&quot;&gt; &lt;/item&gt;

&lt;/menu&gt;	
	</pre>
	<h4>De AddEditActivity klasse</h4>
	<p>Onderstaande code toont de AddEditActivity klasse. De klasse
		maakt gebruik van de database klasse om de namen van de lijsten op te
		halen en in de spinner te tonen.</p>
	<p>Om te bepalen of het om een bestaande taak gaat die gewijzigd
		moet worden of om een nieuwe taak is er een boolean variabele editMode
		gemaakt die op true wordt gezet als het om een bestaande taak en op
		false als het om een nieuwe taak gaat. In het eerste geval wordt de
		taak eerst uit de database gehaald en worden de EditText views en de
		spinner gevuld met de bestaande data, in het tweede geval wordt er een
		nieuwe taak gemaakt. Om te weten of het om een bestaande of een nieuwe
		taak gaan we straks informatie aan de intent meegeven (met de putExtra
		methode) waarmee de activity wordt gestart.</p>

	<pre class="code">
public class AddEditActivity extends AppCompatActivity
        implements View.OnKeyListener {

    private Spinner lijstSpinner;
    private EditText naamEditText;
    private EditText notitieEditText;
    private TakenlijstDB db;
    private boolean editMode;
    private Taak taak;
    private String huidigeTabNaam;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_edit);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        <span class="comment">//reference widgets</span>
        lijstSpinner = (Spinner) findViewById(R.id.lijstSpinner);
        naamEditText = (EditText) findViewById(R.id.naamEditText);
        notitieEditText = (EditText) findViewById(R.id.noitieEditText);

        <span class="comment">// set de listeners</span>
        naamEditText.setOnKeyListener(this);
        notitieEditText.setOnKeyListener(this);

        <span class="comment">// get database object</span>
        db = new TakenlijstDB(this);

        <span class="comment">// set adapter voor spinner</span>
        ArrayList&lt;Lijst&gt; lijsten = db.getLijsten();
        ArrayAdapter&lt;Lijst&gt; adapter = new ArrayAdapter<>(this, R.layout.spinner_list, lijsten);
        lijstSpinner.setAdapter(adapter);

        <span class="comment">// get edit mode from intent</span>
        Intent intent = getIntent();
        editMode = intent.getBooleanExtra("editmode", false);

        <span class="comment">//als een bestaande taak ge-edit moet worden...</span>
        if (editMode) {
            <span class="comment">// get taak</span>
            int taakId = intent.getIntExtra("taakId", -1);
            taak = db.getTaak(taakId);

            <span class="comment">//update UI</span>
            naamEditText.setText(taak.getNaam());
            notitieEditText.setText(taak.getNotitie());
        }
        <span class="comment">// set correcte lijst voor de spinner</span>
        int lijstId;
        if (editMode) { //gebruik dezelfde lijst voor een bestaande taak
            lijstId = taak.getLijstId();

        } else { <span class="comment">// add mode: gebruik de huidige lijst van de tab</span>
            huidigeTabNaam = intent.getStringExtra("tab");
            lijstId = db.getLijst(huidigeTabNaam).getId();
        }

        <span class="comment">// set de juiste lijst in de spinner widget</span>
        <span class="comment">// selectie van spinner start met 0 dus = lijstId - 1</span>
        lijstSpinner.setSelection(lijstId - 1);
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        <span class="comment">// Inflate the menu; this adds items to the action bar if it is present.</span>
        getMenuInflater().inflate(R.menu.activity_add_edit, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.menuSave) {
            bewaarInDB();
            <span class="comment">//verwijder de activity van de stack (keer terug naar MainActivity)</span>
            this.finish();
        }

        else if (id == R.id.menuCancel) {
           this.finish();
        }

        return super.onOptionsItemSelected(item);
    }

    private void bewaarInDB() {
        int lijstId = lijstSpinner.getSelectedItemPosition() + 1;
        String naam = naamEditText.getText().toString();
        String notitie = notitieEditText.getText().toString();

        <span class="comment">// als er geen naam is: exit methode</span>
        if (naam == null || naam.replace(" ", "").equals("")) {
            return;
        }
        if (!editMode) {
            taak = new Taak();
        }

        taak.setLijstId(lijstId);
        taak.setNaam(naam);
        taak.setNotitie(notitie);
        if (editMode) {
            int countRijen = db.updateTaak(taak);

        } else {
            long rijId = db.voegTaakToe(taak);
        }
    }

    @Override
    public boolean onKey(View v, int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_DPAD_CENTER) {
            <span class="comment">//verberg het soft keyboard</span>
            InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
            imm.hideSoftInputFromWindow(v.getWindowToken(), 0);
            return true;
        } else if (keyCode == KeyEvent.KEYCODE_BACK) {
            bewaarInDB();
            return false;
        }
        return false;
    }
}
	</pre>
	<h4>De AddEditActivity starten met intents</h4>
	<p>De AddEditActivit moet worden geopend als gebruiker vanaf de
		MainActivity op het + icoontje klikt of als hij op een bestaande taak
		klikt. Vul de onOptionsItemSelected methode in de MainActivity klasse
		als volgt aan:</p>

	<pre class="code">
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        
        int id = item.getItemId();

        if (id == R.id.action_settings) {
            return true;
        }

        else if (id == R.id.menuAddTaak) {
            <span class="codeplus">Intent intent = new Intent(this, AddEditActivity.class);</span>
            <span class="codeplus">Lijst lijst = db.getLijst(tabLayout.getSelectedTabPosition() + 1);</span>
            <span class="codeplus">intent.putExtra(&quot;tab&quot;, lijst.getNaam());</span>
            <span class="codeplus">startActivity(intent);</span>
        }

        else if (id == R.id.menuDelete) {
            //verberg taken die afgerond zijn
            TabLayout.Tab tab = tabLayout.getTabAt(tabLayout.getSelectedTabPosition());
            String tabTag = tab.getTag().toString();
            ArrayList&lt;Taak&gt; taken = db.getTaken(tabTag);
            for (Taak t: taken) {
                if (t.getDatumMillisVoltooid() > 0) {
                    t.setVerborgen(Taak.TRUE);
                    db.updateTaak(t);
                }
            }
            int currentIndex = pager.getCurrentItem();
            LijstFragment huidigFragment = adapter.getFragment(currentIndex);
            huidigFragment.refreshTaskList();
        }

        return super.onOptionsItemSelected(item);
    }
	</pre>
	<p>
		In de TaakLayout klasse kun je aan de onClick methode nu de volgende
		code toevoegen die zorgt dat AddEditActivity wordt gestart met een
		bestaande taak. Hiervoor wordt de taakId aan het intent meegegeven met
		de putExtra methode. Ook wordt een boolean variabele <em>editmode</em>
		meegegeven zodat we weten dat het om een bestaande taak gaat.
	</p>

	<pre class="code">
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.voltooidCheckBox:
                if (checkBox.isChecked()) {
                    taak.setDatumMillisVoltooid(System.currentTimeMillis());
                } else {
                    taak.setDatumMillisVoltooid(0);
                }
                db.updateTaak(taak);
                break;
            default:
                <span class="codeplus">Intent intent = new Intent(context, AddEditActivity.class);</span>
                <span class="codeplus">intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);</span>
                <span class="codeplus">intent.putExtra(&quot;editmode&quot;, true);</span>
                <span class="codeplus">intent.putExtra(&quot;taakId&quot;, taak.getTaakId());</span>
                <span class="codeplus">context.startActivity(intent);</span>
        }
    }	
	</pre>

</div>
<%@ include file="/AO/android/includes/bottom.html"%>
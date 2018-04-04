<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">
	<%@ include file="/AO/android/includes/zijmenu.jsp"%>

	<div class="col-md-9">
		<h2>3 Layouts &amp; widgets</h2>

		<!-- Leerdoelen -->
		<div class="bs-callout bs-callout-warning">
			<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
				je:</p>
			<ul>
				<li>weet hoe je een <em>RelativeLayout</em>, een <em>LinearLayout</em>,
					een <em>TableLayout</em> en een <em>FrameLayout</em> maakt
				</li>
				<li>weet hoe je layouts kunt nesten</li>
				<li>weet hoe je scherm-ori&euml;ntatie kunt bepalen in de <em>AndroidManifest.xml</em></li>
				<li>hoe je verschillende layouts voor portrait en landscape
					maakt</li>
				<li>hoe je <em>check boxes</em>, <em>radio buttons</em>, <em>spinners</em>
					en <em>seek bars</em> maakt en gebruikt
				</li>
				<li>hoe je widgets kunt verbergen/tonen</li>
				<li>hoe je een <em>scroll bar</em> om een layout of een view
					kunt zetten
				</li>

			</ul>

		</div>

		<img src="<c:url value="/AO/android/H3/materialDesign.png"/>">
		<p>Android kent een aantal standaard layouts waarmee wordt bepaald
			hoe de elementen ten opzichte van elkaar worden gepositioneerd.</p>

		<h3>Relative Layout</h3>
		<p>
			In een <a
				href="http://developer.android.com/reference/android/widget/RelativeLayout.
					LayoutParams.html"
				target="_blank">Relative Layout</a> zijn de elementen relatief ten
			opzichte van elkaar gepositioneerd. In deze layout moeten alle
			elementen een &quot;id&quot; krijgen.
		</p>
		<img src="<c:url value="/AO/android/H3/relative_layout.png"/>">


		<h3>Linear Layout</h3>
		<p>
			In een <a
				href="http://developer.android.com/guide/topics/ui/layout/linear.html"
				target="_blank"> lineaire layout</a> worden de elementen horizontaal
			naast elkaar, of verticaal onder elkaar geplaatst. Met de property
			&quot;weight&quot; kun je de (relatieve) grootte van de elementen
			aanpassen (zie illustratie). Met de property &quot;gravity&quot; kun
			je de ori&euml;ntatie ten opzichte van het parent-element (top,
			bottom, center, left, right) bepalen.
		</p>
		<img src="<c:url value="/AO/android/H3/linear_layout.png"/>">

		<h3>Table layout</h3>
		<P>
			Om je layout in een grid te zetten kun je een <a
				href="http://developer.android.com/reference/android/widget/TableLayout.html"
				target="_blank">Table Layout </a> gebruiken. Voor iedere rij die je
			maakt voeg je een element &lt;TableRow&gt; toe waar je de elementen
			binnen plaatst. Met &quot;layout_span=&quot;...&quot; kun je een
			element over meerdere kolommen laten lopen (zie voorbeeld).
		</P>
		<img src="<c:url value="/AO/android/H3/tableLayout.png"/>" alt="tabel layout">

		<pre class="code">
<span class="codeplus">&lt;TableLayout</span> xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot;
    android:padding=&quot;10dp&quot;&gt;

    &lt;!-- het rekening bedrag --&gt;
    <span class="codeplus">&lt;TableRow&gt;</span>
        &lt;TextView
            android:id=&quot;@+id/rekeningBedragLabel&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:padding=&quot;10dp&quot;
            android:text=&quot;@string/rekening_bedrag_label&quot;
            android:textSize=&quot;20sp&quot;
            android:textStyle=&quot;bold&quot; /&gt;

        &lt;EditText
            android:id=&quot;@+id/rekeningBedragEditText&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:ems=&quot;8&quot;
            <span class="codeplus">android:layout_span=&quot;3&quot;</span>
            android:inputType=&quot;numberDecimal&quot;
            android:text=&quot;@string/rekening_bedrag&quot;
            android:textSize=&quot;20sp&quot; &gt;

            &lt;requestFocus /&gt;
        &lt;/EditText&gt;
     <span class="codeplus">&lt;/TableRow&gt;</span>
</pre>




		<div class="opdrachten">
			<h2>Opdracht 3.1</h2>
			<p>Maak een nieuw project waarin je de Fooi Calculator met een
				Table Layout maakt.</p>
		</div>

		<h3>Frame Layout</h3>
		<p>Met een frame layout kun je meerdere widgets over elkaar heen
			&quot;stacken&quot;. Je kunt bijvoorbeeld een TextView bovenop een
			foto plaatsen.</p>
		<img src="<c:url value="/AO/android/H3/frameScreen.png"/>" width="350">
		<pre class="code">
&lt;FrameLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    xmlns:tools=&quot;http://schemas.android.com/tools&quot;
    android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot;

    &lt;ImageView
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;match_parent&quot;
        android:src=&quot;@drawable/rest_dark_N5&quot; /&gt;

    &lt;TextView
        android:text=&quot;@string/welkom&quot;
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:gravity=&quot;center&quot;
        android:textColor=&quot;#ffffff&quot;
        android:textSize=&quot;30sp&quot;
        android:layout_marginTop=&quot;20dp&quot;
        /&gt;

&lt;/FrameLayout&gt;   					
</pre>
		<div class="opdrachten">
			<h2>Opdracht 3.2</h2>
			<p>Maak een nieuw project met een welkom tekst op een foto zoals
				bovenstaand voorbeeld.</p>
		</div>

		<h3>Layouts nesten</h3>
		<p>Je kunt layouts &quot;nesten&quot;, dat wil zeggen dat je
			layouts binnen layouts maakt. Je kunt bijvoorbeeld rijen maken met
			een horizontale Linear Layout binnen een verticale Linear Layout.</p>

		<pre class="code">
<span class="codeplus">&lt;LinearLayout</span> xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    xmlns:tools=&quot;http://schemas.android.com/tools&quot; 
    android:layout_width=&quot;match_parent&quot;
    android:layout_height=&quot;match_parent&quot; 
    <span class="codeplus">android:orientation=&quot;vertical&quot;&gt;</span>
    
    &lt;!--de eerste rij--&gt;
    
    <span class="codeplus">&lt;LinearLayout</span>
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;match_parent&quot;
        <span class="codeplus">android:orientation=&quot;horizontal&quot;&gt;</span>
        
        &lt;!--widgets --&gt;

        &lt;TextView android:text=&quot;@string/hello_world&quot; 
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot; /&gt;
        
        &lt;Button
            android:layout_width=&quot;60dp&quot;
            android:layout_height=&quot;60dp&quot;
            android:text=&quot;Ok&quot;/&gt;
        
    &lt;/LinearLayout&gt;
    
    &lt;!--tweede rij--&gt;

    &lt;LinearLayout
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;match_parent&quot;
        android:orientation=&quot;horizontal&quot;&gt;

        &lt;!--widgets --&gt;
        
    &lt;/LinearLayout&gt;

    
&lt;/LinearLayout&gt;

</pre>
		<p>Wees voorzichtig met het teveel nesten van layouts omdat het de
			performance negatief kan be&iuml;nvloeden.</p>

		<h3>Scherm ori&euml;ntatie</h3>
		<p>
			Je kunt de ori&euml;ntatie van het scherm instellen op Portrait of
			Landscape. Als je niets doet, dan zal dezelfde layout voor zowel
			Portrait als Landscape worden gebruikt. Als je niet wilt dat het
			scherm draait dan kun je de ori&euml;ntatie vast zetten. Een
			gemakkelijke manier om dit te doen is in het AndroidManifest.xml
			bestand. Voeg de volgende regel binnen de activity tag toe:<br>
			<b>android:screenOrientation=&quot;portrait&quot;</b><br>
			Hiermee zorg je er voor dat het scherm altijd op portrait blijft en
			niet meedraait.
		</p>
		<p>Het kan zijn dat je verschillende layouts voor verschillende
			ori&euml;ntaties wilt gebruiken om maximaal van de beschikbare ruimte
			gebruik te maken. In dat geval maak je een nieuwe map
			res/layout-land. Kopieer de layout van je portrait versie van je
			activity hierin en pas het aan zodat het beter in een landscape
			ori&euml;ntatie past.
		<h2>Overige widgets</h2>

		<h3>Check boxes</h3>
		<p>Met een check box kan gebruiker opties in- of uitschakelen. Er
			kunnen meerdere opties worden aangevinkt.</p>

		<h4>xml code</h4>


		<pre class="code">
&lt;checkbox
    android:id=&quot;@+id/checkbox&quot;
    android:layout_width=&quot;wrap_content&quot;
    android:layout_height=&quot;wrap_content&quot;
    android:checked=&quot;true&quot;
    android:text=&quot;@string/onthoud_percentage&quot; /&gt;
</pre>


		<h4>Java methodes voor check boxes</h4>
		<pre class="code">
 void setChecked(boolean)
 boolean isChecked()
</pre>

		<h3>Radio Buttons</h3>
		<p>Met radio buttons maak je een keus uit meerdere opties. Binnen
			een RadioGroup kan maar &eacute;&eacute;n button worden geselecteerd.</p>

		<h4>xml code</h4>
		<pre class="code">                   
&lt;RadioGroup
        android:id=&quot;@+id/radiogroep&quot;
        android:layout_width=&quot;wrap_content&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:layout_below=&quot;@+id/scheidslijn&quot;
        android:layout_toRightOf=&quot;@+id/afrondLabel&quot;
        android:layout_alignLeft=&quot;@id/totaalTextView&quot;&gt;

        &lt;RadioButton
            android:id=&quot;@+id/optie1RadioButton&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:checked=&quot;true&quot;
            android:text=&quot;@string/tekst_optie_1&quot; /&gt;

        &lt;RadioButton
            android:id=&quot;@+id/optie2RadioButton&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:text=&quot;@string/tekst_optie_2&quot; /&gt;

        &lt;RadioButton
            android:id=&quot;@+id/optie3RadioButton&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:text=&quot;@string/tekst_optie_3&quot; /&gt;
    &lt;/RadioGroup&gt;                    
</pre>


		<h4>Java methodes</h4>
		<p>
			Veelgebruikte methodes van de klasse <a
				href="http://developer.android.com/reference/android/widget/RadioButton.html"
				target="_blank"> RadioButton</a> zijn:
		</p>
		<pre class="code">
<span class="comment">// void setChecked()</span>
 optie1RadioButton.setChecked(true);
 
<span class="comment">// boolean isChecked()</span>
if (optie2RadioButton.isChecked) {
    <span class="comment">//Doe iets</span>
}
 
</pre>
		<h3 id="spinners">Spinners</h3>
		<p>Een spinner is een drop-down lijst met opties. Aangezien de
			meeste code voor een spinner in java wordt gemaakt is de xml code
			vrij simpel.</p>
		<img src="<c:url value="/AO/android/H3/spinner.png"/>" width="300">

		<h4>xml layout</h4>
		<pre class="code">
&lt;Spinner
        android:id=&quot;@+id/spinner&quot;
        android:layout_width=&quot;wrap_content&quot;
        android:layout_height=&quot;wrap_content&quot;
</pre>

		<h4>strings xml</h4>
		<p>Maak in strings.xml een string array</p>
		<pre class="code">
&lt;string-array name=&quot;spinner_array&quot;&gt;
        &lt;item &gt;optie 1&lt;/item&gt;
        &lt;item &gt;optie 2&lt;/item&gt;
        &lt;item &gt;optie 3&lt;/item&gt;
        &lt;item &gt;optie 4&lt;/item&gt;
 &lt;/string-array&gt;
</pre>
		<h4>Java code om je spinner te maken</h4>
		<p>
			Declareren en instanti&euml;rene van de variabele van het type <a
				href="http://developer.android.com/reference/android/widget/Spinner.html"
				target="_blank"> Spinner</a> werkt hetzelfde als andere elementen,
			met de methode findViewById(&quot;id&quot;). Om de spinner te maken
			heb je een instantie van <a
				href="http://developer.android.com/reference/android/widget/ArrayAdapter.html"
				target="_blank">ArrayAdapter</a> nodig.
		</p>
		<p>Twee methodes van de ArrayAdapter klasse:</p>
		<table class="table table-bordered">
			<tr>
				<td><b>createFromResource(context, arrayID, layoutID)</b></td>
				<td>maakt een arrayadapter voor de specifieke array en layout</td>
			</tr>
			<tr>
				<td><b>setDropDownViewResource()</b></td>
				<td>bepaalt de layout voor de items in de drop down lijst</td>
			</tr>
		</table>



		<pre class="code">
<span class="comment">//importeer de benodigde klassen</span>
import android.widget.ArrayAdapter;
import android.widget.Spinner;
 
<span class="comment">//declareer het spinner attribuut</span>
private Spinner spinner;

<span class="comment">//instantieer de spinner</span>
spinner = (Spinner) findViewById(R.id.delenSpinner);

<span class="comment">//maak een adapter</span>
ArrayAdapter&lt;CharSequence&gt; adapter = ArrayAdapter.createFromResource(
    this, R.array.spinner_array, android.R.layout.simple_spinner_item);
adapter.setDropDownViewResource(
    android.R.layout.simple_spinner_dropdown_item);
    
<span class="comment">//koppel de adapter aan de spinner</span>
spinner.setAdapter(adapter);

 
		</pre>

		<p>
			Door de methode <b></b>getSelectedItemPosition() op de spinner aan te
			roepen krijg je het indexnummer van het item zodat je weet wat de
			gebruiker heeft geselecteerd.
		</p>
		<pre class="code">
if (spinner.getSelectedItemPosition() == 0) {
    <span class="comment">//doe iets</span>
} else if ......
</pre>

		<h3>Widgets verbergen</h3>
		<p>Soms wil je een widget alleen vertonen als het nodig is.
			Hiervoor kun je de opdracht setVisibility() gebruiken</p>

		<pre class="code">
widgetNaam.<span class="codeplus">setVisibility(View.<b>GONE</b>);</span>
widgetNaam.<span class="codeplus">setVisibility(View.<b>VISIBLE</b>);</span>
</pre>


		<div class="opdrachten">
			<h2>Opdracht 3.3</h2>
			<p>Maak de fooi calculator volgens onderstaand voorbeeld. De
				gebruiker kan er voor kiezen om of het fooibedrag of het
				totaalbedrag af te ronden. Middels een drop down menu kan hij er
				voor kiezen om het bedrag te delen tussen 2, 3 of 4 personen. Als
				het bedrag niet wordt gedeeld, wordt het gedeelde bedrag niet
				vertoond.</p>
			<img src="/AO/android/H3/opdr3_3_1.png" width="250"> <img
				src="/AO/android/H3/opdr3_3_2.png" width="250">

		</div>

		<h3>Seek bars</h3>
		<p>Een seek bar is een slider waarmee je een waarde (int) kunt
			veranderen.</p>
		<img src="<c:url value="/AO/android/H3/seekbar.png"/>" width=300>

		<h4>xml code</h4>
		<p>In je xml code kun je de slider een maximale waarde (standaard
			100) en de voortgang (beginstand) geven.</p>
		<pre class="code">
&lt;SeekBar
        android:id=&quot;@+id/procentSeekBar&quot;
        android:layout_width=&quot;180dp&quot;
        android:layout_height=&quot;wrap_content&quot;
        android:<span class="codeplus">max=&quot;30&quot;</span>
        android:<span class="codeplus">progress=&quot;15&quot; /&gt;</span>
</pre>

		<h4>Java code</h4>
		<p>
			Twee veelgebruikte methodes van de <a
				href="http://developer.android.com/reference/android/widget/SeekBar.html"
				target="_blank">SeekBar</a> klasse:
		</p>
		<pre class="code">
void setProgress(int);
int getProgress();
</pre>
		<p>
			Om een action listener aan een seek bar te koppelen moet de interface
			<a
				href="http://developer.android.com/reference/android/widget/SeekBar.OnSeekBarChangeListener.html"
				target="_blank">OnSeekBarChangeListener</a> worden
			ge&iuml;mplementeerd.
		</p>
		<pre class="code">
import android.widget.SeekBar.<span class="codeplus">OnSeekBarChangeListener;</span>
public class FooiCalculatorActivity extends Activity
        implements OnEditorActionListener, OnClickListener,
        <span class="codeplus">OnSeekBarChangeListener</span> {
</pre>
		<p>
			Implementatie van deze listener maakt dat je 3 methodes <em>moet</em>
			defini&euml;ren. Studio geeft dit aan en kan de (lege) methodes voor
			je aanmaken. Dat scheelt weer het nodige typewerk.
		</p>

		<pre class="code">
<span class="comment">//doet niets</span>
@Override
public void <span class="codeplus">onStartTrackingTouch(SeekBar seekBar)</span> {}	

<span class="comment">//verandert alleen fooiPercentageTextview</span>
@Override
public void <span class="codeplus">onProgressChanged(SeekBar seekBar, int i, boolean b)</span> {
    fooiPercentageInt = i;
    fooiPercentage = (double) fooiPercentageInt;
    procentTextView.setText(&quot;&quot; + fooiPercentageInt + &quot;%&quot;);
}
<span class="comment">//maak de berekening na input gebruiker</span>
@Override
public void <span class="codeplus">onStopTrackingTouch(SeekBar seekBar)</span> {
	berekenEnToon();
}
</pre>
		<div class="opdrachten">
			<h2>Opdracht 3.4</h2>
			<p>Verander de twee knoppen die het percentage verlagen/verhogen
				in een seek bar. Het percentage wordt achter de seek bar weergegeven
				in een TextView (zie afbeelding bij uitleg).</p>

		</div>

		<h3>Scroll Bars</h3>
		<p>
			Om te vermijden dat inhoud buiten het scherm valt, kun je je gehele
			layout in een <a
				href="http://developer.android.com/reference/android/widget/ScrollView.html"
				target="_blank"> ScrollView</a> plaatsen. Voor horizontaal scrollen
			gebruik je <a
				href="http://developer.android.com/reference/android/widget/HorizontalScrollView.html"
				target="_blank">HorizontalScrollView.</a>
		</p>
		<img src="/AO/android/H3/scrollbar.png" width="400">

		<pre class="code">
&lt;ScrollView xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    xmlns:tools=&quot;http://schemas.android.com/tools&quot;
    android:layout_width=&quot;wrap_content&quot;
    android:layout_height=&quot;wrap_content&quot;  &gt;

    &lt;RelativeLayout
    ...
</pre>
		<div class="opdrachten">
			<h2>Opdracht 3.5</h2>
			<p>Zorg er voor dat je Fooi Calculator kan scrollen zodat hij ook
				in landscape gebruikt kan worden.</p>


		</div>


		<h2>Meer action Listeners</h2>
		<p>Aan de Seekbar, de spinner en de radiogroup kun je ook Action
			Listeners koppelen.</p>
		<pre class="code">
<span class="comment">//Radiogroup</span>
import android.widget.RadioGroup.<span class="codeplus">OnCheckedChangeListener</span>;
<span class="comment">//Spinner</span>
import android.widget.AdapterView.<span class="codeplus">OnItemSelectedListener</span>;
<span class="comment">//SeekBar</span>
import android.widget.SeekBar.<span class="codeplus">OnSeekBarChangeListener</span>;
</pre>
		<p>
			Implementatie van deze <em>interfaces</em> vereist dat je de volgende
			methoden implementeert:
		</p>
		<pre class="code">
<span class="comment">/******************************************************************</span>
     <span class="comment">Event handler voor de de RadioGroup</span>
<span class="comment">******************************************************************/</span>
@Override
public void <span class="codeplus">onCheckedChanged(RadioGroup group,</span> 
    <span class="codeplus">int checkedId)</span> {
    switch (checkedId) {
        case R.id.geenAfrondingRadioButton:
            afronding = AFROND_GEEN;
            break;
        case R.id.fooiAfrondingRadioButton:
            afronding = AFROND_FOOI;
            break;
        case R.id.totaalAfrondingRadioButton:
            afronding = AFROND_TOTAAL;       
    }
    berekenEnToon();
}

<span class="comment">/*****************************************************************</span>
     <span class="comment">Event handlers voor de de SeekBar</span>
 <span class="comment">*****************************************************************/</span>

<span class="comment">//Bij schuiven percentage veranderen</span>
@Override
public void <span class="codeplus">onProgressChanged(SeekBar seekBar, int i, boolean b)</span> {
    //geenAfrondingRadioButton.setChecked(true);
    fooiPercentageInt = i;
    fooiPercentage = (double) fooiPercentageInt;
    procentTextView.setText("" + fooiPercentageInt + "%");
}

@Override
public void <span class="codeplus">onStartTrackingTouch(SeekBar seekBar)</span> {
    <span class="comment">//doe niets</span>
}

<span class="comment">//Bij loslaten berekenen</span>
@Override
public void <span class="codeplus">onStopTrackingTouch(SeekBar seekBar)</span> {
    
    berekenEnToon();
}

<span class="comment">/****************************************************</span>
<span class="comment">    Event handlers voor de de Spinner</span>
<span class="comment">*****************************************************/</span>
public void <span class="codeplus">onItemSelected(AdapterView&lt;?&gt; parent,</span> 
        <span class="codeplus">View v, int positie, long id)</span> {
    delen = positie + 1;
    berekenEnToon();
}

    public void <span class="codeplus">onNothingSelected(AdapterView&lt;?&gt; parent )</span> {
    <span class="comment">//doe niets</span>
}
</pre>

		<div class="opdrachten">
			<h2>Opdracht 3.6</h2>
			<p>Verwijder de &quot;Bereken knop&quot; en koppel Action
				Listeners aan de RadioGroup, de SeekBar en de Spinner.</p>



			<h2>Bijlage: de gebruikte code</h2>
			<div class="toonknopcontainer">
				<button class="toonknop" id="toon3_5"
					onclick="toon('uitwerking3_5')">Toon uitwerking</button>
			</div>

			<div class="uitwerking" id="uitwerking3_5">
				<p>In deze uitwerking is de Bereken knop verdwenen en zijn er
					listeners aan de widgets voor afronden (RadioGroup) en delen
					(Spinner) toegevoegd. Toevoegingen zijn gemarkeerd.</p>
				<h3>FooiCalculatorActivity.java</h3>
				<pre class="code">
package com.rocdev.android.piet.fooicalculator;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.RadioGroup;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
<span class="codeplus">import android.widget.RadioGroup.OnCheckedChangeListener;</span>
<span class="codeplus">import android.widget.AdapterView.OnItemSelectedListener;</span>
import android.widget.TextView.OnEditorActionListener;
import android.widget.SeekBar.OnSeekBarChangeListener;
import java.text.DecimalFormat;


public class FooiCalculatorActivity extends Activity
        implements OnEditorActionListener,OnSeekBarChangeListener,
        <span class="codeplus">OnCheckedChangeListener, OnItemSelectedListener</span> {

    <span class="comment">//variabelen voor de widgets</span>
    private EditText rekeningBedragEditText;
    private TextView procentTextView;
    private TextView fooiTextView;
    private TextView totaalTextView;
    private RadioGroup afrondRadioGroup;
    private Spinner delenSpinner;
    <span class="codeplus">private TextView bedragPerPersoonLabel;</span>
    <span class="codeplus">private TextView bedragPerPersoonTextView;</span>
    private SeekBar procentSeekBar;

    <span class="comment">//het SharedPreferences object</span>
    private SharedPreferences bewaardeWaardes;

    <span class="comment">//afrondings constanten</span>
    <span class="codeplus">private final int AFROND_GEEN = 0;</span>
    <span class="codeplus">private final int AFROND_FOOI = 1;</span>
    <span class="codeplus">private final int AFROND_TOTAAL = 2;</span>

    <span class="comment">//reken variabelen</span>
    private String rekeningBedragString;
    private int fooiPercentageInt = 15;
    private double fooiPercentage = (double) fooiPercentageInt;
    private int afronding = AFROND_GEEN;
    <span class="codeplus">private int delen = 1;</span>


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fooi_calculator);

        <span class="comment">//maak referenties naar de widgets</span>
        rekeningBedragEditText = (EditText) 
            findViewById(R.id.rekeningBedragEditText);
        procentTextView = (TextView) 
            findViewById(R.id.procentTextView);
        procentSeekBar = (SeekBar) 
            findViewById(R.id.procentSeekBar);
        fooiTextView = (TextView) 
            findViewById(R.id.fooiTextView);
        totaalTextView = (TextView) 
            findViewById(R.id.totaalTextView);
        afrondRadioGroup = (RadioGroup) 
            findViewById(R.id.afrondingRadioGroup);
        delenSpinner = (Spinner) 
            findViewById(R.id.delenSpinner);
        bedragPerPersoonLabel = (TextView) 
            findViewById(R.id.perPersoonLabel);
        bedragPerPersoonTextView = (TextView) 
            findViewById(R.id.bedragPerPersoonTextView);


        <span class="comment">//array adapter voor de spinner</span>
        ArrayAdapter&lt;CharSequence&gt; adapter = 
            ArrayAdapter.createFromResource(this, R.array.delen_array, 
            android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(
                android.R.layout.simple_spinner_dropdown_item);
        delenSpinner.setAdapter(adapter);

        <span class="comment">//koppel de Listeners</span>
        rekeningBedragEditText.setOnEditorActionListener(this);
        procentSeekBar.setOnSeekBarChangeListener(this);
        <span class="codeplus">afrondRadioGroup.setOnCheckedChangeListener(this);</span>
        <span class="codeplus">delenSpinner.setOnItemSelectedListener(this);</span>


       <span class="comment">/*
        SharedPreferences bewaart waardes als methode onPause() 
        wordt aangeroepen en haalt waardes weer op als onResume() 
        wordt aangeroepen
        @param &quot;BewaardeWaardes = naam of sleutel
        @param Mode_private betekent dat het alleen binnen de 
        app gebruikt mag worden
        */</span>
        bewaardeWaardes = getSharedPreferences(&quot;BewaardeWaardes&quot;, MODE_PRIVATE);
    }

    @Override
    public void onPause() {
        <span class="comment">// bewaar de variabelen</span>
        SharedPreferences.Editor editor = bewaardeWaardes.edit();
        editor.putString(&quot;rekeningBedragString&quot;, rekeningBedragString);
        fooiPercentageInt = (int) fooiPercentage;
        editor.putInt(&quot;fooiPercentageInt&quot;, fooiPercentageInt);
        editor.commit();

        super.onPause();
    }

    @Override
    public void onResume() {
        super.onResume();

        rekeningBedragString = bewaardeWaardes.getString
            (&quot;rekeningBedragString&quot;, &quot;&quot;);
        fooiPercentageInt = bewaardeWaardes.getInt
            (&quot;fooiPercentageInt&quot;, 15);
        rekeningBedragEditText.setText(rekeningBedragString);
        fooiTextView.setText(&quot;&quot; + fooiPercentageInt + &quot;%&quot;);
        fooiPercentage = (double) fooiPercentageInt;

        <span class="comment">// berekenEnToon</span>
        berekenEnToon();
    }

    private void berekenEnToon() {

        <span class="comment">// haal rekening bedrag op</span>
        rekeningBedragString = rekeningBedragEditText.getText().toString();
        double rekeningBedrag;
        if (rekeningBedragString.equals(&quot;&quot;)) {
            rekeningBedrag = 0.0;
        }
        else {
            rekeningBedrag = Double.parseDouble(rekeningBedragString);
        }

        <span class="comment">// bereken fooi en totaal</span>
        double fooiBedrag = rekeningBedrag * (fooiPercentage/100);
        if (<span class="codeplus">afronding == AFROND_FOOI</span>) {
            fooiBedrag = Math.round(fooiBedrag);
        }
        double totaalBedrag = rekeningBedrag + fooiBedrag;
        if (<span class="codeplus">afronding == AFROND_TOTAAL</span>) {
            totaalBedrag = Math.round(totaalBedrag);
            <span class="comment">//pas fooi aan aan de afronding</span>
            fooiBedrag = totaalBedrag - rekeningBedrag;
        }

        <span class="comment">// toon geformatteerde bedragen</span>
        DecimalFormat df = new DecimalFormat(&quot;€ ###,##0.00&quot;);
        fooiTextView.setText(df.format(fooiBedrag));
        totaalTextView.setText(df.format(totaalBedrag));

        procentTextView.setText(&quot;&quot; + Math.round(fooiPercentage) + &quot;%&quot;);

        <span class="comment">//bedrag wordt eventueel gedeeld</span>
        double bedragPerPersoon = 0;
        switch (<span class="codeplus">delen</span>) {
            case 1:  <span class="comment">// geen deling, verberg per persoon views</span>
                bedragPerPersoonLabel.setVisibility(View.GONE);
                bedragPerPersoonTextView.setVisibility(View.GONE);
                break;
            case 2:
            case 3:
            case 4:
                bedragPerPersoon = totaalBedrag / <span class="codeplus">delen</span>;
                bedragPerPersoonTextView.setText(df.format(bedragPerPersoon));
                bedragPerPersoonLabel.setVisibility(View.VISIBLE);
                bedragPerPersoonTextView.setVisibility(View.VISIBLE);
                break;
        }

    }

    <span class="comment">/*****************************************************************
    Event handler voor de de EditText View
    ******************************************************************/</span>
    @Override
    public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
        if (actionId == EditorInfo.IME_ACTION_DONE ||
                actionId == EditorInfo.IME_ACTION_UNSPECIFIED) {
            berekenEnToon();
        }
        return false;
    }


    <span class="comment">/******************************************************************
     Event handlers voor de de SeekBar (slider)
     ******************************************************************/</span>
    @Override
    public void onProgressChanged(SeekBar seekBar, int i, boolean b){
        fooiPercentageInt = i;
        fooiPercentage = (double) fooiPercentageInt;
        procentTextView.setText(&quot;&quot; + fooiPercentageInt + &quot;%&quot;);
    }

    @Override
    public void onStartTrackingTouch(SeekBar seekBar) {
        <span class="comment">//doe niets</span>
    }

    @Override
    public void onStopTrackingTouch(SeekBar seekBar) {
        berekenEnToon()</span>;
    }


    <span class="comment">/******************************************************************
     Event handler voor de de RadioGroup
     ******************************************************************/</span>
    @Override
    public void onCheckedChanged(RadioGroup group, 
        int checkedId) {
        switch (checkedId) {
            case R.id.geenAfrondingRadioButton:
                <span class="codeplus">afronding = AFROND_GEEN;</span>
                break;
            case R.id.fooiAfrondingRadioButton:
                <span class="codeplus">afronding = AFROND_FOOI;</span>
                break;
            case R.id.totaalAfrondingRadioButton:
                <span class="codeplus">afronding = AFROND_TOTAAL;</span>       
        }
        <span class="codeplus">berekenEnToon();</span>
    }

    <span class="comment">/******************************************************************
     Event handlers voor de de Spinner
     ******************************************************************/</span>
    public void onItemSelected(AdapterView&lt;?&gt; parent,
        View v, int positie, long id) {
        <span class="codeplus">delen</span> = positie + 1;
        berekenEnToon();
    }

    public void onNothingSelected(AdapterView&lt;?&gt; parent ) {
        <span class="comment">//doe niets</span>
    }
}
</pre>
				<h3>activity_fooi_calculator.xml</h3>
				<pre class="code">
&lt;ScrollView xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    xmlns:tools=&quot;http://schemas.android.com/tools&quot;
    android:layout_width=&quot;wrap_content&quot;
    android:layout_height=&quot;wrap_content&quot;
    &gt;

    &lt;RelativeLayout
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;match_parent&quot;
        android:paddingLeft=&quot;@dimen/activity_horizontal_margin&quot;
        android:paddingRight=&quot;@dimen/activity_horizontal_margin&quot;
        android:paddingTop=&quot;@dimen/activity_vertical_margin&quot;
        android:paddingBottom=&quot;@dimen/activity_vertical_margin&quot;
        tools:context=&quot;.FooiCalculatorActivity&quot; &gt;

        &lt;TextView
            android:id=&quot;@+id/rekeningBedragLabel&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:padding=&quot;10dp&quot;
            android:text=&quot;@string/rekening_bedrag_label&quot;
            android:textSize=&quot;20sp&quot;
            android:textStyle=&quot;bold&quot; /&gt;

        <span class="comment">&lt;!--het invoerveld--&gt;</span>

        &lt;EditText
            android:id=&quot;@+id/rekeningBedragEditText&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_alignBaseline=&quot;@+id/rekeningBedragLabel&quot;
            android:layout_marginLeft=&quot;25dp&quot;
            android:layout_toRightOf=&quot;@+id/rekeningBedragLabel&quot;
            android:ems=&quot;8&quot;
            android:inputType=&quot;numberDecimal&quot;
            android:text=&quot;@string/rekening_bedrag&quot;
            android:textSize=&quot;20sp&quot; &gt;

            &lt;requestFocus /&gt;
        &lt;/EditText&gt;

        <span class="comment">&lt;!-- fooi percentage --&gt;</span>

        &lt;TextView
            android:id=&quot;@+id/procentLabel&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_alignLeft=&quot;@+id/rekeningBedragLabel&quot;
            android:layout_below=&quot;@+id/rekeningBedragLabel&quot;
            android:padding=&quot;10dp&quot;
            android:text=&quot;@string/fooi_percentage_label&quot;
            android:textSize=&quot;20sp&quot;
            android:textStyle=&quot;bold&quot; /&gt;

        
        <span class="comment">&lt;!--Overbodige knoppen--&gt;</span>
        
        <span class="comment">&lt;!--&lt;Button--&gt;
            &lt;!--android:id=&quot;@+id/procentMinButton&quot;--&gt;
            &lt;!--android:layout_width=&quot;45dp&quot;--&gt;
            &lt;!--android:layout_height=&quot;45dp&quot;--&gt;
            &lt;!--android:layout_alignBaseline=&quot;@+id/procentTextView&quot;--&gt;
            &lt;!--android:layout_toRightOf=&quot;@+id/procentTextView&quot;--&gt;
            &lt;!--android:layout_marginLeft=&quot;25dp&quot;--&gt;
            &lt;!--android:text=&quot;@string/min_knop&quot;--&gt;
            &lt;!--android:textSize=&quot;20sp&quot; /&gt;--&gt;</span>

        <span class="comment">&lt;!--&lt;Button--&gt;
            &lt;!--android:id=&quot;@+id/procentPlusButton&quot;--&gt;
            &lt;!--android:layout_width=&quot;45dp&quot;--&gt;
            &lt;!--android:layout_height=&quot;45dp&quot;--&gt;
            &lt;!--android:layout_alignBaseline=&quot;@+id/procentMinButton&quot;--&gt;
            &lt;!--android:layout_toRightOf=&quot;@+id/procentMinButton&quot;--&gt;
            &lt;!--android:text=&quot;@string/plus_knop&quot;--&gt;
            &lt;!--android:textSize=&quot;20sp&quot; /&gt;  --&gt;</span>



        <span class="comment">&lt;!--slider in plaats van knoppen--&gt;</span>
        &lt;SeekBar
            android:id=&quot;@+id/procentSeekBar&quot;
            android:layout_width=&quot;180dp&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_toRightOf=&quot;@id/procentLabel&quot;
            android:layout_alignBottom=&quot;@id/procentLabel&quot;
            android:max=&quot;30&quot;
            android:progress=&quot;15&quot; /&gt;


        &lt;TextView
            android:id=&quot;@+id/procentTextView&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_below=&quot;@id/rekeningBedragEditText&quot;
            android:layout_toRightOf=&quot;@id/procentSeekBar&quot;
            android:layout_alignBottom=&quot;@id/procentLabel&quot;
            android:padding=&quot;10dp&quot;
            android:textSize=&quot;20sp&quot;
            android:text=&quot;@string/fooi_percentage&quot;
            /&gt;

       <span class="comment"> &lt;!-- fooi bedrag --&gt;</span>

        &lt;TextView
            android:id=&quot;@+id/fooiLabel&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_alignLeft=&quot;@+id/procentLabel&quot;
            android:layout_below=&quot;@+id/procentLabel&quot;
            android:layout_marginTop=&quot;5dp&quot;
            android:padding=&quot;10dp&quot;
            android:text=&quot;@string/fooi_bedrag_label&quot;
            android:textSize=&quot;20sp&quot;
            android:textStyle=&quot;bold&quot; /&gt;

        &lt;TextView
            android:id=&quot;@+id/fooiTextView&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_alignBaseline=&quot;@+id/fooiLabel&quot;
            android:layout_alignLeft=&quot;@id/rekeningBedragEditText&quot;
            android:padding=&quot;5dp&quot;
            android:text=&quot;@string/fooi_bedrag&quot;
            android:textSize=&quot;20sp&quot; /&gt;

        <span class="comment">&lt;!-- totaal bedrag --&gt;</span>

        &lt;TextView
            android:id=&quot;@+id/totaalLabel&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_alignLeft=&quot;@+id/fooiLabel&quot;
            android:layout_below=&quot;@+id/fooiLabel&quot;
            android:padding=&quot;10dp&quot;
            android:text=&quot;@string/totaal_bedrag_label&quot;
            android:textSize=&quot;20sp&quot;
            android:textStyle=&quot;bold&quot; /&gt;

        &lt;TextView
            android:id=&quot;@+id/totaalTextView&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_alignBaseline=&quot;@+id/totaalLabel&quot;
            android:layout_alignLeft=&quot;@+id/fooiTextView&quot;
            android:padding=&quot;5dp&quot;
            android:text=&quot;@string/totaal_bedrag&quot;
            android:textSize=&quot;20sp&quot; /&gt;

        <span class="comment">&lt;!-- de scheidingslijn --&gt;</span>

        &lt;View
            android:id=&quot;@+id/scheidslijn&quot;
            android:layout_alignLeft=&quot;@+id/totaalLabel&quot;
            android:layout_below=&quot;@+id/totaalLabel&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;1dp&quot;
            android:padding=&quot;5dp&quot;
            android:background=&quot;@android:color/black&quot; /&gt;

        <span class="comment">&lt;!--afronding--&gt;</span>

        &lt;TextView
            android:id=&quot;@+id/afrondLabel&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_alignLeft=&quot;@+id/scheidslijn&quot;
            android:layout_below=&quot;@+id/scheidslijn&quot;
            android:padding=&quot;10dp&quot;
            android:text=&quot;@string/afronding_label&quot;
            android:textSize=&quot;20sp&quot;
            android:textStyle=&quot;bold&quot; /&gt;

        &lt;RadioGroup
            android:id=&quot;@+id/afrondingRadioGroup&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_below=&quot;@+id/scheidslijn&quot;
            android:layout_toRightOf=&quot;@+id/afrondLabel&quot;
            android:layout_alignLeft=&quot;@id/totaalTextView&quot;&gt;

            &lt;RadioButton
                android:id=&quot;@+id/geenAfrondingRadioButton&quot;
                android:layout_width=&quot;wrap_content&quot;
                android:layout_height=&quot;wrap_content&quot;
                android:checked=&quot;true&quot;
                android:text=&quot;@string/geen_afronding&quot; /&gt;

            &lt;RadioButton
                android:id=&quot;@+id/fooiAfrondingRadioButton&quot;
                android:layout_width=&quot;wrap_content&quot;
                android:layout_height=&quot;wrap_content&quot;
                android:text=&quot;@string/fooi_afronding&quot; /&gt;

            &lt;RadioButton
                android:id=&quot;@+id/totaalAfrondingRadioButton&quot;
                android:layout_width=&quot;wrap_content&quot;
                android:layout_height=&quot;wrap_content&quot;
                android:text=&quot;@string/totaal_afronding&quot; /&gt;
        &lt;/RadioGroup&gt;

        &lt;TextView
            android:id=&quot;@+id/delenLabel&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:text=&quot;@string/delen_label&quot;
            android:layout_below=&quot;@+id/afrondingRadioGroup&quot;
            android:layout_alignStart=&quot;@id/afrondLabel&quot;
            android:layout_alignLeft=&quot;@id/afrondLabel&quot;
            android:padding=&quot;10dp&quot;
            android:textSize=&quot;20sp&quot;
            android:textStyle=&quot;bold&quot;  /&gt;

        &lt;Spinner
            android:id=&quot;@+id/delenSpinner&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_below=&quot;@id/afrondingRadioGroup&quot;
            android:layout_alignLeft=&quot;@+id/afrondingRadioGroup&quot; /&gt;

        &lt;TextView
            android:id=&quot;@+id/perPersoonLabel&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_alignLeft=&quot;@+id/delenLabel&quot;
            android:layout_below=&quot;@+id/delenLabel&quot;
            android:padding=&quot;10dp&quot;
            android:text=&quot;@string/delen_per_persoon&quot;
            android:textSize=&quot;20sp&quot;
            android:textStyle=&quot;bold&quot; /&gt;

        &lt;TextView
            android:id=&quot;@+id/bedragPerPersoonTextView&quot;
            android:layout_width=&quot;wrap_content&quot;
            android:layout_height=&quot;wrap_content&quot;
            android:layout_below=&quot;@+id/delenSpinner&quot;
            android:layout_alignLeft=&quot;@id/delenSpinner&quot;
            android:layout_alignBaseline=&quot;@+id/perPersoonLabel&quot;
            android:text=&quot;@string/bedrag_per_persoon&quot;
            android:textSize=&quot;20sp&quot;
            android:textStyle=&quot;bold&quot; /&gt;
		
        <span class="comment">&lt;!-- vervangen door action listeners
        &lt;!--&lt;Button--&gt;
            &lt;!--android:id=&quot;@+id/berekenButton&quot;--&gt;
            &lt;!--android:layout_width=&quot;match_parent&quot;--&gt;
            &lt;!--android:layout_height=&quot;wrap_content&quot;--&gt;
            &lt;!--android:gravity=&quot;center&quot;--&gt;
            &lt;!--android:text=&quot;@string/pas_toe_knop&quot;--&gt;
            &lt;!--android:layout_below=&quot;@id/bedragPerPersoonTextView&quot;--&gt;
            &lt;!--android:layout_marginTop=&quot;30dp&quot;  /&gt;--&gt;
        --&gt;</span>    

    &lt;/RelativeLayout&gt;

&lt;/ScrollView&gt;

</pre>

			</div>
		</div>
	</div>
</div>

<%@ include file="/AO/android/includes/bottom.html"%>
</html>
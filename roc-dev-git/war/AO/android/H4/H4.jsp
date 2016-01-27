<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">
<%@ include file="/AO/android/includes/zijmenu.jsp"%>




      
      <div class="col-md-9">
      <h2>4 Thema&#39;s &amp; stijlen</h2>
  
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
	    	<h2>Leerdoelen</h2>
			<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
			<ul>
				<li>weet hoe je een stijl maakt en toepast</li>
				<li>weet hoe je stijlen kunt laten erven van standaard Android stijlen en 
				eigen gemaakte stijlen</li>
				<li>weet waar je de standaard Android stijlen kunt vinden</li>
				<li>weet waar je de xml properties van Views kunt vinden</li>
				<li>weet hoe je verschillende thema&#39;s voor verschillende Android versies kunt maken</li>
				<li>weet hoe je kleuren kunt gebruiken</li>
				
			</ul>
		</div>

       
        <!-- inhoud -->
        
		<img src="/AO/android/H4/stijl.png">
		<p>In het vorige hoofdstuk heb je de properties van de widgets handmatig 
		ingesteld. Je hebt bijvoorbeeld de textSize property van ieder label en Textview 
		ingesteld zodat ze allemaal even groot zijn. In dit hoofdstuk gaan we werken met 
		themes en styles zodat dat automatisch gebeurt en inhoud en design volledig van 
		elkaar worden gescheiden. Dit maakt het ontwerp consistenter, helpt om de hoeveelheid 
		code te beperken en maakt je app gemakkelijker onderhoudbaar.</p>
		<p>
		<p>Android gebruikt ingebouwde thema&#39;s en stijlen. Een stijl is verzameling 
					properties die bepaalt hoe een widget er uit ziet. Een thema is een stijl die van toepassing 
					is op een gehele Activity of de gehele app. Onderstaande afbeeldingen tonen drie 
					verschillende thema&#39;s voor de fooi calculator. Bij de eerste twee is het &quot;Material&quot; thema 
					dat vanaf API 21 (Android 5.0) kan worden gebruikt, maar niet werkt op oudere versies. Bij de 
					derde is het &quot;Holo&quot; thema gebruikt dat vanaf API 14 (Android 4.0) kan worden 
					gebruikt. Bij de ontwikkeling van een app moet je dus rekening houden met verschillende versies 
					die verschillende thema&#39;s kunnen hebben. Als je je app geschikt wilt maken voor oudere 
					versies, moet je ook een thema kiezen dat voor de oudste versie gebruikt kan worden. 
					</p>
					<img src="/AO/android/H4/mat_l_da.png" width=180>
					<img src="/AO/android/H4/mat_l.png" width=180>	
					<img src="/AO/android/H4/hol_l.png" width=180>				
					<p>In studio kun je in je activity.xml file een preview zien van verschillende thema&#39;s.</p>
					<h3>Een stijl maken</h3>
					<p>Onze fooicalculator uit het vorige hoofdstuk heeft een aantal TextViews die als label 
					fungeren. Al deze labels hebben een aantal dezelfde stijl kenmerken (properties):</p>
<pre class="code">
<span class="comment">&lt;!-- een willekeurig label--&gt;</span>
&lt;TextView
    android:id=&quot;@+id/rekeningBedragLabel&quot;
    <span class="codeplus">android:layout_width=&quot;wrap_content&quot;</span>
    <span class="codeplus">android:layout_height=&quot;wrap_content&quot;</span>
    <span class="codeplus">android:padding=&quot;10dp&quot;</span>
    android:text=&quot;@string/rekening_bedrag_label&quot;
    <span class="codeplus">android:textSize=&quot;20sp&quot;</span>
    <span class="codeplus">android:textStyle=&quot;bold&quot; /&gt;</span>
    
    
</pre>				<div class="opdrachten">
						<h2>Opdracht 4.1</h2>	
						<p>Open in de map values het bestand styles.xml. Kies een thema dat geschikt is voor 
						je minimum api versie en neem nu als volgt de stijl elementen 
						van je labels op in het bestand:</p>
<pre class="code">
&lt;resources&gt;

    <span class="comment">&lt;!-- Base application theme. --&gt;</span>
    &lt;style name=&quot;AppTheme&quot; parent=&quot;android:Theme.Holo.Light.DarkActionBar&quot;&gt;
        <span class="comment">&lt;!-- Eventuele aanpassingen thema komen hier--&gt;</span>
    &lt;/style&gt;
    
    
    &lt;style name=&quot;Label&quot; parent=&quot;@android:style/TextAppearance.Medium&quot; &gt;
        &lt;item name=&quot;android:layout_width&quot;&gt;wrap_content&lt;/item&gt;
        &lt;item name=&quot;android:layout_height&quot;&gt;wrap_content&lt;/item&gt;
        &lt;item name=&quot;android:paddingLeft&quot;&gt;10dp&lt;/item&gt;
        &lt;item name=&quot;android:textSize&quot;&gt;20sp&lt;/item&gt;
        &lt;item name=&quot;android:textStyle&quot;&gt;bold&lt;/item&gt;
        &lt;item name=&quot;android:layout_marginTop&quot;&gt;25dp&lt;/item&gt;
    &lt;/style&gt;


&lt;/resources&gt;
</pre>					
						<p>Nu kun je in al je TextViews die als label fungeren de stijlelementen 
						weghalen en als volgt vervangen:</p>
<pre class="code">
&lt;TextView
    <span class="codeplus">style=&quot;@style/Label&quot;</span>
    android:id=&quot;@+id/rekeningBedragLabel&quot;
    android:text=&quot;@string/rekening_bedrag_label&quot;  /&gt;
</pre>					
					
					</div>
					
				
					<h3>Overerving van stijlen</h3>
					<p>Een stijl kun je een &quot;parent&quot; geven. De parent is ook een stijl. De kindstijl erft dan alle eigenschappen 
					van z&#39;n ouder. Alleen de items die je definieert overriden de parent stijl. Je kunt 
					de standaard stijlen van Android gebruiken of je eigen gedefinieerde stijlen. Zie voorbeelden.</p>
<pre class="code">
<span class="comment">//erft een Android stijl</span>
&lt;style name=&quot;Label&quot; <span class="codeplus">parent=&quot;@android:style/TextAppearance.Medium&quot;</span> &gt;
    &lt;item name=&quot;android:layout_width&quot;&gt;wrap_content&lt;/item&gt;
    &lt;item name=&quot;android:layout_height&quot;&gt;wrap_content&lt;/item&gt;
    &lt;item name=&quot;android:paddingLeft&quot;&gt;10dp&lt;/item&gt;
    &lt;item name=&quot;android:textSize&quot;&gt;20sp&lt;/item&gt;
    &lt;item name=&quot;android:textStyle&quot;&gt;bold&lt;/item&gt;
    &lt;item name=&quot;android:layout_marginTop&quot;&gt;25dp&lt;/item&gt;
&lt;/style&gt;

<span class="comment">//erft een eigen stijl</span>
&lt;style name=&quot;<span class="codeplus">Label.Rood&quot;</span> &gt;
    &lt;item name=&quot;android:textColor&quot;&gt;#FF0000&lt;/item&gt;
&lt;/style&gt;

</pre>					
				<p>Een uitputtende lijst van Android stijlen vind je in de 
				<a href="http://developer.android.com/reference/android/R.style.html" target="_blank">R.style klasse</a>. 
				Je kunt de stijlen aanroepen door het liggende streepje van de constante in een punt te veranderen. 
				Het in bovenstaande voorbeeld gebruikte  
				<b>TextAppearance.Medium</b> is afgeleid van de constante 
				<a href="http://developer.android.com/reference/android/R.style.html#TextAppearance_Medium" target="_blank">
				TextAppearance_Medium</a> van deze klasse.</p>
				<p>Merk op dat bij het erven van eigen stijlen met een punt wordt aangegeven dat 
				de stijl een kind is van &quot;Label&quot;. Dit mag alleen bij je eigen gedefinieerde stijlen. Op deze manier kun je 
				eindeloos doorgaan met 
				het aaneenschakelen van stijlen.</p>
				
<pre class="code">
&lt;style name=&quot;Label.Rood&quot; &gt;
    &lt;item name=&quot;android:textColor&quot;&gt;#FF0000&lt;/item&gt;
&lt;/style&gt;

&lt;style name=&quot;<span class="codeplus">Label.Rood.Groot&quot</span>; &gt;
    &lt;item name=&quot;android:textSize&quot;&gt;30sp&lt;/item&gt;
&lt;/style&gt;
</pre>				

					<div class="opdrachten">
						<h2>Opdracht 4.2</h2>
						<p>Laat je in 4.1 gemaakte stijl erven van een Android stijl zoals in bovenstaand voorbeeld</p>
						<p>Maak een nieuwe stijl die erft van je stijl uit de vorige opdracht en verander 
						&eacute;&eacute;n of meer 
						properties. Pas de nieuwe stijl toe.</p>
					</div>
					
					<p>Nu je weet hoe je stijlen kunt toepassen, is het handig om te weten welke stijl 
					properties je allemaal kunt gebruiken. Een aantal zoals TextSize en TextColor ken je inmiddels. 
					Om een overzicht te krijgen van alle xml attributen ga je naar de klasse van de bewuste View. Onder &quot;
					xml attributes&quot; vind je alle xml attributen die je kunt gebruiken en ook de bijbehorende java methoden. Zie 
					<a href="http://developer.android.com/reference/android/widget/TextView.html" target="_blank">voorbeeld TextView</a>
					
					<h3>Een thema aanpassen</h3>
					<p>Het thema van je app wordt gedefinieerd in het AndroidManifest.xml file.</p>
<pre class="code">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;manifest xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
    package=&quot;com.example.piet.fooithemestyle&quot; &gt;

    &lt;application
        android:allowBackup=&quot;true&quot;
        android:icon=&quot;@drawable/ic_launcher&quot;
        android:label=&quot;@string/app_name&quot;
        <span class="codeplus">android:theme=&quot;@style/AppTheme&quot; &gt;</span>
        &lt;activity
            android:name=&quot;.MainActivity&quot;
            android:label=&quot;@string/app_name&quot; &gt;
            &lt;intent-filter&gt;
                &lt;action android:name=&quot;android.intent.action.MAIN&quot; /&gt;

                &lt;category android:name=&quot;android.intent.category.LAUNCHER&quot; /&gt;
            &lt;/intent-filter&gt;
        &lt;/activity&gt;
    &lt;/application&gt;

&lt;/manifest&gt;
</pre>					
					<p>In het styles.xml file krijgt het thema een geschikte parent en kun je bepaalde items aanpassen.</p> 
<pre class="code">
&lt;resources&gt;

    <span class="comment">&lt;!-- Base application theme. --&gt;</span>
    <span class="codeplus">&lt;style name=&quot;AppTheme&quot; parent=&quot;android:Theme.Holo.Light.DarkActionBar&quot;&gt;</span>
        <span class="codeplus">&lt;item name=&quot;android:textViewStyle&quot;&gt;@style/TextView&lt;/item&gt;</span>
        <span class="codeplus">&lt;item name=&quot;android:editTextStyle&quot;&gt;@style/EditText&lt;/item&gt;</span>
        <span class="codeplus">&lt;item name=&quot;android:buttonStyle&quot;&gt;@style/Button&lt;/item&gt;</span>
    &lt;/style&gt;

    &lt;style name=&quot;Label&quot; parent=&quot;@android:style/TextAppearance.Medium&quot; &gt;
        &lt;item name=&quot;android:layout_width&quot;&gt;wrap_content&lt;/item&gt;
        &lt;item name=&quot;android:layout_height&quot;&gt;wrap_content&lt;/item&gt;
        &lt;item name=&quot;android:paddingLeft&quot;&gt;10dp&lt;/item&gt;
        &lt;item name=&quot;android:textSize&quot;&gt;20sp&lt;/item&gt;
        &lt;item name=&quot;android:textStyle&quot;&gt;bold&lt;/item&gt;
        &lt;item name=&quot;android:layout_marginTop&quot;&gt;25dp&lt;/item&gt;
    &lt;/style&gt;

    <span class="codeplus">&lt;style name=&quot;TextView&quot; parent=&quot;@android:style/Widget.TextView&quot;&gt;</span>
        &lt;item name=&quot;android:textSize&quot;&gt;20sp&lt;/item&gt;
    &lt;/style&gt;

    <span class="codeplus">&lt;style name=&quot;EditText&quot; parent=&quot;@android:style/Widget.EditText&quot;&gt;</span>
        &lt;item name=&quot;android:textSize&quot;&gt;20sp&lt;/item&gt;
    &lt;/style&gt;

    <span class="codeplus">&lt;style name=&quot;Button&quot; parent=&quot;@android:style/Widget.Button&quot;&gt;</span>
        &lt;item name=&quot;android:textSize&quot;&gt;20sp&lt;/item&gt;
        &lt;item name=&quot;android:textStyle&quot;&gt;bold&lt;/item&gt;
    &lt;/style&gt;

    
&lt;/resources&gt;

</pre>				
					<p>In bovenstaande code is gekozen voor het Holo.Light.DarkActionBar thema. De TextView, EditText en Button stijlen  
					erven alle eigenschappen van hun ouders en er worden een aantal elementen aangepast. Aangezien de 3 aangepaste stijlen 
					het thema overriden, worden ze nu automatisch op alle TextView, EditText en Button widgets toegepast. Als je een thema 
					wilt aanpassen moet je vaak de nodige research doen en experimenteren om er achter te komen welke attributen en stijlen 
					je kunt veranderen. De attributen van standaard thema&#39;s die je kunt aanpassen kun je vinden in de 
					<a href="http://developer.android.com/reference/android/R.styleable.html#Theme" target="_blank">R.styleable</a> klasse.</p>
					<p>Je kunt een thema toepassen op de gehele app met het thema attribuut in je AndroidManifest.xml file binnen de 
					&lt;application&gt; tag. Om een thema op een specifieke Activity toe te passen benoem je het thema binnen de &lt;activity&gt; tag. 
					Het activity thema krijgt in zo&#39;n geval voorrang boven het app thema.</p>
						
					<div class="opdrachten">
						<h2>Opdracht 4.3</h2>
						<p>Probeer verschillende thema&#39;s uit en pas de attributen van de widgets aan volgens bovenstaande voorbeelden</p>
					</div>
					
					<h3>Platform afhankelijke thema&#39;s</h3>
					<p>Als je een thema wilt gebruiken dat is ontwikkeld voor een nieuwer platform maar je app ook voor oudere modellen 
					geschikt wilt maken, dan kun je een nieuwe map maken in de res directory. Stel je wilt het Material thema gebruiken voor 
					android API 21 en het Holo thema voor oudere modellen. Maak een map genaamd values-v21 in de res map. Kopieer het styles.xml 
					bestand in de nieuwe map en verander het thema als volgt:</p>
					<h4>res/values</h4>
					
<pre class="code">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;resources&gt;
    &lt;style name=&quot;AppTheme&quot; <span class="codeplus">parent=&quot;android:Theme.Holo.Light&quot;&gt;</span>
    &lt;/style&gt;
&lt;/resources&gt;
</pre>					
					<h4>res/values-v21</h4>
<pre class="code">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;resources&gt;
    &lt;style name=&quot;AppTheme&quot; <span class="codeplus">parent=&quot;android:Theme.Material.Light&quot;&gt;</span>
    &lt;/style&gt;
&lt;/resources&gt;
</pre>					
					<p>Afhankelijk van de Android versie van de telefoon waar de app op is ge&iuml;nstalleerd zal nu het nieuwst 
					toepasbare thema worden gebruikt.</p>
					
					<div class="opdrachten">
						<h2>Opdracht 4.4</h2>
						<p>Gebruik voor de fooi calculator twee thema&#39;s voor verschillende versies, bijvoorbeeld het Material thema 
						voor API 21 en het Holo thema voor oudere versies.</p>
					</div>
					
					<h3>Kleuren</h3>
					<p>Als je kleuren gaat gebruiken is het aan te raden een kleurenschema te maken in een file genaamd colors.xml 
					in de values map. Kleuren worden met hexadecimale waardes aangegeven. Een kleurenschema zou er bijvoorbeeld 
					als volgt uit kunnen zien:</p>
					
<pre class="code">					
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;resources&gt;
    &lt;color name=&quot;primair&quot;&gt;#141315&lt;/color&gt;
    &lt;color name=&quot;secundair&quot;&gt;#736C6B&lt;/color&gt;
    &lt;color name=&quot;tertiair&quot;&gt;#DDE0CE&lt;/color&gt;
    &lt;color name=&quot;achtergrond&quot;&gt;#A6D39D&lt;/color&gt;
    &lt;color name=&quot;donker&quot;&gt;#000000&lt;/color&gt;
    &lt;color name=&quot;licht&quot;&gt;#FFFFFF&lt;/color&gt;
&lt;/resources&gt;					
</pre>					
			<p>Nu kun je in je stylesheet de kleuren aanroepen bijvoorbeeld om een tekst van een widget een kleur te geven:</p>
			
<pre class="code">
&lt;TextView
    android:id=&quot;@+id/procentLabel&quot;
    style=&quot;@style/Label&quot;
    <span class="codeplus">android:textColor=&quot;@color/primair&quot;</span>
    android:layout_alignLeft=&quot;@+id/rekeningBedragLabel&quot;
    android:layout_below=&quot;@+id/rekeningBedragLabel&quot;
    android:text=&quot;@string/fooi_percentage_label&quot;
/&gt;
</pre>			

			<p>In je stylesheet kun je nu een kleur geven aan al je labels.</p>
			
<pre class="code">
&lt;style name=&quot;Label&quot; parent=&quot;@android:style/TextAppearance.Medium&quot; &gt;
    &lt;item name=&quot;android:layout_width&quot;&gt;wrap_content&lt;/item&gt;
    &lt;item name=&quot;android:layout_height&quot;&gt;wrap_content&lt;/item&gt;
    &lt;item name=&quot;android:paddingLeft&quot;&gt;10dp&lt;/item&gt;
    &lt;item name=&quot;android:textSize&quot;&gt;20sp&lt;/item&gt;
    &lt;item name=&quot;android:textStyle&quot;&gt;bold&lt;/item&gt;
    <span class="codeplus">&lt;item name=&quot;android:textColor&quot;&gt;@color/primair&lt;/item&gt;</span>
    &lt;item name=&quot;android:layout_marginTop&quot;&gt;25dp&lt;/item&gt;
&lt;/style&gt;
</pre>					
			
			
			<p>Ook kun je de kleuren in je thema toepassen:</p>
<pre class="code">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;resources&gt;
    &lt;style name=&quot;AppTheme&quot; parent=&quot;android:Theme.Material.Light&quot;&gt;
        <span class="codeplus">&lt;item name=&quot;android:windowBackground&quot;&gt;@color/achtergrond&lt;/item&gt;</span>
    &lt;/style&gt;
&lt;/resources&gt;
</pre>		


			<div class="opdrachten">
						<h2>Opdracht 4.5</h2>
						<p>Maak een kleurenschema voor de fooi calculator en pas het toe.</p>
					</div>		
		</div>


	
<%@ include file="/AO/android/includes/bottom.html"%>

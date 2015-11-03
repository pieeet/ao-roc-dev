<%@ include file="/AO/android/includes/pagetop.jsp"%>

<%
	if (user != null) {
%>

<div class="col-md-9">
	<h2>1 Ontwikkelomgeving</h2>

	<!-- Leerdoelen -->
	<div class="bs-callout bs-callout-warning">
		<h2>Leerdoelen</h2>
		<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
			je:</p>
		<ul>
			<li>Android Studio hebt ge&iuml;nstalleerd</li>
			<li>De SDK Manager kunt gebruiken</li>
			<li>Een beeld hebt van de structuur van een Android project</li>
			<li>Een virtual device en/of een Android telefoon kunt gebruiken
				om te testen</li>
		</ul>
	</div>

	<!-- inhoud -->

	<img src="AndroidStudio.png" alt="Android Logo" width="300">
	<p>Android Studio (studio) is een nieuwe ontwikkelomgeving die door
		Google en de makers van de IntelliJ IDEA wordt ontwikkeld. Op het
		moment van schrijven is studio nog in ontwikkeling (b&#232;ta), maar
		voldoende functioneel om mee aan de slag te gaan. Volgens Google wordt
		studio - als hij uitontwikkeld is - de offici&euml;le Android IDE.</p>

	<h2>Installatie</h2>
	<p>
		Download <a
			href="https://developer.android.com/sdk/installing/studio.html"
			target="_blank">Android Studio</a> op je computer en installeer het.
	</p>
	<p>Als installatie gelukt is open je studio. In het Quick Start
		menu kies je &quot;Configure&quot; en daarna &quot; SDK Manager&quot;.
	</p>

	<h2>De SDK manager</h2>
	<p>
		Studio maakt gebruik van de Android SDK en aanvullende bibliotheken
		die nodig zijn om Android Apps te ontwikkelen. Deze kun je vanuit
		studio beheren met de <a
			href="http://developer.android.com/tools/help/sdk-manager.html"
			target="_blank">SDK Manager</a>.
	</p>
	<img src="sdkm_icon.png">
	<p>Installeer de meest recente versies van de volgende pakketten in
		de SDK manager</p>
	<ul>
		<li>Tools
			<ul>
				<li>Android SDK Tools</li>
				<li>Android SDK Platform-tools</li>
				<li>Android SDK Build-tools</li>
			</ul>
		</li>
		<li>Laatste Android API (bijvoorbeeld Android 5.0(API 21))
			<ul>
				<li>SDK platform</li>
				<li>ARM EABI v7a <em>System Image</em></li>
			</ul>
		</li>
		<li>Minimum API (bijvoorbeeld Android 2.3.3)
			<ul>
				<li>SDK platform</li>
			</ul>
		</li>
		<li>Extras
			<ul>
				<li>Android Support Repository</li>
				<li>Android Support Library</li>
				<li>Google USB driver (Windows)</li>
			</ul>
		</li>

	</ul>

	<p>



		Nadat de pakketten zijn ge&iuml;nstalleerd keer je terug naar het
		start scherm (Quick Start menu) en kies je
		<code>New Project</code>
		. Kies desgevraagd voor &quot;Blank Activity&quot; en kies als
		minimum-sdk de minimum API die je net hebt ge&iuml;nstalleerd. Als het
		goed is krijg je het volgende scherm te zien.
	</p>
	<img src="studio_start.jpg" width="800">
	<h2>Projectstructuur</h2>
	<p>Wanneer je een nieuw project start maakt studio een simpele app
		aan met &eacute;&eacute;n &quot;Activity&quot; (scherm ) die de tekst
		"Hello world!" toont.</p>
	<p>Aan de linkerkant zie je de projectstructuur en de bestanden die
		studio voor je app heeft aangemaakt. In de map java bevinden zich de
		java bestanden en in de map res (resources) vind je xml files. Voor nu
		zijn drie bestanden van belang:</p>

	<h3>activity_main.xml</h3>
	<p>Dit bestand vind je in de map layout. Hiermee bouw je de
		user-interface van de &quot;Activity&quot;. Een Activity is in Android
		de benaming voor een scherm. Je kunt het xml bestand op twee manieren
		bewerken. Onderin het scherm zie je twee tabs: Design en Text. In de
		design tab kun je elementen vanaf het palet links naar het scherm
		slepen. In de Text tab kun je de xml-code bekijken en aanpassen. De
		tekst Hello world! is een element van het type TextView.</p>
	<pre class="code">
&lt;TextView 
	<span class="codeplus">android:text=&quot;@string/hello_world&quot;</span>
	android:layout_width=&quot;wrap_content&quot;
	android:layout_height=&quot;wrap_content&quot; /&gt;
</pre>


	<h3>strings.xml</h3>
	<p>In de map values vind je o.m. een bestand strings.xml. In
		Android worden strings in een apart xml bestand gemaakt. Dit is gedaan
		om het gemakkelijker te maken apps voor verschikkende talen te maken.
		Als je het bestand opent zie je dat er een aantal strings is gemaakt.
		De tekst Hello world! wordt met de volgende regel gemaakt:</p>
	<pre class="code">
&lt;resources&gt;

    &lt;string name=&quot;app_name&quot;&gt;Test&lt;/string&gt;
    <span class="codeplus">&lt;string name=&quot;hello_world&quot;&gt;Hello world!&lt;/string&gt;</span>
    &lt;string name=&quot;action_settings&quot;&gt;Settings&lt;/string&gt;

&lt;/resources&gt;
</pre>


	<h3>MainActivity.java</h3>
	<p>Deze klasse is een subklasse van Activity. Als de app wordt
		gestart wordt de methode onCreate() van deze klasse aangeroepen. De
		klasse maakt gebruik van de klasse R. In deze klasse bevinden zich de
		gecompileerde xml resources.</p>

	<pre class="code">
@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(<span class="codeplus">R.layout.activity_main);</span>
}
</pre>
	<h2>Testen</h2>
	<p>
		Je kunt je apps in studio testen op een Android Virtual Device (AVD).
		Hiervoor moet je er eerst &eacute;&eacute;n aanmaken met de AVD
		Manager. Zoek bovenin je taakbalk naar het icoontje met de AVD Manager
		en klik hierop. Om een virtual device te maken moet er een geschikte <em>&quot;System
			Image&quot;</em> ge&iuml;nstalleerd zijn. Als je dit nog niet had gedaan
		kun je het nu doen met behulp van de SDK Manager. AVD&#39;s zijn in
		het algemeen nogal traag.
	</p>
	<p>Als je een Android telefoon hebt kun je die ook gebruiken om je
		apps te testen. Hiervoor moet je &quot;Developer Options&quot;
		activeren. Op nieuwere Android modellen zijn deze verborgen. Je kunt
		ze activeren door in je instellingen naar de sectie &quot;Over de
		telefoon&quot; te gaan en 7x op &quot;Build-nummer&quot; te tikken.
		Hierna zie je in je instellingen {} Opties voor ontwikkelaars. Klik
		hierop en activeer USB-foutopsporing. Koppel nu je telefoon aan je
		computer en klik in studio op het Run app icoontje. Als het goed is
		kun je nu je telefoon kiezen om je app te testen.
</div>




<%@ include file="/includes/bottom.html"%>

<%
	}
%>

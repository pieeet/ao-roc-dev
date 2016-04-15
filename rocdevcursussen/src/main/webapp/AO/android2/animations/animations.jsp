<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android2/includes/zijmenu.jsp" %>

    <div class="col-md-9">
        <h2>1 Animaties</h2>
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het maken van deze app wordt van je verwacht dat
                je:</p>
            <ul>
                <li>weet hoe je Activities maakt met behulp van
                    xml en java
                </li>
                <li>weet hoe je plaatjes in een activity kunt tonen</li>
                <li>weet wat views zijn en hoe je ze in java kunt initialiseren met behulp van de
                    methode findViewById
                </li>
                <li>weet hoe je de onClick methode op
                    views kunt toepassen
                </li>
                <li>weet hoe je een seekbar maakt en hoe je hem kunt gebruiken om
                    de waarde van een variabele te veranderen
                </li>
                <li>weet hoe je RadioButtons in een Radiogroup gebruikt</li>
                <li>weet hoe je verschillende animaties op views kunt toepassen</li>
            </ul>
        </div>

        <h3>Activities</h3>
        <p>Een <a href="http://developer.android.com/reference/android/app/Activity.html" target="_blank">Activity</a>
            in Android is een scherm. Als je in Android Studio een project start wordt er standaard een MainActivity
            voor je aangemaakt. De layout van een activity maak je met xml. Dit lijkt een beetje op HTML.
            In de map res (van resources) zit
            o.m. eem map layout. Hierin zitten de xml bestanden waarmee je de layouts van je activities kunt maken.
            Onderin het layout scherm zie je twee tabs. Als je de design tab kiest kun je elementen uit het menu in
            het scherm slepen op de gewenste positie. Een activity heeft een bijbehorende java klasse. Het bestand
            activity_main.xml heeft een bijbehorende lava klasse MainActivity.java.</p>

        <div class="opdrachten">
            <h2>Opdracht 1</h2>
            <p>Maak een nieuw project aan en bekijk de bestanden in de map res/layout en in de map java.</p>

        </div>

        <h3>Views</h3>
        <p>Schermelementen - zoals stukken tekst, knoppen, foto&#39;s etc. heten <a
                href="http://developer.android.com/reference/android/view/View.html" target="_blank">Views</a>.
            Je kunt een view een id geven door er in de design tab op te dubbelklikken. Als je een view een id hebt
            gegeven kun je hem in de java klasse opvragen. Met de volgende code vraag je in MainActivity een TextView
            op,
            waarbij je [id] verandert in de id die je aan de view hebt gegeven.</p>

        <pre class="code">
TextView tekst = <span class="codeplus">(TextView) findViewById( R.id.[id] )</span>;
        </pre>

        <p>Nadat je een view in je java klasse hebt opgevraagd kun je hem gebruiken.</p>


    </div>


</div>
<%@ include file="/AO/android/includes/bottom.html" %>
</html>
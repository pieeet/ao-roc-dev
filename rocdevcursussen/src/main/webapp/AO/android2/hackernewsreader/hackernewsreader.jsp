<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 26-04-16
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android2/includes/zijmenu.jsp" %>

    <div class="col-md-9">


        <h2>Hacker News Reader</h2>
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het maken van deze app wordt van je verwacht dat
                je:</p>
            <ul>
                <li>gegevens uit een JSONArray kunt halen met een for-lus</li>
                <li>weet hoe je de methode publishProgress in de doInBackground methode van een
                    AsyncTask klasse gebruikt en hoe je de gegevens in de UI thread gebruikt met de
                    methode onProgressUpdate
                </li>
                <li>vanuit je app een browser of de telefoon app kunt openen met een uri</li>

            </ul>
        </div>

        <div class="opdrachten">

            <h2>Opdracht</h2>
            <p>Bekijk onderstaand filmpje en maak de app.</p>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/SEJqFcwwLxw"
                        allowfullscreen></iframe>
            </div>
            <h2>Gebruikte methodes/klassen</h2>
            <p>Onze reader haalt de artikelen van hacker news op in twee stappen. Eerst wordt een JSONArray met
                de id&#39;s van de artikelen opgehaald. Per id wordt vervolgens het artikel opgevraagd. Aangezien het
                om zo&#39;n 500 artikelen gaat is dit een vrij tijdrovende aangelegenheid. </p>


            <h3>JSONArray</h3>
            <p>De JSONArray met id&#39;s die Hacker News levert is een array met enkelvoudige waarden. De waarden
                bevinden zich tussen rechte haken en worden met komma&#39;s van elkaar gescheiden: </p>

<pre class="code">
<span class="codeplus">[</span> 9129911<span class="codeplus">,</span> 9129199, 9127761, 9128141, 9128264, 9127792, 9129248, 9127092, 9128367, ..., 9038733 <span
        class="codeplus">]</span>
</pre>
            <p>Nadat je de JSONArray hebt gemaakt met de binnengehaalde string kun je de waardes &eacute;&eacute;n voor
                &eacute;&eacute;n opvragen met een for-lus:</p>

<pre class="code">
JSONArray jsonArray = new JSONArray(jsonArrayString);
for (int i = 0; i < jsonArray<span class="codeplus">.length()</span> ; i++) {
    String id = jsonArray.<span class="codeplus">getString(i)</span>;
}
</pre>
            <p>Meestal bestaat een JSONArray uit een reeks JSONObjecten. In dat geval heeft de array de volgende
                structuur:</p>

<pre class="code">
<span class="codeplus">[</span>
     {
        "type": "home",
        "number": "212 555-1234"
     }<span class="codeplus">,</span>
     {
        "type": "fax",
        "number": "646 555-4567"
     }
<span class="codeplus">]</span>
</pre>
            <p>Ook hier kun je met een for-lus doorheen loopen om de JSONObjecten op te halen:</p>

<pre class="code">
JSONArray jsonArray = new JSONArray(jsonArrayString);
for (int i = 0; i < jsonArray.length() ; i++) {
    JSONObject jsonObject = jsonArray.<span class="codeplus">getJSONObject(i)</span>;
}
</pre>

            <h3>publishProgress</h3>

            <p>Het binnenhalen van alle 500 artikelen is een langdurige operatie. Om er voor te zorgen dat de
                gebruiker ziet dat het proces gaande is wordt de voortgang van de achtergrond thread op de UI
                vertoond. Hiervoor gebruik je de methode publishProgress in de doInBackground methode. In de definitie
                van de klasse moet je aangeven wat voor type gegevens er worden doorgegeven:</p>

<pre class="code">
class DownloadTaak extends AsyncTask&lt;Void, <span class="codeplus">String</span>, Void&gt; {
    @Override
    protected Void doInBackground(Void... params) {
        <span class="comment">//TODO haal JSONArray met id&#39;s artikelen</span>

        <span class="comment">//maak een voortgangs teller</span>
        int teller = 0;

        <span class="comment">//publiceer voortgang</span>
        for (int i = 0; i < jsonArray.length(); i++) {
            <span class="comment">//TODO haal artikel mbv z&#39;n id</span>
            teller++;
            <span class="codeplus">publishProgress(&quot;Downloaded: &quot; + teller + &quot; articles&quot;)</span>;
        }
    }
}
</pre>
            <h3>onProgressUpdate</h3>
            <p>De string die met de methode publishProgress wordt doorgegeven aan de UI thread moet worden opgevangen
                met de methode onProgressUpdate van de AsyncTask klasse. De doorgegeven string zit in een array met in
                dit
                geval &eacute;&eacute;n waarde. De string wordt op een TextView vertoond.</p>

<pre class="code">
@Override
protected void onProgressUpdate(<span class="codeplus">String... values</span>) {
    String update = <span class="codeplus">values[0]</span>;
    voortgangTextView.setText(<span class="codeplus">update</span>);
}
</pre>

            <h3>Een web browser openen</h3>
            <p>Tot nu toe hebben we intents gebruikt om van de ene naar de andere activity te gaan binnen de
                app. Dit soort intents worden explicit genoemd omdat precies wordt aangegeven welke activity
                wordt gestart. Een
                intent kan echter ook worden gebruikt om een andere app te starten, zoals de standaard browser of de
                telefoon app. Dit
                soort intents worden implicit genoemd omdat we niet weten welke app wordt gestart.
                Android kijkt zelf op basis van de Uri die wordt meegegeven welke app(s) geschikt is/zijn
                en laat
                de gebruiker een keuze kan maken als er meerdere mogelijkheden zijn. In het volgende codefragment wordt
                nadat de gebruiker op een list item heeft geklikt de url van een webpagina uit een
                ArrayList gehaald en gebruikt om de standaard web browser te starten. </p>
<pre class="code">
listView = (ListView) findViewById(R.id.listView);
listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

        <span class="comment">// haal de url uit de lijst</span>
        String urlString = urlLijst.get(position);

        <span class="comment">// parse hem naar een Uri</span>
        Uri uri = Uri.parse(urlString);
        Intent browserIntent = new Intent(Intent.<span class="codeplus">ACTION_VIEW</span>, uri));
        startActivity(browserIntent);
    }
});
</pre>
            <h3>De telefoon app starten</h3>
            <p>Onderstaande code start de telefoon app met een gegeven telefoonnummer. De gebruiker moet in het
                eerste voorbeeld nog op de bel knop drukken om de actie te bevestigen. In het tweede voorbeeld wordt
                er meteen gebeld.</p>
<pre class="code">
String telefoonNummer = <span class="codeplus">&quot;tel:020-1234567&quot;</span>;
Uri telUri = Uri.parse(telefoonNummer);

<span class="comment">// open telefoon app met gegeven nummer</span>
Intent telefoonIntent = new Intent(Intent.<span class="codeplus">ACTION_DIAL</span>, telUri);

<span class="comment">// gaat meteen bellen (vereist permissie)</span>
Intent telefoonIntent = new Intent(Intent.<span class="codeplus">ACTION_CALL</span>, telUri);
startActivity(telefoonIntent);
</pre>


            <p>Voor ACTION_CALL is toestemming vereist in het AndroidManifest:</p>
<pre class="code">
&lt;uses-permission android:name=&quot;android.permission.CALL_PHONE&quot; /&gt;
</pre>
        </div>
    </div>
</div>

<%@ include file="/AO/android/includes/bottom.html" %>
</html>
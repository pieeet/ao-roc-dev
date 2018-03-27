<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android2/includes/zijmenu.jsp" %>

    <div class="col-md-9">


        <h2>6 Hacker News Reader met Firebase backend</h2>
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het maken van deze app wordt van je verwacht dat
                je:</p>
            <ul>
                <li>weet hoe de Android Lifecycle er uit ziet en zijn verschillende methodes kunt gebruiken</li>
                <li>weet hoe je Firebase in een projectNaam installeert</li>
                <li>een referentie naar een dataset in Firebase kunt maken</li>
                <li>EventListeners aan een Firebase referentie kunt koppelen</li>
                <li>diverse typen data uit een DataSnapshot kunt halen</li>
                <li>een model klasse kunt maken en hiervan een object kunt maken met behulp van een DataSnapshot</li>
                <li>een Toast kunt maken</li>

            </ul>
        </div>

        <div class="opdrachten">

            <h2>Opdracht 1</h2>
            <p>Bekijk onderstaand filmpje en maak de app.</p>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/Yo-OaAxAaaI"
                        allowfullscreen></iframe>
            </div>
        </div>
        <h2>Gebruikte methodes/klassen</h2>

        <h3>De Android Lifecycle</h3>
        <p>Alleen als je app niet (meer) op de achtergrond actief is, wordt de onCreate methode
            aangeroepen. Dit gebeurt als de app voor het eerst wordt gestart of wanneer het systeem of de
            gebruiker de app heeft be&euml;indigd en de onDestroy methode is aangeroepen. Android kent een aantal
            van deze <a href="http://developer.android.com/training/basics/activity-lifecycle/index.html"
                        target="_blank">lifecycle methoden</a> die je kunt gebruiken om processen te starten en te
            stoppen.</p>
        <img src="/AO/android2/hnreaderfirebase/lifecycle.png" alt="android lifecycle">

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>startmethode</th>
                <th>stopmethode</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>onCreate</td>
                <td>onDestroy</td>
            </tr>
            <tr>
                <td>onStart/onRestart</td>
                <td>onStop</td>
            </tr>
            <tr>
                <td>onResume</td>
                <td>onPause</td>
            </tr>
            </tbody>
        </table>
        <p>Om er voor te zorgen dat de app stopt met het binnenhalen van data als hij niet op de voorgrond draait,
            kun je bijvoorbeeld de onPause en de onResume methode gebruiken om de Firebase listeners uit/in te
            schakelen.</p>

        <h3>Firebase</h3>
        <p>Om Firebase te kunnen gebruiken moet je het in je projectNaam installeren. Dit is vrij eenvoudig in Android
            Studio. Ga naar <code>File</code>, kies <code>Project Structure...</code>, Kies <code>Cloud</code> en
            vink
            Firebase aan. Je hoeft nu alleen nog de volgende regel code in de onCreate methode toe te voegen:</p>
<pre class="code">
Firebase.setAndroidContext(this);
</pre>

        <p>Data van Firebase kun je vinden met behulp van een url. De volgende regel code maakt een referentie
            naar de id&#39;s van <a href="https://hacker-news.firebaseio.com/v0/newstories" target="_blank">
                New Stories</a>.</p>
<pre class="code">
Firebase ref = new Firebase(<span class="codeplus">&quot;https://hacker-news.firebaseio.com/v0/newstories&quot;</span>);
</pre>
        <h4>Listeners</h4>
        <p>Om de data daadwerkeijk in je app binnen te halen <em>moet</em> je een listener aan de Firebase
            referentie koppelen. Deze haalt allereerst de data op en zorgt er vervolgens voor dat wijzigingen in de
            dataset worden gesynchroniseerd met de app. Je kunt verschillende soorten listeners aan een Firebase
            referentie koppelen:</p>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>methode</th>
                <th>beschrijvingTicket</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>addValueEventListener</td>
                <td>luistert naar verandering van waarden in de dataset. Met de dataSnapshot parameter van de
                    methode <em>onDataChange</em> wordt
                    de gehele vernieuwde dataset doorgegeven.
                </td>
            </tr>
            <tr>
                <td>addChildEventListener</td>
                <td>wanneer sprake is van een lijst met items luistert deze listener naar veranderingen in de <em>children</em>
                    van de lijst. De methoden <em>onChildAdded</em>, <em>onChildChanged</em>,
                    <em>onChildRemoved</em>
                    en <em>onChildMoved</em> geven alleen
                    de data van het veranderde item door.
                </td>
            </tr>
            <tr>
                <td>addListenerForSingleValueEvent</td>
                <td>Haalt data binnen en wordt daarna verwijderd. Deze listener blijft dus niet luisteren naar
                    wijzigingen in de dataset en hoeft dus ook niet te worden verwijderd.
                </td>
            </tr>
            </tbody>

        </table>
        <p>Voor een uitgebreide uitleg zie de <a
                href="https://www.firebase.com/docs/android/guide/retrieving-data.html"
                target="_blank">Android guide</a> van Firebase. </p>
        <p>Het volgende codefragment koppelt een ValueEventListener aan de referentie met de id&#39;s van de
            artikelen en haalt met een for-each loop &eacute;&eacute;n voor &eacute;&eacute;n de id&#39;s op:</p>

<pre class="code">
Firebase ref = new Firebase(&quot;https://hacker-news.firebaseio.com/v0/newstories&quot;);
ref.addValueEventListener(new ValueEventListener() {
    @Override
    public void <span class="codeplus">onDataChange</span>(DataSnapshot <span class="codeplus">dataSnapshot</span> ) {
        for (DataSnapshot <span class="codeplus">idSnapShot</span> : dataSnapshot.<span
        class="codeplus">getChildren()</span>) {
            Long id = (Long) idSnapShot.<span class="codeplus">getValue()</span>;
            <span class="comment">//TODO haal artikel mbv id</span>
        }
    }
    @Override
    public void onCancelled(FirebaseError firebaseError) {
    }
}
</pre>
        <h4>DataSnapshot</h4>
        <p>Data wordt door Firebase doorgegeven met een <a
                href="https://www.firebase.com/docs/java-api/javadoc/com/firebase/client/DataSnapshot.html"
                target="_blank">DataSnapshot</a> Dit is de dataset van de Firebase referentie. Dit kan
            een enkel item of een lijst met items zijn. In de Hacker News reader zijn de volgende methodes van
            DataSnapshot gebruikt:
        </p>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>methode</th>
                <th>beschrijvingTicket</th>
                <th>return-type</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>child(String naam)</td>
                <td>verwijst naar een property van de DataSnapshot waarbij de naam (key) wordt meegegeven als
                    String. De methode geeft een DataSnapshot object terug.
                </td>
                <td>DataSnapshot</td>
            </tr>
            <tr>
                <td>getChildren()</td>
                <td>geeft alle kinderen van een DataSnapshot in de vorm van een lijst met DataSnapshots (waar je
                    doorheen kunt loopen).
                </td>
                <td><a href="https://docs.oracle.com/javase/7/docs/api/java/lang/Iterable.html"
                       target="_blank">Iterable</a>&lt;DataSnapshot&gt;
                </td>
            </tr>
            <tr>
                <td>exists()</td>
                <td>checkt of een bepaalde property in de DataSnapshot aanwezig is.</td>
                <td>boolean</td>
            </tr>
            <tr>
                <td>getValue()</td>
                <td>geeft de waarde van een DataSnapshot</td>
                <td><a href="https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html"
                       target="_blank">Object</a> (moet gecast worden naar werkelijke type)
                </td>
            </tr>

            </tbody>
        </table>


        <p>In de uitwerking van de HN reader worden de methodes child en getValue gebruikt om de Strings met de
            titel en de
            url van het artikel op te halen.</p>
<pre class="code">
String title = (String) dataSnapshot.child("title").getValue();
String url = (String) dataSnapshot.child("url").getValue();
</pre>

        <h4>Een model-klasse gebruiken</h4>
        <p>Data van een DataSnapshot kun je gebruiken om een object van een model-klasse te maken. Eigenschappen
            waar zo&#39;n model klasse aan moet voldoen:</p>
        <ul>
            <li>de klasse heeft <em>dezelfde attributen</em> met <em>dezelfde namen</em> als de properties
                van de DataSnapshot
            </li>
            <li>bovengenoemde attributen hebben public getters</li>
            <li>de klasse heeft een lege constructor dwz geen parameters en een lege body</li>
        </ul>
        <p>In de <a
                href="https://www.firebase.com/docs/android/guide/retrieving-data.html" target="_blank">Android
            guide</a> op de Firebase site wordt als voorbeeld een model-klasse BlogPost gebruikt:</p>
<pre class="code">
public class BlogPost {
  private String author;
  private String title;

  <span class="comment">// lege constructor</span>
  public BlogPost() {}

  <span class="comment">// getters</span>
  public String getAuthor() {
    return author;
  }
  public String getTitle() {
    return title;
  }
}
</pre>


        <p>In het volgende codefragment wordt met behulp van de <a
                href="http://beginnersbook.com/2013/05/method-overloading/" target="_blank">overloaded</a> methode
            getValue van DataSnapshot een object van de klasse
            BlogPost gemaakt.</p>

<pre class="code">
<span class="comment">// Get a reference to our posts</span>
Firebase ref = new Firebase("https://docs-examples.firebaseio.com/web/saving-data/fireblog/posts");
<span class="comment">// Attach an listener to read the data at our posts reference</span>
ref.addValueEventListener(new ValueEventListener() {
  @Override
  public void onDataChange(DataSnapshot snapshot) {
      System.out.println("There are " + snapshot.getChildrenCount() + " blog posts");
      for (DataSnapshot postSnapshot: snapshot.getChildren()) {
        <span class="codeplus">BlogPost post = postSnapshot.getValue(BlogPost.class);</span>
        System.out.println(post.getAuthor() + " - " + post.getTitle());
      }
  }
  @Override
  public void onCancelled(FirebaseError firebaseError) {
      System.out.println("The read failed: " + firebaseError.getMessage());
  }
});
</pre>
        <div class="opdrachten">
            <h2>Opdracht 2</h2>
            <p>Verander de reader zodat gebruik wordt gemaakt van een klasse Artikel. Let op dat gehele
                getallen in Firebase altijd van het type Long zijn. De property <em>kids</em> bestaat uit een reeks
                gehele
                getallen. Hier kun je een
                <a href="https://docs.oracle.com/javase/7/docs/api/java/util/List.html" target="_blank">List</a> van
                maken.
            </p>
        </div>

        <h3>Een Toast maken</h3>
        <p>Een <a href="http://developer.android.com/guide/topics/ui/notifiers/toasts.html" target="_blank">Toast</a> is
            een berichtje dat gedurende enkele seconden in beeld komt en de gebruiker ergens
            over informeert. </p>
        <img src="/AO/android2/hnreaderfirebase/helloWorldToast.png">
        <p>De volgende regel code maakt een Toast die de gebruiker informeert dat de
            lijst met artikelen is ververst:</p>
<pre class="code">
Toast.makeText(getApplicationContext(), "Lijst ververst", Toast.LENGTH_SHORT).show();
</pre>


    </div>
</div>

<%@ include file="/AO/android2/includes/bottom.html" %>
<script>
    $(document).ready(function() {
        $("li#hnreaderfirebase").addClass("selected");
    })
</script>
</html>

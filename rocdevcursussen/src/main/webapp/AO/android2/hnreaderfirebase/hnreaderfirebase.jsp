<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android2/includes/zijmenu.jsp" %>

    <div class="col-md-9">


        <h2>6 Hacker News met Firebase</h2>
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het maken van deze app wordt van je verwacht dat
                je:</p>
            <ul>
                <li></li>

            </ul>
        </div>

        <div class="opdrachten">

            <h2>Opdracht</h2>
            <p>Bekijk onderstaand filmpje en maak de app.</p>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/Yo-OaAxAaaI"
                        allowfullscreen></iframe>
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
            <p>Om Firebase te kunnen gebruiken moet je het in je project installeren. Dit is vrij eenvoudig in Android
                Studio. Ga naar <code>File</code>, kies <code>Project Structure...</code>, Kies <code>Cloud</code> en
                vink
                Firebase aan. Je hoeft nu alleen nog de volgende regel code in de onCreate methode toe te voegen:</p>
<pre class="code">
Firebase.setAndroidContext(this);
</pre>

            <p>Data van Firebase kun je vinden met behulp van een url. De volgende regel code maakt een referentie
                naar de id&#39;s van <em>New Stories</em>. Als je de url in de adres balk van je browser plakt zie je de
                Firebase dataset.</p>
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
                    <th>beschrijving</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>addValueEventListener</td>
                    <td>luistert naar verandering van waarden in de dataset. Met de methode <em>onDataChange</em> wordt
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
    public void onDataChange(DataSnapshot <span class="codeplus">dataSnapshot</span> ) {
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
                    href="https://www.firebase.com/docs/android/api/#datasnapshot_methods"
                    target="_blank">DataSnapshot</a> Dit is de dataset van de Firebase referentie. Dit kan
                een enkel item of een lijst met items zijn. In de Hacker News reader zijn de volgende methodes van
                DataSnapshot gebruikt:
            </p>

            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>methode</th>
                    <th>beschrijving</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>child(String naam)</td>
                    <td>verwijst naar een kind van de DataSnapshot waarbij de naam wordt meegegeven als String. De
                        methode
                        geeft een DataSnapshot object terug.
                    </td>
                </tr>
                <tr>
                    <td>getChildren()</td>
                    <td>haalt alle kinderen van een DataSnapshot in de vorm van een lijst met DataSnapshots (waar je
                        doorheen kunt
                        loopen).
                    </td>
                </tr>
                <tr>
                    <td>exists()</td>
                    <td>checkt of een bepaald kind bestaat.</td>
                </tr>
                <tr>
                    <td>getValue()</td>
                    <td>geeft de waarde van een DataSnapshot</td>
                </tr>

                </tbody>
            </table>


            <p>In de uitwerking van de HN reader wordt de methode getValue gebruikt om de Strings met de titel en de
                url van het artikel op te halen.</p>
<pre class="code">
String title = (String) dataSnapshot.child("title").getValue();
String url = (String) dataSnapshot.child("url").getValue();
</pre>

            <h4>Een model klasse gebruiken</h4>
            <p>Ook kun je data van een DataSnapshot gebruiken om een object van een model-klasse te maken. Deze klasse
                moet dezelfde attributen met dezelfde namen hebben als de properties in Firebase en deze attributen
                moeten public getters hebben. Ook moet de klasse een lege constructor hebben. In de <a
                        href="https://www.firebase.com/docs/android/guide/retrieving-data.html" target="_blank">Android
                    guide</a> op de Firebase site wordt als voorbeeld een app met blogposts gebruikt:</p>
<pre class="code">
public class BlogPost {
  private String author;
  private String title;
  public BlogPost() {
    <span class="comment">// empty default constructor, necessary for Firebase to be able to deserialize blog posts</span>
  }
  public String getAuthor() {
    return author;
  }
  public String getTitle() {
    return title;
  }
}
</pre>


            <p>In het volgende codefragment wordt met behulp van het datasnapshot een object van de klasse
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

            <h2>Opdracht</h2>
            <p>Verander de Hacker News reader zodat gebruik wordt gemaakt van een klasse Artikel.</p>

            <h3>Een Toast maken</h3>
            <p>Een Toast is een berichtje dat gedurende enkele seconden in beeld komt en de gebruiker ergens
                over informeert. In de code hierboven wordt een Toast gemaakt die gebruiker informeert dat de lijst is
                ververst.</p>


        </div>
    </div>
</div>

<%@ include file="/AO/android/includes/bottom.html" %>
</html>

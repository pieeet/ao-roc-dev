<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 20-04-16
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android2/includes/zijmenu.jsp" %>

    <div class="col-md-9">


        <h2>4 Brain Trainer</h2>
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het maken van deze app wordt van je verwacht dat
                je:</p>
            <ul>
                <li>een nieuwe activity kunt starten met een Intent</li>
                <li>data aan een intent kunt meegeven met de methode putExtra en deze
                    kunt opvragen met getXxxExtra
                </li>
                <li>waardes kunt opslaan met SharedPreferences en deze kunt opvragen</li>

            </ul>
        </div>

        <div class="opdrachten">

            <h2>Opdracht</h2>
            <p>Bekijk onderstaand filmpje en maak de app.</p>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/epu-PualKT0"
                        allowfullscreen></iframe>
            </div>
            <h2>Gebruikte methodes/klassen</h2>

            <h3>Intent</h3>
            <p>Om van de ene activity naar de andere te gaan heb je een object van de klasse <a
                    href="http://developer.android.com/reference/android/content/Intent.html" target="_blank">Intent</a>
                nodig. De constructor van Intent accepteert twee parameters:</p>
            <ol>
                <li>de context. Meestal kun je <em>this</em> gebruiken. Als je vanuit een andere klasse (bijvoorbeeld
                    een binnenklasse
                    of een anonieme klasse) het intent maakt kun je
                    getApplicationContext gebruiken.
                </li>
                <li>de naam van de klasse waar je naar toe wilt gaan gevolgd door .class</li>
            </ol>

<pre class="code">
<span class="comment">//ga naar TimerActivity</span>
Intent intent = <span class="codeplus">new Intent(this, TimerActivity.class)</span>;
<span class="codeplus">startActivity(intent)</span>;
</pre>

            <h4>Waardes meegeven aan een intent</h4>
            <p>Soms wil je waardes meegeven aan een intent waar in de doel activity iets mee wordt gedaan. In de brain
                trainer
                wordt de score van de speler meegegeven zodat kan worden gechecked of er een nieuwe high score is.
                Hiervoor
                gebruiken we de methode putExtra. Deze methode accepteert twee parameters:</p>
            <ol>
                <li>de key waarmee je de waarde kunt opvragen. Dit is een string.</li>
                <li>de waarde zelf, afhankelijk van het type (long, int, double, String etc.).</li>
            </ol>
<pre class="code">
<span class="comment">//ga naar MainActivity</span>
Intent intent = new Intent(this, MainActivity.class);

<span class="comment">//geef de variabele score (int) mee</span>
intent.<span class="codeplus">putExtra(&quot;score&quot;, score)</span>;
startActivity(intent);
</pre>
            <h4>Waardes van een intent opvragen</h4>
            <p>In de klasse waar het intent naar toe wordt gestuurd kun je de waarde opvragen met de key die je hebt
                toegekend. Je kunt verschillende types opvragen met verschillende methoden. Hieronder een aantal
                veelgebruikte. Voor alle methodes zie klasse
                <a href="http://developer.android.com/reference/android/content/Intent.html" target="_blank">Intent</a>
            </p>
            <ul>
                <li>getStringExtra</li>
                <li>getIntExtra</li>
                <li>getBooleanExtra</li>
                <li>getDoubleExtra</li>
                <li>etc...</li>
            </ul>


            <p>Als er geen waarde is met die key, dan geeft de methode een default value die je
                zelf kunt bepalen. In onderstaand voorbeeld geeft de methode 0 terug als er geen intent is of
                als er geen score is.</p>

<pre class="code">
<span class="comment">// vraag het intent op</span>
Intent intent = <span class="codeplus"> getIntent()</span>;

<span class="comment">// vraag de meegestuurde integer waarde op</span>
int score = intent.<span class="codeplus">getIntExtra(&quot;score&quot;, 0)</span>;
</pre>

            <h3>SharedPreferences</h3>
            <p>Met de klasse <a href="http://developer.android.com/reference/android/content/SharedPreferences.html"
                                target="_blank">SharedPreferences</a> kun je waardes opslaan in een bestand dat
                Android voor je bewaart. Je maakt een object van SharedPreferences met de methode getPreferences
                waarbij je aan moet geven of de gegevens alleen voor de eigen applicatie beschikbaar zijn of
                ook voor andere apps. Hiervoor kun je een constante van de Context klasse gebruiken. In de Brain Trainer
                willen we de high score bewaren. Om een waarde op te slaan
                heb je een object van de binnenklasse SharedPreferences.Editor nodig. Zie voorbeeld hieronder. Met de
                editor kun je verschillende gegevenstypen opslaan. Zie <a
                        href="http://developer.android.com/reference/android/content/SharedPreferences.Editor.html"
                        target="_blank">documentatie</a>.</p>




<pre class="code">
SharedPreferences prefs = this.<span class="codeplus">getPreferences(Context.MODE_PRIVATE)</span>;

<span class="comment">//haal de high score (default 0)</span>
int highScore = prefs.<span class="codeplus">getInt("highScore", 0)</span>;
Intent intent = getIntent();
int score = intent.getIntExtra("score", 0);
if (score > highScore) {
    highScore = score;
    <span class="comment">//Bewaar de nieuwe high score</span>
    <span class="codeplus">SharedPreferences.Editor editor = prefs.edit()</span>;
    editor.<span class="codeplus">putInt("highScore", highScore)</span>;
    editor.<span class="codeplus">commit()</span>;
}

</pre>


        </div>
    </div>
</div>
</div>
<%@ include file="/AO/android/includes/bottom.html" %>
</html>

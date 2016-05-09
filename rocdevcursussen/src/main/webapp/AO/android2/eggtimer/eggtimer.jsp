<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 20-04-16
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android2/includes/zijmenu.jsp" %>

    <div class="col-md-9">


        <h2>3 Eierwekker</h2>

        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het maken van deze app wordt van je verwacht dat
                je:</p>
            <ul>
                <li>een geluidsbestand kunt afspelen in een app</li>
                <li>weet hoe je een CountDownTimer maakt en gebruikt</li>

            </ul>
        </div>
        <div class="bs-callout bs-callout-info">
            <p>Het gebruikte geluidsbestand kun je <a href="/AO/android2/eggtimer/airhorn.mp3" download>hier</a> downloaden</p>
        </div>

        <div class="opdrachten">

            <h2>Opdracht</h2>
            <p>Bekijk onderstaand filmpje en maak de app.</p>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/EJgIOVvsB2I"
                        allowfullscreen></iframe>
            </div>
            <h2>Gebruikte methodes/klassen</h2>

            <h3>MediaPlayer</h3>
            <p>Om geluidsbestanden af te spelen maak je in de map res een nieuwe resource directory genaamd raw. In
                deze map stop je het geluidsbestand (bijvoorbeeld een mp3) die je wilt afspelen. In je java klasse maak
                je
                een object van de klasse <a href="http://developer.android.com/reference/android/media/MediaPlayer.html"
                                            target="_blank">
                    MediaPlayer
                </a>. MediaPlayer heeft hiervoor een speciale static methode <a href="MediaPlayer heeft een speciale"
                                                                                target="_blank">create</a>.
                Je start het geluidsbestand door de methode start op het MediaPlayer object aan te roepen.
            </p>
<pre class="code">
<span class="comment">//start geluidsbestand airhorn.mp3</span>
MediaPlayer mediaPlayer = MediaPlayer.<span class="codeplus">create(getApplicationContext(), R.raw.airhorn)</span>;
mediaPlayer.<span class="codeplus">start()</span>;
</pre>


            <h3>CountDownTimer</h3>
            <p>Met de klasse <a href="http://developer.android.com/reference/android/os/CountDownTimer.html"
                                target="_blank">CountDownTimer</a> kun je er voor zorgen dat er iets gebeurt
                nadat een bepaalde tijd is verstreken. Als je een object van een CountDownTimer maakt geef je aan de
                constructor twee parameters mee:</p>
            <ol>
                <li>De tijd die aftelt in milliseconden. Na afloop wordt de methode onFinish aangeroepen.</li>
                <li>De interval in milliseconden tijdens het aftellen waarin iets kan gebeuren. Na iedere
                interval wordt de methode onTick aangeroepen. De methode heeft een parameter millisUntilFinished die
                de resterende tijd van de timer geeft.</li>
            </ol>

            <p>Om een countdown timer te maken kun je een object maken. Android Studio zal twee verplichte
                methodes voor je aanmaken.</p>






<pre class="code">
<span class="comment">//maak een timer die 30 seconden aftelt</span>
CountDownTimer timer = new CountDownTimer(30000, 1000) {

    <span class="comment">//deze methode wordt iedere seconde uitgevoerd
    //zolang de timer loopt</span>
    @Override
    public void <span class="codeplus">onTick(long millisUntilFinished)</span> {
        int timerTijd = (int) (millisUntilFinished / 1000);
        <span class="comment">//zet resterende tijd op een TextView</span>
        timerTextView.setText("" + timerTijd);
    }
    <span class="comment">//deze methode wordt uitgevoerd als de tijd is verstreken</span>
    @Override
    public void <span class="codeplus">onFinish()</span> {
        MediaPlayer mediaPlayer = MediaPlayer.create(getApplicationContext(), R.raw.airhorn);
        mediaPlayer.start();
    }
}<span class="codeplus">;</span>
timer.start();

</pre>


        </div>


    </div>

</div>
</div>
<%@ include file="/AO/android2/includes/bottom.html" %>
</html>
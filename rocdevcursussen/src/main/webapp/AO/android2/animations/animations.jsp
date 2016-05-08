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
                <li>Activities kunt maken met behulp van xml en java</li>
                <li>afbeeldingen in een activity kunt tonen</li>
                <li>verschillende views in een activity kunt plaatsen en weet hoe je ze in java kunt opvragen met behulp
                    van de methode findViewById
                </li>
                <li>de onClick methode op views kunt toepassen</li>
                <li>een seekbar kunt maken en weet hoe je hem kunt gebruiken om
                    de waarde van een variabele te veranderen
                </li>
                <li>RadioButtons in een Radiogroup kunt gebruiken</li>
                <li>verschillende animaties op views kunt toepassen</li>
            </ul>
        </div>

        <div class="opdrachten">
            <h2>Opdracht</h2>
            <p>Bekijk onderstaand filmpje en maak de app af zodat de gebruiker met behulp van
                radio buttons een animatie kan kiezen.</p>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/ilFCJck4DPI?list=PLh97xb8FtLkvRh09Nz3-RrxN_ZpbRA9xe"></iframe>
            </div>
            <h2>Uitwerking</h2>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/-B6sYP50ilg?list=PLh97xb8FtLkvRh09Nz3-RrxN_ZpbRA9xe"
                        frameborder="0" allowfullscreen></iframe>

            </div>
            <h2>Gebruikte methodes/klassen</h2>

            <h4>findViewById</h4>
            <p>Maak een button in het layout bestand</p>

            <pre class="code">
&lt;Button
     android:<span class="codeplus">id=&quot;@+id/my_button&quot;</span>
     android:layout_width=&quot;wrap_content&quot;
     android:layout_height=&quot;wrap_content&quot;
     android:text=&quot;@string/my_button_text&quot;/&gt;
            </pre>

            <p>Initialiseer de button in de onCreate methode. De methode findViewById maakt een
                object van de view met de gemaakte id. </p>

            <pre class="code">
Button myButton = <span class="codeplus">(Button) findViewById(R.id.my_button)</span>;
            </pre>


            <h4>onClick</h4>
            <p>In je layout kun je aan een view een onClick methode toevoegen. Deze methode implementeer
                je vervolgens in je java klasse. De view parameter van de methode is de view waarop gebruiker heeft
                geklikt.</p>

            <pre class="code">
&lt;ImageView
        android:id=&quot;@+id/bart&quot;
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;match_parent&quot;
        android:layout_alignParentLeft=&quot;true&quot;
        android:layout_alignParentStart=&quot;true&quot;
        android:layout_alignParentTop=&quot;true&quot;
        android:layout_marginBottom=&quot;40dp&quot;
        android:layout_marginTop=&quot;40dp&quot;
        android:src=&quot;@drawable/bart&quot;

        <span class="codeplus">android:onClick=&quot;animate&quot;</span>  /&gt;</pre>

            <pre class="code">
public void <span class="codeplus">animate(View view)</span> {
        <span class="comment">//TODO uitwerking methode</span>
}
            </pre>


            <h4>setVisibility</h4>

            <p>Met de methode setVisibility kun je een view zichtbaar/onzichtbaar maken. De methode
                accepteert een aantal constanten van de View klasse als parameter.
            </p>

            <pre class="code">
<span class="comment">//Maak bijvoorbeeld een object van een ImageView</span>
ImageView img = (ImageView) findViewById(R.id.imageView);

<span class="comment">//maak zichtbaar</span>
img.setVisibility(<span class="codeplus">View.VISIBLE</span>);

<span class="comment">//maak onzichtbaar</span>
img.setVisibility(<span class="codeplus">View.INVISIBLE</span>);

<span class="comment">//verwijder van scherm</span>
img.setVisibility(<span class="codeplus">View.GONE</span>);
            </pre>
            <h4>SeekBar</h4>
            <p>Met een <a href="http://developer.android.com/reference/android/widget/SeekBar.html" target="_blank">
                Seekbar</a> kun je een waarde instellen met een schuifbalk. Veelgebruikte
                methodes:</p>
            <pre class="code">
<span class="comment">//duur van de animatie in ms</span>
int animationTime = 2000;
SeekBar seekBar = (SeekBar) findViewById(R.id.seekBar);

<span class="comment">// set maximale waarde, minimale waarde == 0</span>
seekBar.<span class="codeplus">setMax(5000)</span>;

<span class="comment">// set positie van de schuif op de balk</span>
seekBar.<span class="codeplus">setProgress(animationTime);</span>

<span class="comment">//Koppel een listener</span>
seekBar.<span class="codeplus">setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener()</span> {
    @Override
    public void onProgressChanged(SeekBar seekBar, <span class="codeplus">int progress</span>, boolean fromUser) {
        <span class="codeplus">animationTime = progress</span>;
    }

    @Override
    public void onStartTrackingTouch(SeekBar seekBar) {
    }

    @Override
    public void onStopTrackingTouch(SeekBar seekBar) {
    }
});
            </pre>

            <h4>RadioGroup &amp; RadioButton</h4>

            <p>Met <a href="http://developer.android.com/guide/topics/ui/controls/radiobutton.html" target="_blank">RadioButtons</a>
                binnen een <a href="http://developer.android.com/reference/android/widget/RadioGroup.html"
                              target="_blank">RadioGroup</a>
                kunnen gebruikers &eacute;&eacute;n optie kiezen uit een aantal. Veelgebruikte methodes:</p>

            <pre class="code">
RadioButton fadeRadioButton = (RadioButton) findViewById(R.id.fadeRadioButton);
fadeRadioButton.<span class="codeplus">setChecked(true)</span>;
boolean isChecked = fadeRadioButton.<span class="codeplus">isChecked()</span>;
if (isChecked) {
    <span class="comment">//doe iets</span>
}            </pre>
            <p>Aan een RadioButton kun je een onClick methode toevoegen.</p>

            <h3>Animaties</h3>

            <h4>Fade</h4>
            <p>Met de alpha waarde van een view kun je de transparantie bepalen met behulp van een
                float tussen 0 en 1, waarbij 0 geheel onzichtbaar is en 1 geheel zichtbaar. Met de methode
                <a href="http://developer.android.com/reference/android/view/View.html#animate()" target="_blank">animate</a>
                kun je de overgang van de ene naar de andere waarde animeren. De methode setDuration bepaalt
                hoe lang de animatie duurt.</p>


            <pre class="code">
ImageView image = (ImageView) findViewById(R.id.myImg);

<span class="comment">//maak image onzichtbaar</span>
image.setAlpha(0f);

<span class="comment">//fade in</span>
image.animate()
        .alpha(1f)
        .setDuration(animationTime);
            </pre>

            <h4>Translate</h4>
            <p>Met translationX en translationY kun je de x en y co&ouml;rdinaten van een view be&iuml;nvloeden.</p>

            <pre class="code">
<span class="comment">// zet het plaatje links van het scherm (onzichtbaar)</span>
image.setTranslationX(-2000f);

<span class="comment">// laat plaatje het beeld inkomen</span>
image.animate()
        .translationX(0f)
        .setDuration(animationTime);
            </pre>

            <H4>Scale</H4>
            <p>Met de methodes scaleX en scaleY kun je de breedte en de hoogte van een view aanpassen. </p>
<pre class="code">
<span class="comment">// maak breedte en hoogte 0 (onzichtbaar)</span>
image.setScaleX(0f);
image.setScaleY(0f);

<span class="comment">//animeer naar oorspronkelijke grootte</span>
image.animate()
    .scaleX(1f)
    .scaleY(1f)
    .setDuration(animationTime);
</pre>


            <h4>Rotate</h4>
            <p>Met rotate kun je een view laten draaien.</p>


<pre class="code">
<span class="comment">//roteer 1 keer rechtsom</span>
image.animate()
    .rotation(360)
    .setDuration(animationTime);

<span class="comment">//roteer 2 keer linksom</span>
image.animate()
    .rotation(-720)
    .setDuration(animationTime);

</pre>
        </div>
    </div>
</div>
<%@ include file="/AO/android2/includes/bottom.html" %>
</html>
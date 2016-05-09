<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 16-04-16
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android2/includes/zijmenu.jsp" %>

    <div class="col-md-9">
        <h2>2 Boter Kaas &amp; Eieren (Tic Tac Toe)</h2>

        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het maken van deze app wordt van je verwacht dat
                je:</p>
            <ul>
                <li>weet hoe je een grid layout gebruikt</li>
                <li>weet hoe je tags aan een view kunt koppelen en kunt gebruiken</li>
                <li>met java een afbeelding aan een ImageView kunt koppelen</li>
                <li>weet hoe je met behulp van de onClick property de view waarop door gebruiker
                    is geklikt kunt opvragen en gebruiken in java
                </li>
                <li>hoe je een gehele layout inclusief children op het scherm zichtbaar en onzichtbaar kunt maken</li>
                <li>hoe je de tekst van een view kunt veranderen met java met de methode setText</li>
                <li>weet hoe je kind-elementen van een layout kunt benaderen met de methode getChildAt(indexPositie) en
                hoe je met een for-lus door alle elementen van een layout kunt loopen.</li>
            </ul>
        </div>

        <div class="bs-callout bs-callout-info">

            <h2>De gebruikte afbeeldingen</h2>
            <img src="/AO/android2/tictactoe/bord.png" width="100">
            <img src="/AO/android2/tictactoe/kruisje.png" width="100">
            <img src="/AO/android2/tictactoe/rondje.png" width="100">


        </div>


        <div class="opdrachten">
            <h2>Opdracht</h2>
            <p>Bekijk onderstaand filmpje en maak de app.</p>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/ZJxJf6ucrWw?list=PLh97xb8FtLkvRh09Nz3-RrxN_ZpbRA9xe"
                        allowfullscreen></iframe>
            </div>
            <h2>Gebruikte methodes/klassen</h2>

            <h3>GridLayout</h3>
            <p>Hieronder zie je een deel van de gebruikte code voor de GridLayout. De achtergrond van de GridLayout is
                een plaatje. De GridLayout krijgt een id zodat we
                hem in java kunnen opvragen.
                De ImageViews worden gepositioneerd met behulp van rij- en kolomnummers. Iedere ImageView in de layout
                krijgt een <em>tag</em> zodat hij in java gemakkelijk te identificeren is als er door gebruiker
                op wordt geklikt. Iedere ImageView krijgt dezelfde methode onClick.</p>
<pre class="code">
&lt;GridLayout
        android:layout_width=&quot;match_parent&quot;
        android:layout_height=&quot;360dp&quot;
        android:layout_centerVertical=&quot;true&quot;
        android:layout_centerHorizontal=&quot;true&quot;
        <span class="codeplus">android:background=&quot;@drawable/bord&quot;</span>
        android:columnCount=&quot;3&quot;
        android:rowCount=&quot;3&quot;
        <span class="codeplus">android:id=&quot;@+id/gridLayout&quot;&gt;</span>

        &lt;ImageView
            android:layout_width=&quot;90dp&quot;
            android:layout_height=&quot;90dp&quot;
            <span class="codeplus">android:layout_row=&quot;0&quot;</span>
            <span class="codeplus">android:layout_column=&quot;0&quot;</span>
            android:layout_marginLeft=&quot;10dp&quot;
            android:layout_marginTop=&quot;20dp&quot;
            <span class="codeplus">android:onClick=&quot;setImg&quot;</span>
            <span class="codeplus">android:tag=&quot;0&quot;/&gt;</span>
        &lt;ImageView
            android:layout_width=&quot;90dp&quot;
            android:layout_height=&quot;90dp&quot;
            <span class="codeplus">android:layout_row=&quot;0&quot;</span>
            <span class="codeplus">android:layout_column=&quot;1&quot;</span>
            android:layout_marginTop=&quot;20dp&quot;
            android:layout_marginLeft=&quot;20dp&quot;
            <span class="codeplus">android:onClick=&quot;setImg&quot;</span>
            <span class="codeplus">android:tag=&quot;1&quot;/&gt;</span>

        ...
        ...

&lt;/GridLayout&gt;

</pre>

            <p>In java implementeer je vervolgens de onClick property setImg door een methode met dezelfde naam
                te schrijven. De methode krijgt een parameter van het type View. Dit
                is de view waar door de gebruiker op is geklikt. Deze moet worden <em>getypecast</em> naar de juiste
                soort view, in dit geval een ImageView. </p>
<pre class="code">
public void setImg(View <span class="codeplus">view</span>) {
    ImageView imageView = <span class="codeplus">(ImageView) view</span>;
    ...
}
</pre>

                <p>Aan deze view kunnen we vervolgens een plaatje koppelen met
                behulp van de methode <em>setImageResource</em>.
                Welk plaatje aan de ImageView wordt gekoppeld is afhankelijk van welke speler aan de beurt is.
                Voor een aardig effect kun je uiteraard wat animatie
                toevoegen.</p>


            <h3>Tags gebruiken</h3>
            <p>Om bij te houden welke speler welke ImageView heeft gekozen wordt het spelverloop
            bijgehouden met behulp van een array van integers. Welke speler aan de beurt is wordt bijgehouden
            met een int variabele (1 of 2). Speler 1 begint, dus spelerActief wordt in de onCreate methode
            op 1 gezet.</p>
<pre class="code">
int spelerActief;
int[] spelverloop = {0,0,0,0,0,0,0,0,0};
</pre>

            <p>Met de tags die we aan de ImageViews hebben gegeven kunnen we de geklikte ImageView identificeren.</p>


<pre class="code">
public void setImg(View view) {
    ImageView imageView = (ImageView) view;
    int <span class="codeplus">index</span> = Integer.parseInt(imageView.<span class="codeplus">getTag().toString()</span>);
    <span class="comment">//check of plaatje nog leeg is</span>
    if (spelverloop[<span class="codeplus">index</span>] == 0) {
        spelverloop[<span class="codeplus">index</span>] = spelerActief;

        <span class="comment">// set het juiste plaatje</span>
        switch (spelerActief) {
            case 1:
                imageView.setTranslationY(-1000f);
                imageView.<span class="codeplus">setImageResource(R.drawable.kruisje)</span>;
                imageView.animate().translationY(0f).setDuration(300);
                <span class="comment">//TODO check einde spel</span>
                spelerActief = 2;
                break;
            case 2:
                imageView.setTranslationY(-1000f);
                imageView.setImageResource(R.drawable.rondje);
                imageView.animate().translationY(0f).setDuration(300);
                <span class="comment">//TODO check einde spel</span>
                spelerActief = 1;
                break;
        }
    }
}
</pre>

            <h3>setText</h3>
            <p>De text van bijvoorbeeld TextViews, EditText velden en Buttons kun je in java be&iuml;nvloeden met de
                methode setText. De tekst van de layout die verschijnt als het spel is afgelopen bijvoorbeeld
                is afhankelijk van de uitkomst van het spel. In het volgende codefragment wordt met een hulpmethode
                geswitched over het attribuut spelergewonnen en afhankelijk daarvan wordt de juiste tekst uit
                het strings.xml bestand opgehaald en
                op de TextView gezet:</p>

<pre class="code">
private void eindigSpel() {
    switch (spelerGewonnen) {
        case 0:
            eindeSpelTextView.<span class="codeplus">setText</span>(<span class="codeplus">R.string.gelijk_spel</span>);
            break;
        case 1:
            eindeSpelTextView.setText(R.string.winner_1);
            break;
        case 2:
            eindeSpelTextView.setText(R.string.winner_2);
            break;
    }
    eindeSpelLayout.setVisibility(View.VISIBLE);
}
</pre>


            <h3>Loopen door een Layout</h3>
            <p>Als een nieuw spel wordt gestart moeten alle plaatjes van de ImageViews weer worden verwijderd. Je kunt alle
                views binnen een layout (de zogenaamde <em>children</em>) benaderen met
                de methode getChildAt(indexpositie). Als je alle elementen van een layout wilt benaderen,
                dan gebruik je een for-lus:</p>

<pre class="code">
public void nieuwSpel(View view) {
    GridLayout gridLayout = (GridLayout) findViewById(R.id.gridLayout);
    for (int i = 0; i < <span class="codeplus">gridLayout.getChildCount()</span>; i++) {
        ImageView imageView = (ImageView) gridLayout.<span class="codeplus">getChildAt(i)</span>;
        imageView.setImageResource(<span class="codeplus">0</span>);
    }
    <span class="comment">//TODO reset alle attributen naar hun startwaarde</span>
}
</pre>


        </div>
    </div>
</div>
<%@ include file="/AO/android2/includes/bottom.html" %>
</html>

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
        <h2>2 Boter, kaas en eieren (TicTacToe)</h2>

        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het maken van deze app wordt van je verwacht dat
                je:</p>
            <ul>
                <li>weet hoe je een grid layout gebruikt</li>
                <li>weet hoe je tags kunt gebruiken</li>
                <li>met java een afbeelding aan een ImageView kunt koppelen</li>
                <li>weet hoe je een view waarop door gebruiker is geklikt kunt gebruiken in java</li>
                <li>hoe je een layout op het scherm zichtbaar en onzichtbaar kunt maken</li>
                <li>hoe je de tekst van een TextView kunt veranderen met java</li>
            </ul>
        </div>

        <div class="bs-callout bs-callout-info">

            <h2>De gebruikte afbeeldingen</h2>
            <img src="bord.png" width="100">
            <img src="kruisje.png" width="100">
            <img src="rondje.png" width="100">


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

            <h4>GridLayout</h4>
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

            <p>In java implementeer je vervolgens de onClick methode setImg. We moeten dan weten op
            welk vakje de gebruiker heeft geklikt. Hiervoor kunnen we de tag gebruiken die we aan
            iedere ImageView hebben gegeven.</p>

<pre class="code">
public void setImg(View <span class="codeplus">view</span>) {
    ImageView imageView = (ImageView) <span class="codeplus">view</span>;
    int index = Integer.parseInt(<span class="codeplus">imageView.getTag()</span>.toString());
</pre>
            <h4>setImageResource</h4>
            <p>Aan een ImageView kun je in java een plaatje (ImageResource) koppelen met behulp van
                het bestand in de map drawable.</p>

<pre class="code">
<span class="comment">//koppel plaatje aan de ImageView</span>
imageView.<span class="codeplus">setImageResource</span>(<span class="codeplus">R.drawable.kruisje</span>);
</pre>
            <p>Met de methode setImageResource kun je een plaatje verwijderen door als argument 0 mee
            te geven.</p>

<pre class="code">
<span class="comment">//verwijder plaatje van ImageView</span>
imageView.setImageResource(<span class="codeplus">0</span>);
</pre>

            <h4>Loopen door een Layout</h4>
            <p>Als een nieuw spel wordt gestart moeten alle ImageViews weer leeg worden gemaakt. Je kunt alle
                views binnen een layout (de zogenaamde <em>children</em> van een layout) benaderen met
                de methode getChildAt(indexpositie). Als je alle elementen van een layout wilt benaderen,
                dan kun je een for-lus gebruiken:</p>

<pre class="code">
GridLayout gridLayout = (GridLayout) findViewById(R.id.gridLayout);
int count = gridLayout.<span class="codeplus">getChildCount()</span>;
for (int i = 0; i < count; i++) {
    ImageView imageView = (ImageView) gridLayout.<span class="codeplus">getChildAt(i)</span>;
    imageView.setImageResource(0);
}
</pre>

        </div>


    </div>

</div>
<%@ include file="/AO/android/includes/bottom.html" %>
</html>

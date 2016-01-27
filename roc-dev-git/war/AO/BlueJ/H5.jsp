<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">

	<%@ include file="/AO/BlueJ/includes/zijmenu.jsp"%>

      
      <div class="col-md-9">
	        <h2>Collecties</h2>
	        <!-- Leerdoelen -->
	        <div class="bs-callout bs-callout-warning">
		       <h2>Leerdoelen</h2>
				<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je: </p>
				<ul>
					<li>weet hoe je een <em>ArrayList</em> maakt en gebruikt</li>
					<li>de <em>for-each</em> lus kent</li>
					<li>uitvoer kunt formatteren met <em>String.format()</em> en <em>printf()</em></li>
				</ul>
		          
	        </div>
	       <img src="images/List.gif" width=350>
	       <p>In dit hoofdstuk leer je werken met de klasse 
					<a href="https://docs.oracle.com/javase/7/docs/api/java/util/ArrayList.html" target="_blank">ArrayList</a>. 
					In een ArrayList kun je objecten opbergen. Een ArrayList is een stuk flexibeler dan een array omdat je er 
					objecten bij kunt doen en er weer uit kan halen met de opdrachten add(object) en remove(object).</p>
<pre class="code">
<span class="comment">//maak een object van type Leerling</span>
Leerling leerling = new Leerling(&quot;Pietje&quot;, &quot;3c&quot;);

<span class="comment">//maak een lijst van type Leerling</span>
ArrayList&lt;Leerling&gt; leerlingen = new ArrayList&lt;Leerling&gt;();

<span class="comment">//stop leerling in lijst</span>
leerlingen.add(leerling);

<span class="comment">//haal hem er weer uit</span>
leerlingen.remove(leerling);

</pre>					
					
					
					<p>Lijsten kun je doorlopen met een zogenaamde <em>&quot;for-each&quot;</em> opdracht. De volgende twee lussen 
					doen precies hetzelfde, namelijk de namen van de leerlingen uit de lijst afdrukken:</p>
<pre class="code">
for (int i = 0; i < leerlingen<span class="codeplus">.size()</span>; i++) {
    Leerling leerling = leerlingen.get(i);
    System.out.println(leerling.getNaam());
}

for <span class="codeplus">(Leerling leerling: leerlingen)</span> {
    System.out.println(leerling.getNaam());
</pre>					
					<p>De grootte van een ArrayList kun je opvragen met de methode size(). Dit is anders dan de 
					grootte van een array die je met .length opvraagt. In het tweede voorbeeld wordt ieder object 
					in de lijst langs gelopen en tijdelijk leerling genoemd. Let op: 
					leerling is dus steeds een ander object van de lijst!  
					Op het object leerling kunnen de public methoden 
					van de klasse Leerling worden aangeroepen.</p>
					<p>Nadeel van een ArrayList is dat je er alleen objecten in mag stoppen en geen primitieven zoals 
					int en double. Om dit nadeel op te lossen heeft java klassen die primitieve waarden als objecten 
					kunnen verpakken. Voorbeelden zijn Integer, Double, Float, Long en Boolean. Let op de hoofdletters! 
					</p>
					
	</div>
<%@ include file="/AO/BlueJ/includes/bottom.html"%>

<%@ include file="/AO/BlueJ/includes/pagetop.jsp" %>


<%	if (user != null) { %>

      
      <div class="col-md-10">
	        <h2>Objecten met objecten</h2>
	        <!-- Leerdoelen -->
	        <div class="bs-callout bs-callout-warning">
		       <h2>Leerdoelen</h2>
				<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je de volgende begrippen kent en kunt gebruiken:</p>
				<ul>
					<li>associatie tussen klassen</li>
					<li>referentie objecten </li>
					<li>het Terminal Window</li>
					<li>de methoden System.out.print( ) &amp; System.out.println( )</li>
					<li>In BlueJ een test-klasse en een test-fixture kunt maken</li>
					<li>concatenatie van Strings</li>
					<li>de methode toString( )</li>
				</ul>
		          
	        </div>
	       
					<h3>Associatie</h3>
					<p>In dit hoofdstuk leer je hoe je in een klasse objecten van een andere klasse kunt gebruiken. Een klasse kan een attribuut hebben dat een 
					object is van een andere klasse. Er is dan sprake van een associatie. In BlueJ wordt dit mooi ge&iuml;llustreerd doordat er een stippellijn tussen 
					de klassen wordt getoond.</p>
					<img class="imgfullwidth" src="/AO/BlueJ/images/assoociatiev2.jpg">
					<h3>Referenties</h3>
					<p>Om een team te kunnen maken moeten er spelers zijn. De klasse team heeft daarom twee attributen van het type Speler. Omdat de attributen 
					<em>verwijzen</em> naar objecten die tot een andere klasse behoren, noemen we ze referenties of referentieobjecten. In een klasse kunnen 
					objecten van een andere klasse worden gecre&euml;erd met het keyword <em>new</em>. Deze roept de constructor van de klasse Speler aan. </p>
					
<pre class="code">
Speler speler1 = new Speler(arg0, arg1, arg2)
</pre>				
					<p>Om op deze manier een instantie van een andere klasse te maken moeten beide klassen zich in hetzelfde <em>project</em> bevinden. 
					Anders moet de klasse ge&iuml;mporteerd worden. In de praktijk zul je in je Java klassen heel veel gebruik maken van andere klassen die je zelf 
					hebt gemaakt of die je uit de Java klassenbibliotheken (API) leent (zie web links).</p>
					
					
					
	</div>


	
    </div>
  </div>
</div>
	
<% } %>

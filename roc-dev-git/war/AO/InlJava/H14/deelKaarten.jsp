<%@ page import="inleidingJava.DeelKaarten" %>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

<%@ include file="/AO/InlJava/includes/zijmenu.jsp" %>
<%
	String tabel = "";
	DeelKaarten dk = new DeelKaarten();
	if (request.getParameter("deel_kaart") != null) {
		tabel = dk.maakTabel();
	}
%>

      
      <div class="col-md-9">
        <h2>Kaarten delen</h2>
        <h3>Voorbeeld</h3>
        <form action="/AO/inleiding-java/deel-kaarten?deel_kaart" method="get">
        	<input type="submit" name="deel_kaart"  value="Deel Kaarten" >
        </form>
        <%= tabel %>
		<h3>Uitwerking stap voor stap</h3>
		<p>Maak twee arrays voor de kleuren en de kaarten</p>
		
<pre class="code">
private String[] kleuren = {&quot;Ruiten&quot;, &quot;Klaver&quot;, &quot;Harten&quot;, &quot;Schoppen&quot;};
private String[] kaarten = {&quot;twee&quot;, &quot;drie&quot;, &quot;vier&quot;, &quot;vijf&quot;, &quot;zes&quot;, &quot;zeven&quot;, 
        &quot;acht&quot;, &quot;negen&quot;, &quot;tien&quot;, &quot;boer&quot;, &quot;vrouw&quot;, &quot;heer&quot;, &quot;aas&quot;};
</pre>		
		
		<p>Maak een array &quot;deck&quot; waar alle kaarten in komen en 4 arrays waar de kaarten van de 
		vier spelers in komen.</p>
		
<pre class="code">
private String[] deck = new String[52];
private String[] speler1 = new String[13];
private String[] speler2 = new String[13];
private String[] speler3 = new String[13];
private String[] speler4 = new String[13];
</pre>		
		
		<p>In de methode init() kun je het deck vullen met behulp van twee lussen. Hiervoor heb je een 
		teller nodig die doortelt tot het deck gevuld is.</p>
		
<pre class="code">
int index = 0;
//vul deck met kaarten
for (int i = 0; i &lt; kleuren.length; i++) {
    String kleur = kleuren[i];
    for (int j = 0; j &lt; kaarten.length; j++) {
        String kaart = kaarten[j];
        deck[index] = kleur + &quot; &quot; + kaart;
        index++;
    }
}
</pre>		
		<p>Om de arrays van de 4 spelers te vullen kun je een hulpmethode maken die een willekeurige kaart uit het 
		deck haalt. Een kaart mag natuurlijk maar &eacute;&eacute;n keer gedeeld worden. Dit is lastig want je kunt 
		een array niet kleiner of groter maken nadat hij is aangemaakt. Om dit probleem op te lossen kun je 
		een nieuwe array maken die gevuld wordt met alle kaarten uit het deck, behalve degene die net gedeeld is. Deze 
		hulparray vervangt deck nadat hij is aangemaakt.</p>
		
<pre class="code">
private String deelKaart() {	
    int random = new Random().nextInt(deck.length);
    String kaart = deck[random];
    
    <span class="comment">//vervang de inhoud van deck</span>
    String[] hulpLijst = new String[<span class="codeplus">deck.length - 1</span>];
    int hulpindex = 0;
    for (int i = 0; i < deck.length; i++) {
        if (<span class="codeplus">i != random</span>) {
            hulpLijst[hulpindex] = deck[i];
            hulpindex++;
        }
    }
    deck = hulpLijst;
    return kaart;
}
</pre>		
		<p>Nu kun je met behulp van de hulpmethode de kaarten verdelen in de methode init().</p>
		
<pre class="code">
for (int i = 0; i < 13; i++ ) {
    speler1[i] = deelKaart();
    speler2[i] = deelKaart();
    speler3[i] = deelKaart();
    speler4[i] = deelKaart();
}
</pre>		

		<p>Tot slot moet je de kaarten nog op het scherm zetten met paint().</p>
<pre class="code">
public void paint(Graphics g) {
    int x1 = 50;
    int x2 = 250;
    int x3 = 450;
    int x4 = 650;
    int y = 70;
    g.drawString(&quot;Speler 1&quot;, x1, y);
    g.drawString(&quot;Speler 2&quot;, x2, y);
    g.drawString(&quot;Speler 3&quot;, x3, y);
    g.drawString(&quot;Speler 4&quot;, x4, y);
    y = 100;
    for (int i = 0; i < 13; i++) {
        g.drawString(speler1[i], x1, y);
        g.drawString(speler2[i], x2, y);
        g.drawString(speler3[i], x3, y);
        g.drawString(speler4[i], x4, y);
        y = y + 20;
    }
}
</pre>		
		
	</div>
<%@ include file="/AO/InlJava/includes/bottom.html"%>


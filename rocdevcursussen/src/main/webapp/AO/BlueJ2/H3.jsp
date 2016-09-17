<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

    <%@ include file="/AO/BlueJ2/includes/zijmenu.jsp" %>


    <div class="col-md-9">
        <h2>Klassen</h2>
        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>

            <p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
                je de volgende begrippen kent en kunt gebruiken:</p>
            <ul>
                <li>klassendiagram</li>
                <li>namen van klassen, attributen en methoden</li>
                <li>case-sensitive</li>
                <li>public en private</li>
                <li>project</li>
                <li>gebruik van de constructor en keyword &quot;this&quot;</li>
                <li>gebruik verschillende soorten methoden</li>
                <li>getters en setters</li>
                <li>commentaar</li>
            </ul>
        </div>

        <h3>Inleiding</h3>
        <p>Zonder een klasse kun je geen objecten maken. Klassen vormen de basis van objectgeori&euml;nteerd
            programmeren. In de vorige hoofdstukken heb je gezien dat een klasse methoden heeft waar elk object gebruik
            van kan maken. Elk object bevat ook gegevens, de attributen van het object, die je in BlueJ met de Object
            Inspector kunt bekijken. De attributen moet je in de klasse defini&euml;ren, dat wil zeggen dat je voor
            elk attribuut een naam moet bedenken en het type moet opgeven. Hoe dat in zijn werk gaat leer je in dit
            hoofdstuk.</p>

        <h3>Een klasse voor bankrekeningen</h3>
        <p>Een bankrekening heeft een nummer. Ook heeft het een saldo en hij is gekoppeld aan een klant met een
            naam. Dit zijn de <em>attributen</em> van een bankrekening.</p>
        <p>Bij het maken van een <em>klasse</em> plaats je de attributen in de broncode van de klasse. Je moet voor
            elk attribuut een naam bedenken. Daar is meestal niet veel fantasie voor nodig. Een goede naam geeft aan wat
            de betekenis van het attribuut is: saldo, naam en nummer zijn in dit geval geschikt.</p>

        <h3>Klassendiagram</h3>
        <p>Als je met klassen werkt is het handig om een <em>klassendiagram</em> te maken. In zo&#39;n diagram
            stel je een klasse voor door een rechthoek die doorgaans uit drie gedeeltes bestaat. </p>
        <img src="/AO/BlueJ2/images/klassendiagram.png">

        <p>In bovenstaande figuur is het onderste gedeelte, het gedeelte waar de methoden komen, nog leeg. Verderop in
            dit hoofdstuk komt daar verandering in.</p>

        <p>Een klasse heeft een naam die begint met een hoofdletter. Het ligt voor de hand dat je een klasse voor
            bankrekeningen de naam Bankrekening geeft. De kop van de klasse komt er dan als volgt uit te zien:</p>

        <pre class="code">
public class Bankrekening</pre>

        <p>Het woord <em>public</em> duidt erop dat deze klasse voor algemeen gebruik is. Behalve de kop bestaat een
            klasse uit een body die door accolades wordt omgeven:</p>

        <pre class="code">
public class Bankrekening {
    ...
}</pre>


        <p>Op de plaats van de puntjes komen de attributen en de methoden. Welke attributen de klasse heeft, weten we
            al uit de vorige paragraaf. De attributen komen doorgaans aan het begin van de klasse.</p>

        <pre class="code">
public class Bankrekening {
    private String naam;
    private int nummer;
    private double saldo;
}</pre>
        <p>merk op dat voor de attributen steeds het woord <em>private</em> staat. Dat betekent dat de gegevens niet
            openbaar zijn, ze kunnen niet zomaar veranderd of opgevraagd worden.</p>

        <h3>Nieuw project maken in BlueJ</h3>
        <p>BlueJ maakt gebruik van projecten om bij elkaar horende klassen op te bergen. Voor een nieuwe klasse
            Bankrekening maken we een nieuw project. In het project maak je een klasse Bankrekening.</p>
        <p>In het vensterzie je de klasse Bankrekening. Hij is gearceerd omdat hij nog niet gecompileerd is. Maar
            eerst ga je de klasse vullen met de attributen die onze Bankrekening nodig heeft. BlueJ maakt altijd
            standaard
            wat voorbeeld-code aan. Die kun je verwijderen door alle code tussen de openings- en sluitaccolade van de
            klasse
            te verwijderen.</p>

        <p>Maak nu de drie attributen in de klasse. Je klasse ziet er dan als volgt uit:</p>
        <pre class="code">
public class Bankrekening {
    private String naam;
    private int nummer;
    private double saldo;
}</pre>
        <p>Compileer de klasse. Als het goed is zie je onderin het scherm dat er geen fouten zijn.</p>

        <p>Je kunt nu een object maken van de klasse maar dit object kan nog niets omdat de klasse nog geen methoden
            heeft. De enige methodes die je kunt gebruiken zijn de methodes van de klasse <a
                    href="https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html" target="_blank">Object</a>.
            Iedere klasse stamt af van de klasse Object, dus deze
            methodes kun je op iedere Java klasse aanroepen.</p>

        <p>Wat je wel kunt doen, is in het object de waarde van de drie attributen bekijken met <code>Inspect</code>.</p>
        <img src="/AO/BlueJ2/images/bankrekening_object.png">
        <p>Het attribuut nummer (int) heeft de waarde 0 gekregen. Het attribuut saldo (double) 0.0 en de naam (String)
        de waarde null. De waarde null betekent dat het attribuut nog geen waarde heeft.</p>
        <p>De bovenstaande waarden zijn standaardwaarden die alle attributen in Java automatisch krijgen, tenzij je ze
        zelf een andere waarde geeft. E&eacute;n van de manieren waarop je dat kan doen is een <em>constructor</em> te
        maken.</p>

        <h3>Een constructor voor Bankrekening</h3>
        <p>Een constructor is een methode die wordt aangeroepen als je een nieuw object maakt. De belangrijkste
        functie van een constructor is in het algemeen ervoor te zorgen dat de attributen een waarde krijgen. Daarom
        heeft een constructor meestal argumenten, zodat je de waarden van die argumenten kunt doorgeven aan de
        attributen. Een constructor heeft altijd dezelfde naam als de naam van de klasse, dus een constructor voor de
        klasse Bankrekening zou er als volgt uit kunnen zien:</p>

        <pre class="code">
public Bankrekening( String naam,
                     int nummer,
                     double saldo ) {
    this.naam = naam;
    this.nummer = nummer;
    this.saldo = saldo;
}</pre>
        <p>Voeg de constructor aan de klasse toe onder de attributen.</p>
        <p>Nu kun je een object maken met behulp van de constructor. Vul argumenten in waarmee je de attributen
        een waarde geeft. String waardes moeten worden omgeven door aanhalingstekens.</p>
        <p>Als je dit object inspecteert zul je zien dat de attributen de waardes hebben gekregen die je hebt
        ingevuld als argumenten. Dit komt door de opdrachten in de body van de constructor:</p>

        <pre class="code">
this.naam = naam;
this.nummer = nummer;
this.saldo = saldo;</pre>

        <p>De uitdrukking this.saldo verwijst naar het attribuut met de naam saldo. Saldo zonder this is het argument
        waarvoor je een waarde hebt ingevoerd. Dus this.saldo = saldo betekent: het <em>attribuut</em> saldo krijgt de
        waarde van het <em>argument</em> saldo.</p>


        <p>Maak een tweede object en voer andere waarden in. Inspecteer ook dit object en merk op dat de waarden van
        de attributen anders zijn dan die van het eerste object. Ieder object heeft zijn eigen stel attributen. In elk
        object kun je andere gegevens opslaan. Alle bankrekening objecten hebben een naam, nummer en saldo, maar hun
        waarden kunnen verschillen. Ze hebben een andere toestand.</p>

        <h3>Methoden voor de klasse Bankrekening</h3>
        <p>Alleen maar gegevens in een object opslaan is niet erg nuttig. Je moet die gegevens ook kunnen opvragen en
        eventueel wijzigen. Daarvoor heb je <em>methoden</em> nodig. Welke methoden zou een bankrekening moeten hebben?
        Wat doe je normaal gesproken met een bankrekening? In elk geval drie dingen:</p>
        <ul>
            <li>geld storten</li>
            <li>geld opnemen</li>
            <li>saldo opvragen</li>
        </ul>
        <p>Maak drie methoden: stort(), neemOp() en getSaldo().</p>
        <img src="/AO/BlueJ2/images/klassendiagram_bankrekening.png">

        <h3>De methode stort()</h3>
        <p>Het bedrag dat je stort is niet elke keer hetzelfde. Daarom krijgt de methode stort() een argument, zodat je
        bij de aanroep van de methode het te storten bedrag kunt invullen. Het bedrag moet aan het bestaande saldo
        worden toegevoegd.</p>
        <pre class="code">
public void stort(double bedrag) {
    saldo = saldo + bedrag;
}</pre>

        <p>Hier staat dat de nieuwe waarde van saldo gelijk wordt aan de oude waarde van saldo plus het ingevoerde
        bedrag.</p>

        <h3>De methode getSaldo()</h3>
        <p>Methodes die de waarde van een attribuut teruggeven beginnen meestal met get gevolgd door de naam van het
            attribuut. Dergelijke methodes worden ook wel getters genoemd. Het saldo opvragen doe je met de methode
            getSaldo(). Deze methode levert het saldo als retourwaarde af. Dat
        gaat met de opdracht <em>return</em>.</p>
        <pre class="code">
public <span class="codeplus">double</span> getSaldo() {
    return saldo;
}</pre>

        <p>Merk op dat in de kop van de methode het woord <em>double</em> staat in plaats van void. Als een methode
        een retourwaarde heeft moet je het type daarvan in de kop van de methode aangeven.</p>

        <h3>De methode neemOp()</h3>
        <p>Bij het opnemen van geld van een rekening varieert het bedrag, dus moeten we nu weer een argument
        gebruiken, waarmee je aangeeft hoeveel geld je gaat opnemen. Het saldo moet vervolgens worden verlaagd
        met dat bedrag. En hij levert als retourwaarde het opgenomen bedrag af zodat hier verder iets mee gedaan
        kan worden, bijvoorbeeld de bankbiljetten uittellen.</p>
        <pre class="code">
public double neemOp(double bedrag)
{
    saldo -= bedrag;
    return bedrag;
}</pre>

        <p>Voeg de drie methoden aan de klasse toe.</p>

        <p>Maak een object van de klasse met de constructor die je hebt gemaakt. Je kunt nu de methoden testen. Roep de
        methode stort aan en voer een bedrag in. Roep de methode getSaldo() aan, als het goed is is het saldo verhoogd
        met het gestorte bedrag. Neem nu een bedrag op en check opnieuw het saldo. Klopt het saldo?</p>

        <h3>Lay-out van de broncode</h3>
        <p>Een goede programmeur hecht veel waarde aan de lay-out van de broncode omdat slordige code moeilijk leesbaar
        is en je gemakkelijk fouten maakt. En fouten (bugs) zijn de grootste vijand van de programmeur.</p>

        <p>Voor de lay-out van code worden in de praktijk verschillende methoden toegepast, maar iedereen is het
        erover eens dat je na elke openingsaccolade (minstens) twee spaties naar rechts inspringt. Bij een
        sluitaccolade spring je weer twee spaties terug. Sommige IDE&#39;s kunnen code met een slordige lay-out
        opnieuw voor je formatteren. Onderstaande code blok toont twee veelgebruikte codeerstijlen. De tweede neemt
        wat minder ruimte en is het meest gangbaar.</p>

        <pre class="code">
public void stort(double bedrag)
{
    saldo = saldo + bedrag;
}

public void stort(double bedrag) {
    saldo = saldo + bedrag;
}</pre>

       <h3>De klasse Leerling</h3>
        <p>Als tweede voorbeeld maak je een klasse om objecten te maken waarin je gegevens van leerlingen kunt
        opslaan: van elke leerling de naam, de klas, het geslacht en een leerlingnummer. Het nummer is
        noodzakelijk om de gegevens uniek te maken. Het kan immers voorkomen dat er twee leerlingen met dezelfde
        naam zijn. Een voor de hand liggende naam voor de klasse is Leerling.</p>

        <h3>De attributen</h3>
        <p>De attributen van de klasse Leerling krijgen de volgende namen:</p>
        <ul>
            <li>naam</li>
            <li>klas</li>
            <li>geslacht</li>
            <li>nummer</li>
        </ul>
        <img src="/AO/BlueJ2/images/klassendiagramLeerling.png">
        <p>In het klassendiagram zet je het type achter de naam van het attribuut en voorafgegaan door een dubbele
        punt. Het min-teken voor de namen duidt erop dat de attributen <em>private</em> zijn. Een plusteken gebruik je
        voor <em>public</em>. De broncode komt er met deze attributen zo uit te zien:</p>

        <pre class="code">
public class Leerling {
    private String naam;
    private String klas;
    private String geslacht;
    private int nummer;
}</pre>

        <h3>Constructor</h3>
        <p>Bij het maken van een object moeten de attributen een waarde krijgen. Daartoe maak je een constructor
        met vier argumenten, voor elk attribuut &eacute;&eacute;n.</p>

        <pre class="code">
public Leerling(String naam, String klas, String geslacht, int nummer) {
    this.naam = naam;
    this.klas = klas;
    this.geslacht = geslacht;
    this.nummer = nummer;
}</pre>
        <h3>Getters en setters</h3>
        <p>Als je een object hebt gemaakt en de attributen gevuld zijn met waarden, moet je ook de mogelijkheid
        hebben om de waarden van de attributen op te vragen of ze te wijzigen. Daarvoor maak je methoden. Een
        methode die niets anders doet dan de waarde van een attribuut afleveren als retourwaarde heet een
        <em>getter</em>. Het is gebruikelijk om de naam van zo&#39;n methode te beginnen met het Engelse woord
        get gevolgd door de naam van het attribuut. Dus getNaam, getKlas, getGeslacht en getNummer;</p>

<pre class="code">
public String getNaam() {
    return naam;
}</pre>
        <p>Het type van de retourwaarde van deze methode is String, daarom zet je in de kop van de methode String.</p>
        <p>Soms is het nodig om de bestaande waarde van een attribuut te wijzigen. Ook daarvoor maak je methoden.
        Zo&#39;n methode heet een <em>setter</em>. Het is gebruikelijk om de naam van zo&#39;n methode met het
        Engelse woord <em>set</em> te beginnen, gevolgd door de naam van het attribuut. Dus setNaam, setKlas,
        setGeslacht en setNummer.</p>
        <p>Een setter heeft geen retourwaarde; in de kop van de methode staat dan ook <em>void</em>. De methode
        moet wel een argument hebben. Met dat argument voer je immers de waarde in die het attribuut moet krijgen.
        </p>
<pre class="code">
public void setNaam(String naam) {
    this.naam = naam;
}</pre>
        <p>Hieronder zie je het klassendiagram van de klasse Leerling tot nu toe. Het is nog niet af: er zijn
        alleen methoden om de naam op te vragen of te wijzigen en nog niet voor de andere attributen.</p>
        <img src="/AO/BlueJ2/images/klassendiagram_leerling_2.png">
        <p>Merk op dat in een klassendiagram het type van het attribuut altijd erachter staat. Ook bij een argument
        staat het type erachter. En het type van de retourwaarde staat achter de methode.</p>



        <div class="opdrachten">
            <h2>Vragen</h2>
            <ol>
                <li>Wat is een attribuut?</li>
                <li>Wat plaats je in de drie gedeelten van een klassendiagram?</li>
                <li>Welke van de volgende benamingen zijn geldige namen in Java?
                    <ul>
                        <li>Java</li>
                        <li>U2</li>
                        <li>AZ67</li>
                        <li>8088</li>
                        <li>H&M</li>
                        <li>get saldo</li>
                        <li>get_saldo</li>
                        <li>getSaldo</li>
                    </ul>
                </li>
                <li>Welk type gebruik je in Java voor een stukje tekst? Voor een geheel getal? Voor een gebroken
                getal?</li>
                <li>Wat betekent case-sensitive?</li>
                <li>Wat is een constructor?</li>
                <li>Met welk teken geef je private aan in een klassendiagram? En met welk teken public?</li>
                <li>Wat is een getter? En wat is een setter?</li>
            </ol>
        </div>

        <div class="opdrachten">
            <h2>Opgave 4.1</h2>
            <p>Gegeven is het diagram van de klasse CD:<br>
                <img src="/AO/BlueJ2/images/klassendiagram_cd.png"><br>
                Schrijf de broncode voor de klasse CD. Geef de klasse een constructor met drie argumenten waarmee
                de attributen een waarde kunnen krijgen. Geef de klasse drie getters en setters waarmee je de
                waarden van de attributen kunt opvragen en wijzigen.</p>
        </div>

        <div class="opdrachten">
            <h2>Opgave 4.2</h2>
            <p>Maak in BlueJ een nieuw project aan met de naam Leerling. Maak een nieuwe klasse met de naam Leerling
            en maak de broncode. Test de methoden, dat wil zeggen:
                roep de methoden getNaam() aan, wijzig de naam met setNaam() en vraag daarna opnieuw de naam op.</p>
        </div>

        <div class="opdrachten">
            <h2>Opgave 4.3</h2>
            <p>Voeg aan de broncode van de klasse Leerling drie methoden toe om de waarden van de overige
            attributen op te vragen. Test de methoden op een object van de klasse. Voeg vervolgens drie methoden
            toe om de waarde van de overige attributen te wijzigen. Test de methoden.</p>
        </div>



    </div>
</div>
<%@ include file="/AO/BlueJ2/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#h4").addClass("selected");
    })
</script>
</html>
<%@ page import="jspcursus.autoshop.Auto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jspcursus.autoshop.DataUtils" %>

<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/JSP_Java_DB/includes/zijmenu.jsp" %>

    <%
        if (request.getAttribute("check") == null) {
            response.sendRedirect("/jsp_deel_3");
        } else {
    %>


    <div class="col-md-9">
        <h2>Java klassen</h2>

        <!-- Leerdoelen -->
        <div class="bs-callout bs-callout-warning">
            <h2>Leerdoelen</h2>
            <p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat
                je weet:</p>
            <ul>
                <li>hoe je java klassen in je web app kunt maken en gebruiken</li>

            </ul>
        </div>

        <%
            ArrayList<Auto> lijst = DataUtils.getAutolijst();

        %>

        <div class="opdrachten" id="zelftoets">
            <h2>Praktijkopdracht</h2>
            <p>Maak een webpagina volgens onderstaand voorbeeld waarin auto's
                of andere produkten worden vertoond en waarbij de gebruiker kan
                selecteren op merk of minimum- en/of maximumprijs.</p>


            <label>Kies Merk</label> <select id="merk">
            <option value="alle">Alle merken</option>
            <%
                for (String merk : DataUtils.getMerken()) {
            %>
            <option value="<%=merk%>"><%=merk%>
            </option>
            <%
                }
            %>
        </select><br> <label>Minimum prijs</label> <input type="text"
                                                          id="minprijs"> <label>Maximum prijs</label> <input
                type="text" id="maxprijs"><br> <input type="button"
                                                      id="knop_merk_prijs" value="OK">


            <div id="autoselectie">

                <%
                    for (Auto auto : lijst) {
                %>
                <div class="autokader">
                    <img src="<%=auto.getFoto()%>"
                         alt="<%=auto.getMerk()%><%=auto.getType()%>">
                    <p class="merktype"><%=auto.getMerk()%>
                        <%=auto.getType()%>
                    </p>
                    <p class="prijs">
                        &euro;
                        <%=auto.getPrijsFormat()%>
                    </p>
                </div>
                <%
                    }
                %>

            </div>
            <div class="toonknopcontainer">
                <button class="toonknop" id="toonzelftoets"
                        onclick="toon('uitwzelftoets')">Toon uitwerking
                </button>
            </div>

            <div class="uitwerking" id="uitwzelftoets">
                <p>Om je op weg te helpen kun je gebruik maken van de twee
                    onderstaande Java klassen.</p>
				<pre class="code">
package jspcursus;

import java.text.DecimalFormat;


<span class="comment">/**
 *Een typische POJO klasse waarin je de relevante data van een auto-object kunt opslaan
 */</span>

public class Auto {
    <span class ="comment">// De attributen (eigenschappen) van een auto die we nodig hebben voor de app</span>
    private String mMerk;
    private String mType;
    private int mPrijs;
    private String mFotourl;

    <span class="comment">// Constructor waarmee je een auto object maakt</span>
    public Auto(String merk, String type, int prijs, String fotourl) {
        this.mMerk = merk;
        this.mType = type;
        this.mPrijs = prijs;
        this.mFotourl = fotourl;
    }

    <span class="comment">// get methoden (getters) die de attributen van een auto-object teruggeven</span>

    public String getMerk() {
        return mMerk;
    }
    
    public String getType() {
        return mType;
    }
    
    public int getPrijs() {
        return mPrijs;
    }
    
    public String getFoto() {
        return mFotourl;
    }
    
    
    <span class="javadoc">/**
      *
      * @return geeft prijs als geformatteerde String mbv DecimalFormat object
      */</span>
    public String getPrijsFormat() {
        <span class="comment">//met een DecimalFormat object kun je een double naar een String converteren
        //volgens een bepaald patroon. Zie java documentatie.</span>
    	DecimalFormat df = new DecimalFormat(&quot;#,##0.--&quot;);
    	double prijs = (double) this.getPrijs();
    	String fPrijs = df.format(prijs);
    	return fPrijs;
    }

</pre>

				<pre class="code">
package jspcursus;

import java.util.ArrayList;

<span class="comment">/**
 * Utility cLass to retrieve hard-coded data.
 * Class contains only static methods so no need to instanciate
 */</span>
public class DataUtils {

    <span class="comment">/**
     * @return hard-coded list of cars
     *
     */</span>
    public static ArrayList&lt;Auto&gt; getAutolijst() {
        ArrayList<Auto> autolijst = new ArrayList<>();
        autolijst.add(new Auto(&quot;Ford&quot;, &quot;Fiesta&quot;, 23999, &quot;images/autos/fordfiesta.jpg&quot;));
        autolijst.add(new Auto(&quot;Ford&quot;, &quot;Focus&quot;, 18995, &quot;images/autos/fordfocus.jpg&quot;));
        autolijst.add(new Auto(&quot;Opel&quot;, &quot;Astra&quot;, 14895, &quot;images/autos/opelastra.jpg&quot;));
        autolijst.add(new Auto(&quot;Opel&quot;, &quot;Insignia&quot;, 65450, &quot;images/autos/opelinsignia.jpg&quot;));
        autolijst.add(new Auto(&quot;Subaru&quot;, &quot;Forester&quot;, 34750, &quot;images/autos/subaruforester.jpg&quot;));
        autolijst.add(new Auto(&quot;Subaru&quot;, &quot;Impreza&quot;, 28345, &quot;images/autos/subaruimpreza.jpg&quot;));
        autolijst.add(new Auto(&quot;Mercedes&quot;, &quot;E 63&quot;, 110995, &quot;images/autos/mercedede63.png&quot;));
        autolijst.add(new Auto(&quot;Mercedes&quot;, &quot;CLA 45&quot;, 190780, &quot;images/autos/mercedescla45.jpg&quot;));
        autolijst.add(new Auto(&quot;Mercedes&quot;, &quot;E 230&quot;, 1000, &quot;images/autos/mercedese230.jpg&quot;));
        autolijst.add(new Auto(&quot;Mercedes&quot;, &quot;C 250&quot;, 599, &quot;images/autos/mercedesc250.jpg&quot;));
        autolijst.add(new Auto(&quot;Ferrari&quot;, &quot;612 GTO&quot;, 350500, &quot;images/autos/ferrari612.jpg&quot;));
        autolijst.add(new Auto(&quot;Ferrari&quot;, &quot;California&quot;, 210780, &quot;images/autos/ferraricalifornia.jpg&quot;));
        autolijst.add(new Auto(&quot;Ferrari&quot;, &quot;458&quot;, 280775, &quot;images/autos/ferrari458.jpg&quot;));
        autolijst.add(new Auto(&quot;Lotus&quot;, &quot;Elise CR&quot;, 48591, &quot;images/autos/lotuselisecr.jpg&quot;));
        autolijst.add(new Auto(&quot;Lotus&quot;, &quot;Elise S CR&quot;, 60079, &quot;images/autos/lotuselisescr.jpg&quot;));
        autolijst.add(new Auto(&quot;Citroen&quot;, &quot;2CV&quot;, 459, &quot;images/autos/citroen2cv.jpg&quot;));
        autolijst.add(new Auto(&quot;Volvo&quot;, &quot;V40&quot;, 1250, &quot;images/autos/volvov40.jpg&quot;));
        autolijst.add(new Auto(&quot;Mini&quot;, &quot;Cooper&quot;, 34495, &quot;images/autos/minicooper.jpg&quot;));

        return autolijst;
    }


    <span class="comment">/**
     * Ten behoeve van het select merk input veld
     * @return een lijst met alle unieke merken
     */</span>
    public static ArrayList<String> getMerken() {
        ArrayList&lt;String&gt; merken = new ArrayList<>();
        for (Auto auto: getAutolijst()) {
            String merk = auto.getMerk();
            if (!merken.contains(merk)) {
                merken.add(merk);
            }
        }
        return merken;
    }

}

</pre>

            </div>

        </div>

        <%--<div class="opdrachten" id="zelftoetsstudenten">--%>
            <%--<h2>Uitwerking studenten</h2>--%>
            <%--<!-- <div id="ninjalevels">--%>

                            <%--<img alt="whitebelt" src="/images/white_belt.png">--%>
                            <%--<img alt="greenbelt" src="/images/green_belt.png">--%>
                            <%--<img alt="blackbelt" src="/images/black_belt.png">--%>
                            <%--<img alt="master" src="/images/master.png">--%>


                    <%--</div> -->--%>


            <%--<h3>Criteria voor de Ninja-levels</h3>--%>
            <%--<p>De definitieve criteria zijn nog onderwerp van gesprek, er--%>
                <%--kunnen derhalve geen rechten aan deze pagina worden ontleend</p>--%>

            <%--<div class="ninja_level_uitleg">--%>
                <%--<img class="ninja_img_uitleg" alt="greenbelt"--%>
                     <%--src="<c:url value="/images/green_belt.png"/>">--%>
                <%--<ul>--%>
                    <%--<li>Het onderdeel &quot;programmeren&quot; van de proeve van--%>
                        <%--bekwaamheid jaar 1 is als voldoende beoordeeld--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>

            <%--<div class="ninja_level_uitleg">--%>
                <%--<img class="ninja_img_uitleg" alt="blackbelt"--%>
                     <%--src="<c:url value="/images/black_belt.png"/>">--%>
                <%--<ul>--%>
                    <%--<li>de pagina is ingebed in je online portfolio. Je hebt een--%>
                        <%--eigen(zinnige) stijl gemaakt--%>
                    <%--</li>--%>
                    <%--<li>de HTML van het selectieveld &quot;Merk&quot; wordt--%>
                        <%--automatisch gevuld met unieke merken. Default is &quot;alle--%>
                        <%--merken&quot;</li>--%>
                    <%--<li>bij de inputvelden &quot;prijs&quot; hoeft maar--%>
                        <%--&eacute;&eacute;n van beide velden door gebruiker te worden--%>
                        <%--ingevuld (twee mag uiteraard ook)--%>
                    <%--</li>--%>
                    <%--<li>de auto&#039;s verschijnen netjes naast en onder elkaar,--%>
                        <%--de pagina elementen schalen afhankelijk van de schermgrootte--%>
                    <%--</li>--%>
                    <%--<li>de prijzen van de produkten zijn geformatteerd volgens de--%>
                        <%--Nederlandse standaard (1.000.000,-)--%>
                    <%--</li>--%>
                    <%--<li>er kan een combinatie van Merk(en) en prijzen worden--%>
                        <%--geselecteerd--%>
                    <%--</li>--%>
                    <%--<li>de pagina heeft een overzichtelijke lay-out en een--%>
                        <%--wervende vormgeving--%>
                    <%--</li>--%>
                    <%--<li>de pagina staat online in een produktieomgeving (zoals--%>
                        <%--Google App Engine)--%>
                    <%--</li>--%>
                    <%--<li>de broncode van de web-app is &quot;Open Source&quot; en--%>
                        <%--is te vinden op <a href="https://github.com/" target="_blank">GitHub</a>--%>
                        <%--inclusief een readme bestand met een Engelstalige--%>
                        <%--gebruiksaanwijzing--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<div class="ninja_level_uitleg">--%>
                <%--<img class="ninja_img_uitleg" alt="master" src="<c:url value="/images/master.png"/>">--%>
                <%--<ul>--%>
                    <%--<li>alle vereisten zwarte band</li>--%>
                    <%--<li>de inputvelden prijs zijn vervangen door een--%>
                        <%--&quot;slider&quot; waarmee zowel minimum- als maximumprijs kan--%>
                        <%--worden aangepast (<a--%>
                                <%--href="http://demos.jquerymobile.com/1.3.0-rc.1/docs/demos/widgets/sliders/rangeslider.html"--%>
                                <%--target="_blank">voorbeeld</a>)--%>
                    <%--</li>--%>
                    <%--<li>er kunnen nu ook meerdere merken worden geselecteerd</li>--%>

                    <%--<li>de pagina is gekoppeld aan een database en er is--%>
                        <%--functionaliteit toegevoegd zodat de eigenaar van de website zijn--%>
                        <%--voorraad op gemakkelijke wijze kan beheren.--%>
                    <%--</li>--%>
                    <%--<li>De auto-divs worden met <a--%>
                            <%--href="http://www.w3schools.com/jquery/jquery_ref_ajax.asp"--%>
                            <%--target="_blank">JQuery / AJAX</a> ververst zonder dat de pagina--%>
                        <%--hoeft te worden herladen--%>
                    <%--</li>--%>

                <%--</ul>--%>
            <%--</div>--%>
            <%--<h3>Publiceer je portfolio</h3>--%>
            <%--<p>--%>
                <%--Je kunt je portfolio <a href="/studenten#portfolio-form">hier</a>--%>
                <%--publiceren.--%>
            <%--</p>--%>
        <%--</div>--%>
    </div>
</div>
<%@ include file="/AO/JSP_Java_DB/includes/bottom.html" %>
<script>
    $(document).ready(
            function () {

                $("li#deel-3").addClass("selected");

                /***********  Rekenmachine  **********/

                $(document).on(
                        'click',
                        '#reken_functie_plus',
                        function () {
                            var functie = $("#reken_functie_plus").val();
                            var arg1 = $("#arg1").val();
                            var arg2 = $("#arg2").val();
                            $.get("/rekenmachine?arg1=" + arg1 + "&arg2="
                                    + arg2 + "&functie=" + functie, function (responseText) {
                                $("#inhoud_rekenmachine").html(responseText);
                            });
                        });
                $(document).on(
                        'click',
                        '#reken_functie_min',
                        function () {
                            var functie = $("#reken_functie_min").val();
                            var arg1 = $("#arg1").val();
                            var arg2 = $("#arg2").val();

                            $.get("/rekenmachine?arg1=" + arg1 + "&arg2="
                                    + arg2 + "&functie=" + functie, function (responseText) {
                                $("#inhoud_rekenmachine").html(responseText);
                            });
                        });
                $(document).on(
                        'click',
                        '#reken_functie_maal',
                        function () {
                            var functie = $("#reken_functie_maal").val();
                            var arg1 = $("#arg1").val();
                            var arg2 = $("#arg2").val();
                            $.get("/rekenmachine?arg1=" + arg1 + "&arg2="
                                    + arg2 + "&functie=" + functie, function (responseText) {
                                $("#inhoud_rekenmachine").html(responseText);
                            });
                        });
                $(document).on(
                        'click',
                        '#reken_functie_delen',
                        function () {
                            var functie = $("#reken_functie_delen").val();
                            var arg1 = $("#arg1").val();
                            var arg2 = $("#arg2").val();
                            $.get("/rekenmachine?arg1=" + arg1 + "&arg2="
                                    + arg2 + "&functie=" + functie, function (responseText) {
                                $("#inhoud_rekenmachine").html(responseText);
                            });
                        });

                /***********  Auto shop  **********/

                $("#knop_merk_prijs").click(
                        function () {
                            var merk = $("#merk").val();
                            var minprijs = $("#minprijs").val();
                            var maxprijs = $("#maxprijs").val();
                            $.get("/autoshop?merk=" + merk + "&minprijs="
                                    + minprijs + "&maxprijs=" + maxprijs,
                                    function (responseText) {
                                        $("#autoselectie").html(responseText);
                                    });
                        });
            });
</script>
</html>
<%
    }
%>

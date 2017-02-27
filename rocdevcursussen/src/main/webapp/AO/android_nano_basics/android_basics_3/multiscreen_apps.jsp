<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 19-11-16
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android_nano_basics/includes/zijmenu.jsp" %>

    <div class="col-md-9">

        <div class="bs-callout bs-callout-info">
            <h2>
                <a href="https://www.udacity.com/course/android-basics-nanodegree-by-google--nd803"
                   target="_blank">Android for beginners Nanodegree</a></h2>
            <h3>Android Basics: <a
                    href="https://classroom.udacity.com/courses/ud839/lessons/7633778648/concepts/75563354790923#"
                    target="_blank">Multiscreen Apps</a></h3>
            <p>Benodigde tijd: ca 30 uur</p>
        </div>
        <div class="bs-callout bs-callout-warning">
            <h3>Leerdoelen</h3>
            <p>Na het voltooien van deze cursus kun je:</p>
            <ul>

                <li>een nieuwe <strong>Activity</strong> in je project maken</li>
                <li>met een <strong>explicit intent</strong> een andere Activity binnen je app starten</li>
                <li>op verschillende manieren een <strong>OnClickListener</strong> maken die click events op een view
                    afhandelt
                </li>
                <li>een onderscheid maken tussen <strong>primitieve data-types</strong> en <strong>objecten</strong>
                </li>
                <li><strong>arrays</strong> maken met waardes van een bepaald <strong>data-type</strong></li>
                <li>waardes aan een array toevoegen en gebruiken</li>
                <li><strong>Log Messages</strong> maken</li>
                <li>een <strong>ArrayList</strong> maken en weet je wat de verschillen zijn met een array</li>
                <li>objecten aan een ArrayList kunt toevoegen, verwijderen en gebruiken</li>
                <li><strong>child-views</strong> <strong>dynamisch (dynamically)</strong> aan een
                    <strong>LinearLayout</strong> toevoegen
                </li>
                <li>een <strong>while-loop</strong> en een <strong>for-loop</strong> maken</li>
                <li>een <strong>ListView</strong> en een <strong>GridView</strong> maken met een eenvoudige
                    <strong>ArrayAdapter</strong></li>
                <li>een custom java klasse maken met <strong>attributen (state)</strong>,
                    een <strong>constructor</strong> en <strong>get-methoden (getters)</strong></li>
                <li>een custom ArrayAdapter maken met behulp van een <a
                        href="https://github.com/udacity/ud839_CustomAdapter_Example" target="_blank">voorbeeld
                    project</a></li>
                <li>plaatjes voor verschillende schermresoluties aan je project toevoegen</li>
                <li>meerdere constructors maken (<strong>overloading</strong>)</li>
                <li>in java een <strong>ImageResource</strong> aan een ImageView meegeven</li>
                <li><strong>Constanten</strong> gebruiken</li>
                <li>met java een View zichtbaar (<strong>VISIBLE</strong>), onzichtbaar (<strong>INVISIBLE</strong>),
                    of geheel kunt wegnemen (<strong>GONE</strong>) met
                constanten van de View klasse</li>
                <li><strong>conditionele</strong> statements maken met <strong>if</strong>, <strong>else</strong> en
                    <strong>else if</strong></li>
                <li>een <strong>OnItemClickListener</strong> aan een AdapterView (bijvoorbeeld ListView
                    of GridView) kunt koppelen</li>
                <li>een <strong>MediaPlayer</strong> object gebruiken om media (bijvoorbeeld geluid) af te spelen</li>
                <li><strong>Life Cycle callback</strong> methodes <strong>overriden</strong></li>
                <li>met een <strong>viewpager</strong> en <strong>fragments</strong> een layout met <strong>Tabs</strong>
                maken</li>

            </ul>

        </div>
        <h3>De Android Life Cycle</h3>
        <a href="https://developer.android.com/training/basics/activity-lifecycle/index.html" target="_blank">
        <img src="/AO/android_nano_basics/android_basics_3/lifecycle.png"></a>


        <div class="opdrachten">
            <h2>Project</h2>
            <p>Maak een tour guide app die toeristen informatie geeft over attracties in jouw stad die jij hen aanraadt
                om te bezoeken.
                Voor meer info zie
                <a href="https://classroom.udacity.com/courses/ud839/lessons/6745394898239847/concepts/78297108220923#"
                   target="_blank">Project Overview</a>. </p></div>



    </div>


</div>
</div>
<%@ include file="/AO/android_nano_basics/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#multiscreen").addClass("selected");
    })
</script>
</html>
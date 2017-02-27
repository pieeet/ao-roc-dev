<%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 10-01-17
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/android_nano_basics/includes/zijmenu.jsp" %>

    <div class="col-md-9">

        <h2>
            <a href="https://www.udacity.com/course/android-basics-nanodegree-by-google--nd803"
               target="_blank">Android for beginners Nanodegree</a></h2>
        <h3>Android Basics: <a
                href="https://classroom.udacity.com/courses/ud845/lessons/a6950a5d-b0f0-4b2a-9992-63cfbdec4dff/concepts/aebd6716-d82b-4670-ad80-cca18a7b0ee1#"
                target="_blank">Data Storage</a></h3>
        <p>Benodigde tijd: ca 40 uur</p>

        <div class="bs-callout bs-callout-warning">
            <h3>Leerdoelen</h3>
            <p>Na het voltooien van deze cursus kun je:</p>
            <ul>
                <li>een SQLite database met tabellen met verschillende datatypen
                    aanmaken
                </li>
                <li>data kunt invoeren, opvragen, wijzigen en
                    verwijderen <strong>(CRUD)</strong></li>
                <li><strong>Constraints</strong> (PRIMARY KEY, AUTOINCREMENT, NOT NULL,
                    DEFAULT) aan de kolommen van een database
                    toevoegen
                </li>
                <li>database <strong>Constanten</strong> defini&euml;ren in een <strong>Contract</strong>
                    klasse</li>
                <li>een subklasse van de <strong>SQLiteOpenHelper</strong> klasse maken om de database aan te maken
                    en <strong>readable</strong> of <strong>writable</strong> objecten van de <strong>
                        SQLiteDatabase</strong> klasse maken</li>
                <li>een menu en menu items toevoegen en zorgen dat er wat gebeurt als gebruiker een item selecteert
                in de methode <strong>onOptionsItemSelected</strong></li>
                <li>een item aan een tabel in je database kunt toevoegen met behulp van een object van de klasse
                <strong>ContentValues</strong></li>
                <li>een SQLite databse query maken met behulp van een <strong>projection</strong> (de kolommen van een tabel),
                    een <strong>selection</strong> (de kolommen voor de where-clause) en <strong>selectionArgs</strong>
                    (de waardes in de where-clause)
                </li>
                <li>met een <strong>Cursor</strong> object de resultaten van een query opvragen</li>
                <li>een subklasse van <strong>ContentProvider</strong> klasse maken en de <strong>Content Authority</strong> in je
                <strong>AndroidManifest</strong> benoemen</li>
                <li><strong>CRUD</strong> (Create, Read, Update &amp; Delete) operaties via een Content Provider kunt uitvoeren
                met behulp van een <strong>UriMatcher</strong></li>
                <li>de UI automatisch updaten na veranderingen in de database met de methode <strong>
                    setNotificationUri</strong> van de <strong>Cursor</strong> klasse en de <strong>notifyChange</strong>
                methode van de <strong>ContentResolver</strong> klasse</li>
                <li>een object van de klasse <strong>View.OnTouchListener</strong> maken die de methode
                    <strong>onTouch</strong> implementeert</li>
                <li><strong>MenuItems</strong> dynamisch (<strong>at runtime</strong>) (on)zichtbaar maken met de
                methodes <strong>invalidateOptionsMenu</strong> en <strong>onPrepareOptionsMenu</strong></li>
                <li>een <strong>AlertDialog</strong> maken die om bevestiging vraagt alvorens een actie wordt
                uitgevoerd</li>

            </ul>

        </div>

        <div class="opdrachten">
            <h2>Project</h2>
            <p>Maak een app waarmee een bedrijf zijn inventaris van producten kan bijhouden.
                Voor meer info zie
                <a href="https://classroom.udacity.com/courses/ud845/lessons/6769161694239847/concepts/78222606250923#"
                   target="_blank">Project Overview</a>. </p></div>


    </div>


</div>
</div>
<%@ include file="/AO/android_nano_basics/includes/bottom.html" %>
<script>
    $(document).ready(function () {
        $("li#datastorage").addClass("selected");
    })
</script>
</html>
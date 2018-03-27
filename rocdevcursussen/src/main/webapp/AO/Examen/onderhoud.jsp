<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">
    <%@ include file="/AO/Examen/includes/zijmenu.jsp" %>

    <!-- inhoud -->
    <div class="col-md-9">

        <h2>Kerntaak 4: Onderhoud</h2>
        <h3>Situatie</h3>

        <p>De applicatie is in produktie. De opdrachtgever heeft Fast
            Development gevraagd om het onderhoud en beheer voor haar rekening te
            nemen.</p>

        <div class="opdrachten">
            <h2>Opdracht 1: onderhoud en beheer</h2>

            <!-- oranje border links -->
            <div class="bs-callout bs-callout-warning">
                <p>
                    Van je projectleider heb je het Service Level Agreement (<a
                        href="<c:url value="/AO/Examen/hulpdocs/ServiceLevelagreement.docx.pdf"/>">zie
                    voorbeeld</a>) gekregen dat afgesloten is tussen de opdrachtgever en
                    FastDevelopment. Verder heb je het kwaliteitshandboek van je
                    projectleider gekregen. Het is jouw taak om het onderhoud en beheer
                    uit te voeren.
                </p>
            </div>
            <p>Onderhoud en beheer de applicatie. Doe dat in de volgende
                stappen:</p>
            <ol>
                <li>Stel je op de hoogte van de productieomgeving waarin de
                    applicatie draait.
                </li>
                <li>Stel een procedureboek samen.</li>
                <li>Breid het kwaliteitshandboek uit voor onderhoud en beheer.</li>
                <li>Als je een onderhoudsticket van je projectleider krijgt,
                    vul je het kwaliteitshandboek in en voeg je hem toe als bijlage aan
                    het kwaliteitshandboek. <a
                            href="<c:url value="/AO/Examen/hulpdocs/TicketOnderhoudenbeheer.docx.pdf"/>">Voorbeeld
                        onderhoudsticket</a>
                </li>
                <li>Schrijf een voorstel over mogelijke oplossingen voor het
                    onderhoudsticket. Overleg met de projectleider over de mogelijke
                    oplossingen voor het onderhoudsticket. Een kopie van het voorstel
                    lever je meteen in bij je projectleider.
                </li>
                <li>Breng in je ontwikkelomgeving de oplossing aan van het
                    onderhoudsticket, test deze en als de test goed verlopen is, laat
                    deze aan je projectleider zien.
                </li>
                <li>Vul de kolom &quot;afgehandeld op&quot; in het
                    kwaliteitshandboek in als de oplossing is goedgekeurd. Als de
                    bedrijfsleider de oplossing niet goed keurt, breng je op aanwijzing
                    van de bedrijfsleider een nieuwe oplossing aan.
                </li>
            </ol>

            <h3>Resultaten</h3>
            <ul>
                <li>Een opgesteld procedureboek</li>
                <li>Uitgewerkte procedures</li>
                <li>Bijgewerkt kwaliteitshandboek (documentatie)</li>
                <li>Oplossingsvoorstellen voor onderhoudstickets</li>
                <li>Uitgevoerde onderhoud- en beheeractiviteiten naar
                    aanleiding van de onderhoudstickets.
                </li>
            </ul>

            <h3>Vormeisen</h3>
            <p>Het resultaat moet aan de volgende eisen voldoen:</p>
            <ul>
                <li>Het procedureboek heeft een voorblad. Het voorblad bevat de
                    volgende elementen:
                    <ol>
                        <li>de naam van het projectNaam</li>
                        <li>de naam van het product: Procedureboek</li>
                        <li>de datum, waarop het product is ingeleverd.</li>
                        <li>de naam of namen van degenen die aan het product hebben
                            meegewerkt.
                        </li>
                        <li>het versienummer</li>
                        <li>eventueel een logo</li>
                    </ol>
                </li>
                <li>de documentatie bevat een inhoudsopgave.</li>
                <li>Het taalgebruik is zakelijk</li>
                <li>Er wordt vaktaal gebruikt</li>
            </ul>

            <h3>Inhoudseisen</h3>
            <p>Het procedureboek bevat de volgende onderdelen:</p>
            <ul>
                <li>Beschrijving installatie en opstarten applicatie</li>
                <li>Beschrijving installatie en opstarten database</li>
                <li>Beschrijving backup applicatie</li>
                <li>Beschrijving restore applicatie</li>
                <li>Beschrijving vervanging door nieuwere versie applicatie</li>
                <li>Beschrijving backup database</li>
                <li>Beschrijving restore database</li>
            </ul>
            <p>Beschrijf bij elk onderdeel wie verantwoordelijk is, wanneer
                een handeling moet plaats vinden en welke stappen er genomen moeten
                worden. Beschrijf de stappen in de volgorde waarin ze uitgevoerd
                moeten worden.</p>

            <h3>Uitbreiding kwaliteitshandboek</h3>
            <p>Breid het kwaliteitshandboek uit met de volgende tabel, waarin
                de wijzigingen voor onderhoud en beheer worden bijgehouden:</p>
            <table class="table table-bordered">
                <tr>
                    <th colspan="5">Wijzigingen onderhoud en beheer</th>
                </tr>
                <tr>
                    <th>Naam bestand</th>
                    <th>programmeur</th>
                    <th>afgehandeld op</th>
                    <th>wijziging</th>
                    <th>ticketnummer</th>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
            <p>De onderhoudstickets worden als bijlage aan het
                kwaliteitshandboek toegevoegd.</p>

        </div>

        <div class="opdrachten">
            <h2>Opdracht 2: Content</h2>
            <div class="bs-callout bs-callout-warning">
                <p>De content van de applicatie moet beheerd worden. Verder
                    moeten er gebruikersrechten worden toegekend.</p>
            </div>
            <p>Doorloop de volgende stappen</p>
            <ol>
                <li>Beschrijf welke soorten bestanden voor content aangeleverd
                    moeten worden.
                </li>
                <li>Als je een onderhoudsticket over gebruikersrechten
                    ontvangt, verleen je de juiste gebruikersrechten. Doe dat door
                    eventueel de applicatie aan te passen. Als het onderhoudsticket
                    wijziging vereist in de code, dan vul je het kwaliteitshandboek in
                    en voeg je hem toe als bijlage aan het kwaliteitshandboek.
                </li>
                <li>Als je een onderhoudsticket van je projectleider krijgt,
                    vul je het kwaliteitshandboek in en voeg je hem toe als bijlage aan
                    het kwaliteitshandboek.
                </li>
                <li>Controleer of de gegevens in het juiste formaat en volledig
                    zijn aangeleverd. Als dat niet zo is, dan zorg je ervoor dat de
                    gegevens alsnog in het juiste formaat en volledig worden gemaakt.
                    Dit doe je eventueel in overleg met de opdrachtgever of je
                    projectleider.
                </li>
                <li>Overleg met de projectleider over mogelijke oplossingen
                    voor het onderhoudsticket
                </li>
                <li>Breng in je ontwikkelomgeving de oplossing aan van het
                    onderhoudsticket, test deze en als deze goed verlopen is, laat deze
                    aan je projectleider zien
                </li>
                <li>Vul de kolom &quot;afgehandeld op&quot; in het
                    kwaliteitshandboek in als de oplossing is goedgekeurd. Als de
                    bedrijfsleider de oplossing niet goed keurt, breng je op aanwijzing
                    van je leidinggevende een nieuwe oplossing aan.
                </li>
            </ol>
            <h3>resultaten</h3>
            <ul>
                <li>Regels met betrekking tot aangeleverde content</li>
                <li>Toegekende gebruikersrechten</li>
                <li>Beheerde content van de applicatie</li>
                <li>Bijgewerkt kwaliteitshandboek (documentatie)</li>
            </ul>
            <h3>Vormeisen</h3>
            <p>Het resultaat moet aan de volgende eisen voldoen:</p>
            <ul>
                <li>Het document <em>Format bestanden</em> heeft een voorblad.
                    Het voorblad bevat de volgende elementen:
                    <ol>
                        <li>de naam van het projectNaam</li>
                        <li>de naam van het product: Format bestanden</li>
                        <li>de datum, waarop het product is ingeleverd.</li>
                        <li>de naam of namen van degenen die aan het product hebben
                            meegewerkt.
                        </li>
                        <li>het versienummer</li>
                        <li>eventueel een logo</li>
                    </ol>
                </li>
                <li>de documentatie bevat een inhoudsopgave.</li>
                <li>Het taalgebruik is zakelijk</li>
                <li>Er wordt vaktaal gebruikt</li>
            </ul>
            <h3>Inhoudseisen</h3>
            <p>De documentatie bevat alle formaten waarin de verschillende
                soorten bestanden die door de opdrachtgever aangeleverd kunnen
                worden. De formaten zijn algemeen gangbaar.</p>
        </div>

        <div class="opdrachten">
            <h2>Opdracht 3: Archivering</h2>
            <div class="bs-callout bs-callout-warning">
                <p>Volgens het Service Level agreement moet er jaarlijks een
                    snapshot gemaakt worden van de gegevens.</p>
            </div>
            <p>Doorloop de volgende stappen:</p>
            <ol>
                <li>Beschrijf de procedure voor het maken van een snapshot en
                    het terugzetten ervan.
                </li>
                <li>Maak een snapshot.</li>
                <li>Documenteer het moment waarop de archivering plaats vindt.</li>
                <li>Overhandig de procedure en de snapshot aan de
                    opdrachtgever.
                </li>
            </ol>
            <h3>Resultaten</h3>
            <ul>
                <li>Procedure voor het maken en terugzetten van een snapshot</li>
                <li>Een volledige gedocumenteerde snapshot</li>
            </ul>
            <h3>Vormeisen</h3>
            <p>Het resultaat moet aan de volgende eisen voldoen:</p>
            <ul>
                <li>De documentatie van de snapshot heeft een voorblad. Het
                    voorblad bevat de volgende elementen:
                    <ol>
                        <li>de naam van het projectNaam</li>
                        <li>de naam van het product: Procedure archivering</li>
                        <li>de datum, waarop het product is ingeleverd.</li>
                        <li>de naam of namen van degenen die aan het product hebben
                            meegewerkt.
                        </li>
                        <li>het versienummer</li>
                        <li>eventueel een logo</li>
                    </ol>
                </li>
                <li>de documentatie bevat een inhoudsopgave.</li>
                <li>Het taalgebruik is zakelijk</li>
                <li>Er wordt vaktaal gebruikt</li>
            </ul>
            <h3>Inhoudseisen</h3>
            <p>Het resultaat moet aan de volgende punten voldoen.</p>
            <ul>
                <li>De documentatie bevat een volledige beschrijvingTicket in stappen
                    van de procedure om een snapshot te kunnen maken.
                </li>
                <li>De documentatie bevat een volledige beschrijvingTicket in stappen
                    van de procedure om de snapshot te kunnen terugzetten zodat
                    gegevens geraadpleegd kunnen worden.
                </li>
                <li>De documentatie bevat een beschrijvingTicket van het moment
                    waarop de snapshot is gemaakt.
                </li>
                <li>Een snapshot die geleverd wordt aan de opdrachtgever en die
                    gemaakt is volgens de procedure zoals beschreven in de documentatie
                    en die terug gezet kan worden volgens de procedure zoals beschreven
                    in de procedure.
                </li>
            </ul>
        </div>
    </div>
</div>
<%@ include file="/AO/Examen/includes/bottom.html" %>
<script>
    $(document).ready(function() {
        $("li#kt-4").addClass("selected");
    })
</script>
</html>
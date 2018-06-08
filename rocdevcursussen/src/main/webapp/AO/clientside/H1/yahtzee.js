/**
 *
 */

$(document).ready(function () {
    //initialiseer benodigde globale variabelen
    let aantalBeurten = 0;
    let aantalWorpen = 0;
    let bonuspunten = 0;
    let bonus = 0;
    let beurtscores = [0, 0, 0, 0, 0];
    let totaalscore = 0;
    const gooiButton = $('#gooi_button');
    /********hulpmethoden****************/

    function resetBeurt() {
        aantalBeurten++;
        aantalWorpen = 0;
        beurtscores = [0, 0, 0, 0, 0];
        for (let i = 0; i < 5; i++) {
            $("#dobbel_" + i).html("");
        }
        gooiButton.prop('disabled', false);
        if (aantalBeurten == 13) {
            $('#submit_score_button').prop('disabled', false);
            gooiButton.prop('disabled', true);
        }

    }

    //telt enen, tweeen etc bij elkaar op
    function telOp(n) {
        let score = 0;
        $.each(beurtscores, function (index, value) {
            if (value == n) {
                score += value;
            }
        });
        totaalscore += score;
        bonuspunten += score;
        //check of de bonus gehaald is
        if (bonus === 0 && bonuspunten > 62) {
            bonus = 35;
            totaalscore += bonus;
            $('#score_bonus').val(bonus)
        }
        $('#score_totaal').val(totaalscore);
        resetBeurt();
        $(this).prop('disabled', true);
        return score;
    }

    /*
     * n = aantal dat hetzelfde moet zijn (bijv. 4 voor carre)
     */
    function nDezelfde(n) {
        let aantalDezelfde = 0;
        let som = 0;
        for (let startwaarde = 1; startwaarde <= 6; startwaarde++) {
            aantal = 0;
            $.each(beurtscores, function (index, value) {
                if (value == startwaarde) {
                    aantal++;
                }
            });
            if (aantal > aantalDezelfde) {
                aantalDezelfde = aantal;
            }
        }
        if (aantalDezelfde >= n) {
            som = somWorp();
        }
        return som;
    }

    /*
     * telt waardes in worp bij elkaar op
     */
    function somWorp() {
        let som = 0;
        $.each(beurtscores, function (index, value) {
            som += value;
        });
        return som;
    }


    /************event handlers**************/
    /*
     * gooit dobbelstenen allleen als hun waarde 0 is en er nog niet
     * 3 keer gegooid is in de beurt
     */
    $(document).on('click', '#gooi_button', function () {
        aantalWorpen++;
        $(this).prop('disabled', true)
        if (aantalWorpen <= 3) {
            for (let i = 0; i < 5; i++) {

                if (beurtscores[i] == 0) {
                    let random = Math.floor((Math.random() * 6) + 1);
                    beurtscores[i] = random;
                    $("#dobbel_" + i).html("<img src=\"/AO/clientside/H1/dobbel" + beurtscores[i] +
                        ".jpg\" class=\"dobbelsteen\">");
                }
            }
        }
    });

    /*
     * Als nog niet 3 keer is gegooid.
     * wanneer op een van de dobbelstenen wordt geklikt
     * bepaal welk plaatje het is met data attribuut
     * verwijder score uit beurt (zet op 0) en
     * haal het plaatje weg. Gooi knop wordt opnieuw geactiveerd
     * zodra een plaatje is weggehaald
     */
    $(document).on('click', '.dobbelveld', function () {
        if (aantalWorpen < 3) {
            let nr = $(this).data('nr');
            beurtscores[nr] = 0;
            $('#dobbel_' + nr).html("");
            gooiButton.prop('disabled', false);
        }
    });
    $(document).on('click', ".nOgen", function() {
        const ogen = $(this).attr("data-ogen");
        let score = telOp(Number(ogen));
        $("#score_" + ogen).val(score);
        $(this).prop('disabled', true);
    });

    /*
     * score button 3 dezelfde
     */
    $(document).on('click', '#button_3dezelfde', function () {
        let score = nDezelfde(3);
        $('#score_3dezelfde').val(score);
        totaalscore += score;
        $('#score_totaal').val(totaalscore);
        resetBeurt();
        $(this).prop('disabled', true);
    });

    /*
     * score button carre
     */
    $(document).on('click', '#button_carre', function () {
        let score = nDezelfde(4);
        $('#score_carre').val(score);
        totaalscore += score;
        $('#score_totaal').val(totaalscore);
        resetBeurt();
        $(this).prop('disabled', true);
    });

    /*
     * score button full house
     */
    $(document).on('click', '#button_full_house', function () {
        let score = 0;
        let drieDezelfde = false;
        let tweeDezelfde = false;
        for (let i = 1; i <= 6; i++) {
            let aantal = 0;
            $.each(beurtscores, function (index, value) {
                if (i == value) {
                    aantal++;
                }
            });
            if (aantal == 2) {
                tweeDezelfde = true;
            }
            else if (aantal == 3) {
                drieDezelfde = true;
            }
            else if (aantal == 5) {
                tweeDezelfde = true;
                drieDezelfde = true;
            }
        }
        if (drieDezelfde && tweeDezelfde) {
            score = 25;
        }
        $('#score_full_house').val(score);
        totaalscore += score;
        $('#score_totaal').val(totaalscore);
        resetBeurt();
        $(this).prop('disabled', true);


    });

    /*
     * score button kleine straat
     */
    $(document).on('click', '#button_kl_straat', function () {
        let score = 0;
        //3 mogelijke kleine straten
        let straat_1 = [1, 2, 3, 4];
        let straat_2 = [2, 3, 4, 5];
        let straat_3 = [3, 4, 5, 6];
        let eq_1 = true;
        let eq_2 = true;
        let eq_3 = true;

        $.each(straat_1, function (i, val) {
            let v = $.inArray(val, beurtscores);
            if (v === -1) {
                eq_1 = false;
            }
        });
        $.each(straat_2, function (i, val) {
            let v = $.inArray(val, beurtscores);
            if (v === -1) {
                eq_2 = false;
            }
        });
        $.each(straat_3, function (i, val) {
            let v = $.inArray(val, beurtscores);
            if (v === -1) {
                eq_3 = false;
            }
        });
        if (eq_1 || eq_2 || eq_3) {
            score = 30;
        }
        $('#score_kl_straat').val(score);
        totaalscore += score;
        $('#score_totaal').val(totaalscore);
        resetBeurt();
        $(this).prop('disabled', true);

    });

    /*
     * score button grote straat
     */
    $(document).on('click', '#button_gr_straat', function () {
        let straat = false;
        let score = 0;
        //2 mogelijke grote straten
        let straat_1 = [1, 2, 3, 4, 5];
        let straat_2 = [2, 3, 4, 5, 6];
        let eq_1 = true;
        let eq_2 = true;
        $.each(straat_1, function (i, val) {
            let v = $.inArray(val, beurtscores);
            if (v === -1) {
                eq_1 = false;
            }
        });
        $.each(straat_2, function (i, val) {
            let v = $.inArray(val, beurtscores);
            if (v === -1) {
                eq_2 = false;
            }
        });
        if (eq_1 || eq_2) {
            score = 40;
        }
        $('#score_gr_straat').val(score);
        totaalscore += score;
        $('#score_totaal').val(totaalscore);
        resetBeurt();
        $(this).prop('disabled', true);
    });

    /*
     * score button yahtzee
     */
    $(document).on('click', '#button_yahtzee', function () {
        let score = 0;
        let v = nDezelfde(5);
        if (v > 0) {
            score = 50;
        }
        $('#score_yahtzee').val(score);
        totaalscore += score;
        $('#score_totaal').val(totaalscore);
        resetBeurt();
        $(this).prop('disabled', true);
    });

    /*
     * score button chance
     */
    $(document).on('click', '#button_chance', function () {
        let score = somWorp();
        $('#score_chance').val(score);
        totaalscore += score;
        $('#score_totaal').val(totaalscore);
        resetBeurt();
        $(this).prop('disabled', true);
    });

    /*
     * zet alles terug
     */
    $(document).on('click', '#nieuw_spel_button', function () {
        $('.score_button').prop('disabled', false);
        $('.score').val("");
        resetBeurt();
        aantalBeurten = 0;
        bonuspunten = 0;
        bonus = 0;
        totaalscore = 0;
        $('#submit_score_button').prop('disabled', true);

    });

    $(document).on('click', '#submit_score_button', function () {
        let user = $('#user_email').val();
        let score = $('#score_totaal').val();
        let url = "/AO/jquery/jquery1";
        $.ajax({
            type: "POST",
            url: url,
            data: {
                user: user,
                score: score,
                submit_score_button: "true"
            },
            success: function (resp) {
                $("#yahtzee_scores_lijst").html(resp);
            }
        });
        $(this).prop('disabled', true);
    });


    /*
     * experiment preload images in browser cache
     * code gevonden op Stack Overflow
     */
    function preloadImages(array) {
        if (!preloadImages.list) {
            preloadImages.list = [];
        }
        let list = preloadImages.list;
        for (let i = 0; i < array.length; i++) {
            let img = new Image();
            img.onload = function () {
                let index = list.indexOf(this);
                if (index !== -1) {
                    // remove image from the array once it's loaded
                    // for memory consumption reasons
                    list.splice(index, 1);
                }
            };
            list.push(img);
            img.src = array[i];
        }
    }

    let imgArray = [];
    for (let i = 1; i <= 6; i++) {
        imgArray.push("/AO/clientside/H1/dobbel" + i + ".jpg")
    }

    preloadImages(imgArray);
});
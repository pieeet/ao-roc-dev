/**
 * 
 */

$(document).ready(function() {
	//initialiseer benodigde globale variabelen
	var aantalBeurten = 0;
	var aantalWorpen = 0;
	var bonuspunten = 0;
	var bonus = 0;
	var beurtscores = [0,0,0,0,0];
	var totaalscore = 0;
	
	/********hulpmethoden****************/
	
	function resetBeurt() {
		aantalBeurten++;
		aantalWorpen = 0;
		beurtscores = [0,0,0,0,0];
		for (var i = 0; i < 5; i++) {
			$("#dobbel_" + i).html("");
		}
		$('#gooi_button').prop('disabled', false);
		if (aantalBeurten == 13) {
			$('#submit_score_button').prop('disabled', false);
			$('#gooi_button').prop('disabled', true);
		}
		
	}
	
	//telt enen, tweeen etc bij elkaar op
	function telOp(n) {
		var score = 0;
		$.each(beurtscores, function(index, value) {
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
		var aantalDezelfde = 0;
		var som = 0;
		for (var startwaarde = 1; startwaarde <= 6; startwaarde++) {
			aantal = 0;
			$.each(beurtscores, function(index, value) {
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
		var som = 0;
		$.each(beurtscores, function(index, value) {
			som += value;
		});
		return som;
	}

	
	/************event handlers**************/
	/*
	 * gooit dobbelstenen allleen als hun waarde 0 is en er nog niet 
	 * 3 keer gegooid is in de beurt
	 */
	$(document).on('click', '#gooi_button', function() {
		aantalWorpen++;
		$(this).prop('disabled', true)
		if (aantalWorpen <= 3) {
			for (var i = 0; i < 5; i++) {
				
				if (beurtscores[i] == 0) {
					var random = Math.floor((Math.random() * 6) + 1);
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
	$(document).on('click', '.dobbelveld', function() {
		if (aantalWorpen < 3) {
			var nr = $(this).data('nr');
			beurtscores[nr] = 0;
			$('#dobbel_' + nr).html("");
			$('#gooi_button').prop('disabled', false);
		}
	});
	
	
	/*
	 * score button enen
	 */
	$(document).on('click', '#button_enen', function() {
		var score = telOp(1);
		$('#score_enen').val(score);
		$(this).prop('disabled', true);
		
	});
	
	/*
	 * score button tweeen
	 */
	$(document).on('click', '#button_tweeen', function() {
		var score = telOp(2);
		$('#score_tweeen').val(score);
		$(this).prop('disabled', true);
	});
	
	/*
	 * score button drieen
	 */
	$(document).on('click', '#button_drieen', function() {
		var score = telOp(3);
		$('#score_drieen').val(score);
		$(this).prop('disabled', true);
		
	});
	
	/*
	 * score button vieren
	 */
	$(document).on('click', '#button_vieren', function() {
		var score = telOp(4);
		$('#score_vieren').val(score);
		$(this).prop('disabled', true);
		
	});
	
	/*
	 * score button vijven
	 */
	$(document).on('click', '#button_vijven', function() {
		var score = telOp(5);
		$('#score_vijven').val(score);
		$(this).prop('disabled', true);
		
	});
	/*
	 * score button zessen
	 */
	$(document).on('click', '#button_zessen', function() {
		var score = telOp(6);
		$('#score_zessen').val(score);
		$(this).prop('disabled', true);
		
	});
	
	/*
	 * score button 3 dezelfde
	 */
	$(document).on('click', '#button_3dezelfde', function() {
		var score = nDezelfde(3);
		$('#score_3dezelfde').val(score);
		totaalscore += score;
		$('#score_totaal').val(totaalscore);
		resetBeurt();
		$(this).prop('disabled', true);
	});
	
	/*
	 * score button carre
	 */
	$(document).on('click', '#button_carre', function() {
		var score = nDezelfde(4);
		$('#score_carre').val(score);
		totaalscore += score;
		$('#score_totaal').val(totaalscore);
		resetBeurt();
		$(this).prop('disabled', true);
	});
	
	/*
	 * score button full house
	 */
	$(document).on('click', '#button_full_house', function() {
		var score = 0;
		var drieDezelfde = false;
		var tweeDezelfde = false;
		for (var i = 1; i <= 6; i++) {
			var aantal = 0;
			$.each(beurtscores, function(index, value) {
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
	$(document).on('click', '#button_kl_straat', function() {
		var score = 0;
		//3 mogelijke kleine straten
		var straat_1 = [1,2,3,4];
		var straat_2 = [2,3,4,5];
		var straat_3 = [3,4,5,6];
		var eq_1 = true;
		var eq_2 = true;
		var eq_3 = true;

		$.each(straat_1, function (i, val) {
			var v = $.inArray(val, beurtscores);
			if (v === -1) {
				eq_1 = false;
			}
		});
		$.each(straat_2, function (i, val) {
			var v = $.inArray(val, beurtscores);
			if (v === -1) {
				eq_2 = false;
			}
		});
		$.each(straat_3, function (i, val) {
			var v = $.inArray(val, beurtscores);
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
	$(document).on('click', '#button_gr_straat', function() {
		var straat = false;
		var score = 0;
		//2 mogelijke grote straten
		var straat_1 = [1,2,3,4,5];
		var straat_2 = [2,3,4,5,6];
		var eq_1 = true;
		var eq_2 = true;
		$.each(straat_1, function (i, val) {
			var v = $.inArray(val, beurtscores);
			if (v === -1) {
				eq_1 = false;
			}
		});
		$.each(straat_2, function (i, val) {
			var v = $.inArray(val, beurtscores);
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
	$(document).on('click', '#button_yahtzee', function() {
		var score = 0;
		var v = nDezelfde(5);
		if ( v > 0) {
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
	$(document).on('click', '#button_chance', function() {
		var score = somWorp();
		$('#score_chance').val(score);
		totaalscore += score;
		$('#score_totaal').val(totaalscore);
		resetBeurt();
		$(this).prop('disabled', true);
	});
	
	/*
	 * zet alles terug
	 */
	$(document).on('click', '#nieuw_spel_button', function() {
		$('.score_button').prop('disabled', false);
		$('.score').val("");
		resetBeurt();
		aantalBeurten = 0;
		bonuspunten = 0;
		bonus = 0;
		totaalscore = 0;
		$('#submit_score_button').prop('disabled', true);
		
	});
	
	$(document).on('click', '#submit_score_button', function() {
		var user = $('#user_email').val();
		var score = $('#score_totaal').val();
		$.get('/jquery?submit_score_button=&user=' + user + '&score=' + score, function(resp) {
			$("#yahtzee_scores_lijst").html(resp);
		})
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
	    var list = preloadImages.list;
	    for (var i = 0; i < array.length; i++) {
	        var img = new Image();
	        img.onload = function() {
	            var index = list.indexOf(this);
	            if (index !== -1) {
	                // remove image from the array once it's loaded
	                // for memory consumption reasons
	                list.splice(index, 1);
	            }
	        }
	        list.push(img);
	        img.src = array[i];
	    }
	}
	var imgArray = [];
	for (var i = 1; i <= 6; i++) {
		imgArray.push("/AO/clientside/H1/dobbel" + i + ".jpg")
	}

	preloadImages(imgArray);
});
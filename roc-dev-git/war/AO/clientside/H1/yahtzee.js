/**
 * 
 */

$(document).ready(function() {
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
		}
		
	}
	
	/* enen, tweeen etc */
	function telOp(n) {
		var score = 0;
		$.each(beurtscores, function(index, value) {
			if (value == n) {
				score += value;
			}
		});
		totaalscore += score;
		bonuspunten += score;
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
	
	function somWorp() {
		var som = 0;
		$.each(beurtscores, function(index, value) {
			som += value;
		});
		return som;
	}

	
	/************event handlers**************/
	
	$(document).on('click', '#gooi_button', function() {
		aantalWorpen++;
		$(this).prop('disabled', true)
		if (aantalWorpen <= 3) {
			for (var i = 0; i < 5; i++) {
				
				if (beurtscores[i] == 0) {
					var random = Math.floor((Math.random() * 6) + 1);
					beurtscores[i] = random
				}
				$("#dobbel_" + i).html("<img src=\"/AO/clientside/H1/dobbel" + beurtscores[i] +".jpg\" class=\"dobbelsteen\">");
			}
			
		}
	});
	
	$(document).on('click', '.dobbelveld', function() {
		if (aantalWorpen < 3) {
			var nr = $(this).data('nr');
			beurtscores[nr] = 0;
			$('#dobbel_' + nr).html("");
			$('#gooi_button').prop('disabled', false);
		}
	});
	
	
	
	$(document).on('click', '#button_enen', function() {
		var score = telOp(1);
		$('#score_enen').val(score);
		$(this).prop('disabled', true);
		
	});
	
	$(document).on('click', '#button_tweeen', function() {
		var score = telOp(2);
		$('#score_tweeen').val(score);
		$(this).prop('disabled', true);
	});
	
	$(document).on('click', '#button_drieen', function() {
		var score = telOp(3);
		$('#score_drieen').val(score);
		$(this).prop('disabled', true);
		
	});
	
	$(document).on('click', '#button_vieren', function() {
		var score = telOp(4);
		$('#score_vieren').val(score);
		$(this).prop('disabled', true);
		
	});
	
	$(document).on('click', '#button_vijven', function() {
		var score = telOp(5);
		$('#score_vijven').val(score);
		$(this).prop('disabled', true);
		
	});
	
	$(document).on('click', '#button_zessen', function() {
		var score = telOp(6);
		$('#score_zessen').val(score);
		$(this).prop('disabled', true);
		
	});
	
	$(document).on('click', '#button_3dezelfde', function() {
		var score = nDezelfde(3);
		$('#score_3dezelfde').val(score);
		totaalscore += score;
		$('#score_totaal').val(totaalscore);
		resetBeurt();
		$(this).prop('disabled', true);
	});
	
	$(document).on('click', '#button_carre', function() {
		var score = nDezelfde(4);
		$('#score_carre').val(score);
		totaalscore += score;
		$('#score_totaal').val(totaalscore);
		resetBeurt();
		$(this).prop('disabled', true);
	});
	
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
	
	$(document).on('click', '#button_chance', function() {
		var score = somWorp();
		$('#score_chance').val(score);
		totaalscore += score;
		$('#score_totaal').val(totaalscore);
		resetBeurt();
		$(this).prop('disabled', true);
	});
	
	$(document).on('click', '#nieuw_spel_button', function() {
		$('.score_button').prop('disabled', false);
		$('.score').val("");
		resetBeurt();
		aantalWorpen = 0;
		bonuspunten = 0;
		bonus = 0;
		totaalscore = 0;
		
	});
	
	
});
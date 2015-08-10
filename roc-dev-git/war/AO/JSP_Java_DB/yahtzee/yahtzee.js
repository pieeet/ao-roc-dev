/**
 * 
 */

$(document).ready(function() {
	var aantalWorpen = 0;
	var beurtscores = [0,0,0,0,0];
	var totaalscore = 0;
	
	function resetBeurt() {
		aantalWorpen = 0;
		beurtscores = [0,0,0,0,0];
		for (var i = 0; i < 5; i++) {
			$("#dobbel_" + i).html("");
		}
	}
	
	function telOp(n) {
		var score = 0;
		$.each(beurtscores, function(index, value) {
			if (value == n) {
				score += value;
			}
		});
		totaalscore += score;
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

	

	$(document).on('click', '#gooi_button', function() {
		aantalWorpen++;
		if (aantalWorpen <= 3) {
			for (var i = 0; i < 5; i++) {
				
				if (beurtscores[i] == 0) {
					var random = Math.floor((Math.random() * 6) + 1);
					beurtscores[i] = random
				}
				$("#dobbel_" + i).html(beurtscores[i]);
			}
		}
	});
	
	$(document).on('click', '.dobbelveld', function() {
		if (aantalWorpen < 3) {
			var nr = $(this).data('nr');
			beurtscores[nr] = 0;
			$('#dobbel_' + nr).html("");
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
	
	
	
});
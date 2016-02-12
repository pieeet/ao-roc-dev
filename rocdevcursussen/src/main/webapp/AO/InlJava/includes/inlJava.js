/**
 * 
 */


function toon(element) {
	if (document.getElementById(element).style.display != "block") {
		document.getElementById(element).style.display = "block";
	}
	else if (document.getElementById(element).style.display = "block"){
		verberg(element);
	}
}

function verberg(element) {
	document.getElementById(element).style.display = "none";
}


$(document).ready (function () {
    $("li#menu-item-java").addClass("active");
    $("li#menu-item-inleiding-java").addClass("active");
    $("h1#page-title-heading").text("Inleiding java");
    
    $(document).on('click', 'button#start_spel_button', function(){
		nieuwSpel();
	});
	$(document).on(
			'click',
			'#speel_knop',
			function() {
				speel();
			});
	$(document).on(
			'keydown',
			'#invoer_spel',
			function(e) {
				var code = e.which; // recommended to use e.which, it's normalized across browsers
			    if(code==13)e.preventDefault();
			    if(code==32||code==13||code==188||code==186){
			    	speel();
			    } 
			   
			});
	
	function speel() {
		var aantal_verminderen = $("#invoer_spel").val();
		var aantal_lucifers = $("#aantal_lucifers").val();

		$.get("/eindspel?aantal_lucifers=" + aantal_lucifers
				+ "&aantal_verminderen=" + aantal_verminderen,
				function(responseText) {
					$('#spel_result').html(responseText);
				});
		setTimeout( function() { $( '#invoer_spel' ).focus() }, 500 );
	}
	
	$(document).on('click', '#nieuw_spel_knop', function() {
		nieuwSpel();
	});
	
	function nieuwSpel() {
		$.get("/eindspel?nieuw_spel=x", function(responseText) {
			$('#spel_result').html(responseText);
		});
	}
    
}); //einde ready event;


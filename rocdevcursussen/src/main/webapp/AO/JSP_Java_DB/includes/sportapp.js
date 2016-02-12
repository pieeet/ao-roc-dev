/**
 * 
 */

$(document).ready(function() {
	var fadeOutTime = 400;
	var fadeInTime = 800;
	var timeOutTime = 500;
	var spinner = 0;
	var loadingSpinner = "<img class=\"loading_spinner\" src=\"/AO/JSP_Java_DB/images/loading_spinner.gif\">";
	
	$("#tabs_sport").tabs();
  
    $(document).on('click', '#open_nieuw_lid', function() {
    	$("#sport_tab-1_content").fadeOut(fadeOutTime, function () {
    		$("#sport_tab-1_content").html(loadingSpinner);
    		$("#sport_tab-1_content").fadeIn(spinner, function () {
    			$.get("/sporthtml?nieuw_lid_scherm=x", function(response) {
    				$("#sport_tab-1_content").fadeOut(spinner, function () {
    					$("#sport_tab-1_content").html(response).fadeIn(fadeInTime);
    					
    				});
    			});
    		});
    	});
    });
    
    $(document).on('click', '#open_nieuw_team', function() {
    	$("#sport_tab-2_content").fadeOut(fadeOutTime, function () {
    		$("#sport_tab-2_content").html(loadingSpinner);
    		$("#sport_tab-2_content").fadeIn(spinner, function () {
    			$.get("/sporthtml?nieuw_team_scherm=x", function(responseText) { 
    				$("#sport_tab-2_content").fadeOut(spinner, function () {
    					$("#sport_tab-2_content").html(responseText).fadeIn(fadeInTime);
    					
    				});
    			});
    		});
    	});
    });

    
    $(document).on('click', '#annuleer_nieuw_lid_button', function() {
    	$("#sport_tab-1_content").fadeOut(fadeOutTime, function () {
    		$("#sport_tab-1_content").html(loadingSpinner);
    		$("#sport_tab-1_content").fadeIn(spinner, function () {
    			$.get("/sporthtml?leden_overzicht=x", function(responseText) { 
    				$("#sport_tab-1_content").fadeOut(spinner, function () {
    					$("#sport_tab-1_content").html(responseText).fadeIn(fadeInTime);
    					
    				});
    			});
    		});
    	});
    });

    
    $(document).on('click', '#annuleer_nieuw_team_button', function() {
    	$("#sport_tab-2_content").fadeOut(fadeOutTime, function () {
    		$("#sport_tab-2_content").html(loadingSpinner);
    		$("#sport_tab-2_content").fadeIn(spinner, function () {
    			$.get("/sporthtml?teams_overzicht=x", function(responseText) { 
    				$("#sport_tab-2_content").fadeOut(spinner, function () {
    					$("#sport_tab-2_content").html(responseText).fadeIn(fadeInTime);
    					
    				});
    			});
    		});
    	});
    });

    

    
    $(document).on("click", "#verzend_nieuw_lid", function(evt) {
    	evt.preventDefault();
    	var fdata = new FormData();
    	fdata.append("nieuwlidform", "x");
    	fdata.append("roepnaam", $("#roepnaam").val());
    	fdata.append("tussenvoegsels", $("#tussenvoegsels").val());
    	fdata.append("achternaam", $("#achternaam").val());
    	fdata.append("adres", $("#adres").val());
    	fdata.append("postcode", $("#postcode").val());
    	fdata.append("woonplaats", $("#woonplaats").val());
    	fdata.append("telefoon", $("#telefoon").val());
    	fdata.append("email", $("#email").val());
    	fdata.append("geboortedatum", $("#gebDatum").val());
    	fdata.append("geslacht", $("#geslacht option:selected").val());
    	fdata.append("gebruiker", $("#email_gebruiker").val());
    	jQuery.each(jQuery('#sport_foto_lid')[0].files, function(i, file) {
    	    fdata.append('file-'+i, file);
    	});
    	var uploadUrl = $('#nieuw_lid_form').attr('action');
    	$("#sport_tab-1_content").fadeOut(fadeOutTime, function () {
    		$("#sport_tab-1_content").html(loadingSpinner);
    		$("#sport_tab-1_content").fadeIn(spinner, function () {
    			$.ajax({
    				type: 'POST',
    				url: uploadUrl,
    	            data: fdata,
    	            cache: false,
    	            processData: false,
    	            contentType: false,
    	            xhrFields: {
    	            	onprogress: function (e) {
    	            		if (e.lengthComputable) {
    	            			console.log(e.loaded / e.total * 100 + '%');
    	            		}
    	            	}
    	            },
    	            complete: function() {
    	            	//alert("complete");
    	            },
    	            success: function (responseText) {
    	            	$("#sport_tab-1_content").fadeOut(spinner, function() {
    	            		$("#sport_tab-1_content").html(responseText).fadeIn(fadeInTime);
    	            	});
        			}
    			});
    		});
    	});
    });

    
    $(document).on("click", "#verzend_nieuw_team", function() {
    	var teamcode = $("#teamcode").val().replace(/\</g, "");
  		var teamomschrijving = $("#teamomschrijving").val().replace(/\</g, "");
    	
    	$("#sport_tab-2_content").fadeOut(fadeOutTime, function () {
    		$("#sport_tab-2_content").html(loadingSpinner);
    		$("#sport_tab-2_content").fadeIn(spinner, function () {
    			$.get("/AO/jsp/sport?nieuwteamform=x"
  		        		+ "&teamcode=" + teamcode
  		        		+ "&teamomschrijving=" + teamomschrijving, function(responseText) { 
    				$("#sport_tab-2_content").fadeOut(spinner, function () {
    					$("#sport_tab-2_content").html(responseText).fadeIn(fadeInTime);
    					
    				});
    			});
    		});
    	});
    });

    
    
    $(document).on('click', '.lid_data', function() {
    	var spelerscode = $(this).data('spelerscode');
    	$("#sport_tab-1_content").fadeOut(fadeOutTime, function () {
    		$("#sport_tab-1_content").html(loadingSpinner);
    		$("#sport_tab-1_content").fadeIn(spinner, function () {
    			$.get("/sporthtml?haal_speler_gegevens=x&spelerscode=" + spelerscode, function(responseText) {  
    				$("#sport_tab-1_content").fadeOut(spinner, function () {
    					$("#sport_tab-1_content").html(responseText).fadeIn(fadeInTime);
    					
    				});
    			});
    		});
    	});
    });

    
    $(document).on('click', '.team_data', function() {
        var teamcode = $(this).data('teamcode');
        $("#sport_tab-2_content").fadeOut(fadeOutTime, function () {
    		$("#sport_tab-2_content").html(loadingSpinner);
    		$("#sport_tab-2_content").fadeIn(spinner, function () {
    			$.get("/sporthtml?haal_team_gegevens=x&teamcode=" + teamcode, function(responseText) {   
    				$("#sport_tab-2_content").fadeOut(spinner, function () {
    					$("#sport_tab-2_content").html(responseText).fadeIn(fadeInTime);
    					
    				});
    			});
    		});
    	});
    });

    

    
    $(document).on("click", "#wijzig_lid", function(evt) {
    	evt.preventDefault();
    	var fdata = new FormData();
    	fdata.append("wijziglid", "x");
    	fdata.append("spelerscode", $("#spelerscode").text());
    	fdata.append("roepnaam", $("#roepnaam").val());
    	fdata.append("tussenvoegsels", $("#tussenvoegsels").val());
    	fdata.append("achternaam", $("#achternaam").val());
    	fdata.append("adres", $("#adres").val());
    	fdata.append("postcode", $("#postcode").val());
    	fdata.append("woonplaats", $("#woonplaats").val());
    	fdata.append("telefoon", $("#telefoon").val());
    	fdata.append("email", $("#email").val());
    	fdata.append("geboortedatum", $("#gebDatum").val());
    	fdata.append("geslacht", $("#geslacht option:selected").val());
    	fdata.append("gebruiker", $("#email_gebruiker").val());
    	jQuery.each(jQuery('#sport_foto_lid')[0].files, function(i, file) {
    	    fdata.append('file-'+i, file);
    	});
    	var uploadUrl = $('#nieuw_lid_form').attr('action');
    	$("#sport_tab-1_content").fadeOut(fadeOutTime, function () {
    		$("#sport_tab-1_content").html(loadingSpinner);
    		$("#sport_tab-1_content").fadeIn(spinner, function () {
    			$.ajax({
    				type: 'POST',
    				url: uploadUrl,
    	            data: fdata,
    	            cache: false,
    	            processData: false,
    	            contentType: false,
    	            xhrFields: {
    	            	onprogress: function (e) {
    	            		if (e.lengthComputable) {
    	            			console.log(e.loaded / e.total * 100 + '%');
    	            		}
    	            	}
    	            },
    	            complete: function() {
    	            	//alert("complete");
    	            },
    	            success: function (responseText) {
    	            	$("#sport_tab-1_content").fadeOut(spinner, function() {
    	            		$("#sport_tab-1_content").html(responseText).fadeIn(fadeInTime);
    	            	});
        			}
    			});
    		});
    	});
    });
    

    
    
    $(document).on('click', '#wijzig_team', function() {
    	var teamcode = $(this).data('teamcode');
    	var teamomschrijving = $("#teamomschrijving").val();
    	var teamcode = $(this).data('teamcode');
        $("#sport_tab-2_content").fadeOut(fadeOutTime, function () {
    		$("#sport_tab-2_content").html(loadingSpinner);
    		$("#sport_tab-2_content").fadeIn(spinner, function () {
    			$.get("/AO/jsp/sport?wijzigteam=x"
    	        		+ "&teamcode=" + teamcode
    	        		+ "&teamomschrijving=" + teamomschrijving, function(responseText) {  
    				$("#sport_tab-2_content").fadeOut(spinner, function () {
    					$("#sport_tab-2_content").html(responseText).fadeIn(fadeInTime);
    					
    				});
    			});
    		});
    	});
    });

    
    
    $(document).on('click', '#verwijder_lid', function() {
    	var confirmed = confirm("U staat op het punt een speler definitief te verwijderen. Is dat de bedoeling?");
    	if (confirmed == true) {
    		var spelerscode = $(this).data('spelerscode');
        	$("#sport_tab-1_content").fadeOut(fadeOutTime, function () {
        		$("#sport_tab-1_content").html(loadingSpinner);
        		$("#sport_tab-1_content").fadeIn(spinner, function () {
        			$.get("/AO/jsp/sport?verwijderlid=x"
    	            		+ "&spelerscode=" + spelerscode, function(responseText) {  
        				$("#sport_tab-1_content").fadeOut(spinner, function () {
        					$("#sport_tab-1_content").html(responseText).fadeIn(fadeInTime);
        					
        				});
        			});
        		});
        	});
        };
    });
    
    		

    
    
    $(document).on('click', '#verwijder_team', function() {
    	var confirmed = confirm("U staat op het punt een team definitief te verwijderen. Is dat de bedoeling?");
    	if (confirmed == true) {
    		var teamcode = $(this).data('teamcode');
    		$("#sport_tab-2_content").fadeOut(fadeOutTime, function () {
        		$("#sport_tab-2_content").html(loadingSpinner);
        		$("#sport_tab-2_content").fadeIn(spinner, function () {
        			$.get("/AO/jsp//sport?verwijderteam=x"
    	            		+ "&teamcode=" + teamcode, function(responseText) { 
        				$("#sport_tab-2_content").fadeOut(spinner, function () {
        					$("#sport_tab-2_content").html(responseText).fadeIn(fadeInTime);
        					
        				});
        			});
        		});
        	});
        };
    });
    		
    		
 
    
	//inladen gegevens tab 2 leden
	$(document).on('click', '#ui-id-2', function() {
		$.get("/sporthtml?leden_overzicht=x", function(responseText) { 
			//$("#sport_tab-1_content").fadeOut(spinner);
			$("#sport_tab-1_content").html(responseText).hide().fadeIn(fadeInTime); 
	    });
    });
	
	

     //inladen gegevens tab 3 teams
    $(document).on('click', '#ui-id-3', function() {
        $.get("/sporthtml?teams_overzicht=x", function(responseText) { 
            $("#sport_tab-2_content").html(responseText).hide().fadeIn(fadeInTime); 
        });
    });
    
    $(document).on('click', '#voeg_teamspeler_toe', function() {
        var spelerscode = $('#select_teamspeler').val();
        var teamcode = $(this).data('teamcode');
        $.get("/AO/jsp/sport?voegteamspelertoe=x&spelerscode=" + spelerscode + "&teamcode=" + teamcode, function(responseText) { 
            $("#sport_tab-2_content").html(responseText); 
        });
    });
   
    $(document).on('click', '.verwijder_teamspeler', function() {
        var spelerscode = $(this).data('spelerscode');
        var teamcode = $(this).data('teamcode');
        $.get("/AO/jsp/sport?verwijderteamspeler=x&spelerscode=" + spelerscode + 
        		"&teamcode=" + teamcode, function(responseText) { 
            $("#sport_tab-2_content").html(responseText); 
        });
    });
    
    $(document).on('click', '.speler_team_shortcut', function(e) { 
    	e.preventDefault();
    	$("#sport_tab-2_content").html(loadingSpinner);
    	$( "#tabs_sport" ).tabs( "option", "active", 2 );
    	var teamcode = $(this).data('teamcode');
		$.get("/sporthtml?haal_team_gegevens=x&teamcode=" + teamcode, function(responseText) {   
			$("#sport_tab-2_content").fadeOut(spinner, function () {
				$("#sport_tab-2_content").html(responseText).fadeIn(fadeInTime);
			});
		});
    });
    
    $(document).on('click', '.team_speler_shortcut', function(e) { 
    	e.preventDefault();
    	$("#sport_tab-1_content").html(loadingSpinner);
    	$( "#tabs_sport" ).tabs( "option", "active", 1 );
    	var spelerscode = $(this).data('spelerscode');
		$.get("/sporthtml?haal_speler_gegevens=x&spelerscode=" + spelerscode, function(responseText) {   
			$("#sport_tab-1_content").fadeOut(spinner, function () {
				$("#sport_tab-1_content").html(responseText).fadeIn(fadeInTime);
			});
		});
    });
  
});



/**
 * 
 */
$(document)
		.ready(
				function() {
					var url = "/voeg-gerecht-toe";
					$(document)
							.on(
									'click',
									'#kies-gerecht-btn',
									function(event) {
										event.preventDefault();
										var gerecht = $(
												"#select-gerechten option:selected")
												.val();
										var data = "gerecht=" + gerecht
												+ "&kies-gerecht-btn=true";
										var html = "";
										$
												.ajax({
													type : "GET",
													url : url,
													data : data,
													success : function(res) {
														$("#naam-gerecht-heading")
																.text(gerecht);
														$(
																"#naam-gerecht-hidden")
																.val(gerecht);
														var ingredienten = JSON
																.parse(res);
														var html = "<tr><th>Naam ingredi&euml;nt</th>"
																+ "<th>Hoeveelheid per persoon</th>"
																+ "<th>Eenheid</th></tr>"
														for (var i = 0; i < ingredienten.length; i++) {
															html += "<tr><td>"
																	+ ingredienten[i].naamProdukt
																	+ "</td>"
																	+ "<td>"
																	+ ingredienten[i].hoeveelheidPP
																	+ "</td>"
																	+ "<td>"
																	+ ingredienten[i].eenheid
																	+ "</td></tr>";
														}
														$("#ingredienten-tabel")
																.html(html);
														$(
																"div#voeg-ingredienten-toe")
																.show();
														$("div#nieuw-gerecht")
																.hide();
													}
												});

									});

					$(document).on(
							"click",
							"#voeg-gerecht-toe-btn",
							function(event) {
								event.preventDefault();
								var data = $("#nieuw-gerecht-form").serialize()
										+ "&voeg-gerecht-toe-btn=true";
								var html;
								$.ajax({
									type : "GET",
									url : url,
									data : data,
									success : function(res) {
										var arr = JSON.parse(res);
										html = "";
										for (var i = 0; i < arr.length; i++) {
											var naam = arr[i].naam;
											html += "<option value=\"" + naam
													+ "\">" + naam
													+ "</option>"
										}
										$("#select-gerechten").html(html);
									}
								});
							});

					$(document).on(
							"click",
							"#voeg-produkt-toe-btn",
							function(event) {
								event.preventDefault();
								var data = $("#nieuw-produkt").serialize()
										+ "&voeg-produkt-toe-btn=true";
								var html;
								$.ajax({
									type : "POST",
									url : url,
									data : data,
									success : function(res) {
										var arr = JSON.parse(res);
										html = "";
										for (var i = 0; i < arr.length; i++) {
											var naam = arr[i].naam;
											var eenheid = arr[i].eenheid;
											html += "<option value=\"" + naam
													+ "\">" + naam + " (" + eenheid + ")";
													+ "</option>"
										}
										$("#select-produkten").html(html);
									}
								});
							});

					$(document)
							.on(
									"click",
									"#voeg-ingredient-toe-btn",
									function(event) {
										event.preventDefault();
										var data = $("#nieuw-ingredient")
												.serialize()
												+ "&voeg-ingredient-toe-btn=true";
										var html;
										$
												.ajax({
													type : "POST",
													url : url,
													data : data,
													success : function(res) {
														var ingredienten = JSON
																.parse(res);
														var html = "<tr><th>Naam ingredi&euml;nt</th>"
																+ "<th>Hoeveelheid per persoon</th></tr>";
														for (var i = 0; i < ingredienten.length; i++) {
															html += "<tr><td>"
																	+ ingredienten[i].naamProdukt
																	+ "</td>"
																	+ "<td>"
																	+ ingredienten[i].hoeveelheidPP
																	+ "</td></tr>";
														}

														$("#ingredienten-tabel")
																.html(html);

													}
												});
									});

					$(document).on(
							"click",
							"#voeg-meeteenheid-toe",
							function(event) {
								event.preventDefault();
								var data = $("#nieuwe-meeteenheid").serialize()
										+ "&voeg-meeteenheid-toe-btn=true";
								var html;
								$.ajax({
									type : "POST",
									url : url,
									data : data,
									success : function(res) {
										var arr = JSON.parse(res);
										html = "";
										for (var i = 0; i < arr.length; i++) {
											var naam = arr[i].naam;
											html += "<option value=\"" + naam
													+ "\">" + naam
													+ "</option>"
										}
										$("#select-meeteenheden").html(html);
									}
								});

							});

				});
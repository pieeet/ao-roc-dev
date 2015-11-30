<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="gerechten.recept.*"%>

<%
	if (request.getAttribute("gerechten") == null) {
    	response.sendRedirect("voeg-toetjes-toe");
    	
    } else {
    	ArrayList<Gerecht> gerechten = (ArrayList<Gerecht>) request.getAttribute("gerechten");
    	ArrayList<Produkt> produkten = (ArrayList<Produkt>) request.getAttribute("produkten");
    	ArrayList<String> meeteenheden = (ArrayList<String>) request.getAttribute("meeteenheden");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
div#voeg-ingredienten-toe {
	display: none;
}
</style>
</head>
<body>
	<div id="kies-gerecht">
		<h1>Kies gerecht</h1>
		<form id="kies-gerecht">
			<label>Naam gerecht</label><br> <select id="select-gerechten"
				name="gerecht">
				<%
					for (Gerecht gerecht: gerechten) {
				%>
				<option value="<%=gerecht.getNaam()%>"><%=gerecht.getNaam()%></option>
				<%
					}
				%>
			</select><br> <input type="submit" id="kies-gerecht-btn">
		</form>
	</div>


	<div id="nieuw-gerecht">
		<h1>Nieuw gerecht</h1>
		<form id="nieuw-gerecht-form">
			<label for="naam-gerecht">Naam gercht</label><br> <input
				type="text" name="naam-gerecht" id="naam-gerecht"><br>
			<label for="bereidingstijd">Bereidingstijd</label><br> <input
				type="text" name="bereidingstijd" id="bereidingstijd"
				placeholder="minuten"><br> <label for="">Bereidingswijze</label><br>
			<textarea name="bereidingswijze" id="bereidingswijze" cols="60"
				rows="10"></textarea>
			<br> <input type="submit" id="voeg-gerecht-toe-btn">
		</form>
	</div>


	<div id="voeg-ingredienten-toe">
		<h1 id="naam-gerecht-heading"></h1>
		<h2>Ingredi&euml;nten</h2>
		<table id="ingredienten-tabel">
			<tr id="header-row">
				<th>Naam ingredi&euml;nt</th>
				<th>hoeveelheid per persoon</th>
			</tr>
			
		</table>
		<h1>Voeg Ingredi&euml;nten toe</h1>
		<p>Voeg een produkt toe als het niet in de lijst voorkomt</p>
		<form id="nieuw-ingredient">

			<label>Naam produkt</label><br> <select id="select-produkten"
				name="produkt">
				<%
					for (Produkt produkt: produkten) {
				%>
				<option value="<%=produkt.getNaam()%>"><%=produkt.getNaam()%> (<%= produkt.getEenheid() %>)</option>
				<%
					}
				%>
			</select><br> <label>Hoeveelheid per persoon</label><br> <input
				type="text" name="hoeveelheid"><br> <input
				type="hidden" id="naam-gerecht-hidden" name="gerecht"> <input
				type="submit" id="voeg-ingredient-toe-btn">
		</form>

		<h1>Voeg produkt toe</h1>
		<p>Voer produkten in</p>
		<form id="nieuw-produkt">
			<label>Naam produkt</label><br> <input type="text" name="naam"><br>
			<label>Meeteenheid</label><br> <select id="select-meeteenheden"
				name="meeteenheid">
				<%
					for (String s: meeteenheden) {
				%>
				<option value="<%=s%>"><%=s%></option>
				<%
					}
				%>
			</select><br> <label>Energie per eenheid</label><br> <input
				type="text" name="energie"><br> <input type="submit"
				id="voeg-produkt-toe-btn">
		</form>


		<h1>Voeg meeteenheid toe</h1>
		<form id="nieuwe-meeteenheid">
			<label>naam meeteenheid</label> <input type="text"
				name="naam-eenheid"><br> <input type="submit"
				id="voeg-meeteenheid-toe">
		</form>
	</div>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<script>
	$(document)
			.ready(
					function() {
						var url = "/voeg-toetjes-toe";
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
															$("#naam-gerecht")
																	.text(
																			gerecht);
															$(
																	"#naam-gerecht-hidden")
																	.val(
																			gerecht);
															var array = JSON
																	.parse(res);
															for (var i = 0; i < array.length; i++) {
																$(
																		"#ingredienten-tabel tr:last")
																		.after(
																				"<tr><td>"
																						+ array[i].naam
																						+ "</td><td>"
																						+ array[i].hoeveelheidPP
																						+ "</td></tr>");
															}
															$(
																	"div#voeg-ingredienten-toe")
																	.show();
															$(
																	"div#nieuw-gerecht")
																	.hide();
														}
													});

										});

						$(document)
								.on(
										"click",
										"#voeg-gerecht-toe-btn",
										function(event) {
											event.preventDefault();
											var data = $("#nieuw-gerecht-form")
													.serialize()
													+ "&voeg-gerecht-toe-btn=true";
											var html;
											$
													.ajax({
														type : "GET",
														url : url,
														data : data,
														success : function(res) {
															var arr = JSON
																	.parse(res);
															html = "";
															for (var i = 0; i < arr.length; i++) {
																var naam = arr[i].naam;
																html += "<option value=\"" + naam + "\">"
																		+ naam
																		+ "</option>"
															}
															$(
																	"#select-gerechten")
																	.html(html);
														}
													});
										});

						$(document)
								.on(
										"click",
										"#voeg-produkt-toe-btn",
										function(event) {
											event.preventDefault();
											var data = $("#nieuw-produkt")
													.serialize()
													+ "&voeg-produkt-toe-btn=true";
											var html;
											$
													.ajax({
														type : "POST",
														url : url,
														data : data,
														success : function(res) {
															var arr = JSON
																	.parse(res);
															html = "";
															for (var i = 0; i < arr.length; i++) {
																var naam = arr[i].naam;
																html += "<option value=\"" + naam + "\">"
																		+ naam
																		+ "</option>"
															}
															$(
																	"#select-produkten")
																	.html(html);
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
																	html += "<tr><td>" + ingredienten[i].naam + "</td>"
																	+ "<td>" + ingredienten[i].hoeveelheidPP + "</td></tr>";
																}

															$("#ingredienten-tabel")
																	.html(html);

														}
													});
										});

						$(document)
								.on(
										"click",
										"#voeg-meeteenheid-toe",
										function(event) {
											event.preventDefault();
											var data = $("#nieuwe-meeteenheid")
													.serialize()
													+ "&voeg-meeteenheid-toe-btn=true";
											var html;
											$
													.ajax({
														type : "POST",
														url : url,
														data : data,
														success : function(res) {
															var arr = JSON
																	.parse(res);
															html = "";
															for (var i = 0; i < arr.length; i++) {
																var naam = arr[i].naam;
																html += "<option value=\"" + naam + "\">"
																		+ naam
																		+ "</option>"
															}
															$(
																	"#select-meeteenheden")
																	.html(html);
														}
													});

										});

					});
</script>





</html>
<%
	}
%>
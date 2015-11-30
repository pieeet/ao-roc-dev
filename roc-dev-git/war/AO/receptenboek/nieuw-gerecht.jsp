<%@ include file="/AO/receptenboek/includes/pagetop.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="gerechten.recept.*"%>

<%
	if (user != null) {

		if (request.getAttribute("gerechten") == null) {
			response.sendRedirect("voeg-toetjes-toe");

		} else {
			ArrayList<Gerecht> gerechten = (ArrayList<Gerecht>) request
					.getAttribute("gerechten");
			ArrayList<Produkt> produkten = (ArrayList<Produkt>) request
					.getAttribute("produkten");
			ArrayList<String> meeteenheden = (ArrayList<String>) request
					.getAttribute("meeteenheden");
%>
<style>
div#voeg-ingredienten-toe {
	display: none;
}
</style>

<div class="col-md-9">
	<h1>Voeg gerechten toe</h1>
	<div id="kies-gerecht">
		<h2>Kies een bestaand gerecht</h2>
		<form role="form" id="kies-gerecht">
			<fieldset>
				<div class="form-group">
					<label for="select-gerechten">Naam gerecht</label> <select
						id="select-gerechten" name="gerecht">
						<%
							for (Gerecht gerecht : gerechten) {
						%>
						<option value="<%=gerecht.getNaam()%>"><%=gerecht.getNaam()%></option>
						<%
							}
						%>
					</select>
				</div>
				<input type="submit" id="kies-gerecht-btn" class="btn btn-danger"
					value="Kies">
			</fieldset>
		</form>
		<div id="nieuw-gerecht">
			<h2>Maak nieuw gerecht</h2>
			<form role="form" id="nieuw-gerecht-form">
				<fieldset>
					<div class="form-group">
						<label for="naam-gerecht">Naam gerecht</label><br> <input
							type="text" name="naam-gerecht" id="naam-gerecht">
					</div>
					<div class="form-group">
						<label for="bereidingstijd">Bereidingstijd</label><br> <input
							type="text" name="bereidingstijd" id="bereidingstijd"
							placeholder="minuten">
					</div>
					<div class="form-group">
						<label for="">Bereidingswijze</label><br>
						<textarea name="bereidingswijze" id="bereidingswijze" cols="60"
							rows="10"></textarea>
					</div>
					<input type="submit" class="btn btn-danger"
						id="voeg-gerecht-toe-btn" value="Maak gerecht">
				</fieldset>
			</form>
		</div>
		<div id="voeg-ingredienten-toe">
			<h2 id="naam-gerecht-heading"></h2>
			<h3>Ingredi&euml;nten</h3>
			<table id="ingredienten-tabel"></table>
			<h3>Voeg ingredi&euml;nten toe</h3>
			<p>Voeg een produkt toe als het niet in de lijst voorkomt</p>
			<form role="form" id="nieuw-ingredient">
				<fieldset>
					<div class="form-group">
						<label>Naam produkt</label> <select id="select-produkten"
							name="produkt">
							<%
								for (Produkt produkt : produkten) {
							%>
							<option value="<%=produkt.getNaam()%>"><%=produkt.getNaam()%>
								(<%=produkt.getEenheid()%>)
							</option>
							<%
								}
							%>
						</select>
					</div>
					<div class="form-group">
						<label>Hoeveelheid per persoon</label><br> <input type="text"
							name="hoeveelheid"><input type="hidden"
							id="naam-gerecht-hidden" name="gerecht">
					</div>
					<input type="submit" id="voeg-ingredient-toe-btn"
						class="btn btn-danger" value="Voeg toe">

				</fieldset>
			</form>
			<h3>Voeg produkten toe</h3>
			<form role="form" id="nieuw-produkt">
				<fieldset>
					<div class="form-group">
						<label>Naam produkt</label><br> <input type="text"
							name="naam">
					</div>
					<div class="form-group">
						<label>Meeteenheid</label> <select id="select-meeteenheden"
							name="meeteenheid">
							<%
								for (String meeteenheid : meeteenheden) {
							%>
							<option value="<%=meeteenheid%>"><%=meeteenheid%></option>
							<%
								}
							%>
						</select>
					</div>
					<div class="form-group">
						<label>Energie per eenheid</label><br> <input type="text"
							name="energie">
					</div>
					<input type="submit" id="voeg-produkt-toe-btn"
						class="btn btn-danger" value="Voeg toe">
				</fieldset>
			</form>
			<h3>Voeg meeteenheid toe</h3>
			<form role="form" id="nieuwe-meeteenheid">
				<fieldset>
					<div class="form-group">
						<label>naam meeteenheid</label> <input type="text"
							name="naam-eenheid">
					</div>
					<input type="submit" id="voeg-meeteenheid-toe"
						class="btn btn-danger"
						value="Voeg toe">
				</fieldset>
		</div>
	</div>
</div>

<%@ include file="/includes/bottom.html"%>
<script src="/AO/receptenboek/javascript/gerechten.js"></script>
</body>

<%
	}
	}
%>

</html>
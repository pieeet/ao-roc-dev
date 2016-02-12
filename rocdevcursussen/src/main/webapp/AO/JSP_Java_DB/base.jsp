<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">
	<%@ include file="/AO/JSP_Java_DB/includes/zijmenu.jsp"%>com.rocdev


	<div class="col-md-9">
		<h2>Titel pagina</h2>

		<%--<h3>Schaakbord</h3>--%>
		<%----%>
		<%--<table id="schaakbord">--%>
		<%--<%--%>
		<%--for (int i = 0; i < 8; i++) {--%>
			<%--out.println("<tr>");--%>
			<%--for ( int j = 0; j < 8; j++) {--%>
				<%--if ((i + j) % 2 == 0) {--%>
					<%--out.println("<td class=\"zwart\"></td>");--%>
				<%--} else {--%>
					<%--out.println("<td class='wit'>");--%>
				<%--}--%>
			<%--}--%>
			<%--out.println("</tr>");--%>
		<%--}--%>
		<%--%>--%>
		<%--</table>--%>

		<%--<h3>Vermenigvuldigingstabel</h3>--%>
		<%----%>
		<%--<table id="xtabel">--%>
		<%--<%--%>
		<%--for (int i = 1; i <= 10; i++) {--%>
			<%--out.println("<tr>");--%>
			<%--for (int j = 1; j <= 10; j++) {--%>
				<%--if (i == 1 || j == 1) {--%>
					<%--out.println("<th>" + i * j + "</th>");--%>
				<%--} else {--%>
					<%--out.println("<td>" + i * j + "</td>");--%>
				<%--}--%>
				<%----%>
			<%--}--%>
			<%--out.println("</tr>");--%>
		<%--}--%>
		<%----%>
		<%--%>--%>
		<%----%>
		<%--</table>--%>

		<%
			boolean showTable = false;
			String invoer;
			int tafelGetal = 0;
			String foutboodschap = "";
			if (request.getParameter("knop") != null
					|| request.getParameter("min") != null
					|| request.getParameter("plus") != null) {
				invoer = request.getParameter("getal");
				try {
					tafelGetal = Integer.parseInt(invoer);
					showTable = true;

				} catch (NumberFormatException e) {
					foutboodschap = "U moet een geheel getal invoeren!";
				}

				if (request.getParameter("min") != null) {
					tafelGetal--;
				} else if (request.getParameter("plus") != null) {
					tafelGetal++;
				}
			}
		%>

		<h3>Kies een tafel</h3>

		<form action="/AO/JSP_Java_DB/base.jsp" method="get">

			<input type="text" name="getal">


			<p class="fout"><%=foutboodschap%></p>


			<input type="submit" name="knop" value="Ok">


		</form>
		<%
			if (showTable) {
				out.println("<h3>De tafel van " + tafelGetal + "</h3>");
				for (int i = 1; i <= 10; i++) {
					out.println(i + " x " + tafelGetal + " = " + i * tafelGetal
							+ "<br>");
				}
		%>

		<form action="/AO/JSP_Java_DB/base.jsp" method="get">
			<input type="hidden" name="getal" value="<%=tafelGetal%>"> <input
				type="submit" name="min" value="vorige"> <input
				type="submit" name="plus" value="volgende">
		</form>

		<%
			}
		%>





		<br><br><br><br><br>
		
	</div>
</div>
<%@ include file="/AO/JSP_Java_DB/includes/bottom.html"%>
</html>
<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">
	<%@ include file="/AO/JSP_Java_DB/includes/zijmenu.jsp"%>


	<div class="col-md-9">
		<h2>Titel pagina</h2>
		
		<table id="schaakbord">
		<%
		for (int i = 0; i < 8; i++) {
			out.println("<tr>");
			for ( int j = 0; j < 8; j++) {
				if ((i + j) % 2 == 0) {
					out.println("<td class=\"zwart\"></td>");
				} else {
					out.println("<td class='wit'>");
				}
			}
			out.println("</tr>");
		}
		%>
		</table>
		
		<table id="xtabel">
		<%
		for (int i = 1; i <= 10; i++) {
			out.println("<tr>");
			for (int j = 1; j <= 10; j++) {
				if (i == 1 || j == 1) {
					out.println("<th>" + i * j + "</th>");
				} else {
					out.println("<td>" + i * j + "</td>");
				}
				
			}
			out.println("</tr>");
		}
		
		%>
		
		</table>
		
		<p>

				<%
				long arg0 = 0L;
				long arg1 = 1L;
				long som = arg0 + arg1;
				long maxWaarde = 900000000000000000L;
				out.println("1, ");
				while (som < maxWaarde) {
					som = arg0 + arg1;
					arg0 = arg1;
					arg1 = som;
					out.println(som);
					}
				%>
				<b>en zo voort...</b>
			</p>
		
		<h3>De tafel van 5</h3>
			<%
				for (int i = 1; i <= 10; i++) {
					out.println(i + " x 5 = " + i * 5 + "<br>");
				}
			%>
		
		
		
	</div>
</div>
<%@ include file="/AO/JSP_Java_DB/includes/bottom.html"%>
</html>
<%@ include file="/includes/pagetop-all.jsp"%>
<div class="container">
	<%@ include file="/AO/JSP_Java_DB/includes/zijmenu.jsp"%>
	<div class="col-md-9">
		<h2>Conversie van Celsius naar Fahrenheit</h2>
		<%
			int celsius;
			int fahr;
			String tekst = "";
			try {
				celsius = Integer.parseInt(request.getParameter("celsius"));
				fahr = Math.round(celsius * 1.8f + 32);
				//alternatief
				//fahr = (int) Math.round(celsius * 1.8 + 32);
				tekst = celsius + " graden Celsius is " + fahr
						+ " graden Fahrenheit";
			} catch (NumberFormatException e) {
				tekst = "Foute invoer, u moet een geheel getal invoeren";
			} finally {
			}
		%>
		<p><%=tekst%></p>
		<p>
			Ga <a href="/AO/jsp/deel2#opg10">terug</a> naar de cursus pagina.
		</p>
	</div>
</div>
<%@ include file="/AO/JSP_Java_DB/includes/bottom.html"%>
</html>
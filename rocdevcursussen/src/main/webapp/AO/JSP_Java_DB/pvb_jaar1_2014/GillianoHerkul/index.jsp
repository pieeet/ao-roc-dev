<%-- 
    Document   : Formulier
    Created on : 28-mei-2014, 14:17:15
    Author     : gilliano
--%>

<%
    out.println("<style>");
    out.println("#tabel {");
    out.println("font-weight: bold;");
    out.println("background-color: red;");
    out.println("width: 100%;");
    out.println("}");
    out.println("</style>");
    
    out.println("<table id = tabel>");
    out.println("<tr>");
    out.println("<td>" + "<h1> Zoeken op prijs </h1> </td>" + "<br>");
    out.println("</tr>");
    out.println("</table>");
    
    out.println("Vul de minimale prijs en maximale prijs in" + "<br>");
    out.println("<form action=\"Overzicht.jsp\" method=\"get\">" + "<br>");
    out.println("Minimale prijs" + "<input type=\"text\" name=\"maxprijs\"> <br>");
    out.println("Maximale prijs" + "<input type=\"text\" name=\"maxprijs\">" + "<br>" + "<br>");
    out.println("<input type=\"submit\" value=\"Zoek op prijs\">" + "<br>");
    out.println("</form>");
    
    out.println("<style>");
    out.println("#tabel {");
    out.println("font-weight: bold;");
    out.println("background-color: green;");
    out.println("width: 100%;");
    out.println("}");
    out.println("</style>");
    
    out.println("<table id= tabel>");
    out.println("<td> <h1> Zoeken op merk </h1> </td>" + "<br>");
    out.println("</table>" + "<br>");
    
    out.println("Type de naam van een merk zodat alle auto's van dat merk worden weergegeven" + "<br>" + "<br>");
    
    out.println("<form action=\"Overzicht.jsp\" method=\"get\">");
    out.println("Merk  " + "<select name=\"merken\">");
    out.println("<option value=\"mercedes\">Mercedes</option>");
    out.println("<option value=\"ferrari\">Ferrari</option>");
    out.println("<option value=\"mclaren\">McLaren</option>");
    out.println("</select>" + "<br>" + "<br>");
    out.println("<input type=\"submit\" value=\"Zoeken op merk\">");
    out.println("</form>");
%>

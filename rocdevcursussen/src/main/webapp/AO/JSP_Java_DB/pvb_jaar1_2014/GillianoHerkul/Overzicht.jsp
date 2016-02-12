
<%@page import = "java.util.ArrayList" %>
<%@page import = "jspcursus.eindtoets.gillianoherkul.*" %>

<%
    AutoOverzicht auto = new AutoOverzicht();
    
    ArrayList<Auto> lijst = auto.getLijst();
    String tabel = "";
    
    out.println("<style>");
    out.println("#header {");
    out.println("font-weight: bold;");
    out.println("background-color: grey;");
    out.println("width: 100%;");
    out.println("}");
    out.println("</style>");
    
    out.println("<h1> Auto's </h1>");
    
    out.println("<table id=\"header\">");
    out.println("<td> <h1> Model </h1> </td>");
    out.println("<td> <h1> Prijs </h1> </td>");
    out.println("</table>");
    
    tabel += "<table>";
    for(Auto autos : lijst)
    {
        tabel += "<tr>";
        
            tabel += "<td>" + "<img src=\"Foto/" + autos.getAfbeelding() + "\" height=150px; width=150px;>" + "<br>"
            + autos.getMerk() + autos.getModel() + "<td>" + autos.getPrijsFormat() + "</td>";
            
        
        
        tabel += "</tr>";
    }
    tabel += "</table>";
    
    out.println(tabel);
     
    
%>
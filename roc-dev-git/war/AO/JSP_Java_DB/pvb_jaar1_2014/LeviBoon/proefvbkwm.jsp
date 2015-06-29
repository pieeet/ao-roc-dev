<%-- 
    Document   : proefvbkwm
    Created on : 28-May-2014, 08:48:12
    Author     : Levi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="jspcursus.eindtoets.leviboon.*" %>
<!DOCTYPE html>
<%
AutoOverzicht overz = new AutoOverzicht();
ArrayList<Auto> autolijst = overz.getAutolijst();
String table="";
String item=""; 
int min;
int max;
if (request.getParameter("btn1") != null) {
    min = Integer.parseInt(request.getParameter("minimum"));
    max = Integer.parseInt(request.getParameter("maximum"));
    for( int i = 0; i < overz.autolijst.size(); i++) {
        if(autolijst.get(i).getPrijs()>=(min) && autolijst.get(i).getPrijs()<=(max)){
                    table+="<tr><th>Model</th><th id=\"theading2\">Prijs</th></tr>";
                    table+="<tr><td>"+autolijst.get(i).getPlaatje()+"</td><td>€"+autolijst.get(i).getPrijs()+"</td></tr>";
                    table+="<tr><td>"+autolijst.get(i).getMerk()+" "+autolijst.get(i).getModel()+"</td></tr>";
        }
    }
}
if (request.getParameter("btn") != null){ 
            item = request.getParameter("drop1");
            for( int i = 0; i < overz.autolijst.size(); i++) {
                if(autolijst.get(i).getMerk().toLowerCase().contains(item.toLowerCase())){
                    table+="<tr><th id=\"theading1\">Model</th><th id=\"theading2\">Prijs</th></tr>";
                    table+="<tr><td>"+autolijst.get(i).getPlaatje()+"</td><td>€"+autolijst.get(i).getPrijs()+"</td></tr>";
                    table+="<tr><td>"+autolijst.get(i).getMerk()+" "+autolijst.get(i).getModel()+"</td></tr>";
            }
      }
}
if (request.getParameter("btn") == null && request.getParameter("btn1") == null ){ 
            for( int i = 0; i < overz.autolijst.size(); i++) {
                if(autolijst.get(i).getMerk().toLowerCase().contains(item.toLowerCase())){
                    table+="<tr><th id=\"theading1\">Model</th><th id=\"theading2\">Prijs</th></tr>";
                    table+="<tr><td>"+autolijst.get(i).getPlaatje()+"</td><td>€"+autolijst.get(i).getPrijs()+"</td></tr>";
                    table+="<tr><td>"+autolijst.get(i).getMerk()+" "+autolijst.get(i).getModel()+"</td></tr>";
            }
      }
}
%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/master.css">
        <title>Autos</title>
    </head>
    <body>
        <h1>Auto's</h1>
        <div align="left">
           <table style='width:300px'>
            <%=table%>
        </table>
        <a href="index.jsp">formulier</a>
    </div>
    </body>
</html>

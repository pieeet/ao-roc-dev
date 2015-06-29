<%@page import="jspcursus.eindtoets.sebastianjakupovitch.*" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    AutoOverzicht overzicht = new AutoOverzicht();
    ArrayList<Auto> lijst = overzicht.getAutolijst();
    String merk = "";
    String tabel = "";
    int minPrijs = 0;
    int maxPrijs = 0;
    
    if (request.getParameter("knop1") != null){
        if(request.getParameter("minPrijs") == ""){
            minPrijs = 0;
        }
        else{
        minPrijs = Integer.parseInt(request.getParameter("minPrijs"));
        }
        if(request.getParameter("maxPrijs") == ""){
            maxPrijs = 300000;
        }
        else{
        maxPrijs = Integer.parseInt(request.getParameter("maxPrijs"));
        }
        for(int i = 0; i < lijst.size(); i++){
            if(lijst.get(i).getPrijs() >= minPrijs && lijst.get(i).getPrijs() <= maxPrijs){
                tabel += "<tr>";
                tabel += "<td> <img src=\"img/"  +lijst.get(i).getImg() + ".jpg\" width=\"200\" height=\"100px\" class=\"img-thumbnail\" alt=\"Responsive image\"> <br> Merk en model: "+  lijst.get(i).getMerk() + " " + lijst.get(i).getModel() + "</td>";
                tabel += "<td> &euro;" + lijst.get(i).getPrijs()+ "</td>";
                tabel += "</tr>";
            }
        }
    }
    
    if (request.getParameter("knop2") != null){
        merk = request.getParameter("merk");
        for(int i = 0; i < lijst.size(); i++){
            if(lijst.get(i).getMerk().equals(merk)){
                tabel += "<tr>";
                tabel += "<td> <img src=\"img/"  +lijst.get(i).getImg() + ".jpg\" width=\"200\" height=\"100px\" class=\"img-thumbnail\" alt=\"Responsive image\"> <br> Merk en model: "+  lijst.get(i).getMerk() + " " + lijst.get(i).getModel() + "</td>";
                tabel += "<td> &euro;" + lijst.get(i).getPrijs()+ "</td>";
                tabel += "</tr>";
            }
        }
    }

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-header">
  <div style="margin-left:30px">
    <h1>Auto's</h1>
  </div>
</div>
<table class="table table-condensed">
  <tr class="active">
    <th style="width: 300px">Model</th>
    <th>Prijs</th>
  </tr>
  <%= tabel %>
</table>
<a href="index.jsp">formulier</a>
</body>
</html>
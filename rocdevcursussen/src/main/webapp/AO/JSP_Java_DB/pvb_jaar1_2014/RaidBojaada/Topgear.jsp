<%-- 
    Document   : Topgear
    Created on : 28-May-2014, 10:58:29
    Author     : Raïd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcursus.eindtoets.raidbojaada.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<%
    AutoOverzicht overzicht = new AutoOverzicht();
    String tabel = "";
    String merk = "";
    int minimaal;
    int maximaal;
    ArrayList<Auto> lijst = overzicht.getLijst();

    if (request.getParameter("zoekknop") != null) {
            merk = (request.getParameter("zoekmerk"));
          for (int i = 0; i <overzicht.lijst.size(); i++){
              if (lijst.get(i).getMerk().equals(merk))  {
                
                tabel+="<tr>";
                tabel+="<td>" + lijst.get(i).getMerk() + " "+ lijst.get(i).getType() +"<br>" + "<img src=\"plaatje/" +lijst.get(i).getPlaatje() +"\" width=\"85\"></td>";
                tabel+="<td>" + "Prijs: €" + lijst.get(i).getPrijs()+" ,--" + "</td>";
                tabel+="</tr>";
        }
      }
    }
    
    else if (request.getParameter("zoek") != null) {
            minimaal = Integer.parseInt(request.getParameter("min"));
            maximaal = Integer.parseInt(request.getParameter("max"));

          for (int i = 0; i <overzicht.lijst.size(); i++){
              if (lijst.get(i).getPrijs() >= (minimaal) && lijst.get(i).getPrijs() <=(maximaal))  {
                
                tabel+="<tr>";
                tabel+="<td>" + lijst.get(i).getMerk() + " "+ lijst.get(i).getType() +"<br>" + "<img src=\"plaatje/" +lijst.get(i).getPlaatje() +"\" width=\"85\"></td>";
                tabel+="<td>" + "Prijs: €" + lijst.get(i).getPrijs()+" ,--" + "</td>";
                tabel+="</tr>";
        }
      }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Topgear</title>
    </head>
    <body>
        <table class="table table-hover">
            <tr style="background-color: lightsteelblue" >
                <th style="width: 280px">De autolijst van Topgear </th>
                <th>Prijzen</th>
            </tr>
            <%=tabel%> 
        </table>
     <a href="index.jsp">Formulier</a>
    </body>
</html>

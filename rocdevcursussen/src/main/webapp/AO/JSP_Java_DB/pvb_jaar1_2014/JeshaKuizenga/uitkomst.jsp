<%-- 
    Document   : uitkomst
    Created on : 28-mei-2014, 13:31:50
    Author     : kuizenga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import='jspcursus.eindtoets.jeshakuizenga.*'%>
<link rel="stylesheet" type="text/css" href="style.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Auto's</h1>
                     <table id='header'><tr>
                      <td id='td1'>Model</td>
                      <td id='td2'>Prijs</td>
                      </tr></table>
        
        
                      <%
                          
                          
                       String swagger = "swag";
                     AutoOverzicht overzicht = new AutoOverzicht();
                            overzicht.voegAutoToe(new Auto("images/audi_a1.jpg","audi", "a1", 23000));
                             overzicht.voegAutoToe(new Auto("images/audi_a3.jpg","audi", "a3", 23000));
                             overzicht.voegAutoToe(new Auto("images/audi_r8.jpg","audi", "r8", 123000));
                            overzicht.voegAutoToe(new Auto("images/ferrari_enzo.jpg","ferrari", "enzo", 200000));
                             overzicht.voegAutoToe(new Auto("images/ferrari_testarossa.jpg","ferrari", "testarossa", 209000));
                             overzicht.voegAutoToe(new Auto("images/fiat_500.jpg","fiat", "500", 12000));
                               overzicht.voegAutoToe(new Auto("images/fiat_bravo.jpg","fiat", "bravo", 23000));
                               overzicht.voegAutoToe(new Auto("images/fiat_punto.jpg","fiat", "punto", 16000));
                                      overzicht.voegAutoToe(new Auto("images/ford_fiesta.jpg","ford", "fiesta", 14000));
                                     overzicht.voegAutoToe(new Auto("images/ford_focus.jpg","ford", "focus", 25000));
                                       overzicht.voegAutoToe(new Auto("images/ford_mondeo.jpg","ford", "mondeo", 28000));
                                       overzicht.voegAutoToe(new Auto("images/maserati_ghibli.jpg","maserati", "ghibli", 120000));
                                       overzicht.voegAutoToe(new Auto("images/maserati_quattroporte.jpg","maserati", "quattroporte", 160000));
                                       overzicht.voegAutoToe(new Auto("images/opel_astra.jpg","opel", "astra", 22000));
                                         overzicht.voegAutoToe(new Auto("images/opel_corsa.jpg","opel", "corsa", 14000));
                                        overzicht.voegAutoToe(new Auto("images/opel_mokka.jpg","opel", "mokka", 11000));
                                         overzicht.voegAutoToe(new Auto("images/porsche_cayenne.jpg","porsche", "cayenne", 85000));
                                          overzicht.voegAutoToe(new Auto("images/porsche_panamera.jpg","porsche", "panamera", 120000));
                                         overzicht.voegAutoToe(new Auto("images/porsche_911.jpg","porsche", "911", 126000));
                          
                          
                          
                          String strMinprijs,strMaxprijs;
                          String merk;
                          int minprijs,maxprijs;
                          
               if(request.getParameter("zoekprijs") != null ){
                              
              strMinprijs=request.getParameter("minprijs");
              strMaxprijs=request.getParameter("maxprijs");
           try{
               minprijs=Integer.parseInt(strMinprijs);
               maxprijs=Integer.parseInt(strMaxprijs);
               
               swagger=overzicht.zoekAutoOpPrijs(minprijs, maxprijs);
               
               
           }  
            catch(NumberFormatException e) {}
           }
               else if(request.getParameter("zoekmerk") != null ){
                              
              merk=request.getParameter("merk");
              
           try{
               
               
               swagger=overzicht.zoekAutoOpMerk(merk);
               
               
           }  
            catch(NumberFormatException e) {}
           }
                      %>
                      
                      
                      
                      <%=swagger%><br>
    <td><a href="index.jsp" target="_self">Formulier</a></td>
    </body>
</html>

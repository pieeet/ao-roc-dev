<%-- 
    Document   : index
    Created on : 28-mei-2014, 12:28:51
    Author     : Pascal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- import weggehaald Java klassen ontbreken (pdv)-->


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="index.css" rel="stylesheet" type="type/css" media="screen">
        <title>Topgear</title>
        
        <!-- jsp code weggehaald ivm compile errors -->
           
                
    </head>
    <body>
       <div class="wrapper">
           <form action="result.jsp" method="get">
               <div class="banner">Zoeken op prijs</div>
               <br />Vul de minimale en maximale prijs in <br /><br/>
               <label>Minimale prijs  </label><input type="text" name="minprijs"><br /> 
               <label>Minimale prijs  </label><input type="text" name="maxprijs"><br /><br />
               <input type="submit" value="zoek op prijs" name="prijs"><br /><br />
           </form>
           <form action="result.jsp" method="get">
               <div class="banner">Zoeken op prijs</div>
               <br />Selecteer een merk zodat alle auto's van dat merk worden weergegeven<br /><br />
               Merk
               <select name="lijst" id="opa">
                   <option value="audi">Audi</option>
                   <option value="ferrari">Ferrari</option>
                   <option value="fiat">Fiat</option>
               </select><br/><br />
               <input type="submit" value="zoek op Merk" name="merk"><br /><br />
           </form>
           
       </div>   

    </body>
</html>

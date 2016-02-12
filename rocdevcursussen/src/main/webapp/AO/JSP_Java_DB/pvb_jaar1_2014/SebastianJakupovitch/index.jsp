<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
<div class="row">
  <div class="col-md-4"></div>
  <div class="col-md-4">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">Zoek op prijs</h3>
      </div>
        <div class="panel-body" style="text-align: center">
        <form action="zoekresultaat.jsp" method="get">
          <label>Minimale prijs</label>
          <input  name="minPrijs" type="text" placeholder="">
          <br>
          <label>Maximale prijs</label>
          <input type="text" name="maxPrijs" placeholder="">
          <p></p>
          <input type="submit" name="knop1" value="Zoek op prijs">
        </form>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">Zoek op prijs</h3>
      </div>
        <div class="panel-body" style="text-align: center">
        <form action="zoekresultaat.jsp" method="get">
          <select name="merk">
            <option value="Audi">Audi</option>
            <option value="Ferrari">Ferrari</option>
            <option value="Fiat">Fiat</option>
            <option value="Ford">Ford</option>
            <option value="Maserati">Maserati</option>
            <option value="Opel">Opel</option>
            <option value="Porsche">Porsche</option>
          </select>
          <p></p>
          <input type="submit" name="knop2" value="Zoek op merk">
        </form>
      </div>
    </div>
  </div>
  <div class="col-md-4"></div>
</div>
</body>
</html>

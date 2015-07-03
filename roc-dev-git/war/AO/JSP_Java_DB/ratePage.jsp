<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Rate a page</h1>
<form>
<table>
	<tr>
		<td><label>Website</label></td>
		<td><input type="text" size="50"></td>
	</tr>
</table>
<table>
	<tr>
		<td><label>Rating</label></td>
		<td>5</td><td>4</td><td>3</td><td>2</td><td>1</td>
	</tr>
	<tr>
		<td><label>Rate</label></td>
		<td><input name="rating1" type="radio"></td>
		<td><input name="rating2" type="radio"></td>
		<td><input name="rating3" type="radio"></td>
		<td><input name="rating4" type="radio"></td>
		<td><input name="rating5" type="radio"></td>
	</tr>
	<tr>
		<td colspan="1"><input name="rate_knop" type="submit" value="Ok"></td>
		<td colspan="4"><input name="annuleer_knop" type="submit" value="Annuleer" ></td>
	</tr>
		

</table>
</form>
</body>
</html>
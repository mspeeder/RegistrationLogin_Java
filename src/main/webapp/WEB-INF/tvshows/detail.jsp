<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<title>Detail</title>
</head>
<body>
	<div class="container">
		<h2><c:out value="${show.title}" /></h2>
		
		<p>Network: <c:out value="${show.network}" /></p>
		
		<a href="/shows/${show.id}/edit">Edit</a>
		
	</div>
	
	<br>
	<div class="container">
		<form action="/shows">
			  <select name="cars">
			    <option value="1">1</option>
			    <option value="2">2</option>
			    <option value="3">3</option>
			    <option value="4">4</option>
			    <option value="5">5</option>
			  </select>
			  <input type="submit" value="Submit">
		</form>
	</div>

</body>
</html>
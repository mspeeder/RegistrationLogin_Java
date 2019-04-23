<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<title>Shows</title>
</head>
<body>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-5"><h2>Welcome, <c:out value="${user.name}" /></h2></div>
			<div class="col-5"></div>
			<div class="col-2"><a href="/logout">Logout</a></div>
		</div>
	</div>
	
	
	<br>
	<div class="container">
		<table>
			<tr>
				<th>Show</th>
				<th>Network</th>
				<th>Average Rating</th>
			<tr>
			<c:forEach items="${shows}" var="show">
			<tr>
				<td><a href="/shows/${show.id}"><c:out value="${show.title}"/></a></td>
				<td><c:out value="${show.network}"/></td>
			</tr>
			</c:forEach>
		</table>
	
	</div>
	<br>
	<div class="container">
		<a href="/shows/new">Add a show</a>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<title>Edit Show</title>
</head>
<body>
	<br>
	<div class="container">
		<h2><c:out value="${show.title}" /></h2>
		
		<p><form:errors path="show.*"/></p>
	    <form:form action="/shows/${show.id}/edit" method="post" modelAttribute="show">
	    <input type="hidden" name="_method" value="put"> 
	    <p>
	        <form:label path="title">Title</form:label>
	        <form:errors path="title"/>
	        <form:input path="title"/>
	    </p>
	    <p>
	        <form:label path="network">Network</form:label>
	        <form:errors path="network"/>
	        <form:textarea path="network"/>
	    </p>
	  
	    <input type="submit" value="Update"/>
	</form:form>
	</div>
	<br>
	<div class="container">
		<form action="/shows/${show.id}" method="post">
	    <input type="hidden" name="_method" value="delete">
	    <input type="submit" value="Delete">
	</form> 
	</div>
	
</body>
</html>
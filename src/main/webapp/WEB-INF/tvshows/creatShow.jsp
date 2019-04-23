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
	<title>Create a Show</title>
</head>
<body>
	<br>
	<div class="container">
		<h2>Create a new show</h2>
		<br>
		<p><form:errors path="show.*"/></p>
		<form:form method="POST" action="/shows/new" modelAttribute="show">
	    	<p>
	            <form:label path="title">title:</form:label>
	            <form:input path="title"/>
	        </p>
	        <p>
	            <form:label path="network">Network:</form:label>
	            <form:input path="network"/>
	        </p>
	        <input type="submit" value="Creat"/>
	    </form:form>
	</div>
	

</body>
</html>
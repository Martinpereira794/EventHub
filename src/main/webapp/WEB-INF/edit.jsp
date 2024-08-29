<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Event</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<h1>${event.eventName}</h1>
		<h2>Edit Event</h2>
		<div>
			<form:form action="/edit/${event.id}" method="post" modelAttribute="event">
				<input type="hidden" name="_method" value="put">
				<div>
					<form:label path="eventName" > Name:</form:label>
					<form:input path="eventName" class="form-control"/>
					<form:errors path="eventName" class="text-danger"/>
				</div>
				<div>
					<form:label path="eventDate" > Date:</form:label>
					<form:input path="eventDate" class="form-control"/>
					<form:errors path="eventDate" class="text-danger"/>
				</div>
				<div>
					<form:label path="eventLocation" > Location:</form:label>
					<form:input path="eventLocation" class="form-control"/>
					<form:errors path="eventLocation" class="text-danger"/>
					<form:label path="eventProvince">Province:</form:label>
					<form:select path="eventProvince">
						<c:forEach items="${provinces}" var="province">
							<form:option value="${province}">${province}</form:option>
						</c:forEach>
					</form:select>
				</div>
				<input type="submit" class="btn btn-primary" value="Edit">
			</form:form>
		</div>
	</div>
</body>
</html>
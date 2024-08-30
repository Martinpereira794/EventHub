<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Create Event - EventHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/styles.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
</head>
<body class="body-custom">
<header>
    <div class="nav">
        <a href="/home"><h1 class="logo">EventHub</h1></a>
        <div class="nav-items">
            <a href="/home"><h2 class="registert">Home</h2></a>
        </div>
        <div class="auth-items">
            <c:choose>
                <c:when test="${not empty userInSession}">
                    <!-- Si el usuario está logueado, no mostrar botones de Login y Register -->
                    <a class="registert" href="/logout"><h2>Logout</h2></a>
                </c:when>
            </c:choose>
        </div>
    </div>
</header>
<main>
    <div class="container">
        <div>
            <div>
                <div class="box p-4 m-2 ">
                    <h2 class="text-center mb-4">Create Event</h2>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">
                            ${error}
                        </div>
                    </c:if>
                    
                    <form:form action="/create_event" method="post" modelAttribute="newEvent" enctype="multipart/form-data">
                    	
                        <div class="mb-3">
                            <form:label class="inputLabel" path="eventName">Event Name</form:label>
                            <form:input path="eventName" class="form-control" placeholder="Enter event name" />
                            <form:errors path="eventName" class="text-danger" />
                        </div>
                        <div class="date-time">
                            <div class="date mb-3">
                                <form:label class="inputLabel" path="eventDate">Event Date</form:label>
                                <form:input path="eventDate" class="form-control" type="date" placeholder="Select event date" />
                                <form:errors path="eventDate" class="text-danger" />
                            </div>
                            <div class="hour mb-3">
                                <div class="form-group">
                                    <label class="inputLabel" for="eventStartTime">Start Time</label>
                                    <form:input type="time" path="eventStartTime" id="eventStartTime" class="form-control" placeholder="Select start time" />
                                    <form:errors path="eventStartTime" class="text-danger" />
                                </div>
                                <div class="form-group">
                                    <label class="inputLabel" for="eventEndTime">End Time</label>
                                    <form:input type="time" path="eventEndTime" id="eventEndTime" class="form-control" placeholder="Select end time" />
                                    <form:errors path="eventEndTime" class="text-danger" />
                                </div>
                            </div>
                        </div>
                        <div class="location-province">
                            <div class="location mb-3">
                                <form:label class="inputLabel" path="eventLocation">Address</form:label>
                                <form:input path="eventLocation" class="form-control" placeholder="Enter event address" />
                                <form:errors path="eventLocation" class="text-danger" />
                            </div>
                            <div class="provinceevent mb-3">
                                <form:label class="inputLabel" path="eventProvince">Province</form:label>
                                <form:select path="eventProvince" class="form-select">
                                    <c:forEach items="${provinces}" var="province">
                                        <form:option value="${province}">${province}</form:option>
                                    </c:forEach>
                                </form:select>
                                <form:errors path="eventProvince" class="text-danger" />
                            </div>
                        </div>
                        <div class="form-group">
                            <form:label class="inputLabel" path="eventInfo">Event Information</form:label>
                            <form:textarea path="eventInfo" class="form-control" id="eventInfo" rows="3" placeholder="Enter additional information about the event" />
                            <form:errors path="eventInfo" class="text-danger" />
                        </div>
                        <div class="mb-3">
                            <form:label class="inputLabel" path="eventImage">Event Image</form:label>
                            <form:input path="eventImage" type="file" class="form-control" />
                            <form:errors path="eventImage" class="text-danger" />
                        </div>
                        <form:hidden value="${userInSession.id}" path="host" />
                        <input type="submit" class="registert text-center mt-4" value="Save">
                    </form:form>
                    <a href="/" class="mt-3 text-center">Back to home</a>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="ISO-8859-1">
    <title>Event</title>
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
<link rel="stylesheet" href="/CSS/styles.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <div class="nav">
            <a href="/home"><h1 class="logo">EventHub</h1></a>
            <div class="nav-items">
            </div>
        </div>
    </header>

    <div class="container mt-4">
        <div>
            <div>
                <div class="eventbox">
                	<img  src="/uploads/${event.eventImagePath}" alt="${event.eventName}">
                	<p class="m-4">${event.formattedEventDate}</p>
                	<div class="event-details">
                    	<h2 class="event-title">${event.eventName}</h2>
                    	<h2 class="event-host">Organized by: ${event.host.firstName}</h2>
                    </div>
                    <div class="event-details">
                    	<h2>Fecha y hora</h2>
                    	<p>${event.formattedEventDate}</p>
                    	<div class="event-hour">
                    		<p>${event.eventStartTime}</p>
                    		<p>${event.eventEndTime}</p>
                    	</div>
                    </div>
                    <div class="event-details">
                    	<h2>Address</h2>
                    	<p>${event.eventLocation}</p>
                    </div>
                    <div class="event-details">
                    	<h2>About this event</h2>
                    	<p>${event.eventInfo}</p>
               		</div>
               		<div class="event-details">
               			<h2>People Joined</h2>
               			<p>${event.joinedUsers.size()}</p>
               		</div>
                </div>
                
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Location</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${event.joinedUsers}" var="user">
                            <tr>
                                <td>${user.firstName}</td>
                                <td>${user.location}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white py-3 mt-4">
        <div class="container text-center">
            <p>&copy; 2024 Your Company. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>

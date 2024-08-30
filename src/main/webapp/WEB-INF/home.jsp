<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

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
        <a href="/"><h1 class="logo">EventHub</h1></a>
        <div class="nav-items">
            <a href="/create"><h2 class="registert">Create Event</h2></a>
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
        <nav class="barra m-4">
            <div class="img">
                <img src="/img/search24.png" alt="lupa">
            </div>
            <div class="searcher">
                <form action="/searchEvent" method="GET">
                    <input id="eventName" name="eventName" class="search" type="text" placeholder="Search events">
                    <input type="submit" class="registert" value="Search">
                </form>
            </div>
        </nav>
        <div class="events">
            <!-- Eventos en tu ciudad -->
            <div class="row">
                <h2 class="section-title">Events in your city</h2>
                <div class="card-container">
                    <c:forEach items="${eventsNear}" var="event">
                        <a href="/event/${event.id}" class="card-link"> <!-- Envuelve toda la tarjeta con el enlace -->
                            <div class="card">
                                <div class="card-img">
                                    <c:choose>
                                        <c:when test="${not empty event.eventImagePath}">
                                            <img src="/uploads/${event.eventImagePath}" alt="${event.eventName}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/img/default.png" alt="default image">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="card-body">
                                    <h3>${event.eventName}</h3>
                                    <p class="event-date"><b>Date:</b> ${event.formattedEventDate}</p>
                                    <p class="event-location"><b>Location:</b> ${event.eventLocation}</p>
                                    <p class="event-info"><b>Info:</b>${event.eventInfo}</p>
                                    <p class="event-host"><b>Hosted by:</b> ${event.host.firstName}</p>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>

            <!-- Eventos en otras provincias -->
            <div class="row">
                <h2 class="section-title">Events in other provinces</h2>
                <div class="card-container">
                    <c:forEach items="${eventsNotNear}" var="event">
                        <a href="/event/${event.id}" class="card-link"> <!-- Envuelve toda la tarjeta con el enlace -->
                            <div class="card">
                                <div class="card-img">
                                    <c:choose>
                                        <c:when test="${not empty event.eventImagePath}">
                                            <img src="/uploads/${event.eventImagePath}" alt="${event.eventName}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/img/default.png" alt="default image">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="card-body">
                                    <h3>${event.eventName}</h3>
                                    <p class="event-date"><b>Date:</b> ${event.eventDate}</p>
                                    <p class="event-location"><b>Location:</b> ${event.eventLocation}</p>
                                    <p class="event-province"><b>Province:</b> ${event.eventProvince}</p>
                                    <p class="event-host"><b>Hosted by:</b> ${event.host.firstName}</p>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</main>
<footer>
</footer>
</body>
</html>

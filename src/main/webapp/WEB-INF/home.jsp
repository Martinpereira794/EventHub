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
		        <h2>Create Event</h2>
		    </div>
		    <div class="auth-items">
			    <c:choose>
			        <c:when test="${not empty userInSession}">
			            <!-- Si el usuario está logueado, no mostrar botones de Login y Register -->
			            <a href="/logout"><h2>Logout</h2></a>
			        </c:when>
			    </c:choose>
			</div>
		</div>
	</header>
	<main>
	<div class="container">
		<nav class="barra  m-4">
			<div class="img">
				<img src="/img/search24.png" alt="lupa">
			</div>
			<div class="searcher">
			    <form action="/searchEvent" method="GET">
			        <input id="eventName" name="eventName" class="search" type="text" placeholder="Search events">
			        <input type="submit" class="btn btn-custom" value="Search">
			    </form>
			</div>
			
		</nav>
		<div class="events">
		    <!-- Eventos en tu ciudad -->
		    <div class="row">
		        <h2 class="section-title">Events in your city</h2>
		        <div class="card-container">
		            <c:forEach items="${eventsNear}" var="event">
		                <div class="card">
		                    <div class="card-img">
		                        <img src="/img/medapp.png" alt="imagen">
		                    </div>
		                    <div class="card-body">
		                        <h3><a href="/event/${event.id}">${event.eventName}</a></h3>
		                        <p class="event-date"><b>Date:</b> ${event.eventDate}</p>
		                        <p class="event-location"><b>Location:</b> ${event.eventLocation}</p>
		                        <p class="event-host"><b>Hosted by:</b> ${event.host.firstName}</p>
		                        <c:if test="${event.host.id == userInSession.id}">
		                            <div class="buttons">
		                                <a class="btn btn-custom" href="/event/edit/${event.id}">Edit</a>
		                                <form action="/event/delete/${event.id}" method="post">
		                                    <input type="hidden" name="_method" value="Delete">
		                                    <input type="submit" name="delete" class="btn btn-custom" value="Delete">
		                                </form>
		                            </div>
		                        </c:if>
		                        <c:if test="${event.host.id != userInSession.id}">
		                            <div class="buttons">
		                                <c:choose>
		                                    <c:when test="${event.joinedUsers.contains(user)}">
		                                        <div class="btn btn-custom">Joined</div>
		                                        <a href="/cancel/${event.id}" class="btn btn-custom">Cancel</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                        <a href="/join/${event.id}" class="btn btn-custom">Join</a>
		                                    </c:otherwise>
		                                </c:choose>
		                            </div>
		                        </c:if>
		                    </div>
		                </div>
		            </c:forEach>
		        </div>
		    </div>
		    
		    <!-- Eventos en otras provincias -->
		    <div class="row">
		        <h2 class="section-title">Events in other provinces</h2>
		        <div class="card-container">
		            <c:forEach items="${eventsNotNear}" var="event">
		                <div class="card">
		                	<div class="card-img">
		                        <img src="/img/medapp.png" alt="imagen">
		                    </div>
		                    <div class="card-body">
		                        <h3><a href="/event/${event.id}">${event.eventName}</a></h3>
		                        <p class="event-date"><b>Date:</b> ${event.eventDate}</p>
		                        <p class="event-location"><b>Location:</b> ${event.eventLocation}</p>
		                        <p class="event-province"><b>Province:</b> ${event.eventProvince}</p>
		                        <p class="event-host"><b>Hosted by:</b> ${event.host.firstName}</p>
		                        <c:if test="${event.host.id == userInSession.id}">
		                            <div class="buttons">
		                                <a class="btn btn-custom" href="/event/edit/${event.id}">Edit</a>
		                                <form action="/event/delete/${event.id}" method="post">
		                                    <input type="hidden" name="_method" value="Delete">
		                                    <input type="submit" name="delete" class="btn btn-custom" value="Delete">
		                                </form>
		                            </div>
		                        </c:if>
		                        <c:if test="${event.host.id != userInSession.id}">
		                            <div class="buttons">
		                                <c:choose>
		                                    <c:when test="${event.joinedUsers.contains(user)}">
		                                        <div class="btn btn-custom">Joined</div>
		                                        <a href="/cancel/${event.id}" class="btn btn-custom">Cancel</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                        <a href="/join/${event.id}" class="btn btn-custom">Join</a>
		                                    </c:otherwise>
		                                </c:choose>
		                            </div>
		                        </c:if>
		                    </div>
		                </div>
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
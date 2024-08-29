<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="/CSS/styles.css" />
	
</head>
<body>
	<header>
		<div class="nav">
			<a href="/"><h1 class="logo">EventHub</h1></a>
		    <div class="nav-items">
		        <h2>Create Event</h2>
		    </div>
		    <div class="auth-items">
			    <a class="loginb" href="/login"><h2>Login</h2></a>
			    <a class="registerb" href="/register"><h2>Register</h2></a>
			</div>
		</div>
	</header>
	<main>
		
	    <div class="container">
		   	<div class="eventhub-container">
				 <div class="eventhub p-2 m-4">
				    <h1>
				      <span class="event">EVENTHUB</span>
				   </h1>
				   <p>EventHub is your go-to platform for discovering, joining, and hosting events in your area. Whether you're looking for exciting local events or planning to create your own, EventHub connects you with like-minded people and experiences. Start exploring and make your next event unforgettable.</p>
				</div>
			</div>
		    <nav class="barra  m-4">
				<div class="img">
					<img src="/img/search24.png" alt="lupa">
				</div>
				<div class="searcher">
				    <form action="/searchEventF" method="GET">
				        <input id="eventName" name="eventName" class="search" type="text" placeholder="Search events">
				        <input type="submit" class="btn btn-custom" value="Search">
				    </form>
				</div>
			</nav>
	        <div class="events">
		    <!-- Eventos en tu ciudad -->
			    <div class="row">
			        <h2 class="section-title">Events </h2>
			        <div class="card-container">
			            <c:forEach items="${events}" var="event">
			                <div class="card">
			                    <div class="card-img">
			                        <img src="/img/medapp.png" alt="imagen">
			                    </div>
			                    <div class="card-body">
			                        <h3><a href="/event/${event.id}">${event.eventName}</a></h3>
			                        <p class="event-date"><b>Date:</b> ${event.eventDate}</p>
			                        <p class="event-location"><b>Location:</b> ${event.eventLocation}</p>
			                        <p class="event-host"><b>Hosted by:</b> ${event.host.firstName}</p>
						        </div>
			                </div>
			            </c:forEach>
			        </div>
		    </div>
	    </div>
	   </div>
    </main>
    <footer>
    	<p>Made By Martin.</p>
    	<p class="text-muted">&copy; 2024</p>
    	
    </footer>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to EventHub</title>
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
            </div>
        </div>
    </header>
    
    <main class="index">
	        <section class="eventhub">
	            <h1>EVENTHUB</h1>
	            <p>The place where connections happen. Create, join, and enjoy events with people who share your interests.</p>
	            <div class="cta-buttons">
	           		<a href="/login" class="login">Log In</a>
			    	<a href="/register" class="register">Sign Up</a>
			    </div>
	        </section>
	        
	        <section class="features">
	            <div class="featurebox">
	                <h2>Meet People</h2>
	                <p>Connect with others who share your passions.</p>
	            </div>
	            <div class="featurebox">
	                <h2>Create Events</h2>
	                <p>Host your own events and invite others to join.</p>
	            </div>
	            <div class="featurebox">
	                <h2>Explore</h2>
	                <p>Discover new events and activities around you.</p>
	            </div>
	        </section>
   	</main>
   	<footer>
   		<p>Designed by Martin
   	</footer>
</body>
</html>

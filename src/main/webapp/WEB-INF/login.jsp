<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login - EventHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/styles.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
</head>
<body>
<header>
		<div class="nav">
		    <a href="/"><h1 class="logo">EventHub</h1></a>
		    <div class="auth-items">
				 <a href="/" class="registert"><h2>Home</h2></a>
		    </div>
		</div>
</header>
<main>
	<div class="container">
		<div class="row justify-content-center m-5">
			<div class="col-md-8">
				<div class="p-4 m-2 shadow">
					<h2 class="text-center mb-4">Login</h2>
					<p class="text-danger">${errorLogin}</p>
					<form action="/login2" method="POST">
						<div class="mb-3">
							<label>E-mail</label>
							<input type="email" class="form-control" name="email" >
						</div>
						<div class="mb-3">
							<label>Password</label>
							<input type="password" class="form-control" name="password" >
						</div>
						<input type="submit" class="registert mt-4" value="Login" >
					</form>
					<a href="/" class="d-block mt-3 text-center">Back to home</a>
				</div>
			</div>
		</div>
	</div>
</main>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register - EventHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/styles.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
</head>
<body class="body-custom">
<header>
		<div class="nav">
		    <a href="/"><h1 class="logo">EventHub</h1></a>
		    <div class="nav-items">
		        <h2>Create Event</h2>
		    </div>
		    <div class="auth-items">
		        <a href="/"><h2>Home</h2></a>
		    </div>
		</div>
</header>
<main>
    <div class="container">
        <div class="row justify-content-center m-5">
            <div class="col-md-8">
                <div class="box p-4 m-2">
                        <h2 class="text-center mb-4">Registro</h2>
                        <form:form action="/register" method="POST" modelAttribute="newUser">
                            <div class="mb-3">
                                <form:label class="inputLabel" path="firstName">Nombre:</form:label>
                                <form:input path="firstName" class="form-control" />
                                <form:errors path="firstName" class="text-danger" />
                            </div>
                            <div class="mb-3">
                                <form:label class="inputLabel" path="lastName">Apellido:</form:label>
                                <form:input path="lastName" class="form-control" />
                                <form:errors path="lastName" class="text-danger" />
                            </div>
                            <div class="mb-3">
                                <form:label class="inputLabel" path="email">E-mail:</form:label>
                                <form:input path="email" class="form-control" />
                                <form:errors path="email" class="text-danger" />
                            </div>
                            <div class="mb-3">
                                <form:label class="inputLabel" path="location">Ubicación:</form:label>
                                <form:input path="location" class="form-control" />
                                <form:errors path="location" class="text-danger" />
                            </div>
                            <div class="mb-3">
                                <form:label class="inputLabel" path="province">Provincia:</form:label>
                                <form:select path="province" class="form-control">
                                    <c:forEach items="${provinces}" var="province">
                                        <form:option value="${province}">${province}</form:option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="mb-3">
                                <form:label class="inputLabel" path="password">Contraseña:</form:label>
                                <form:password path="password" class="form-control" />
                                <form:errors path="password" class="text-danger" />
                            </div>
                            <div class="mb-3">
                                <form:label class="inputLabel" path="confirm">Confirmar Contraseña:</form:label>
                                <form:password path="confirm" class="form-control" />
                                <form:errors path="confirm" class="text-danger" />
                            </div>
                            <input type="submit" class="btn btn-custom mt-4" value="Registrarme">
                        </form:form>
                        <a href="/index" class="d-block mt-3 text-center">Back to home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>

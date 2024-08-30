<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css"> <!-- Enlace al archivo de estilos CSS -->
</head>
<body>
    <header class="bg-success text-white py-3 mb-4">
        <div class="container">
            <h1 class="display-4">Event Details</h1>
        </div>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="event-details">
                    <h2>${event.eventName}</h2>
                    <p><strong>Host:</strong> ${event.host.firstName}</p>
                    <p><strong>Date:</strong> ${event.eventDate}</p>
                    <p><strong>Location:</strong> ${event.eventLocation}</p>
                    <p><strong>People attending:</strong> ${event.joinedUsers.size()}</p>
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
            
            <div class="col-md-6">
                <div class="message-wall border rounded p-3">
                    <h3>Message Wall</h3>
                    <div class="messages mb-3">
                        <c:forEach items="${event.eventMessages}" var="msg">
                            <p><strong>${msg.author.firstName}:</strong> ${msg.content}</p>
                        </c:forEach>
                    </div>
                    
                    <form:form action="/create_message" method="post" modelAttribute="message">
                        <div class="mb-3">
                            <form:errors path="content" class="text-danger"/>
                            <form:label path="content" class="form-label">Add Comment</form:label>
                            <form:textarea path="content" class="form-control"></form:textarea>
                        </div>
                        <form:hidden path="author" value="${userInSession.id}"/>
                        <form:hidden path="event" value="${event.id}"/>
                        <input type="submit" value="Submit" class="btn btn-success">
                    </form:form>
                </div>
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

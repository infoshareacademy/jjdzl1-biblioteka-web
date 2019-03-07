<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="/./include/head.jsp" %>
</head>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
<body>
<%
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userCookie")) userName = cookie.getValue();
        }
    }
%>
<%@include file="/./include/appHeader.jsp" %>

<div class="addUserForm">
    <br/><br/>
    <h4>Dodaj książkę</h4>
    <br/>
    <form method="POST" action="AddBookServlet" class="addUser">

        <div>
            <div>
                <input type="text" class="form-control" name="title" placeholder="Tytuł książki">
            </div>
        </div>
        <br/>
        <div class="form-row">
            <div>
                <input type="text" class="form-control" name="lastName" placeholder="Nazwisko autora">
            </div>
            <div>&nbsp;</div>
            <div>
                <input type="text" class="form-control" name="firstName" placeholder="Imię autora">
            </div>
        </div>
        <br/>
        <div class="form-row">
            <div>
                <input type="text" class="form-control" name="isbn" placeholder="Numer ISBN">
            </div>
            <div>&nbsp;</div>
            <div>
                <input type="text" class="form-control" name="daterelease" placeholder="Rok wydania">
            </div>
        </div>
        <br/>
        <br/>
        <button type="submit" class="btn btn-primary">Dodaj książkę</button>
    </form>
</div>
<%@include file="/./include/footer.jsp" %>
</body>
</html>
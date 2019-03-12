<%@ page import="com.infoshare.validation.BookValidation" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="/./include/head.jsp" %>
</head>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
<body>
<div class="addUserForm">
    <%
        String userName = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userCookie")) userName = cookie.getValue();
            }
        }
        List<String> validationResult = BookValidation.validationResult;
    %>
    <%@include file="/./include/appHeader.jsp" %>

    <% if (BookValidation.validationResult.size() > 0) { %>
    <br/><br/><br/>
    <ul class="list-group" style="vertical-align: center">
        <%
            for (String s : validationResult) {
        %>
        <li>
            <%=s%>
        </li>
        <%}%>
    </ul>
    <%}%>
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
                <input type="number" class="form-control" name="isbn" placeholder="Numer ISBN (tylko cyfry)">
            </div>
            <div>&nbsp;</div>
            <div>
                <input type="number" class="form-control" name="daterelease"
                       placeholder="Rok wydania (tylko cyfry)">
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
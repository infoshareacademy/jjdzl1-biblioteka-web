<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">

<head>
    <%@include file="include/head.jsp" %>
</head>

<% if (session.getAttribute("user") == null) {%>

<header>
    <%@include file="include/header.jsp" %>
</header>

<meta http-equiv="refresh" content="2;url=index.jsp">
<% } else {%>

<header>
    <%@include file="include/appHeader.jsp" %>
</header>

<meta http-equiv="refresh" content="2;url=loginSuccess.jsp">
<%}%>

<div class="addUserForm">
    <br/><br/>
    <p class="font-weight-bold">
    <h1>Oops!</h1></p>
    <h3>Błąd 404</h3>
    <h5>Strony nie odnaleziono</h5>
    Za chwilę nastąpi przekierowanie na stronę główną.
</div>

<footer>
    <%@include file="include/footer.jsp" %>
</footer>

</body>
</html>
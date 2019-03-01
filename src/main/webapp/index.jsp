<%--
  Created by IntelliJ IDEA.
  User: lukaszbezlada
  Date: 17.02.19
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="include/head.jsp" %>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<% if (session.getAttribute("loginFalse") == "loginFalse") { %>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Błędna nazwa użytkownika lub hasło!</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%}%>
<% if (request.getSession().getAttribute("addUser") == "userAdded"){ %>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Twoje konto jest aktywne, możesz się zalogować</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%}
    request.getSession().removeAttribute("addUser");%>
<%@include file="include/header.jsp" %>
<div class="mainpage"></div>
<%@include file="include/footer.jsp" %>
</body>

</html>

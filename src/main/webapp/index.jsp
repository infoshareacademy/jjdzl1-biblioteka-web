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
    <link rel="stylesheet" href="main.css">
</head>
<body>
<% if (session.getAttribute("loginFalse") == "loginFalse"){ %>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Błędna nazwa użytkownika lub hasło!</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%}%>
<%@include file="include/header.jsp" %>
<%@include file="include/footer.jsp" %>

</body>

</html>

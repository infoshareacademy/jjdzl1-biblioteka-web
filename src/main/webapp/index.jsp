<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">

<head>
    <%@include file="include/head.jsp" %>
</head>

<header>
    <%@include file="include/header.jsp" %>
</header>

<body>
<% if (session.getAttribute("loginFalse") == "loginFalse") { %>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Błędna nazwa użytkownika lub hasło!</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        request.getSession().removeAttribute("loginFalse");
    }
%>
<% if (request.getSession().getAttribute("addUser") == "userAdded") { %>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Twoje konto jest aktywne, możesz się zalogować</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
    request.getSession().removeAttribute("addUser");
%>

<div class="mainpage"></div>

<footer>
    <%@include file="include/footer.jsp" %>
</footer>

</body>
</html>

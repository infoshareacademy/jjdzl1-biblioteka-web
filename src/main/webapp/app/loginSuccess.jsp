<%--
Created by IntelliJ IDEA.
User: lukasz
Date: 02.02.19
Time: 16:08
To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="/./include/head.jsp" %>
</head>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
<body>

<% if (request.getSession().getAttribute("addUser") == "userAdded") { %>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Dodano użytkownika do biblioteki</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
    request.getSession().removeAttribute("addUser");
%>

<% if (request.getSession().getAttribute("userEdited") == "userEdited") { %>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Edytowano dane użytkownika w bazie</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
    request.getSession().removeAttribute("userEdited");
%>

<% if (request.getSession().getAttribute("addBook") == "bookAdded") { %>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Dodano książkę do biblioteki</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
    request.getSession().removeAttribute("addBook");
%>
<%
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userCookie")) userName = cookie.getValue();
        }
    }
%>
<% if (session.getAttribute("normalUser") == null) {%>
<%@include file="/./include/appHeader.jsp" %>
<% } else { %>
<%@include file="/./include/appUserHeader.jsp" %>
<%}%>
<div class="mainpage"></div>
<%@include file="/./include/footer.jsp" %>

</body>

</html>
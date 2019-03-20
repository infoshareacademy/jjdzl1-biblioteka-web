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
<%
    String selectedUser = request.getParameter("selectedUser");

    if (selectedUser != null && !selectedUser.isEmpty() && selectedUser.equals("remove")) {
        session.removeAttribute("selectedUser");
    }
%>
<header>
    <%@include file="/./include/appHeader.jsp" %>
</header>

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
<div class="mainpage"></div>

<footer>
    <%@include file="/./include/footer.jsp" %>
</footer>

</body>
</html>
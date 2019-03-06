<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="include/head.jsp" %>
</head>
<% if (session.getAttribute("user") == null){%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<body>
<%@include file="include/header.jsp" %>
<meta http-equiv="refresh" content="2;url=index.jsp">
<% } else {%>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
<body>
<meta http-equiv="refresh" content="2;url=loginSuccess.jsp"> <%}%>
<div class="addUserForm">
    <br/><br/>
    <h2>Błąd 404</h2>
    <h5>Strony nie odnaleziono</h5>
Za chwilę nastąpi przekierowanie na stronę główną.
</div>
<%@include file="include/footer.jsp" %>
</body>
</html>
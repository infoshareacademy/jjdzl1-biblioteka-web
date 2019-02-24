<%--
  Created by IntelliJ IDEA.
  User: arek
  Date: 24.02.19
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="/./include/head.jsp" %>
</head>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../main.css">
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

<h2>Dodanie nowego użytkownika</h2>
<form method="POST" action="AddUserServlet">
    <table>
        <tr><td>Login: <td><input type="text" name="login"/></td></tr>
        <tr><td>Hasło: </td><td><input type="password" name="password1"/></td></tr>
        <tr><td>Powtórz hasło: </td><td><input type="password" name="password2"/></td></tr>
        <tr><td>Imię: </td><td><input type="text" name="firstName"/></td></tr>
        <tr><td>Nazwisko: </td><td><input type="text" name="lastName"/></td></tr>
        <tr><td>E-mail: </td><td><input type="email" name="e-mail"/></td></tr>
        <tr><td>Admistrator:</td><td> <input type="checkbox" id="name" name="admin"/></td></tr>
        <tr><td>Konto ważne do:</td><td> <input type="date"  name="validTo"/></td></tr>
        <tr><td></td><td><input type="submit" name="save" value="save"/></td></tr>
    </table>
</form>

</body>
</html>
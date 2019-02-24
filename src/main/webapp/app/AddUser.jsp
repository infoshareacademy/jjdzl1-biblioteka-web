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

<div id="adduser">
<form>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputLogin">Login</label>
            <input type="text" class="form-control" id="inputLogin" placeholder="Login">
        </div>
        <div class="form-group col-md-6">
            <label for="inputPassword">Hasło</label>
            <input type="password" class="form-control" id="inputPassword" placeholder="Hasło">
        </div>
    </div>
    <div class="form-group">
        <label for="inputAddress">Address</label>
        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
    </div>
    <div class="form-group">
        <label for="inputAddress2">Address 2</label>
        <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputCity">City</label>
            <input type="text" class="form-control" id="inputCity">
        </div>
        <div class="form-group col-md-4">
            <label for="inputState">State</label>
            <select id="inputState" class="form-control">
                <option selected>Choose...</option>
                <option>...</option>
            </select>
        </div>
        <div class="form-group col-md-2">
            <label for="inputZip">Zip</label>
            <input type="text" class="form-control" id="inputZip">
        </div>
    </div>
    <div class="form-group">
        <div class="form-check">
            <input class="form-check-input" type="checkbox" id="gridCheck">
            <label class="form-check-label" for="gridCheck">
                Check me out
            </label>
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Sign in</button>
</form>
</div>






















<h1>Dodanie nowego użytkownika</h1>
<form method="post" action="">
    Login: <input type="text" name="login"/><br/><br/>
    Hasło: <input type="password" name="password1"/><br/><br/>
    Powtórz hasło: <input type="password" name="password2"/><br/><br/>
    Imię: <input type="text" name="firstName"/><br/><br/>
    Nazwisko: <input type="text" name="lastName"/><br/><br/>
    E-mail: <input type="email" name="e-mail"/><br/><br/>
    Admistrator: <input type="checkbox" name="czy_admin"/><br/><br/>
    Konto ważne do: <input type="date" name="validTo"/><br/><br/>
    <input type="submit" name="save" value="save"/><br/><br/>
</form>

</body>
</html>
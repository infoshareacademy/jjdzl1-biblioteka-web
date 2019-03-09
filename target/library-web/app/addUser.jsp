<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="/./include/head.jsp" %>
</head>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
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

<div class="addUserForm">
    <br/><br/>
    <h4>Utwórz nowego użytkownika</h4>
    <br/>
    <form method="POST" action="AddUserServlet" class="addUser">

        <div class="form-row">
            <div>
                <input type="text" class="form-control" name="login" placeholder="Login">
            </div>
            <div>&nbsp;</div>
            <div>
                <input type="email" class="form-control" name="e-mail" placeholder="Adres e-mail">
            </div>
        </div>
        <br/>
        <div class="form-row">
            <div>
                <input type="password" class="form-control" name="password1" placeholder="Hasło">
            </div>
            <div>&nbsp;</div>
            <div>
                <input type="password" class="form-control" name="password2" placeholder="Powtórz hasło">
            </div>
        </div>
        <br/>
        <div class="form-row">
            <div>
                <input type="text" class="form-control" name="firstName" placeholder="Imię">
            </div>
            <div>&nbsp;</div>
            <div>
                <input type="text" class="form-control" name="lastName" placeholder="Nazwisko">
            </div>
        </div>
        <br/>
        <div class="form-row">
            <div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="name" name="admin">
                    <label class="form-check-label" for="name">
                        Czy użytkownik ma posiadać uprawnienia pracownika?
                    </label>
                </div>
            </div>
        </div>
        <br/>
        <button type="submit" class="btn btn-primary">Utwórz użytkownika</button>
    </form>
</div>
<%@include file="/./include/footer.jsp" %>
</body>
</html>
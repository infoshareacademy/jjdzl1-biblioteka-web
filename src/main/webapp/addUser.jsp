<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">

<head>
    <%@include file="include/head.jsp" %>
</head>

<header>
    <%@include file="/include/header.jsp" %>
</header>

<body>


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
        <br/>
        <button type="submit" class="btn btn-primary">Utwórz użytkownika</button>
    </form>
</div>

<footer>
    <%@include file="include/footer.jsp" %>
</footer>

</body>
</html>
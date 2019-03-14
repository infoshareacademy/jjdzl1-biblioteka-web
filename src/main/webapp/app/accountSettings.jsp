<%@ page import="com.infoshare.repository.UsersRepositoryDaoBean" %>
<%@ page import="com.infoshare.domain.User" %>
<%@ page import="com.infoshare.repository.UsersRepositoryDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pl">

<head>
    <%@include file="/./include/head.jsp" %>
</head>

<header>
    <%@include file="/./include/appHeader.jsp" %>
</header>

<body>
<% UsersRepositoryDao user = new UsersRepositoryDaoBean();
    User userData = user.getUserByLogin(userName);%>
<article>
    <form method="POST" action="EditUserServlet" class="addUser">
        <div>
            <input type="text" class="form-control" name="login" placeholder="Login"
                   value="<%= userData.getLogin()%>">
        </div>
        <div>&nbsp;</div>
        <div>
            <input type="email" class="form-control" name="e-mail" placeholder="E-mail"
                   value="<%= userData.getEmail()%>">
        </div>

        <div>
            <input type="text" class="form-control" name="firstName" placeholder="Imię"
                   value="<%= userData.getFirstName()%>">
        </div>
        <div>&nbsp;</div>
        <div>
            <input type="text" class="form-control" name="lastName" placeholder="Nazwisko"
                   value="<%= userData.getLastName()%>">
        </div>
        <div>
            <input type="password" class="form-control" name="password1" placeholder="Hasło">
        </div>
        <div>&nbsp;</div>
        <div>
            <input type="password" class="form-control" name="password2" placeholder="Powtórz hasło">
        </div>
    </form>
</article>

<footer>
    <%@include file="/./include/footer.jsp" %>
</footer>

</body>
</html>

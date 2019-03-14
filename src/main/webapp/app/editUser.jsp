<%@ page import="com.infoshare.servlets.GetUserToEditServlet" %>
<%@ page import="com.infoshare.domain.UserStatus" %>
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
<article>
    <div class="addUserForm">
        <br/><br/><br/>
        <% int id = GetUserToEditServlet.user.getId(); %>
        <% String login = GetUserToEditServlet.user.getLogin(); %>
        <% String firstName = GetUserToEditServlet.user.getFirstName(); %>
        <% String lastName = GetUserToEditServlet.user.getLastName(); %>
        <% String email = GetUserToEditServlet.user.getEmail(); %>
        <% UserStatus admin = GetUserToEditServlet.user.getAdmin(); %>
        <% String status = GetUserToEditServlet.user.getStatus(); %>
        <h4>Edytuj użytkownika <%= firstName + " " + lastName%>
        </h4>
        <br/>
        <form method="POST" action="EditUserServlet" class="addUser">

            <div class="form-row">
                <div>
                    <input type="text" class="form-control" name="login" placeholder="Login: <%= login%>">
                </div>
                <div>&nbsp;</div>
                <div>
                    <input type="email" class="form-control" name="e-mail" placeholder="E-mail: <%= email%>">
                </div>
            </div>
            <br/>
            <div class="form-row">
                <div>
                    <input type="text" class="form-control" name="firstName" placeholder="Imię: <%= firstName%>">
                </div>
                <div>&nbsp;</div>
                <div>
                    <input type="text" class="form-control" name="lastName" placeholder="Nazwisko: <%= lastName%>">
                </div>
            </div>
            <br/>
            <div class="form-row">
                <select class="form-control" id="adminUser" name="adminUser">
                    <option selected>Wybierz rodzaj użytkownika</option>
                    <option value="1">Administrator</option>
                    <option value="2">Czytelnik</option>
                </select>
            </div>
            <br/>
            <div class="form-row">
                <select class="form-control" id="status" name="status">
                    <option selected>Wybierz status konta użytkownika</option>
                    <option value="1">Aktywny</option>
                    <option value="2">Nieaktywny</option>
                </select>
            </div>
            <br/><br/><br/>
            <button type="submit" class="btn btn-primary">Edytuj użytkownika</button>
        </form>
    </div>
</article>

<footer>
    <%@include file="/./include/footer.jsp" %>
</footer>

</body>
</html>
<%@ page import="com.infoshare.servlets.GetUserToEditServlet" %>
<%@ page import="com.infoshare.domain.UserStatus" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="/./include/head.jsp" %>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/main.css">
</head>
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
        <h4>Edytuj użytkownika <%= firstName + "," + lastName%></h4>
        <br/>
        <form method="POST" action="EditUserServlet" class="addUser">

            <div class="form-row">
                <div>
                    <input type="text" class="form-control" name="login" placeholder="<%= login%>">
                </div>
                <div>&nbsp;</div>
                <div>
                    <input type="email" class="form-control" name="e-mail" placeholder="<%= email%>">
                </div>
            </div>
            <br/>
            <div class="form-row">
                <div>
                    <input type="text" class="form-control" name="firstName" placeholder="<%= firstName%>">
                </div>
                <div>&nbsp;</div>
                <div>
                    <input type="text" class="form-control" name="lastName" placeholder="<%= lastName%>">
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
            <button type="submit" class="btn btn-primary">Edytuj użytkownika</button>
        </form>
    </div>
</article>
<%@include file="/./include/footer.jsp" %>
</body>
</html>
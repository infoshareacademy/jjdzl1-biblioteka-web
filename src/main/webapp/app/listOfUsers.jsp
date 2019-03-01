<%--
  Created by IntelliJ IDEA.
  User: lukasz
  Date: 27.02.19
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.infoshare.repository.UsersRepositoryDao" %>
<%@ page import="com.infoshare.repository.UsersRepositoryDaoBean" %>
<%@ page import="com.infoshare.domain.User" %>
<%@ page import="java.util.List" %>
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
    <div class="content">
        <div class="contentInside">
            <br/>
            <h4>Lista użytkowników</h4>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Login</th>
                    <th scope="col">Nazwisko, Imię</th>
                    <th scope="col">Email</th>
                    <th scope="col">Status</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int rowNumber = 1;
                    UsersRepositoryDao usersRepositoryDaoBean = new UsersRepositoryDaoBean();
                    List<User> listOfUsers = usersRepositoryDaoBean.listOfUsers();
                    for (User user : listOfUsers) {
                %>
                <tr>
                    <th scope="row"><%=rowNumber%>
                    </th>
                    <td><%= user.getLogin()%>
                    </td>
                    <td><%= user.getFirstName() + ", " + user.getLastName()%>
                    </td>
                    <td><%= user.getEmail()%>
                    </td>
                    <td><%= user.getStatus()%>
                </tr>
                <%
                        rowNumber++;
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</article>
</head>
<%@include file="/./include/footer.jsp" %>
</body>
</html>
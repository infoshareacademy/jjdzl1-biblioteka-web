<%@ page import="com.infoshare.repository.UsersRepositoryDao" %>
<%@ page import="com.infoshare.repository.UsersRepositoryDaoBean" %>
<%@ page import="com.infoshare.domain.User" %>
<%@ page import="java.util.List" %>
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
    <div class="content">
        <div class="contentInside">
            <br/>
            <h4>Kliknij użytkownika, którego chcesz edytować</h4>
            <table class="table">
                <thead>
                <tr class="listofitemps">
                    <th scope="col">#</th>
                    <th scope="col">Login</th>
                    <th scope="col">Nazwisko, Imię</th>
                    <th scope="col">Email</th>
                    <th scope="col">Administrator</th>
                    <th scope="col">Status</th>
                </tr>
                </thead>

                <tbody>
                <% UsersRepositoryDao usersRepository = new UsersRepositoryDaoBean();
                    List<User> listOfUsers = usersRepository.listOfUsers();
                    for (User user : listOfUsers) {
                %>

                <tr class="listofitemps" style="cursor:pointer" onclick="window.location='GetUserToEditServlet?userID=<%=user.getId()%>';" >
                    <th scope="row"><%=user.getId()%>
                    </th>
                    <td><%= user.getLogin()%>
                    </td>
                    <td><%= user.getFirstName() + ", " + user.getLastName()%>
                    </td>
                    <td><%= user.getEmail()%>
                    </td>
                    <td><%= user.getAdmin()%>
                    </td>
                    <td><%= user.getStatus()%>
                    </td>
                </tr>
                <%}%>
                </tbody>

            </table>
            <br/>
            <br/>

        </div>
    </div>
</article>

<footer>
<%@include file="/./include/footer.jsp" %>
</footer>

</body>
</html>
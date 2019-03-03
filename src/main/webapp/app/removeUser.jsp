<%--
  Created by IntelliJ IDEA.
  User: lukasz
  Date: 27.02.19
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="static com.infoshare.dao.DBCon.preparedStatement" %>
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
    <% try {
        String query = "SELECT * FROM users " + "ORDER by id";
        ResultSet rs = preparedStatement(query).executeQuery();
    %>
    <div class="content">
        <div class="contentInside">
            <br/>
            <h4>Zaznacz id użytkownika, któremu chcesz zmienić status konta</h4>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Login</th>
                    <th scope="col">Nazwisko, Imię</th>
                    <th scope="col">Email</th>
                    <th scope="col">Administrator</th>
                    <th scope="col">Status</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int rowNumber = 1;
                    int radioId = 1;
                    while (rs.next()) {
                        int userID = rs.getInt("id");
                        String login = rs.getString("login");
                        String firstName = rs.getString("firstName");
                        String lastName = rs.getString("lastName");
                        String email = rs.getString("email");
                        int kind = rs.getInt("admin");
                        String status = rs.getString("status");%>

                <tr>
                    <th scope="row">
                        <div class="custom-control custom-radio">
                            <input type="radio" id="customRadio<%= radioId%>" name="customRadio"
                                   class="custom-control-input">
                            <label class="custom-control-label" for="customRadio<%= radioId%>"><%=rowNumber%>
                            </label>
                        </div>
                    </th>
                    <td><%= login%>
                    </td>
                    <td><%= lastName + ", " + firstName%>
                    </td>
                    <td><%= email%>
                    </td>
                    <td><%= kind%>
                    </td>
                    <td><%= status%>
                    </td>
                </tr>
                <%
                            rowNumber++;
                            radioId++;
                        }
                        rs.close();
                    } catch (ClassNotFoundException | SQLException ex) {
                        System.err.println("Got an exception! ");
                        System.err.println(ex.getMessage());
                    }
                %>
                </tbody>
            </table>
            <br/>
            <br/>
            <div class=removeForm>
                <h4>Wpisz hasło administratora, aby dezaktywować zaznaczone konto</h4>

                <form method="POST" action="AddUserServlet" class="removeForm">
                    <div class="form-row">
                        <div>
                            <input type="password" class="form-control" name="password" placeholder="Hasło">
                        </div>
                        <br/>
                    </div>
                    <br/>
                    <button type="submit" class="btn btn-primary">Dezaktywuj użytkownika</button>
                </form>
            </div>

        </div>
    </div>
</article>
<%@include file="/./include/footer.jsp" %>


</body>
</html>
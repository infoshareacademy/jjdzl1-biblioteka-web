<%@ page import="java.sql.ResultSet" %>
<%@ page import="static com.infoshare.dao.DBCon.preparedStatement" %>
<%@ page import="java.sql.SQLException" %>
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
    <%
        String query = "SELECT * FROM users WHERE id=" + request.getParameter("userID");
        ResultSet rs = null;%>
    <div class="addUserForm">
        <br/><br/>
        <% try {
            rs = preparedStatement(query).executeQuery();
            int userID = rs.getInt("id");
            String login = rs.getString("login");
            String firstName = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            String email = rs.getString("email");
            int kind = rs.getInt("admin");
            String status = rs.getString("status");%>
        <h4>Edytuj użytkownika <%= firstName + "," + lastName%></h4>
        <br/>
        <form method="POST" action="AddUserServlet" class="addUser">

            <div class="form-row">
                <div>
                    <h5>Login użytkownika to <%= login%>
                    </h5>
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
        <%
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
    </div>

</article>
<%@include file="/./include/footer.jsp" %>
</body>
</html>
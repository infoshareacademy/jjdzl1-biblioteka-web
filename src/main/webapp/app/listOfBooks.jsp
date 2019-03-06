<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.infoshare.query.BooksQuery" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="../include/head.jsp" %>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/main.css">
</head>
<%
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userCookie")) userName = cookie.getValue();
        }
    }
%>

<%@include file="../include/appHeader.jsp" %>


<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<body>
<article>
    <%
        String title1 = request.getParameter("title");
        try {
            ResultSet rs = BooksQuery.findBookByTitle(title1);
    %>

    <div class="content">
        <div class="contentInside">
            <br/>
            <h4>Spis książek</h4>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tytuł</th>
                    <th scope="col">Autor</th>
                    <th scope="col">Nr ISBN</th>
                    <th scope="col">Rok wydania</th>
                    <th scope="col">Kategoria</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int rowNumber = 1;
                    while (rs.next()) {
                        int bookID = rs.getInt("bookID");
                        String title = rs.getString("title");
                        String firstName = rs.getString("firstName");
                        String lastName = rs.getString("lastName");
                        String isbn = rs.getString("isbn");
                        int dateRelease = rs.getInt("dateRelease");
                        int categoryID = rs.getInt("categoryID");
                        int bookscol = rs.getInt("bookscol");
                        String category = rs.getString("booksCat.name");%>

                <tr style="cursor:pointer" onclick="window.location='index.jsp';">
                    <th scope="row"><%=rowNumber%>
                    </th>
                    <td><%= title%>
                    </td>
                    <td><%= lastName + ", " + firstName%>
                    </td>
                    <td><%= isbn%>
                    </td>
                    <td><%= dateRelease%>
                    </td>
                    <td><%= category%>
                    </td>
                   </tr>
                <%
                            rowNumber++;
                        }
                        rs.close();
                    } catch (ClassNotFoundException | SQLException ex) {
                        System.err.println("Got an exception! ");
                        System.err.println(ex.getMessage());
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</article>
</head>
<%@include file="../include/footer.jsp" %>


</body>
</html>
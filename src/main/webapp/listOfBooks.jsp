<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="static com.infoshare.dao.DBCon.preparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: lukaszbezlada
  Date: 24.02.19
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<article>
    <% try {
        ResultSet rs = preparedStatement("SELECT * FROM books, authors WHERE authorID=id ORDER by title").executeQuery();

        while (rs.next()) {
            int bookID = rs.getInt("bookID");
            String title = rs.getString("title");
            String firstName = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            String isbn = rs.getString("isbn");
            int dareRelease = rs.getInt("dateRelease");
            int categoryID = rs.getInt("categoryID");
            int bookscol = rs.getInt("bookscol");%>

    <table>
        <tr>
            <td><%= title%>
            </td>
        </tr>
    </table>

    <%
                System.out.format("%s, %s, %s %s, %s, %s\n", bookID, title, firstName, lastName, isbn, dareRelease, categoryID, bookscol);
            }
            rs.close();
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("Got an exception! ");
            System.err.println(ex.getMessage());
        }
    %>

</article>

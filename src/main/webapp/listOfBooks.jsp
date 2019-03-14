<%@ page import="com.infoshare.repository.BooksRepositoryDao" %>
<%@ page import="com.infoshare.repository.BooksRepositoryDaoBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.infoshare.domain.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pl">

<head>
    <%@include file="include/head.jsp" %>
</head>

<header>
    <%@include file="include/header.jsp" %>
</header>

<body>
<%
    String order = request.getParameter("order");
    String bookTitle = request.getParameter("title");
    String orderTitle;
    if (order == null || order.isEmpty() || order.equals("title")) {
        orderTitle = " (wg tytułu)";
        order = "title";
    } else orderTitle = " (wg autora)";
%>
<article>
    <div class="content">
        <div class="contentInside">
            <br/>
            <h4>Spis książek<%=orderTitle%>
            </h4>
            <table class="table">
                <thead>
                <tr class="listofitemps">
                    <th scope="col">#</th>
                    <th scope="col">Tytuł</th>
                    <th scope="col">Autor</th>
                    <th scope="col">Nr ISBN</th>
                    <th scope="col">Rok wydania</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int rowNumber = 1;
                    BooksRepositoryDao booksRepository = new BooksRepositoryDaoBean();
                    List<Book> listOfBooks = booksRepository.bookList(bookTitle, order);
                    for (Book book : listOfBooks) {
                %>

                <tr class="listofitemps">
                    <th scope="row"><%=rowNumber%>
                    </th>
                    <td><%=book.getTitle()%>
                    </td>
                    <td><%=book.getAuthorLastName() + ", " + book.getAuthorFirstName()%>
                    </td>

                    <td><%=book.getIsbn()%>
                    </td>
                    <td><%=book.getRelaseDate()%>
                    </td>
                </tr>
                <%
                        rowNumber++;
                    }%>
                </tbody>
            </table>
        </div>
    </div>
</article>

<footer>
    <%@include file="include/footer.jsp" %>
</footer>

</body>
</html>
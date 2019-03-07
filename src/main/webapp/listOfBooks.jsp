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
<%@include file="include/header.jsp" %>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<body>
<%
    String order = request.getParameter("order");
    String bookTitle=request.getParameter("title");
    String orderTitle;
    if (order == null || order.isEmpty() || order.equals("title")) {
        orderTitle = " (wg tytułu)";
        order = "title";
    }else orderTitle=" (wg autora)";
%>
<article>
    <div class="content">
        <div class="contentInside">
            <br/>
            <h4>Spis książek<%=orderTitle%>
            </h4>
            <table class="table">
                <thead>
                <tr>
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

                <tr>
                    <th scope="row"><%=rowNumber%>
                    </th>
                    <td><%=book.getTitle()%>
                    </td>
                    <td><%=book.getAuthor()%>
                    </td>
                    <td><%=book.getRelaseDate()%>
                    </td>
                    <td><%=book.getIsbn()%>
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
</head>
<%@include file="include/footer.jsp" %>
</body>
</html>
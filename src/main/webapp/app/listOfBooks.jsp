<%@ page import="com.infoshare.repository.BooksRepositoryDao" %>
<%@ page import="com.infoshare.repository.BooksRepositoryDaoBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.infoshare.domain.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="../include/head.jsp" %>
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

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
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
                <tr class="listofbook">
                    <th scope="row"><a href="bookService.jsp?id="<%=book.getBookID()%>"><%=rowNumber%></a>
                    </th>
                    <td><a href="bookService.jsp?id=<%=book.getBookID()%>"><%=book.getTitle()%></a>
                    </td>
                    <td><a href="bookService.jsp?id=<%=book.getBookID()%>"><%=book.getAuthor()%></a>
                    </td>
                    <td><a href="bookService.jsp?id=<%=book.getBookID()%>"><%=book.getIsbn()%></a>
                    </td>
                    <td><a href="bookService.jsp?id=<%=book.getBookID()%>"><%=book.getRelaseDate()%></a>
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
<%@include file="../include/footer.jsp" %>
</body>
</html>
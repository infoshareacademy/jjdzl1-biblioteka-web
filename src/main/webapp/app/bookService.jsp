<%@ page import="com.infoshare.repository.BooksRepositoryDao" %>
<%@ page import="com.infoshare.repository.BooksRepositoryDaoBean" %>
<%@ page import="com.infoshare.domain.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pl">

<head>
    <%@include file="/./include/head.jsp" %>
</head>
<body>
<header>
    <%@include file="/./include/appHeader.jsp" %>
</header>


<div class="addUserForm">
    <%
        Integer id = Integer.parseInt(request.getParameter("id"));
        BooksRepositoryDao booksRepository = new BooksRepositoryDaoBean();
        Book book = booksRepository.getBookById(id);
    %>

    Tutaj bedzie mozna operawac na książce</br>
    wypozyczenia, rezerwacje, edycja, deaktywowanie
    </br>
    </br>
    </br>
    <h3><%=book.getTitle()%>
    </h3></br>
    <h4>Autor: <%=book.getAuthorLastName() + ", " + book.getAuthorFirstName()%>
    </h4></br>
    <h5>ISBN: <%=book.getIsbn()%>
    </h5></br>
    <h5>Rok wydania: <%=book.getRelaseDate()%>
    </h5></br>


</div>

<footer>
    <%@include file="/./include/footer.jsp" %>
</footer>

</body>
</html>
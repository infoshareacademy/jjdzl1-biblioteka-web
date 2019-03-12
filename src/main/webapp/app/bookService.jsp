<%@ page import="com.infoshare.repository.BooksRepositoryDao" %>
<%@ page import="com.infoshare.repository.BooksRepositoryDaoBean" %>
<%@ page import="com.infoshare.domain.Book" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="/./include/head.jsp" %>
</head>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
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

<div class="addUserForm">
    <%
        Integer id = Integer.parseInt(request.getParameter("id"));
        BooksRepositoryDao booksRepository = new BooksRepositoryDaoBean();
        Book book = booksRepository.bookById(id);
    %>

    Tutaj bedzie mozna operawac na książce</br>
    wypozyczenia, rezerwacje, edycja, deaktywowanie
    </br>
    </br>
    </br>
    <h3><%=book.getTitle()%></h3></br>
    <h4>Autor: <%=book.getAuthorLastName()+", "+book.getAuthorFirstName()%></h4></br>
    <h5>ISBN: <%=book.getIsbn()%></h5></br>
    <h5>Rok wydania: <%=book.getRelaseDate()%></h5></br>


</div>
<%@include file="/./include/footer.jsp" %>
</body>
</html>
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
    <br/><br/>

    <div class="container">

        <ul class="row">
            <li class="col-1"></li>
            <li class="col-lg-4">
                <img src="${pageContext.request.contextPath}/img/no_image_book.jpg" style=" max-width: 100%;
    max-height: 100%;"/>

            </li>
            <li class="col-6">
                <h4><%=book.getTitle()%>
                </h4></br>
                <h5>Autor:<i><%=book.getAuthorLastName() + ", " + book.getAuthorFirstName()%>
                </i>
                </h5></br>
                <h6>ISBN: <%=book.getIsbn()%> Rok wydania: <%=book.getRelaseDate()%>
                </h6></br>
                <br/>
                <span>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium
                    doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis
                    et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia
                    voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui
                    ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor
                    sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut
                    labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum
                    exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?
                    Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae
                    consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</span>
                <br/>
                <br/>
                <button class="btn btn-info" onclick="goBack()">&laquo; Powrót do poprzedniej strony</button>

            </li>
            <li class="col-1"></li>
        </ul>
    </div>

    <footer>
        <%@include file="/./include/footer.jsp" %>
    </footer>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
<%@ page import="com.infoshare.repository.BasketRepositoryDaoBean" %>
<%@ page import="com.infoshare.domain.Basket" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pl">

<head>
    <%@include file="../include/head.jsp" %>
</head>

<header>
    <%@include file="../include/appHeader.jsp" %>
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
            <h4>Koszyk bieżących operacji
            </h4>
            <table class="table">
                <thead>
                <tr class="listofitemps">
                    <th scope="col">#</th>
                    <th scope="col">Tytuł</th>
                    <th scope="col">Autor</th>
                    <th scope="col">uztkownik</th>
                    <th scope="col">operacja</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int rowNumber = 1;
                    BasketRepositoryDaoBean basketRepositoryDaoBean = new BasketRepositoryDaoBean();
                    List<Basket> basketList = basketRepositoryDaoBean.basketList();
                    for (Basket basket : basketList) {
                %>
                <tr class="listofitemps">
                    <th scope="row"><%=rowNumber%>
                    </th>
                    <td><%=basket.getUser().getLastName().toString() + ", " + basket.getUser().getFirstName().toString()%>
                    </td>
                    <td><%=basket.getBook().getTitle() + ", " + basket.getBook().getAuthorLastName()%>
                    </td>
                    <td><%=basket.getOperationType()%>
                    </td>

                            <%}%>
                </tr>
                </tbody>
            </table>
            <br/><br/><br/>
        </div>
    </div>
</article>

<footer>
    <%@include file="../include/footer.jsp" %>
</footer>

</body>
</html>
<%@ page import="com.infoshare.repository.BasketRepositoryDaoBean" %>
<%@ page import="com.infoshare.domain.Basket" %>
<%@ page import="java.util.List" %>
<%@ page import="com.infoshare.repository.BasketRepositoryDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pl">

<head>
    <%@include file="../include/head.jsp" %>
</head>
<body>
<header>
    <%@include file="../include/appHeader.jsp" %>
</header>


<%
    String order = request.getParameter("order");
    String bookTitle = request.getParameter("title");
    String orderTitle;
    if (order == null || order.isEmpty() || order.equals("title")) {
        orderTitle = " (wg tytułu)";
        order = "title";
    } else orderTitle = " (wg autora)";
    BasketRepositoryDao basketRepositoryDaoBean = new BasketRepositoryDaoBean();
    List<Basket> basketList = basketRepositoryDaoBean.basketList();

%>
<article>
    <div class="content">
        <div class="contentInside">
            <br/>
            <%
                if (session.getAttribute("selectedUser") != null) {
                    User user = (User) session.getAttribute("selectedUser");
            %>

            <div class="d-flex">
                <div class="mr-auto p-2 align-items-start"><h4>Koszyk bieżących
                    operacji: <%=user.getLastName() + ", " + user.getFirstName()%>
                </h4>
                </div>
                <div class="p2 align-items-end">
                    <form method="POST" action="SaveBasketServlet" class="addUser">
                        <input type="hidden" name="operationType" value="reservation"/>
                        <button type="submit" class="btn btn-success">Akceptuj operacje</button>
                    </form>
                </div>
                <div class="p2 align-items-end">
                    &nbsp;&nbsp;
                </div>
                <div class="p2 align-items-end">
                    <form method="GET" action="OperationCancelServlet" class="addUser">
                        <input type="hidden" name="selectedUser" value="remove"/>
                        <button type="submit" class="btn btn-secondary">Anuluj</button>
                    </form>
                </div>
            </div>
            <%}%>
            <table class="table">
                <thead>
                <tr class="listofitemps">
                    <th scope="col">#</th>
                    <th scope="col">Tytuł</th>
                    <th scope="col">Autor</th>
                    <th scope="col">Operacja</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int rowNumber = 1;
                    for (Basket basket : basketList) {
                %>
                <tr class="listofitemps">
                    <th scope="row"><%=rowNumber%>
                    </th>
                    <td><%=basket.getBook().getTitle() %>
                    </td>
                    <td><%=basket.getBook().getAuthorLastName() + ", " + basket.getBook().getAuthorFirstName()%>
                    </td>
                    <td><%=basket.getOperationType()%>
                    </td>
                    <%
                            rowNumber++;
                        }
                    %>
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
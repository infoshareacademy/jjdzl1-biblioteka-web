<%@ page import="com.infoshare.repository.OperationsRepositoryDao" %>
<%@ page import="com.infoshare.repository.OperationsRepositoryDaoBeen" %>
<%@ page import="com.infoshare.domain.Operation" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
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
<article>
    <div class="content">
        <div class="contentInside">
            <br/>
            <table class="table">
                <thead>
                <tr class="listofitemps">
                    <th scope="col">#</th>
                    <th scope="col">Użytkownik</th>
                    <th scope="col">Tytuł książki</th>
                    <th scope="col">Data operacji</th>
                    <th scope="col">Data wypożyczenia</th>
                    <th scope="col">Data zwrotu</th>
                    <th scope="col">Typ operacji</th>
                </tr>
                </thead>
                <tbody>
                <%
                    String operationType = request.getParameter("operationType");
                    if (operationType == null || operationType.isEmpty()) operationType = "all";
                    int rowNumber = 1;
                    OperationsRepositoryDao operationsRepository = new OperationsRepositoryDaoBeen();
                    List<Operation> operationList = operationsRepository.AllOperationList(operationType);
                    for (Operation operation : operationList) {
                %>
                <tr class="listofitemps">
                    <th scope="row"><%=rowNumber%>
                    </th>
                    <td><%=operation.getUserName()%>
                    </td>
                    <td><%=operation.getBookTitle()%><br/><%=operation.getAuthor()%>
                    </td>
                    <td><%=operation.getOperationDate()%>
                    </td>
                    <td><%=operation.getStartDate()%>
                    </td>
                    <td>
                        <%if (operation.getEndDate().equals(LocalDate.of(1970, 01, 01))) {%>
                        ---
                        <%} else {%>
                        <%=operation.getEndDate()%>
                        <%}%>
                    </td>
                    <td><%=operation.getOperationType()%>
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
    <%@include file="../include/footer.jsp" %>
</footer>

</body>
</html>
<%@ page import="com.infoshare.repository.UsersRepositoryDao" %>
<%@ page import="com.infoshare.repository.UsersRepositoryDaoBean" %>
<%@ page import="com.infoshare.domain.User" %>
<%@ page import="java.util.List" %>
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
<%
    String operation = request.getParameter("operation");
    String findUserByName = request.getParameter("findUserByName");
    if (session.getAttribute("normalUser") == null) {
%>

<article>
    <div class="content">
        <div class="contentInside">
            <br/>

            <div class="d-flex">

                <div class="mr-auto p-2 align-items-start">
                    <% if (operation != null && !operation.isEmpty() && operation.equals("newoperation")) {%>
                    <h4> Nowa operacja: wybierz użytkownika</h4>
                    <%} else {%>
                    <h4>Kliknij użytkownika, którego chcesz edytować</h4>
                    <%}%>
                </div>

                <div class="p2 align-items-end ">

                    <form action="FindUserServlet" class="form-inline" method="get">
                        <div class="form-row align-items-center">
                            <div class="col-auto inline-block">
                                <input type="text" name="findUserByName" class="form-control" id="inlineFormInput1"
                                       placeholder="Wpisz nazwisko użytkownika">

                                <%if (operation != null && !operation.isEmpty() && operation.equals("newoperation")) {%>
                                <input type="hidden" name="operation" value="newoperation">
                                <%}%>

                                <button type="submit" class="btn btn-outline-info">Znajdź</button>
                            </div>
                        </div>
                    </form>

                </div>

            </div>


            <table class="table table-bordered table-hover">
                <thead>
                <tr class="listofitemps">
                    <th scope="col">#</th>
                    <th scope="col"> Login</th>
                    <th scope="col"> Imię, Nazwisko</th>
                    <th scope="col"> Email</th>
                    <th scope="col"> Administrator</th>
                    <th scope="col"> Status</th>
                    <%if (operation != null && !operation.isEmpty()) {%>
                    <th scope="col">Działanie</th>
                    <%}%>

                </tr>
                </thead>

                <tbody>
                <% UsersRepositoryDao usersRepository = new UsersRepositoryDaoBean();
                    List<User> listOfUsers = usersRepository.listOfUsers(findUserByName);
                    int rowNumber = 1;
                    for (User user : listOfUsers) {
                %>

                <tr class="listofitemps" style="cursor:pointer"
                    onclick="window.location='GetUserToEditServlet?userID=<%=user.getId()%>';">
                    <th scope="row"><%=rowNumber%>
                    </th>
                    <td><%= user.getLogin()%>
                    </td>
                    <td><%=  user.getLastName() + ", " + user.getFirstName()%>
                    </td>
                    <td><%= user.getEmail()%>
                    </td>
                    <td><%= user.getAdmin()%>
                    </td>
                    <td><%= user.getStatus()%>
                    </td>

                    <%if (operation != null && !operation.isEmpty() && operation.equals("newoperation")) {%>
                    <td>
                        <form method="GET" action="SelectUserServlet" class="addUser">
                            <input type="hidden" name="userid" value="<%=user.getId()%>"/>
                            <button type="submit" class="btn btn-secondary btn-sm">Wybierz</button>
                        </form>
                    </td>
                    <%}%>
                </tr>
                <% rowNumber++;
                }%>
                </tbody>

            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-end">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Wcześniejsza</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Następna</a>
                    </li>
                </ul>
            </nav>
            <br/><br/><br/>
        </div>
    </div>
</article>
<%}%>
<footer>
    <%@include file="/./include/footer.jsp" %>
</footer>

</body>
</html>
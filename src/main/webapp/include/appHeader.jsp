<%@ page import="com.infoshare.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userCookie")) userName = cookie.getValue();
        }
    }
    String nameOfUser = (String) session.getAttribute("nameOfUser");
%>
<nav class="navbar navbar-default ">
</nav>
<nav class="navbar navbar-dark bg navbar-expand-lg fixed-top">

    <a class="navbar-brand" href="loginSuccess.jsp"><img src="${pageContext.request.contextPath}/img/logo.png"
                                                         width="30" height="30"
                                                         class="d-inline-block mr-1 align-bottom" alt=""> Biblioteka</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
            aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="mainmenu">

        <ul class="navbar-nav mr-auto">

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                   aria-expanded="false" id="submenu1" aria-haspopup="true"> Książki </a>

                <div class="dropdown-menu" aria-labelledby="submenu">

                    <a class="dropdown-item" href="listOfBooks.jsp?order=title"> Przeglądaj wg tytułów </a>
                    <a class="dropdown-item" href="listOfBooks.jsp?order=authorLastName"> Przeglądaj wg autorów </a>
                    <% if (session.getAttribute("normalUser") == null) {%>
                    <a class="dropdown-item"> --- </a>
                    <a class="dropdown-item" href="addBook.jsp"> Dodaj książkę </a>
                    <a class="dropdown-item" href="#"> Edytuj książkę </a>
                    <%}%>
                </div>

            </li>

            <% if (session.getAttribute("normalUser") == null) {%>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                   aria-expanded="false" id="submenu" aria-haspopup="true"> Użytkownicy </a>
                <div class="dropdown-menu" aria-labelledby="submenu">
                    <a class="dropdown-item" href="addUser.jsp"> Dodaj użytkownika </a>
                    <% if (session.getAttribute("selectedUser") != null) {
                        User user = (User) session.getAttribute("selectedUser");
                    %>
                    <a class="dropdown-item" href="listOfUsers.jsp"> Lista użytkowników </a>
                    <%} else {%>
                    <a class="dropdown-item" href="listOfUsers.jsp"> Edytuj użytkownika </a>
                    <%}%>
                </div>
            </li>
            <%}%>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                   aria-expanded="false" id="submenu2" aria-haspopup="true"> Operacje </a>

                <div class="dropdown-menu" aria-labelledby="submenu">
                    <% if (session.getAttribute("normalUser") == null) {%>
                    <a class="dropdown-item" href="listOfUsers.jsp?operation=newoperation"> Nowa operacja </a>
                    <a class="dropdown-item"> --- </a>
                    <a class="dropdown-item" href="listOfOperations.jsp?operationType=reservation"> Rezerwacje </a>
                    <a class="dropdown-item" href="listOfOperations.jsp?operationType=borrow"> Wypożyczenia </a>
                    <a class="dropdown-item" href="listOfOperations.jsp?operationType=all"> Wszystkie operacje </a>
                    <% } else { %>
                    <a class="dropdown-item" href="#"> Moje rezerwacje </a>
                    <a class="dropdown-item" href="#"> Moje wypożyczenia </a>
                    <a class="dropdown-item" href="@"> Wszystkie operacje </a>
                    <%}%>
                </div>
            </li>
            <li>&nbsp;&nbsp;&nbsp;</li>
            <li>
                <form action="FindBookServlet" class="form-inline" method="get">
                    <div class="form-row align-items-center">
                        <div class="col-auto">
                            <input type="text" name="title" class="form-control" id="inlineFormInput"
                                   placeholder="Wpisz tytuł książki">
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-info">Znajdź</button>
                        </div>
                    </div>
                </form>
            </li>

            <% if (session.getAttribute("selectedUser") != null) {
                User user = (User) session.getAttribute("selectedUser");
            %>
            <li>&nbsp;&nbsp;&nbsp;</li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                   aria-expanded="false" aria-haspopup="true">
                    Wybrano: <%=user.getFirstName() + ", " + user.getLastName()%>
                </a>
                <div class="dropdown-menu" aria-labelledby="submenu">
                    <a class="dropdown-item" href="#"> Koszyk operacji </a>
                    <a class="dropdown-item" href="loginSuccess.jsp?selectedUser=remove"> Anuluj bieżące operacje </a>
                    <a class="dropdown-item"> --- </a>
                    <a class="dropdown-item" href="@"> Historia rezerwacji </a>
                    <a class="dropdown-item" href="@"> Historia wypożyczeń </a>
                </div>
                <%--

                            <a href="#" class="nav-link"> Wybrano: <%=user.getFirstName() + ", " + user.getLastName()%>
            --%>
                </a>
            </li>
            <%}%>
        </ul>

        <ul class="navbar-nav mr-right">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                   aria-expanded="false" id="submenu4" aria-haspopup="true">Witaj <%=nameOfUser%>
                </a>

                <div class="dropdown-menu" aria-labelledby="submenu3">

                    <a class="dropdown-item" href="accountSettings.jsp"> Ustawienia konta </a>
                    <a class="dropdown-item" href="#"> Powiadomienia </a>

                </div>

            </li>
        </ul>

        <form action="LogoutServlet" method="post">
            <button class="btn btn-primary" type="submit">Wyloguj</button>
        </form>

    </div>

</nav>

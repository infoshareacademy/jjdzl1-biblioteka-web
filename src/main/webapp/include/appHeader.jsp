<%--
  Created by IntelliJ IDEA.
  User: lukasz
  Date: 20.02.19
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header>

    <nav class="navbar navbar-dark bg navbar-expand-lg">

        <a class="navbar-brand" href="loginSuccess.jsp"><img src="../img/logo.png" width="30" height="30"
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
                        <a class="dropdown-item"> --- </a>
                        <a class="dropdown-item" href="addBook.jsp"> Dodaj książkę </a>
                        <a class="dropdown-item" href="#"> Edytuj książkę </a>
                    </div>

                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                       aria-expanded="false" id="submenu" aria-haspopup="true"> Użytkownicy </a>

                    <div class="dropdown-menu" aria-labelledby="submenu">

                        <a class="dropdown-item" href="addUser.jsp"> Dodaj użytkownika </a>
                        <a class="dropdown-item" href="listOfUsers.jsp"> Edytuj użytkownika </a>

                    </div>

                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                       aria-expanded="false" id="submenu2" aria-haspopup="true"> Rezerwacje / Wypożyczenia </a>

                    <div class="dropdown-menu" aria-labelledby="submenu">

                        <a class="dropdown-item" href="#"> Nowa rezerwacja </a>
                        <a class="dropdown-item" href="#"> Nowe wypożyczenie </a>
                        <a class="dropdown-item"> --- </a>
                        <a class="dropdown-item" href="listOfOperations.jsp"> Lista rezerwacja </a>
                        <a class="dropdown-item" href="listOfOperations.jsp"> Lista wypożyczeń </a>

                    </div>
                </li>
                <li>&nbsp;&nbsp;&nbsp;</li>
                <li>
                    <form action="FindBookServlet" class="form-inline" method="get">
                        <div class="form-row align-items-center">
                            <div class="col-auto">
                                <%--
                                                                <label class="sr-only" for="inlineFormInput">Name</label>
                                --%>
                                <input type="text" name="title" class="form-control" id="inlineFormInput"
                                       placeholder="Wpisz tytuł książki">
                            </div>
                            <div class="col-auto">
                                <button type="submit" class="btn btn-info">Znajdź</button>
                            </div>
                        </div>
                    </form>
                </li>
            </ul>

            <ul class="navbar-nav mr-right">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                       aria-expanded="false" id="submenu4" aria-haspopup="true">Witaj <%=userName%>
                    </a>

                    <div class="dropdown-menu" aria-labelledby="submenu3">

                        <a class="dropdown-item" href="#"> Ustawienia konta </a>
                        <a class="dropdown-item" href="#"> Powiadomienia </a>

                    </div>

                </li>
            </ul>

            <form action="LogoutServlet" method="post">
                <button class="btn btn-primary" type="submit">Wyloguj</button>
            </form>

        </div>

    </nav>
</header>

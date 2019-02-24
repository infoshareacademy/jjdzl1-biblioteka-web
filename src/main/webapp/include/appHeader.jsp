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

        <a class="navbar-brand" href="#"><img src="../img/logo.png" width="30" height="30"
                                              class="d-inline-block mr-1 align-bottom" alt=""> Biblioteka</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainmenu">

            <ul class="navbar-nav mr-auto">

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                       aria-expanded="false" id="submenu" aria-haspopup="true"> Przeglądaj książki </a>

                    <div class="dropdown-menu" aria-labelledby="submenu">

                        <a class="dropdown-item" href="#"> Sortuj wg tytułów </a>
                        <a class="dropdown-item" href="#"> Sortuj wg autorów </a>

                    </div>

                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link" href="AddUser.jsp" role="button"
                       aria-expanded="false" id="submenu2" aria-haspopup="true"> Dodaj użytkownika </a>

                </li>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link" href="#" role="button"
                       aria-expanded="false" id="submenu2" aria-haspopup="true"> Dodaj książkę </a>

                </li>

            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                       aria-expanded="false" id="submenu3" aria-haspopup="true"> Witaj <%=userName%>
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

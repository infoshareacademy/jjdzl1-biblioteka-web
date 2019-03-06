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
                       aria-expanded="false" id="submenu1" aria-haspopup="true"> Przeglądaj książki </a>

                    <div class="dropdown-menu" aria-labelledby="submenu">

                        <a class="dropdown-item" href="#"> Sortuj wg tytułów </a>
                        <a class="dropdown-item" href="#"> Sortuj wg autorów </a>

                    </div>

                </li>

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
                       aria-expanded="false" id="submenu4" aria-haspopup="true"> Witaj <%=userName%>
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

<%--
  Created by IntelliJ IDEA.
  User: lukaszbezlada
  Date: 17.02.19
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header>
    <nav class="navbar navbar-dark bg navbar-expand-lg">
        <a class="navbar-brand" href="index.jsp"><img src="img/logo.png" width="30" height="30"
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
                        <a class="dropdown-item" href="listOfBooks.jsp?order=title"> Przeglądaj wg tytułu </a>
                        <a class="dropdown-item" href="listOfBooks.jsp?order=authorLastName"> Przeglądaj wg autora </a>


                    </div>

                </li>

            </ul>

            <form action="LoginServlet" class="form-inline" method="post">

                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="aboutUs.jsp"> O nas </a>
                    <li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </li>
                </ul>

                <input class="form-control mr-1" type="user" placeholder="Użytkownik" aria-label="Użytkownik"
                       name="user">
                <input class="form-control mr-1" type="password" placeholder="Hasło" aria-label="Hasło" name="pwd">
                <button class="btn btn-primary" type="submit">Zaloguj</button>

                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="addUser.jsp">Nie masz konta</br>załóż je tutaj</a>
                    </li>
                </ul>
            </form>

        </div>

    </nav>
</header>
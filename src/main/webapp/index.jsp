<%@ page contentType="text/html;charset=UTF-8" language="html" %>
<!DOCTYPE html>
<html lang="pl">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Biblioteka online</title>
    <meta name="description" content="Biblioteka online">
    <meta name="keywords" content="książki, magazyny, czasopisma">
    <meta name="author" content="Biblioteke Team">
    <meta http-equiv="X-Ua-Compatible" content="IE=edge">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="main.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&amp;subset=latin-ext" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <![endif]-->

</head>

<body>

<header>

    <nav class="navbar navbar-dark bg navbar-expand-lg">

        <a class="navbar-brand" href="#"><img src="img/logo.png" width="30" height="30" class="d-inline-block mr-1 align-bottom" alt=""> Biblioteka</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu" aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainmenu">

            <ul class="navbar-nav mr-auto">


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-expanded="false" id="submenu" aria-haspopup="true"> Przeglądaj książki </a>

                    <div class="dropdown-menu" aria-labelledby="submenu">

                        <a class="dropdown-item" href="#"> Sortuj wg tytułów </a>
                        <a class="dropdown-item" href="#"> Sortuj wg autorów </a>

                    </div>

                </li>

            </ul>

            <form action="LoginServlet" class="form-inline" method="post">

                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#"> Pomoc </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"> Kontakt </a>
                    <li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </li>

                </ul>

                <input class="form-control mr-1" type="user" placeholder="Użytkownik" aria-label="Użytkownik" name="user">
                <input class="form-control mr-1" type="password" placeholder="Hasło" aria-label="Hasło" name="pwd">
                <button class="btn btn-primary" type="submit">Zaloguj</button>
                <ul class="add_account">

                    <li>Nie masz konta </br>załóż je
                        <a href="#"> tutaj </a></li>
                </ul>
            </form>

        </div>

    </nav>
</header>

<main>
    <div class="footer">Copyright 2019 infoShare Academy. Wszelkie prawa zastrzeżone.
        Biblioteka created by Biblioteka Team.</div>
    </div>

</main>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

<script src="js/bootstrap.min.js"></script>

</body>
</html>
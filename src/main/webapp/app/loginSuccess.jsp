<%--
Created by IntelliJ IDEA.
User: lukasz
Date: 02.02.19
Time: 16:08
To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="/./include/head.jsp" %>
</head>
<%
    String selectedUser = request.getParameter("selectedUser");

    if (selectedUser != null && !selectedUser.isEmpty() && selectedUser.equals("remove")) {
        session.removeAttribute("selectedUser");
    }
%>
<body>
<header>
    <%@include file="/./include/appHeader.jsp" %>
</header>



<% if (request.getSession().getAttribute("addUser") == "userAdded") { %>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Dodano użytkownika do biblioteki</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
    request.getSession().removeAttribute("addUser");
%>

<% if (request.getSession().getAttribute("userEdited") == "userEdited") { %>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Edytowano dane użytkownika w bazie</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
    request.getSession().removeAttribute("userEdited");
%>

<% if (request.getSession().getAttribute("addBook") == "bookAdded") { %>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Dodano książkę do biblioteki</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
    request.getSession().removeAttribute("addBook");
%>

<% if (request.getSession().getAttribute("opertationSuccess") == "success") { %>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Operacja została zapisana</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
    request.getSession().removeAttribute("opertationSuccess");
%>

<div class="mainpage">
    <div class="row">
        <div class="col-lg-6">
            <div style="margin-top:70px;margin-right: 50px; margin-left: 70px;text-align: left">
                <h4>Statystyki biblioteki</h4>
                <table class="table table-borderless">
                    <thead class="listofitemps">
                    <tr>
                        <td>Ilość książek w bibliotece:</td>
                        <td>15</td>
                    </tr>
                    <tr>
                        <td>Ilość aktywnych użytkowników:</td>
                        <td>20</td>
                        <td>Ilość zablokowanych użytkowników:</td>
                        <td>10</td>
                    </tr>
                    </thead>
                </table>

                <h4>Statystyki wypożyczeń</h4>
                <table class="table table-borderless">
                    <thead class="listofitemps">
                    <tr>
                        <td>Aktualnie wypożyczonych:</td>
                        <td>5</td>
                        <td>Ilość rezerwacji:</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td>Przeterminowanych wypożyczeń:</td>
                        <td>10</td>
                    </tr>

                    </thead>
                </table>


            </div>


        </div>
        <div class="col-lg-4">
        </div>
    </div>


</div>

<footer>
    <%@include file="/./include/footer.jsp" %>
</footer>

</body>
</html>
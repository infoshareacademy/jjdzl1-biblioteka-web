<%--
  Created by IntelliJ IDEA.
  User: lukasz
  Date: 04.03.19
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class=removeForm>
    <h4>Wpisz hasło administratora, aby dezaktywować zaznaczone konto</h4>

    <form method="POST" action="AddUserServlet" class="removeForm">
        <div class="form-row">
            <div>
                <input type="password" class="form-control" name="password" placeholder="Hasło">
            </div>
            <br/>
        </div>
        <br/>
        <button type="submit" class="btn btn-primary">Dezaktywuj użytkownika</button>
    </form>
</div>
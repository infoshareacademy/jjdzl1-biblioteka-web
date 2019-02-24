package com.infoshare.servlets;

import com.infoshare.bd.DBCon;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        String password2 = req.getParameter("password2");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("e-mail");
        String checkAdmin = req.getParameter("czy_admin");
        //int checkAdmin1 = Integer.parseInt(checkAdmin);
        String validTo = req.getParameter("validTo");

        String query = "INSERT INTO users (firstName, lastName, e-mail, czy_admin) VALUES (firstName, lastName, email)";
        try {
            DBCon.preparedStatement(query);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        resp.sendRedirect("LoginSuccess.jsp");
    }
}

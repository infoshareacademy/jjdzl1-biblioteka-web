package com.infoshare.servlets;

import com.infoshare.dao.DBCon;
import com.infoshare.utils.Hasher;
import com.infoshare.utils.PBKDF2Hasher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        String password2 = req.getParameter("password2");
        Hasher hasher = new PBKDF2Hasher();
        String hashedPass = hasher.hash(password2);
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("e-mail");
        String checkAdmin = req.getParameter("czy_admin");
        //int checkAdmin1 = Integer.parseInt(checkAdmin);
        String validTo = req.getParameter("validTo");
        int id = 6;

        String query = "INSERT INTO users (login, password, firstName, lastName, email) " +
                "VALUES (?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = DBCon.preparedStatement(query);
            //ps.setInt(1, id);
            ps.setString(1, login);
            ps.setString(2, hashedPass);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, email);
            ps.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        resp.sendRedirect("LoginSuccess.jsp");
        HttpSession session = req.getSession();
        session.setAttribute("addUser", "addUser");
        session.setMaxInactiveInterval(1);
    }
}

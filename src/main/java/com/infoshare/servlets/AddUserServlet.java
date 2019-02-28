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
        String[] admin = req.getParameterValues("admin");
        Boolean checkAdmin = admin != null ? admin[0].equals("on"):  false;

        String query = "INSERT INTO users (login, password, firstName, lastName, email, admin) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = DBCon.preparedStatement(query);
            ps.setString(1, login);
            ps.setString(2, hashedPass);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, email);
            ps.setBoolean(6, checkAdmin);
            ps.execute();
            ps.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.getSession().setAttribute("addUser", "userAdded");
        if (req.getSession().getAttribute("user") != null)
        resp.sendRedirect("loginSuccess.jsp");
        else
            resp.sendRedirect("index.jsp");
    }
}

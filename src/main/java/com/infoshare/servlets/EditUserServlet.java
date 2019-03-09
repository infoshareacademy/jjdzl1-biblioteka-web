package com.infoshare.servlets;

import com.infoshare.dao.DBCon;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet implements Serializable {
    private static final long serialVersionUID = 2911687195703070806L;

    int userID = GetUserToEditServlet.user.getId();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("e-mail");
        //String[] admin = req.getParameterValues("admin");
        //Boolean checkAdmin = admin != null ? admin[0].equals("on") : false;

        String query = "UPDATE users SET login = ?, firstName = ?, lastName = ?, email = ? WHERE id = " + userID;

        try {
            PreparedStatement ps = DBCon.preparedStatement(query);
            ps.setString(1, login);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, email);
            ps.execute();
            ps.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.getSession().setAttribute("userEdited", "userEdited");
            resp.sendRedirect("loginSuccess.jsp");
    }
}
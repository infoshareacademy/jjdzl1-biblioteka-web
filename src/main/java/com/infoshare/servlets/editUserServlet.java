package com.infoshare.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.infoshare.dao.DBCon.preparedStatement;

@WebServlet("/editUserServlet")
public class editUserServlet extends HttpServlet implements Serializable {
    private static final long serialVersionUID = -6564924863409642949L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getParameter("userID");
        String query = "SELECT * FROM users WHERE id=" + req.getParameter("userID");
        ResultSet rs = null;
        try {
            rs = preparedStatement(query).executeQuery();
            int userID = rs.getInt("id");
            String login = rs.getString("login");
            String firstName = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            String email = rs.getString("email");
            int kind = rs.getInt("admin");
            String status = rs.getString("status");
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

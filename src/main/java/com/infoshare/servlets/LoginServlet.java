package com.infoshare.servlets;

import com.infoshare.bd.DBCon;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet implements Serializable {
    private static final long serialVersionUID = 5384381614337933147L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");

        String query = "SELECT login, password FROM users WHERE login =?";


        String login = "";
        String password = "";
        PreparedStatement ps;
        try {
            ps = DBCon.preparedStatement(query);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                login = rs.getString("login");
                password = rs.getString("password");
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (login.equals(user) && password.equals(pwd)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", request.getParameter("user"));
            session.setMaxInactiveInterval(30 * 60);
            Cookie loginCookie = new Cookie("userCookie", user);
            loginCookie.setMaxAge(30 * 60);
            response.addCookie(loginCookie);
            response.sendRedirect("app/LoginSuccess.jsp");
        } else {
            response.sendRedirect("index.jsp");
            HttpSession session = request.getSession();
            session.setAttribute("loginFalse", "loginFalse");
            session.setMaxInactiveInterval(1);
        }
    }
}
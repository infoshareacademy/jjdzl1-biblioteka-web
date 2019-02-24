package com.infoshare.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final String userID = "admin";
    private final String password = "pass";

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");

        if (userID.equals(user) && password.equals(pwd)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", request.getParameter("user"));
            //setting session to expiry in 30 mins
            session.setMaxInactiveInterval(30 * 60);
            Cookie loginCookie = new Cookie("userCookie", user);
            //setting cookie to expiry in 30 mins
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
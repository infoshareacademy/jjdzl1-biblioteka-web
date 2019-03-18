package com.infoshare.servlets;

import com.infoshare.domain.User;
import com.infoshare.repository.UsersRepositoryDao;
import com.infoshare.repository.UsersRepositoryDaoBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/SelectUserServlet")
public class SelectUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("userid"));

        UsersRepositoryDao usersRepositoryDao = new UsersRepositoryDaoBean();
        User user = usersRepositoryDao.getUserById(userId);
        HttpSession session = req.getSession();
        session.setAttribute("selectedUser", user);
        resp.sendRedirect("loginSuccess.jsp");

    }
}

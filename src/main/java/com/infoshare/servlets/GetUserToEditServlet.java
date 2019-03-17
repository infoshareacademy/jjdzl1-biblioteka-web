package com.infoshare.servlets;

import com.infoshare.domain.User;
import com.infoshare.repository.UsersRepositoryDao;
import com.infoshare.repository.UsersRepositoryDaoBean;
import lombok.Data;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;


@Data
@WebServlet("/GetUserToEditServlet")
public class GetUserToEditServlet extends HttpServlet implements Serializable {
    private static final long serialVersionUID = -6564924863409642949L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String userID = req.getParameter("userID");

        UsersRepositoryDao userDAO = new UsersRepositoryDaoBean();
        User user = userDAO.getUserById(Integer.parseInt(userID));

        HttpSession session = req.getSession();
        session.setAttribute("UserObject", user);

        resp.sendRedirect("editUser.jsp");
    }
}
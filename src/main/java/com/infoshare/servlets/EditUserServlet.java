package com.infoshare.servlets;

import com.infoshare.dao.DBCon;
import com.infoshare.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet implements Serializable {
    private static final long serialVersionUID = 2911687195703070806L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("UserObject");
        String userLogin = user.getLogin();

        String login = req.getParameter("login");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("e-mail");
        String[] admin = req.getParameterValues("adminUser");
        Boolean checkAdmin = admin != null ? admin[0].equals("1") :  false;
        String status = req.getParameter("status");
        if (status.equals("1"))
        status = "Aktywny";
        else status = "Nieaktywny";

        String query = "UPDATE users SET login = ?, firstName = ?, lastName = ?, email = ?, admin = ?, status = ? WHERE login = '" + userLogin + "'";

        try {
            PreparedStatement ps = DBCon.preparedStatement(query);
            ps.setString(1, login);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, email);
            ps.setBoolean(5,checkAdmin);
            ps.setString(6, status);
            ps.execute();
            ps.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.removeAttribute("UserObject");
        req.getSession().setAttribute("userEdited", "userEdited");
        if (req.getSession().getAttribute("user") != null)
            resp.sendRedirect("loginSuccess.jsp");
        else
            resp.sendRedirect("index.jsp");
    }
}
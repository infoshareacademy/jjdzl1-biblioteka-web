package com.infoshare.servlets;

import com.infoshare.dao.DBCon;
import com.infoshare.domain.User;
import com.infoshare.domain.UserStatus;
import lombok.Data;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;


@Data
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet implements Serializable {
    private static final long serialVersionUID = -6564924863409642949L;
    public static User user;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String userId = req.getParameter("userID");
        String query = "SELECT * FROM users WHERE id = " + userId;
        ResultSet rs;
        try {
            rs = DBCon.preparedStatement(query).executeQuery();
            user = new User(rs.getInt("id"), rs.getString("login"), rs.getString("firstName"),
                    rs.getString("lastName"), null, rs.getString("email"), UserStatus.USER);
            //UserStatus.valueOf(rs.getString("admin")
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("/editUser.jsp");
    }
}

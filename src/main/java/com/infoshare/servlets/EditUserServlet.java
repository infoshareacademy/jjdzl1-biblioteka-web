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
            while (rs.next()) {
                int userID = rs.getInt("id");
                String login = rs.getString("login");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                UserStatus admin = UserStatus.valueOf(rs.getString("admin"));
                String status = rs.getString("status");
                user = new User(userID, login, firstName, lastName, null, email, admin, status);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("editUser.jsp");
    }
}

package com.infoshare.repository;

import com.infoshare.domain.User;
import com.infoshare.domain.UserStatus;
import com.infoshare.query.UsersQuery;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersRepositoryDaoBean implements UsersRepositoryDao {

    List<User> listOfUsers = new ArrayList<>();

    @Override
    public List<User> listOfUsers() throws SQLException, ClassNotFoundException {

        try (ResultSet rs = UsersQuery.listOfUsers("id")) {

            while (rs.next()) {
                int userID = rs.getInt("id");
                String login = rs.getString("login");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String password = rs.getString("password");
                String email = rs.getString("email");
                int admin = rs.getInt("admin");
                String status = rs.getString("status");

                User user = new User();
                user.setId(userID);
                user.setLogin(login);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setPassword(password);
                user.setEmail(email);
                if (admin == 1) user.setAdmin(UserStatus.ADMIN);
                else user.setAdmin(UserStatus.USER);
                user.setStatus(status);

                listOfUsers.add(user);
            }
            rs.close();
            return listOfUsers;
        }
    }

    public User getUserById(int id) {
        ResultSet rs;
        User user = new User();
        try {
            rs = UsersQuery.findUserById(id);
            while (rs.next()) {
                String login = rs.getString("login");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                String password = rs.getString("password");
                user.setLogin(login);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setPassword(password);
                user.setEmail(email);
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User getUserByLogin(String login) {
        ResultSet rs;
        User user = new User();
        try {
            rs = UsersQuery.findUserByLogin(login);
            while (rs.next()) {
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                String password = rs.getString("password");
                user.setLogin(login);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setPassword(password);
                user.setEmail(email);
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return user;
    }
}



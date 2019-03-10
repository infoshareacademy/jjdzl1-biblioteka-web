package com.infoshare.repository;

import com.infoshare.domain.User;
import com.infoshare.domain.UserStatus;
import com.infoshare.query.UsersQuery;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersRepositoryDaoBean implements UsersRepositoryDao {

    @Override
    public List<User> listOfUsers() throws SQLException, ClassNotFoundException {

        List<User> lista = new ArrayList<>();

        try (ResultSet rs = UsersQuery.listOfUsers("id")) {

            while (rs.next()) {
                int userID = rs.getInt("id");
                String login = rs.getString("login");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String password = rs.getString("password");
                String email = rs.getString("email");
                int status = rs.getInt("admin");

                User user = new User();
                user.setId(userID);
                user.setLogin(login);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setPassword(password);
                user.setEmail(email);
                if (status == 1) user.setStatus(UserStatus.ADMIN);
                else user.setStatus(UserStatus.USER);

                lista.add(user);
            }
            rs.close();
            return lista;
        }
    }
}
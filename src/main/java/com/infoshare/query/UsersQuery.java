package com.infoshare.query;

import com.infoshare.dao.DBCon;
import com.infoshare.domain.User;
import com.infoshare.utils.Hasher;
import com.infoshare.utils.PBKDF2Hasher;


import java.sql.ResultSet;
import java.sql.SQLException;

import static com.infoshare.dao.DBCon.preparedStatement;

public class UsersQuery {

    public static ResultSet listOfUsers(String order) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM users ORDER BY " + order;
        return preparedStatement(query).executeQuery();
    }

    public static ResultSet listOfUsersFromTo(String order, int from, int to) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM users ORDER BY " + order + " LIMIT " + from + "," + to;
        return preparedStatement(query).executeQuery();
    }

    public static ResultSet CountAllUsers() throws SQLException, ClassNotFoundException {

        String query = "SELECT COUNT(*) FROM users WHERE 1" ;
        return preparedStatement(query).executeQuery();

    }

    public static ResultSet findUserById(int id) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM users WHERE id = " + id;
        return preparedStatement(query).executeQuery();
    }

    public static ResultSet findUserByLogin(String login) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM users WHERE login = '" + login + "'" ;
        return preparedStatement(query).executeQuery();
    }

    public static ResultSet findUserByEmail(String email) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM users WHERE email = '" + email + "'" ;
        return preparedStatement(query).executeQuery();
    }

    public static ResultSet findUserByEmailOrLogin(String email, String login) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM users WHERE email = '" + email + "' OR login = '" + login + "'" ;
        return preparedStatement(query).executeQuery();
    }

    public static void addNewUser(User user) {

        Hasher hasher = new PBKDF2Hasher();

        String query = "INSERT INTO `users`(`login`, `password`, `firstName`, `lastName`, `email`, `admin`) VALUES ('" +
                user.getLogin() + "', '" +
                hasher.hash(user.getPassword()) + "', '" +
                user.getFirstName() + "', '" +
                user.getLastName() + "', '" +
                user.getEmail() + "', '" +
                ((user.getStatus() == "ADMIN") ? 1 : 0) + "' )";
        try {
            preparedStatement(query).execute();
            DBCon.connClose();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

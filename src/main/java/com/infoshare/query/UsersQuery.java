package com.infoshare.query;

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

        String query = "SELECT COUNT(*) FROM users WHERE 1";
        return preparedStatement(query).executeQuery();

    }


}

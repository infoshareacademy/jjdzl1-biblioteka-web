package com.infoshare.query;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.infoshare.dao.DBCon.preparedStatement;

public class UsersQuery {

    public static ResultSet listOfUsers(String order) throws SQLException, ClassNotFoundException {

        String query ="SELECT * FROM users ORDER by "+ order;
        return preparedStatement(query).executeQuery();

    }

}

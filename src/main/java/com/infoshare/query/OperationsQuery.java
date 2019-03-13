package com.infoshare.query;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.infoshare.dao.DBCon.preparedStatement;

public class OperationsQuery {

    public static ResultSet listOfOperationsByUserId(int userID) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM operations WHERE userID = " + userID;
        return preparedStatement(query).executeQuery();
    }

}

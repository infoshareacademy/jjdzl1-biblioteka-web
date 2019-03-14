package com.infoshare.query;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.infoshare.dao.DBCon.preparedStatement;

public class OperationsQuery {

    String query = "SELECT * FROM `operations` " +
            "JOIN `users` ON operations.userId = users.id " +
            "JOIN books ON operations.bookId=books.id " +
            "WHERE users.id = 10";


    public static ResultSet listOfOperationsByUserId(int userID) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM operations WHERE userID = " + userID;
        return preparedStatement(query).executeQuery();
    }

    public static ResultSet allOperations(String operationType) throws SQLException, ClassNotFoundException {


        String query = "SELECT * FROM `operations` " +
                "JOIN `users` ON operations.userId = users.id " +
                "JOIN books ON operations.bookId=books.id ";

        if (operationType.equals("reservation")) query += "WHERE operationTypeId = 0";
        else if (operationType.equals("borrow")) query += "WHERE operationTypeId = 1";
        else query += "WHERE 1";

        return preparedStatement(query).executeQuery();
    }

}

package com.infoshare.query;

import com.infoshare.dao.DBCon;
import com.infoshare.domain.Basket;
import com.infoshare.domain.OperationType;
import com.infoshare.domain.User;
import com.infoshare.utils.DateUtil;


import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

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

    public static ResultSet allOperations(String operationType, Integer userId) throws SQLException, ClassNotFoundException {


        String query = "SELECT * FROM `operations` " +
                "JOIN `users` ON operations.userId = users.id " +
                "JOIN books ON operations.bookId=books.id ";

        String userQuery = "";
        if (userId != null && userId != 0) {
            userQuery = " AND operations.userId =" + userId;
        }

        if (operationType.equals("reservation")) query += "WHERE operationTypeId = 0" + userQuery;
        else if (operationType.equals("borrow")) query += "WHERE operationTypeId = 1" + userQuery;
        else query += "WHERE 1";

        return preparedStatement(query).executeQuery();
    }

    public static void addNewOperation(List userBasket, User selectedUser) {

        Date currentDate = Date.valueOf(DateUtil.currentDate());
        Date endOfReservationDate = Date.valueOf(DateUtil.currentPlusThreeDays());
        Date emptyDate = Date.valueOf(DateUtil.emptyDate());

        Date endDate = emptyDate;
        int operationTypeId = 1;

        User user = selectedUser;
        List<Basket> basket = userBasket;
        for (Basket basketItem : basket) {

            if (basketItem.getOperationType() == OperationType.RESERVATION) {
                endDate = endOfReservationDate;
                operationTypeId = 0;
            }

            String query = "INSERT INTO `operations` " +
                    "(`userId`, `bookId`, `operationDate`, `startDate`, `endDate`, `operationTypeId`) " +
                    "VALUES ('" +

                    user.getId() + "', '" +
                    basketItem.getBook().getBookID() + "', '" +
                    currentDate + "', '" +
                    currentDate + "', '" +
                    endDate + "', '" +
                    operationTypeId + "' )";
            try {
                preparedStatement(query).execute();

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }
}

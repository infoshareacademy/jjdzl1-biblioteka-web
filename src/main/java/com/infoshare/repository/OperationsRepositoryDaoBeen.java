package com.infoshare.repository;

import com.infoshare.domain.Operation;
import com.infoshare.domain.OperationType;
import com.infoshare.query.OperationsQuery;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class OperationsRepositoryDaoBeen implements OperationsRepositoryDao {
    @Override
    public List<Operation> operationListByUserId(int userId) throws SQLException, ClassNotFoundException {

        List<Operation> operationsByUserId = new ArrayList<>();
        OperationType operationType;

        try (ResultSet rs = OperationsQuery.listOfOperationsByUserId(userId)) {

            while (rs.next()) {
                userId = rs.getInt("userId");
                int bookID = rs.getInt("bookId");
                LocalDate startDate = rs.getDate("startDate").toLocalDate();
                LocalDate endDate = rs.getDate("startDate").toLocalDate();
                int operationTypeId = rs.getInt("operationTye");
                if (operationTypeId == 0) operationType = OperationType.RESERVATION;
                else operationType = OperationType.BORROW;

                operationsByUserId.add(new Operation(userId, bookID, startDate, endDate, operationType));
            }
            rs.close();
            return operationsByUserId;
        }
    }


    @Override
    public List<Operation> operationListBookId(int bookId) throws SQLException, ClassNotFoundException {
        return null;
    }
}

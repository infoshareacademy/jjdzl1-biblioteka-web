package com.infoshare.repository;

import com.infoshare.domain.Operation;

import java.sql.SQLException;
import java.util.List;

public interface OperationsRepositoryDao {
    List<Operation> operationListByUserId(int userId) throws SQLException, ClassNotFoundException;
    List<Operation> operationListBookId(int bookId) throws SQLException, ClassNotFoundException;
    List<Operation> AllOperationList(String typoOfOperations) throws SQLException, ClassNotFoundException;
}

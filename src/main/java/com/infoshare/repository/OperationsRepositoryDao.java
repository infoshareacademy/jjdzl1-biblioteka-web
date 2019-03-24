package com.infoshare.repository;

import com.infoshare.domain.Book;
import com.infoshare.domain.Operation;
import com.infoshare.domain.User;
import com.infoshare.query.BooksQuery;

import java.sql.SQLException;
import java.util.List;

public interface OperationsRepositoryDao {
    List<Operation> operationListByUserId(int userId) throws SQLException, ClassNotFoundException;
    List<Operation> operationListBookId(int bookId) throws SQLException, ClassNotFoundException;
    List<Operation> AllOperationList(String typoOfOperations, Integer userId) throws SQLException, ClassNotFoundException;
    void addNewOperation(List basket, User user);
}

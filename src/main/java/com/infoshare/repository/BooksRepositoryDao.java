package com.infoshare.repository;

import com.infoshare.domain.Book;
import java.sql.SQLException;
import java.util.List;

public interface BooksRepositoryDao {


    List<Book> bookList(String order) throws SQLException, ClassNotFoundException;
}
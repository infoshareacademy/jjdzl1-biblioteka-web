package com.infoshare.repository;

import com.infoshare.domain.Author;
import com.infoshare.domain.User;

import java.sql.SQLException;
import java.util.List;

public interface AuthorsRepositoryDao {
    List<Author> listOfAuthors() throws SQLException, ClassNotFoundException;
}

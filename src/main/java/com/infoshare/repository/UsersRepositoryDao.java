package com.infoshare.repository;

import com.infoshare.domain.User;

import java.sql.SQLException;
import java.util.List;

public interface UsersRepositoryDao {
    List<User> listOfUsersByTitle() throws SQLException, ClassNotFoundException;
}

package com.infoshare.repository;

import com.infoshare.domain.User;

import java.sql.SQLException;
import java.util.List;

public interface UsersRepositoryDao {
    List<User> listOfUsers() throws SQLException, ClassNotFoundException;
    User getUserById(int id);
    User getUserByLogin(String login);
}

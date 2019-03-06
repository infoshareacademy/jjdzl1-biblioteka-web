package com.infoshare.repository;

import com.infoshare.domain.Author;
import com.infoshare.domain.User;
import com.infoshare.domain.UserStatus;
import com.infoshare.query.AuthorsQuery;
import com.infoshare.query.UsersQuery;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AuthorsRepositoryDaoBean implements AuthorsRepositoryDao {

    @Override
    public List<Author> listOfAuthors() throws SQLException, ClassNotFoundException {

        List<Author> authorsList = new ArrayList<>();

        try (ResultSet rs = AuthorsQuery.listOfAuthors("lastName")) {

            while (rs.next()) {
                int authorID = rs.getInt("id");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");

                authorsList.add(new Author(authorID, firstName, lastName));
            }
            rs.close();
            return authorsList;
        }
    }
}
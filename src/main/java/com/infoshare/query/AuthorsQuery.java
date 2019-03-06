package com.infoshare.query;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.infoshare.dao.DBCon.preparedStatement;

public class AuthorsQuery {

    public static ResultSet listOfAuthors(String order) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM authors ORDER BY " + order;

        return preparedStatement(query).executeQuery();
    }


    public static ResultSet CountAllAuthors() throws SQLException, ClassNotFoundException {

        String query = "SELECT COUNT(*) FROM authors WHERE 1" ;
        return preparedStatement(query).executeQuery();

    }

    public static ResultSet findBookById(int id) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM authors WHERE id = " + id;
        return preparedStatement(query).executeQuery();

    }

    public static ResultSet findAuthorByLastname(String lastName) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM authors WHERE lastname LIKE '%" + lastName + "%'" ;
        return preparedStatement(query).executeQuery();
    }

}

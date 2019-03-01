package com.infoshare.query;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.infoshare.dao.DBCon.preparedStatement;

public class BooksQuery {

    public static ResultSet listOfBooks(String order) throws SQLException, ClassNotFoundException {


        String query = "SELECT * FROM books " +
                "JOIN authors ON books.authorID = authors.id " +
                "JOIN booksCat ON books.categoryID = booksCat.id " +
                "ORDER by " + order;

        return preparedStatement(query).executeQuery();

    }

}

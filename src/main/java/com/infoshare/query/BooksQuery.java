package com.infoshare.query;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.infoshare.dao.DBCon.preparedStatement;

public class BooksQuery {

    public static ResultSet listOfBooks(String order) throws SQLException, ClassNotFoundException {


        String query = "SELECT * FROM books " +
                "JOIN authors ON books.authorID = authors.id " +
                "JOIN booksCat ON books.categoryID = booksCat.id " +
                "ORDER BY " + order;

        return preparedStatement(query).executeQuery();
    }

    public static ResultSet listOfBooksFromTo(String order, int from, int to) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM books " +
                "JOIN authors ON books.authorID = authors.id " +
                "JOIN booksCat ON books.categoryID = booksCat.id " +
                "ORDER BY " + order + " LIMIT " + from + "," + to;

        return preparedStatement(query).executeQuery();
    }

    public static ResultSet CountAllBooks() throws SQLException, ClassNotFoundException {

        String query = "SELECT COUNT(*) FROM books WHERE 1";
        return preparedStatement(query).executeQuery();

    }

    public static ResultSet findBookById(int id) throws SQLException, ClassNotFoundException {

        String query = "SELECT * FROM books " +
                "JOIN authors ON books.authorID = authors.id " +
                "JOIN booksCat ON books.categoryID = booksCat.id " +
                "WHERE books.bookID = " + id;
        return preparedStatement(query).executeQuery();

    }


    SELECT *
    FROM books
    JOIN authors
    ON books.authorID =
    authors.id JOIN
    booksCat ON
    books.categoryID =
    booksCat.id WHERE
    books.bookID=1


}

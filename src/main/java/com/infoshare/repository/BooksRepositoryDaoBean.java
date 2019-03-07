package com.infoshare.repository;

import com.infoshare.domain.Book;
import com.infoshare.query.BooksQuery;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BooksRepositoryDaoBean implements BooksRepositoryDao {

    @Override
    public List<Book> bookList(String order) throws SQLException, ClassNotFoundException {
        List<Book> booksList = new ArrayList<>();

        try (ResultSet rs = BooksQuery.listOfBooks(order)) {

            while (rs.next()) {
                int bookID = rs.getInt("id");
                String title = rs.getString("title");
                String author = rs.getString("author");
                int relaseDate = rs.getInt("daterelease");
                String isbn = rs.getString("isbn");

                booksList.add(new Book(bookID, title, author, relaseDate, isbn));

            }
            rs.close();
            return booksList;
        }

    }
}
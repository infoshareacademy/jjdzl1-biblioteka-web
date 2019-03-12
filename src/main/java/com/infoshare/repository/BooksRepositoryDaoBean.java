package com.infoshare.repository;

import com.infoshare.dao.DBCon;
import com.infoshare.domain.Book;
import com.infoshare.query.BooksQuery;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BooksRepositoryDaoBean implements BooksRepositoryDao {

    @Override
    public List<Book> bookList(String title, String order) throws SQLException, ClassNotFoundException {
        List<Book> booksList = new ArrayList<>();
        if (title == null || title.isEmpty()) title = "";
        try (ResultSet rs = BooksQuery.listOfBooks(title, order)) {

            while (rs.next()) {
                int bookID = rs.getInt("id");
                String bookTitle = rs.getString("title");
                String authorFirstName = rs.getString("authorFirstName");
                String authorLastName = rs.getString("authorLastName");
                int relaseDate = rs.getInt("daterelease");
                String isbn = rs.getString("isbn");

                booksList.add(new Book(bookID, bookTitle, authorFirstName, authorLastName, relaseDate, isbn));
            }
            rs.close();
            return booksList;
        }
    }

    @Override
    public Book bookById(int id) throws SQLException, ClassNotFoundException {
        Book book = null;
        try (ResultSet rs = BooksQuery.findBookById(id)) {
            while (rs.next()) {
                int bookID = rs.getInt("id");
                String bookTitle = rs.getString("title");
                String authorFirstName = rs.getString("authorFirstName");
                String authorLastName = rs.getString("authorLastName");
                int relaseDate = rs.getInt("daterelease");
                String isbn = rs.getString("isbn");

                book = new Book(bookID, bookTitle, authorFirstName, authorLastName, relaseDate, isbn);
            }
            return book;
        }
    }

    public void addNewBook(Book book) {
        BooksQuery.addNewBook(book);
    }
}
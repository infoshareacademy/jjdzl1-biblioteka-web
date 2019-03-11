package com.infoshare.domain;

import lombok.Data;

@Data
public class Book {
    private int bookID;
    private String title;
    private String author;
    private int relaseDate;
    private String isbn;

    public Book(int bookID, String title, String author, int relaseDate, String isbn) {
        this.bookID = bookID;
        this.title = title;
        this.author = author;
        this.relaseDate = relaseDate;
        this.isbn = isbn;
    }
}


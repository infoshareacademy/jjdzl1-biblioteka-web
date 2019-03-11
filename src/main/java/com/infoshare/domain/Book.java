package com.infoshare.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Book {
    private int bookID;
    private String title;
    private String authorFirstName;
    private String authorLastName;
    private int relaseDate;
    private String isbn;

    public Book(int bookID, String title, String authorFirstName, String authorLastName, int relaseDate, String isbn) {
        this.bookID = bookID;
        this.title = title;
        this.authorFirstName = authorFirstName;
        this.authorLastName = authorLastName;
        this.relaseDate = relaseDate;
        this.isbn = isbn;
    }
}


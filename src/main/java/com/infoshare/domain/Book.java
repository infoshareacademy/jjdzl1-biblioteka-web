package com.infoshare.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class Book {
    private int bookID;
    private String title;
    private int authorID;
    private String isbn;
    private int relaseDate;
    private int categoryID;
    private boolean bookscol;


}


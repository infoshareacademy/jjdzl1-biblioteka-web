package com.infoshare.validation;

import com.infoshare.domain.Book;

import java.util.ArrayList;
import java.util.List;

public class BookValidation {
    public static List<String> validationResult = new ArrayList<>();

    public static List<String> bookValidation(Book book) {

        book.setTitle(BookValidation.validateTitle(book.getTitle()));
        //   book.setAuthorFirstName(BookValidation.validateAutorName(book.getAuthorFirstName()));
        //       book.setAuthorLastName(BookValidation.validateAutorName(book.getAuthorLastName()));
        //     book.setIsbn(BookValidation.validateIsbn(book.getIsbn()));

        return validationResult;
    }

    public static String validateTitle(String title) {

        if (title != null && title.trim().length() != 0) {
            System.out.println("Tytuł" + title);
            title = title.substring(0, 1).toUpperCase() + title.substring(1).toLowerCase();
        } else {
            validationResult.add("Tytuł nie może być pusty ani przekraczać 80 znaków");
            title = "";
        }
        return title;
    }

    public static String validateAutorName(String name) {

        if (name == null || name.isEmpty() & name.length() > 50) {
            validationResult.add("Imię i nazwisko nie może być pusty ani przekraczać 50 znaków");
        }
        return name;
    }

    public static String validateIsbn(String isbn) {
        if (isbn == null || isbn.isEmpty() || isbn.contains("[a-zA-Z]+") == true || isbn.length() > 20) {
            validationResult.add("Numer ISBN nie może być pusty, zawierać liter ani przekraczać 20 znaków");
        }
        return isbn;
    }

}

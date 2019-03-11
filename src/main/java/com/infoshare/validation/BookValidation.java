package com.infoshare.validation;

import com.infoshare.domain.Book;

import java.util.ArrayList;
import java.util.List;

public class BookValidation {
    public static List<String> validationResult = new ArrayList<>();

    public static List<String> bookValidation(Book book) {

        validationResult.clear();
        book.setTitle(BookValidation.validateTitle(book.getTitle()));
        book.setAuthorFirstName(BookValidation.validateAutorName(book.getAuthorFirstName()));
        book.setAuthorLastName(BookValidation.validateAutorName(book.getAuthorLastName()));
        book.setIsbn(BookValidation.validateIsbn(book.getIsbn()));
        book.setRelaseDate(BookValidation.validateRelaseDate(book.getRelaseDate()));

        return validationResult;
    }

    public static String validateTitle(String title) {

        if (title == null || title.trim().length() == 0) {
            validationResult.add("Tytuł nie może być pusty ani przekraczać 80 znaków");
        }
        return title;
    }

    public static String validateAutorName(String name) {

        if (name == null || name.isEmpty()) {
            validationResult.add("Imię i nazwisko nie może być pusty ani przekraczać 50 znaków");
        }
        return name;
    }

    public static String validateIsbn(String isbn) {
        String letterRegex = "[a-zA-Z]+";
        if (isbn == null || isbn.isEmpty() || isbn.matches(letterRegex)) {
            validationResult.add("Numer ISBN nie może być pusty, zawierać liter ani przekraczać 20 znaków");
        }
        return isbn;
    }

    public static int validateRelaseDate(Integer date) {
        String letterRegex = "[a-zA-Z]+";
        if (date == null || date > 2020) {
            validationResult.add("Data nie może być większa niż 2020");
        }
        return 100;
    }

}

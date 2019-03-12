package com.infoshare.validation;

import com.infoshare.domain.Book;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class BookValidation {

    private static final int titleLength = 80;
    private static final int authorsNameLength = 50;
    private static final int isbnLength = 20;

    public static List<String> validationResult = new ArrayList<>();

    public static List<String> bookValidation(Book book) {

        validationResult.clear();
        book.setTitle(BookValidation.validateTitle(book.getTitle()));
        book.setAuthorFirstName(BookValidation.validateAutorName(book.getAuthorFirstName(), "Nazwisko autora: "));
        book.setAuthorLastName(BookValidation.validateAutorName(book.getAuthorLastName(), "Imię autora: "));
        book.setIsbn(BookValidation.validateIsbn(book.getIsbn()));
        book.setRelaseDate(BookValidation.validateRelaseDate(book.getRelaseDate()));

        return validationResult;
    }

    public static String validateTitle(String title) {

        if (title == null || title.trim().length() == 0 || title.length() >titleLength) {
            validationResult.add("Tytuł nie może być pusty ani przekraczać 80 znaków");
        }
        return title;
    }

    public static String validateAutorName(String name, String fieldName) {

        if (name == null || name.isEmpty() || name.length() > authorsNameLength) {
            validationResult.add(fieldName + "pole nie może być pusty ani przekraczać 50 znaków");
        }
        return name;
    }

    public static String validateIsbn(String isbn) {
        String letterRegex = "[a-zA-Z]+";
        if (isbn == null || isbn.isEmpty() || isbn.matches(letterRegex) || isbn.length() > isbnLength) {
            validationResult.add("Numer ISBN nie może być pusty, zawierać liter ani przekraczać 20 znaków");
        }
        return isbn;
    }

    public static int validateRelaseDate(Integer date) {
        String letterRegex = "[a-zA-Z]+";
        int currentYear = LocalDate.now().getYear();
        if (date == 0 || date > currentYear) {
            validationResult.add("Rok wydanie nie może być pusty, równy 0 lub większy niż " + currentYear + " rok");
        }
        return date;
    }

}

package com.infoshare.validation;

import com.infoshare.domain.User;
import com.infoshare.query.UsersQuery;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class UserValidation {

    private static final int loginLength = 20;
    //    private static final Pattern loginPattern = Pattern.compile("[a-zA-Z0-9_]*");
    private static final Pattern loginPattern = Pattern.compile("[$&+,:;=?@#|'<>.-^*()%!\"~]*");
    private static final Pattern namePattern = Pattern.compile("[a-zA-Z]*");
    private static final Pattern emailPattern = Pattern.compile(".+@.+\\..+");

    public static List<String> validationResult = new ArrayList<>();

    public static List<String> userValidation(User user) {

        validationResult.clear();
        user.setLogin(UserValidation.validateLogin(user.getLogin()));
//        user.setPassword(validatePassword(user.getPassword()));
//        user.setFirstName(validateFirstName(user.getFirstName()));
//        user.setLastName(validateLastName(user.getLastName()));
//        user.setEmail(validateEmail(user.getEmail()));
        return validationResult;
    }

    public static String validateLogin(String login) {

// do testowania watosci boolean 4 warunkow - dziwne bo tylko jedna z nich ma wartosc 1 a reszta nie wiadomo czyli
// login jest null-em a w bazie dodaje sie prawidlowo :/ -nie rozumiem tego
        int i1 = (login == null) ? 1 : 0;
        int i2 = (login.trim().length() == 0) ? 1 : 0;
        int i3 = (login.length() > loginLength) ? 1 : 0;
        int i4 = (loginPattern.matcher(login).matches()) ? 1 : 0;


//        if (login == null || login.trim().length() == 0 || login.length() >loginLength || loginPattern.matcher(login).matches())
        if ((login == null || login.trim().isEmpty() || login.contains(" ")) ||
                (login.length() > loginLength || loginPattern.matcher(login).matches())) {
            validationResult.add(i1 + i2 + i3 + i4 + login + "Login nie może być pusty ani przekraczać 20 znaków (typu litery i cyfry oraz podkreślenie)");
        }
        return login;
    }

    public static String validatePassword(String password) {

        if (password == null || password.trim().length() == 0 || password.length() > loginLength) {
            validationResult.add("Hasło nie może być puste ani przekraczać 20 znaków");
        }
        return password;
    }

    public static String validateFirstName(String firstName) {

        if (firstName == null || firstName.trim().length() == 0 || firstName.length() > loginLength || namePattern.matcher(firstName).matches()) {
            validationResult.add("Imię nie może być puste ani przekraczać 20 znaków (typu litery i cyfry");
        }
        return firstName;
    }

    public static String validateLastName(String lastName) {

        if (lastName == null || lastName.trim().length() == 0 || lastName.length() > loginLength || namePattern.matcher(lastName).matches()) {
            validationResult.add("Nazwisko nie może być puste ani przekraczać 20 znaków (typu litery i cyfry)");
        }
        return lastName;
    }

    public static String validateEmail(String email) {

        if (email == null || email.trim().length() == 0 || emailPattern.matcher(email).matches()) {
            validationResult.add("E-mail musi być prawidłowy");
        }
        return email;
    }

    public static void checkIsLoginOrEmailExist(String login, String email) throws SQLException, ClassNotFoundException {
        ResultSet rs = UsersQuery.findUserByLogin(login);
        ResultSet rs1 = UsersQuery.findUserByEmail(email);
        while (rs.next()) {
            if (!rs.getString("login").isEmpty()) {
                validationResult.add("Login jest zajęty");
            }
        }
        rs.close();
        while (rs1.next()) {
            if (!rs1.getString("email").trim().isEmpty()) {
                validationResult.add("E-mail jest zajęty");
            }
        }
        rs1.close();
    }
}

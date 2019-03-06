package com.infoshare.domain;

import lombok.Data;

@Data
public class User {
    private int id;
    private String login;
    private String firstName;
    private String lastName;
    private String password;
    private String email;
    private UserStatus status;

    public User(int id, String login, String firstName, String lastName, String password, String email, UserStatus status) {
        this.id = id;
        this.login = login;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.email = email;
        this.status = status;
    }

    public User() {
    }

}
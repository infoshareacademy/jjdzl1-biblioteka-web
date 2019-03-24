package com.infoshare.domain;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
public class User {

    private int id;
    private String login;
    private String firstName;
    private String lastName;
    private String password;
    private String email;
    private UserStatus admin;
    private String status;

    public User(String login, String firstName, String lastName, String password, String email, UserStatus admin, String status) {
        this.login = login;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.email = email;
        this.admin = admin;
        this.status = status;
    }
}


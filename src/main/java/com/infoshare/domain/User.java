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
    private AccountStatus status;

}


package com.infoshare.domain;

import lombok.Data;

@Data
public class Basket {
    private Book book;
    private User user;
    private OperationType operationType;

    public Basket(Book book, User user, OperationType operationType) {
        this.book = book;
        this.user = user;
        this.operationType = operationType;
    }
}

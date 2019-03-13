package com.infoshare.domain;

import lombok.Data;

import java.time.LocalDate;

@Data
public class Operation {
    private int id;
    private int userId;
    private int bookId;
    private LocalDate startDate;
    private LocalDate endDate;
    private OperationType operationType;

    public Operation( int userId, int bookId, LocalDate startDate, LocalDate endDate, OperationType operationType) {
        this.userId = userId;
        this.bookId = bookId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.operationType = operationType;
    }
}

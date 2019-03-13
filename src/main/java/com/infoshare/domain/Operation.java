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
}

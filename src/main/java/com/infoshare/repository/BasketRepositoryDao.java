package com.infoshare.repository;

import com.infoshare.domain.Basket;
import com.infoshare.domain.Book;
import com.infoshare.domain.OperationType;
import com.infoshare.domain.User;

import java.util.List;

public interface BasketRepositoryDao {

    void addToBasketList(User user, Book book, OperationType operationType);

    List basketList();

    List createBasketList();
}

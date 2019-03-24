package com.infoshare.repository;

import com.infoshare.domain.Basket;
import com.infoshare.domain.Book;
import com.infoshare.domain.OperationType;
import com.infoshare.domain.User;
import com.infoshare.servlets.SelectUserServlet;

import java.util.ArrayList;
import java.util.List;

public class BasketRepositoryDaoBean implements BasketRepositoryDao {

    public List<Basket> basket = SelectUserServlet.basket;

    @Override
    public void addToBasketList(User user, Book book, OperationType operationType) {
        basket.add(new Basket(book, user, operationType));
    }

    @Override
    public List basketList() {
        return basket;
    }

    @Override
    public List createBasketList() {
        List<Basket> basket = new ArrayList<>();
        return basket;
    }
}

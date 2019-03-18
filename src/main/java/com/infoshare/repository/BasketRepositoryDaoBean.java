package com.infoshare.repository;

import com.infoshare.domain.Basket;
import com.infoshare.domain.Book;
import com.infoshare.domain.OperationType;
import com.infoshare.domain.User;
import com.infoshare.servlets.SelectUserServlet;

import java.util.ArrayList;
import java.util.List;

public class BasketRepositoryDaoBean implements BasketRepositoryDao {

    @Override
    public void addToBasketList(User user, Book book, OperationType operationType) {
        SelectUserServlet selectUserServlet = new SelectUserServlet();
        List basketList = selectUserServlet.basket;
        basketList.add(new Basket(book, user, operationType));
    }

    @Override
    public List basketList() {
        SelectUserServlet selectUserServlet = new SelectUserServlet();
        return selectUserServlet.basket;
    }
}

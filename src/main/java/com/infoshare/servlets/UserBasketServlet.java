package com.infoshare.servlets;

import com.infoshare.domain.Basket;
import com.infoshare.domain.Book;
import com.infoshare.domain.OperationType;
import com.infoshare.domain.User;
import com.infoshare.repository.BasketRepositoryDao;
import com.infoshare.repository.BasketRepositoryDaoBean;
import com.infoshare.repository.BooksRepositoryDao;
import com.infoshare.repository.BooksRepositoryDaoBean;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UserBasketServlet")
public class UserBasketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        int bookId = Integer.parseInt(req.getParameter("bookId"));
        String operationType = req.getParameter("operationType");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("selectedUser");
        BooksRepositoryDao booksRepositoryDao = new BooksRepositoryDaoBean();
        try {
            Book book = booksRepositoryDao.getBookById(bookId);

            BasketRepositoryDao basketRepositoryDao= new BasketRepositoryDaoBean();
            basketRepositoryDao.addToBasketList(user,book, OperationType.RESERVATION);


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("listOfBooks.jsp");
    }

}

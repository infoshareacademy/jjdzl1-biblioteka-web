package com.infoshare.servlets;

import com.infoshare.domain.Book;
import com.infoshare.domain.OperationType;
import com.infoshare.domain.User;
import com.infoshare.repository.BasketRepositoryDao;
import com.infoshare.repository.BasketRepositoryDaoBean;
import com.infoshare.repository.BooksRepositoryDao;
import com.infoshare.repository.BooksRepositoryDaoBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UserBasketServlet")
public class UserBasketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int bookId = Integer.parseInt(req.getParameter("bookId"));
        String operationType = req.getParameter("operationType");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("selectedUser");
        BooksRepositoryDao booksRepositoryDao = new BooksRepositoryDaoBean();
        BasketRepositoryDao basketRepositoryDao = new BasketRepositoryDaoBean();
        OperationType operationTypeEnum = OperationType.BORROW;
        if (operationType.equals("reservation")) operationTypeEnum = OperationType.RESERVATION;
        try {
            Book book = booksRepositoryDao.getBookById(bookId);
            basketRepositoryDao.addToBasketList(user, book, operationTypeEnum);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        resp.sendRedirect("listOfBooks.jsp");
    }

}

package com.infoshare.servlets;

import com.infoshare.domain.Basket;
import com.infoshare.domain.User;
import com.infoshare.repository.BasketRepositoryDao;
import com.infoshare.repository.BasketRepositoryDaoBean;
import com.infoshare.repository.OperationsRepositoryDao;
import com.infoshare.repository.OperationsRepositoryDaoBeen;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/SaveBasketServlet")
public class SaveBasketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("selectedUser");

        BasketRepositoryDao basketRepositoryDaoBean = new BasketRepositoryDaoBean();
        List<Basket> basketList = basketRepositoryDaoBean.basketList();

        OperationsRepositoryDao operationsRepository = new OperationsRepositoryDaoBeen();
        operationsRepository.addNewOperation(basketList, user);

        if (req.getSession().getAttribute("user") != null)
            resp.sendRedirect("loginSuccess.jsp");
        else
            resp.sendRedirect("index.jsp");

    }
}

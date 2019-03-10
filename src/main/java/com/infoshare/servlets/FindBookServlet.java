package com.infoshare.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/FindBookServlet")
public class FindBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String titleOfBook = req.getParameter("title");

        resp.setContentType("text/html;charset=UTF-8");
        resp.sendRedirect("listOfBooks.jsp?title=" + titleOfBook);

    }
}

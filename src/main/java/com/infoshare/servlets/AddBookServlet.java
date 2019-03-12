package com.infoshare.servlets;

import com.infoshare.dao.DBCon;
import com.infoshare.domain.Book;
import com.infoshare.repository.BooksRepositoryDao;
import com.infoshare.repository.BooksRepositoryDaoBean;
import com.infoshare.validation.BookValidation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String lastName = req.getParameter("lastName");
        String firstName = req.getParameter("firstName");
        Integer date;
        try {
            date = Integer.parseInt(req.getParameter("daterelease"));
        } catch (NumberFormatException e) {
            date = 0;
        }
        String isbn = req.getParameter("isbn");

        Book book = new Book();
        book.setTitle(title);
        book.setAuthorFirstName(firstName);
        book.setAuthorLastName(lastName);
        book.setIsbn(isbn);
        book.setRelaseDate(date);

        BookValidation.bookValidation(book);

        if (req.getSession().getAttribute("user") != null && BookValidation.validationResult.size() > 0) {
            resp.sendRedirect("addBook.jsp");
        } else {
            BooksRepositoryDao booksRepositoryDaoBean = new BooksRepositoryDaoBean();
            booksRepositoryDaoBean.addNewBook(book);
            req.getSession().setAttribute("addBook", "bookAdded");
            if (req.getSession().getAttribute("user") != null)
                resp.sendRedirect("loginSuccess.jsp");
            else
                resp.sendRedirect("index.jsp");
        }
    }

}


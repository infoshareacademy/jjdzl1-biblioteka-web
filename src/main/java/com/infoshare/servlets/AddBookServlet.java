package com.infoshare.servlets;

import com.infoshare.dao.DBCon;
import com.infoshare.domain.Book;
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
        Integer date = Integer.parseInt(req.getParameter("daterelease"));
        String isbn = req.getParameter("isbn");

        String author = lastName + ", " + firstName;
        Book book = new Book();
        book.setTitle(title);
        book.setAuthorFirstName(firstName);
        book.setAuthorLastName(lastName);
        book.setIsbn(isbn);
        book.setRelaseDate(date);


        String query = "INSERT INTO books (title, , daterelease, isbn) " +
                "VALUES (?, ?, ?, ?)";

        /**
         * Walidacja dodawania użytkownika
         * */
        BookValidation.bookValidation(book);
        if (BookValidation.validationResult.size() > 0) {

            PrintWriter writer = resp.getWriter();
            List<String> validationResult = BookValidation.validationResult;
            for (String s : validationResult) {
                writer.write(s);
                writer.write("</br>");
            }
        }

        //Zakomentowano na czas pracy nad walidacją, nie dodaje nic do bazy
        /*        try {
            PreparedStatement ps = DBCon.preparedStatement(query);
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setInt(3, date);
            ps.setString(4, isbn);
            ps.execute();
            ps.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.getSession().setAttribute("addBook", "bookAdded");
        if (req.getSession().getAttribute("user") != null)
            resp.sendRedirect("loginSuccess.jsp");
        else
            resp.sendRedirect("index.jsp");
            */
    }

}


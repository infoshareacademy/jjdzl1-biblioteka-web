//package com.infoshare.bd;
//
//import java.sql.*;
//import java.util.logging.Logger;
//
//public class DBUtils {
//    public static PreparedStatement preparedStatement(String sql) throws ClassNotFoundException, SQLException {
//
//        final String driver = "com.mysql.cj.jdbc.Driver";
//        final String url = "jdbc:mysql://db4free.net/librarydb";
//        final String user = "librarydb";
//        final String pass = "infoshareacademy";
//
//        PreparedStatement ps = null;
//        Class.forName(driver);
//        Connection con = DriverManager.getConnection(url, user, pass);
//        ps = con.prepareStatement(sql);
//
//        return ps;
//    }
//
//    //Na chwilę sprawdzenie czy działa połaczenie
//    public static void main(String[] args) throws ClassNotFoundException, SQLException {
//
//        try {
//            ResultSet rs = preparedStatement("SELECT * FROM books, authors WHERE authorID=id ORDER by title").executeQuery();
//
//            while (rs.next()) {
//                int bookID = rs.getInt("bookID");
//                String title = rs.getString("title");
//                String firstName = rs.getString("firstName");
//                String lastName = rs.getString("lastName");
//                String isbn = rs.getString("isbn");
//                int dareRelease = rs.getInt("dateRelease");
//                int categoryID = rs.getInt("categoryID");
//                int bookscol = rs.getInt("bookscol");
//
//                System.out.format("%s, %s, %s %s, %s, %s\n", bookID, title, firstName, lastName, isbn, dareRelease, categoryID, bookscol);
//            }
//        } catch (ClassNotFoundException | SQLException ex) {
//            System.err.println("Got an exception! ");
//            System.err.println(ex.getMessage());
//
//        }
//    }
//
//}

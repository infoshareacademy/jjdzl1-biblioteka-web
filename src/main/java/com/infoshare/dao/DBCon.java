package com.infoshare.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBCon {
    private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String url = "jdbc:mysql://db4free.net/librarydb2";
    private static final String user = "librarydb2";
    private static final String pass = "infoshareacademy";

    public static PreparedStatement preparedStatement(String sql) throws ClassNotFoundException, SQLException {

        PreparedStatement ps = null;
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, pass);
        ps = con.prepareStatement(sql);
        return ps;
    }

    public static void connClose() throws ClassNotFoundException, SQLException {

        PreparedStatement ps = null;
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, pass);
        con.close();
    }

}

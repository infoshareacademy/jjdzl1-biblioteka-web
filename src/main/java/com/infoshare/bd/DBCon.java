package com.infoshare.bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBCon {

    public static PreparedStatement preparedStatement(String sql) throws ClassNotFoundException, SQLException {

        final String driver = "com.mysql.cj.jdbc.Driver";
        final String url = "jdbc:mysql://db4free.net/librarydb";
        final String user = "librarydb";
        final String pass = "infoshareacademy";

        PreparedStatement ps = null;
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, pass);
        ps = con.prepareStatement(sql);

        return ps;
    }
}

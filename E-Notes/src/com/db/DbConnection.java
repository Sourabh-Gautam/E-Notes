package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {

    private static Connection conn;

    public static Connection getConnection() {
    	System.out.println("Get Connection Called");
        if (conn == null) {
            try {
                Class.forName("oracle.jdbc.OracleDriver");
                System.out.println("Driver Loaded");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//sourabh-pc:1521/xe", "rohit", "admin");
                System.out.println("Connection Build");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return conn;
    }
}


package com.dao;

import com.user.UserDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author soura
 */
public class UserDao {

    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    public boolean addUser(UserDetails us) {
        boolean f = false;
        try {
            String query = "insert into enotes values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPassword());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return f;
    }

    public UserDetails loginUser(UserDetails us) {
        UserDetails user=null;
        try {

            String query = "select * from enotes where email=? and password=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, us.getEmail());
            ps.setString(2, us.getPassword());
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
            	user=new UserDetails();
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            	user.setPassword(rs.getString("password"));
            }
        } 
        catch (SQLException ex) {
            ex.printStackTrace();
        }
       return user;
    }
}


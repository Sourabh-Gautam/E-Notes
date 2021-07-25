/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DbConnection;
import com.user.UserDetails;
/**
 *
 * @author soura
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email=request.getParameter("email");
        String password=request.getParameter("pwd");
        UserDetails us=new UserDetails();
        us.setEmail(email);
        us.setPassword(password);
        UserDao dao=new UserDao(DbConnection.getConnection());
        UserDetails user=dao.loginUser(us);
        if(user!=null){
        	HttpSession session = request.getSession();
        	session.setAttribute("user-details", user);
            response.sendRedirect("home.jsp");
        }
        else{
        	HttpSession session = request.getSession();
        	session.setAttribute("login-failed", "Invalid username or password!");
        	response.sendRedirect("login.jsp");
        	
        }
    }
}
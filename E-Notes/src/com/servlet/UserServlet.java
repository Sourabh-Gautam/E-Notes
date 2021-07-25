package com.servlet;

import java.io.IOException;
import java.sql.Connection;
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
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("fname");
        String email = request.getParameter("email");
        String password = request.getParameter("pwd");

        UserDetails us = new UserDetails();
        us.setName(name);
        us.setEmail(email);
        us.setPassword(password);

        UserDao dao = new UserDao(DbConnection.getConnection());
        boolean f = dao.addUser(us);
        HttpSession session = request.getSession();
        if (f) {
            session.setAttribute("flag", "success");
            response.sendRedirect("register.jsp");
        } else {
            session.setAttribute("flag", "failed");
            response.sendRedirect("register.jsp");
        }
    }
}


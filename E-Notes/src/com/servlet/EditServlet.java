package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDao;
import com.db.DbConnection;


@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String date = request.getParameter("notedate");
			String content = request.getParameter("content");
			String title = request.getParameter("title");
			PostDao dao = new PostDao(DbConnection.getConnection());
			boolean b = dao.updateNote(date, content, title);
			if(b){
				System.out.println("record Updated Successfulllly ");
				HttpSession session=request.getSession();
				session.setAttribute("result", "Record Updated Successfully!");
				response.sendRedirect("shownotes.jsp");
			}
			else
			{
				System.out.println("record Updatation failed  ");
				HttpSession session=request.getSession();
				session.setAttribute("result", "Sorry! Some error occured while updation of note.");
				response.sendRedirect("shownotes.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}

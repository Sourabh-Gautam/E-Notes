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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
       
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		String date = request.getParameter("notedate");
 		String email=request.getParameter("email");
 		PostDao dao = new PostDao(DbConnection.getConnection());
 		boolean b=dao.deleteNote(date, email);
 		if(b){
			System.out.println("record deleted Successfulllly ");
			HttpSession session=request.getSession();
			session.setAttribute("result", "Record deleted Successfully!");
			response.sendRedirect("shownotes.jsp");
		}
		else
		{
			System.out.println("record deletion failed  ");
			HttpSession session=request.getSession();
			session.setAttribute("result", "Sorry! Some error occured while deletion of note.");
			response.sendRedirect("shownotes.jsp");
		}
 	}
}
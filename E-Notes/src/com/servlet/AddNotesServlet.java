package com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDao;
import com.db.DbConnection;
import com.user.Post;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id =request.getParameter("userid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("MMMM d, yyyy H:m:s a");
		String date = sdf.format(d);
		PostDao dao=new PostDao(DbConnection.getConnection());
		boolean f=dao.addNotes(title, content, id , date);
		if(f){
			System.out.println("Record inserted successfully!");
			HttpSession session=request.getSession();
			session.setAttribute("result", "Record inserted Successfully!");
			response.sendRedirect("addnotes.jsp");
		}
		else
		{
			System.out.println("record deletion failed  ");
			HttpSession session=request.getSession();
			session.setAttribute("result", "Sorry! Some error occured while adding note.");
			response.sendRedirect("addnotes.jsp");
		}
				

	
	}

}

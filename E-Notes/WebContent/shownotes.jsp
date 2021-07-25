<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.dao.PostDao,com.user.UserDetails, com.db.DbConnection, java.util.*, com.user.Post" %>
	<% UserDetails user3=(UserDetails)session.getAttribute("user-details");
	if(user3==null){
		response.sendRedirect("login.jsp");
		session.setAttribute("login-err", "Please login first!");
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Notes</title>
<%@include file="allcomponents/allcss.jsp"%>
</head>
<body>

	<%@include file="allcomponents/navbar.jsp"%>
	<%
String flag=(String)session.getAttribute("result");
if(flag!=null){
	if(flag=="Record Updated Successfully!"){
	%>
	<div class="alert alert-success" role="alert">
	<%= flag %>
</div>
<%
	}
	if(flag=="Record deleted Successfully!"){
		%>
		<div class="alert alert-success" role="alert">
		<%= flag %>
	</div>
	<%
		}
}
if(flag!=null)
{
	if(flag=="Sorry! Some error occured while updation note."){
	%>
	<div class="alert alert-danger" role="alert">
	<%= flag %>
</div>
<%
	}
	
	if(flag=="Sorry! Some error occured while deletion of note."){
		%>
		<div class="alert alert-danger" role="alert">
		<%= flag %>
	</div>
	<%
		}
}
session.removeAttribute("result");
%>
	<div class="container">
	
		<h2 class="text-center">All Notes</h2>
		
		<div class="row">
			<div class="col-md-12">
			
				<% 
					if(user3!=null){
						PostDao dao = new PostDao(DbConnection.getConnection());
						List<Post> post=dao.getData(user3.getEmail());
						
						for(Post po: post){
				%>
							<div class="card mt-3">
							<img src="images/img-notes.png" alt="noteimg" class="card-img-top mt-2 mx-auto "
								style="max-width: 15%;">
							<div class="card-body p-4">

								<h5 class="card-title"><%= po.getTitle() %></h5>
								<p><%= po.getContent() %></p>
								<p>
									<b class="text-success">Published By : </b>
									<b class="text-primary"><%= user.getName() %></b><br>
									<b class="text-success">Published Date : </b>
									<b class="text-primary"><%= po.getPdate() %></b>
								</p>
								<div class="container text-center mt-2">
									<a href="DeleteServlet?notedate=<%=po.getPdate() %>&email=<%=user.getEmail() %>" class="btn btn-danger">Delete</a>
									<a href="edit.jsp?notedate=<%=po.getPdate() %>" class="btn btn-primary">Edit</a>
								</div>
							</div>
						</div>
				<%
						}
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>
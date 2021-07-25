<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<% UserDetails user1=(UserDetails)session.getAttribute("user-details");
	if(user1==null){
		response.sendRedirect("login.jsp");
		session.setAttribute("login-err", "Please login first!");
	}
	%>
	<%@page import="com.user.UserDetails" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="allcomponents/allcss.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Notes</title>
</head>
<body>
	<%@include file="allcomponents/navbar.jsp"%>
	<%
		String flag=(String)session.getAttribute("result");
		if(flag!=null){
			if(flag=="Record inserted Successfully!"){
				%>
				<div class="alert alert-success" role="alert">
				<%= flag %>
			</div>
			<%
		}
		if(flag=="Sorry! Some error occured while adding note."){
			%>
			<div class="alert alert-danger" role="alert">
			<%= flag %>
		</div>
		<%
			}
		session.removeAttribute("result");
		}
	%>
	<div class="container-fluid">
		<h1 class="text-center">Add Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action="AddNotesServlet" method="post">
						<div class="form-group">
							<%
							UserDetails us =(UserDetails)session.getAttribute("user-details");
															
							if(us!=null)
							{
								
							%>
							<input type="hidden" value="<%= us.getEmail() %>" name="userid">
							<%} %>
							<label for="exampleInputEmail1">Note Title</label> <input
								type="text" class="form-control" name="title" id="exampleInputEmail1"
								aria-describedby="emailHelp" required autofocus >
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Edit Content</label>
							<textarea class="form-control" rows="5" cols="" name="content" required> 
							
						</textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Add Notes</button>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>
	<div style="margin-top:28.6vh">
	<%@include file="allcomponents/footer.jsp"%>
	</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="com.dao.PostDao,com.user.UserDetails, com.db.DbConnection, java.util.*, com.user.Post"%>
<%
	UserDetails user4 = (UserDetails) session.getAttribute("user-details");
	if (user4 == null) {
		response.sendRedirect("login.jsp");
		session.setAttribute("login-err", "Please login first!");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Note</title>
<%@include file="allcomponents/allcss.jsp"%>
</head>
<body>
	<%@include file="allcomponents/navbar.jsp"%>
	<%
		String date = request.getParameter("notedate");
		PostDao dao = new PostDao(DbConnection.getConnection());
		Post p = dao.getDataById(date);
	%>
	<div class="container-fluid">
		<h1 class="text-center">Edit Note</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action="EditServlet" method="post">
						<input type="hidden" name="notedate" value="<%=date%>">
						<div class="form-group">

							<label for="exampleInputEmail1">Note Title</label> <input
								type="text" class="form-control" value="<%=p.getTitle()%>"
								name="title" id="exampleInputEmail1"
								aria-describedby="emailHelp" required autofocus>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Edit Content</label>
							<textarea class="form-control" rows="5" cols="" name="content"
								required> <%=p.getContent()%>
							
						</textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Edit Note</button>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 28.6vh">
		<%@include file="allcomponents/footer.jsp"%>
	</div>

</body>
</html>
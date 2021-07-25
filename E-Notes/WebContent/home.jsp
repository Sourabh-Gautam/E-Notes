<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% UserDetails user2=(UserDetails)session.getAttribute("user-details");
	if(user2==null){
		response.sendRedirect("login.jsp");
		session.setAttribute("login-err", "Please login first!");
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="allcomponents/allcss.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Homepage</title>
</head>
<body>
<%@include file="allcomponents/navbar.jsp" %>
<div class="container-fluid">

	<div class="card py-5">
		<div class="card-body text-center">
			<img src="images/Paper-notes.svg" class="img-fluid mx-auto" style="max-width:346px;">
			<h1>Start Taking Your Notes</h1>
			<a href="addnotes.jsp" class="btn btn-outline-primary">Start Here</a>
		</div>
	</div>
</div>
<%@include file="allcomponents/footer.jsp" %>
</body>
</html>
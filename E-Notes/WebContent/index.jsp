<%-- 
    Document   : index
    Created on : Apr 12, 2021, 12:38:13 PM
    Author     : soura
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>E-Notes</title>
<%@include file="allcomponents/allcss.jsp"%>
<style>
.bg-image {
	background: url('images/notes.jpg');
	background-size: 100% 100%;
}

.contain {
	display: block;
	width: 100%;
	height: 90.5vh;
	text-align: center;
}

i {
	margin: 5px;
}
</style>
</head>
<body>
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="bg-image contain">
		<h1>
			<i class="fa fa-book"></i>E Notes - Save Your Notes
		</h1>

		<%
            	if(user==null){
           %> 		
           
            		 <a href="login.jsp" class="btn btn-dark"><i class="fa fa-user-circle-o" aria-hidden="true"></i>Login</a>
                     <a href="register.jsp" class="btn btn-dark"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a>
            	<%
            	}
         %>

	</div>
	<%@include file="allcomponents/footer.jsp"%>
</body>
</html>
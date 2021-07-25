<%-- 
    Document   : login
    Created on : Apr 12, 2021, 12:25:22 PM
    Author     : soura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<%@include file="allcomponents/allcss.jsp"%>
</head>
<body>

	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container-fluid bg-reg">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
						<span class="fa fa-user-plus fa-3x"></span>
						<h4>Login</h4>
					</div>
					<%
						String invalidMsg = (String) session.getAttribute("login-failed");
						if (invalidMsg != null) {
					%>
					<div class="alert alert-danger" role="alert">
						<%=invalidMsg%>
					</div>
					<%
						session.removeAttribute("login-failed");
						}

						String loginError = (String) session.getAttribute("login-err");
						if (loginError != null) {
					%>
					<div class="alert alert-danger" role="alert">
						<%=loginError%>

					</div>
					<%
						session.removeAttribute("login-err");
						}

						String logoutMsg = (String) session.getAttribute("logout-msg");
						if (logoutMsg != null) {
					%>
					<div class="alert alert-success" role="alert">
						<%=logoutMsg%>

					</div>
					<%
						session.removeAttribute("logout-msg");
						}
					%>
					<div class="card-body">

						<form action="LoginServlet" method="post">
							<label> Enter Email Id </label>
							<div class="mb-3">

								<input type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Username"
									name="email" autofocus>

							</div>
							<label> Enter password </label>
							<div class="mb-3">
								<input type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Enter password "
									name="pwd">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allcomponents/footer.jsp"%>
</body>

</html>

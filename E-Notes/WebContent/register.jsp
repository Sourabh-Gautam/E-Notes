<%-- 
    Document   : register
    Created on : Apr 12, 2021, 12:25:45 PM
    Author     : soura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <%@include file="allcomponents/allcss.jsp" %>
    </head>
    <body>
        <%@include file="allcomponents/navbar.jsp" %>
        <div class="container-fluid bg-reg">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-5">
                        <div class="card-header text-center text-white bg-custom">
                            <span class="fa fa-user-plus fa-3x"></span>
                            <h4>Registration</h4>
                        </div>

                        <%
                            String msg=(String)session.getAttribute("flag");
                            if(msg=="success"){
                        %>
                        <div class="alert alert-success" role="alert">Congratulation! You registered successfully. Click here to <a href="login.jsp">login.</a></div>
                        <%
                            session.removeAttribute("flag");
                             }
                     if(msg=="failed"){
                        %>
                        <div class="alert alert-danger" role="alert">Sorry! Something went wrong.</div>
                        <%
                        } %>
                        <div class="card-body">
                            <form action="UserServlet" method="post">
                                <label>
                                    Enter full name
                                </label> 

                                <div class="mb-3">
                                    <input type="text" class="form-control"
                                           id="" aria-describedby="emailHelp" placeholder="Enter your name" name="fname">

                                </div>
                                <label>
                                    Enter Email Id
                                </label>
                                <div class="mb-3">

                                    <input type="email" class="form-control"
                                           id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your email" name="email">

                                </div>
                                <label>
                                    Create password 
                                </label> 
                                <div class="mb-3">

                                    <input type="password" class="form-control"
                                           id="exampleInputPassword1" placeholder="Enter password " name="pwd">
                                </div>

                                <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <%@include file="allcomponents/footer.jsp" %>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>

	<link rel="stylesheet" href="styles/Login_Register.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<%
	String message = null;
	if(request.getAttribute("message") != null) {
		message = (String) request.getAttribute("message");
	}
%>

    <style>       
		.form_container {
            width           : 450px;
            margin          : 10vw auto auto auto;
        }

        #sub_but {
            width           : 100%;
        }

        #link {
            color           : #0E2954;
        }

        #link:hover {
            color           : #092450;
            font-weight     : 700;
        }
    </style>
    
    <%
    	if(message != null) {
    %>
    	<style>
    		.form_container {
    			margin-top  : 100px;
    		}
    	</style>
    <%
    	}
    %>
</head>
<body>
    <div class="form_container">
        <form action="Login" method="post">
            <div style="text-align : center;margin-bottom: 20px;">
                <div id="login_title" style="font-size: 40px; font-weight : 600;">Login</div>
            </div>
            <% 
            	if(message != null) {
            %>
            	<div class="alert alert-danger" role="alert">
				 	Invalid Email Address or Password !!
				</div>
            <%
            	}
            %> 
            
            <div class="mb-3">
              <label for="exampleInputEmail1" class="form-label">Email address</label>
              <input type="email" name="email_id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>
            <div class="mb-3">
              <label for="exampleInputPassword1" class="form-label">Password</label>
              <input type="password" name="password" class="form-control" id="exampleInputPassword1" style="font-family: Verdana, sans-serif;letter-spacing: 3px;">
            </div>
            
            <div style="text-align: center;">
                <a>Doesn't have an account? </a><a href="Registration1.jsp" id="link">Sign Up</a>
            </div>
            <button type="submit" class="btn btn-primary" id="sub_but">Submit</button>
          </form>

    </div>
</body>
</html>
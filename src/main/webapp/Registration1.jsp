<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration - Email details page</title>
    
    	<link rel="stylesheet" href="styles/Login_Register.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     
    	<%
        	boolean[] err_mes = null;
        	if(request.getAttribute("err_messages") != null) {
         	    err_mes = (boolean[]) request.getAttribute("err_messages");
        	}
    	%> 
    
        <style>       
            .form_container {
                width          : 600px;
                margin         : 5vw auto 5vw auto;
            }
    
            #sub_but {
                width          : 45%;
                margin         : 20px 20px 0 0;
            }
    
            #link {
                color          : #0E2954;
            }
    
            #link:hover {
                color          : #092450;
                font-weight    : 700;
            }
    
            @media screen and (max-width : 780px) {
                .form_container {
                    width : 90%;
                }
            }
        </style>  
    </head>
    <body>
    <div class="form_container">
            <form action="Register1_Register2" method="post">
                <div style="text-align : center;margin-bottom: 20px;">
                    <div id="login_title" style="font-size: 40px; font-weight : 600;">Email details</div>
                </div>

                <div class="mb-3">
                  <label for="exampleInputEmail1" class="form-label">Email address</label>
                  <input type="email" name="email_id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                </div>
                
                <% 
                    if(request.getAttribute("err_messages") != null) {	
                    if(err_mes[0] != true) {
                %>
                    <div class="alert alert-danger" role="alert">
                    	 Email address already used !!
                    </div>
                <%
                    }
                    }
                %>
                
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Password</label>
                  <input type="password" name="password" class="form-control" id="exampleInputPassword1" style="font-family: Verdana, sans-serif;letter-spacing: 3px;" maxlength="20" required>
                </div>
                
                
                <% 
                    if(request.getAttribute("err_messages") != null) {	
                    if(err_mes[1] != true) {
                %>
                    <div class="alert alert-danger" role="alert">
                    	 Please enter a strong password !!
                    </div>
                <%
                    }
                    }
                %>
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Confirm Password</label>
                  <input type="password" name="c_password" class="form-control" id="exampleInputPassword1" style="font-family: Verdana, sans-serif;letter-spacing: 3px;" maxlength="20" required>
                </div>
                
                <% 
                    if(request.getAttribute("err_messages") != null) {
                    if(err_mes[2] != true) {
                %>
                    <div class="alert alert-danger" role="alert">
                     	Password doesn't match !!
                    </div>
                <%
                    }
                    }
                %>
                
                <div id="passwordHelpBlock" class="form-text" style="font-size: 14px; color : #282828; margin-bottom : 10px; text-align : center;">
                  	Your password must be 8-20 characters long, must contain atleast one uppercase letter, symbol and number.
                </div>
                
                <div style="text-align: center;">
                    <a>Already have an account? </a><a href="Login.jsp" id="link">Sign In</a>
                </div>
                <div class="but_holder">
                    <div style="float: left; margin-top : 20px;">Steps : </div>
                        <ul class="pagination pagination-sm" style="width : 30%; display : inline-flex; float : left; margin-left : 10px; margin-top : 20px;">
                          
                          <li class="page-item active" aria-current="page" style="width : 20%;  text-align : center; background-color : #0E2954; border-radius : 4px;">
                            <span class="page-link" style="background-color : #0E2954; border-color: #0E2954;">1</span>
                          </li>
                          <li class="page-item" style="width : 20%; text-align : center;"><div class="page-link" style=" color : #0E2954;">2</div></li>
                          <li class="page-item" style="width : 20%; text-align : center;"><div class="page-link" style=" color : #0E2954;">3</div></li>
                          <li class="page-item" style="width : 20%; text-align : center;"><div class="page-link" style=" color : #0E2954;">4</div></li>
                        </ul>
                  <button type="submit" class="btn btn-primary" id="sub_but">Next</button>
                </div>
            </form>
    </div>
</body>
</html>
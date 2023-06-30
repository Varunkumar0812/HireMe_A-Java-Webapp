<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Registration - User Selection Page</title>
    
    <link rel="icon" type="image/x-icon" href="images/logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    
    <style>       
        body {
            background      : url("images/bg7.jpg") no-repeat center/cover;
            color           :black;
        }
    
       .form_container {
            background      : rgb(173, 173, 173, 0.7);
            width           : 600px;
            margin          : 10vw auto auto auto;
            padding         : 40px;
            border          : 2px solid;
            border-radius   : 5px;
       }
    
       #sub_but {
            background      :#0E2954;
            width           : 50%;
            margin          : 20px 20px 0 0;
            border-color    :#0E2954;
       }
    
       #sub_but:hover {
            background      :#02132e;
       }
    
       #link {
            color           : #0E2954;
       }
    
       #link:hover {
            color           : #092450;
            font-weight     : 700;
       }
    
       .but_holder {
            width           : 100%;
            margin          : 10px 15px 0 15px; 
            padding-top     : 10px; 
            text-align      : right; 
       }

	   select {
            width           : 60%;
            height          : 40px;
            padding         : 0 10px 0 10px;
            border          : 1px solid rgb(199, 199, 199);
            border-radius   : 6px;
       }
    
       @media screen and (max-width : 1200px) {
            body {
                background  : url("images/bg8.jpg") no-repeat center/cover;
            }
       }
    
       @media screen and (max-width : 780px) {
            .form_container {
                width      : 90%;
            }
       }
       
    </style>
        
</head>
<body>    
        <div class="form_container">
            <form action="Register3_Register4" method="post">
                <div style="text-align : center;margin-bottom: 20px;">
                    <div id="login_title" style="font-size: 40px; font-weight : 600;">User type</div>
                </div>
                
                <div class="mb-3" style="text-align: center;">
                  <label for="exampleInputEmail1" class="form-label" style="font-size: 20px; margin-top : 15px;">Tell us why are you using HireMe for ?</label>
                </div>

                <div style="text-align : center;">
                    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="userType">
                        <option>Job Seeker</option>
                        <option>Job Provider</option>
                      </select>
                 </div>
                
                <div class="but_holder">
                    <div style="float: left; margin-top : 20px;">Steps : </div>
                        <ul class="pagination pagination-sm" style="width : 30%; display : inline-flex; float : left; margin-left : 10px; margin-top : 20px;">
                          <li class="page-item" style="width : 20%; text-align : center;"><div class="page-link" style=" color : #0E2954;">1</div></li>
                          <li class="page-item" style="width : 20%; text-align : center; color : #0E2954;"><div class="page-link" style=" color : #0E2954;">2</div></li>
                          
                          <li class="page-item active" aria-current="page" style="width : 20%;  text-align : center; background-color : #0E2954; border-radius : 4px;">
                            <span class="page-link" style="background-color : #0E2954; border-color: #0E2954;">3</span>
                          </li>
                          <li class="page-item" style="width : 20%; text-align : center;"><div class="page-link" style=" color : #0E2954;">4</div></li>
                          
                          
                        </ul>
                  <input name="emailID" style="display : none" value='<%= session.getAttribute("emailID") %>'/>
                  <button type="submit" class="btn btn-primary" id="sub_but">Next</button>
                </div>
              </form>
    
        </div>
    </body>
    </html>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Logout Confirmation Page</title>
    
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
        <link rel="stylesheet" href="styles/MessagePageTemplate.css">

        <style>       
            .form_container {
                margin-top    : 6vw;
            }

            #sub_but1 { 
                background    : #be1a1a;
                color         : black;
                width         : 100%;
                border-color  :#0E2954;
                margin-right  : 20px;
            }

            #sub_but2 {
                background    : #00a316;
                color         : black;
                width         : 100%;
                border-color  :#0E2954;
                margin-right  : 20px;
            }
    
            #sub_but1:hover, #sub_but2:hover {
                background    : #02132e;
                color         : white;
            }
    
            .but_holder {
                width         : 100%;
                position      : relative;
                margin-bottom : 40px;
                padding-right : 22px;
            }
    
        </style>

    </head>
    <body>
    
    
    <%
    	String emailID = null;
    	if(request.getAttribute("emailID") != null) {
    		emailID = (String) request.getAttribute("emailID");
    	}
    	
    %> 
    
        <div class="form_container">
                <div style="text-align : center;margin-bottom: 20px;">
                    <div id="login_title" style="font-size: 30px; font-weight : 600;"></div>
                </div>
                
                <div class="mb-3" style="text-align: center;">
                  <label for="exampleInputEmail1" class="form-label" style="font-size: 28px; margin-top : 5px;">Do you really want to logout ?</label>
                </div>
                
                <div style="text-align: center;">
                    <img src="images/logout.jpg" height="300px"></img>
                </div>

                <div class="but_holder">
                    <form action="JPDashboardRedirect" method="post" style="width : 45%; float : left;">
                        <input type="text" name="emailID" value="<%= emailID %>" style="display : none;"/>
                        <button type="submit" class="btn btn-primary" id="sub_but1">No</button>
                    </form>
                    <form action="LandingPage.jsp" style="width : 45%; float : right;">
                        <button type="submit" class="btn btn-primary" id="sub_but2">Yes</button>
                    </form>
                </div>
    
        </div>
    </body>
    </html>
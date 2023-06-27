<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Acceptance message sent successfully</title>
    
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    	<link rel="stylesheet" href="styles/MessagePageTemplate.css">

		<style>
			.form_container {
				margin-top     : 5vw;
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
            <form action="JSDashboardRedirect" method="post">
                <div style="text-align : center;margin-bottom: 20px;">
                    <div id="login_title" style="font-size: 30px; font-weight : 600;">Acceptance message </div>
                </div>
                
                <div class="mb-3" style="text-align: center;">
                  <label for="exampleInputEmail1" class="form-label" style="font-size: 18px; margin-top : 5px;">sent successfully !!</label>
                </div>
                
                <div style="text-align: center;">
                    <img src="images/message_sent.jpg" weight="300px" height="300px"></img>
                </div>

                <div class="but_holder">
                	<input type="text" value="<%= emailID %>" name="emailID" style="display : none"/>
                  	<button type="submit" class="btn btn-primary" id="sub_but">Go to dashboard</button>
                </div>
              </form>
    
        </div>
    </body>
    </html>
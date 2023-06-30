<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
	<title>Account Created Successfully</title>
        
    <link rel="icon" type="image/x-icon" href="images/logo.png">
	<link rel="stylesheet" href="styles/MessagePageTemplate.css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

</head>
<body>
<%
	String firstName = (String) session.getAttribute("firstName");
	String lastName  = (String) session.getAttribute("lastName");
%>
<div class="form_container">
	<div style="text-align : center;margin-bottom: 20px;">
    	<div id="login_title" style="font-size: 30px; font-weight : 600;">Congratulations <%= firstName %> <%= lastName %>, </div>
	</div>
                
	<div class="mb-3" style="text-align: center;">
    	<label for="exampleInputEmail1" class="form-label" style="font-size: 18px; margin-top : 5px;">account created successfully !!</label>
	</div>
                
	<div style="text-align: center;">
    	<img src="images/handshake.png" height="100%"></img>
	</div>

	<div class="but_holder">
    	<button type="submit" onclick="location.href='JPDashboard_ProfilePage.jsp'" class="btn btn-primary" id="sub_but">Go to dashboard</button>
	</div>
</div>

</body>
</html>
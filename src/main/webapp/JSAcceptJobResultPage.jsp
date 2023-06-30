<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Acceptance message sent successfully</title>
  
    <link rel="icon" type="image/x-icon" href="images/logo.png">
  	<link rel="stylesheet" href="styles/MessagePageTemplate.css">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
  
	<style>
		.form_container {
			margin-top     : 5vw;
		}
	</style>
</head>
<body>

<div class="form_container">
	<div style="text-align : center;margin-bottom: 20px;">
    	<div id="login_title" style="font-size: 30px; font-weight : 600;">Acceptance message </div>
    	<div class="mb-3" style="text-align: center;">
   			<label for="exampleInputEmail1" class="form-label" style="font-size: 18px; margin-top : 5px;">sent successfully !!</label>
		</div>
	</div>
                
	<div style="text-align: center;">
    	<img src="images/message_sent.jpg" height="300px"></img>
	</div>

	<div class="but_holder">
    	<button class="btn btn-primary" id="sub_but" onclick="location.href='JSDashboard_ProfilePage.jsp'">Go to dashboard</button>
	</div>
</div>

</body>
</html>
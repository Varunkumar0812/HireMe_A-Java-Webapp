<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Apply for job page</title>
	
	<link rel="icon" type="image/x-icon" href="images/logo.png">
	<link rel="stylesheet" href="styles/Dashboard.css">

	<style>
		@import url('https://fonts.googleapis.com/css2?family=Merriweather+Sans:wght@500&family=Poppins:wght@500&family=Roboto+Slab:wght@600&family=Varela+Round&display=swap');
		 
	    .main-content {
	        padding-right   : 100px;
	    }
	    
	    .title {
	        color           :#0E2954;
	        margin-bottom   : 20px;
	        padding         : 10px 0 10px 0;
	        font-size       : 30px;
	        font-weight     : 1000;
	    }
	    
	    .holderbox {
	        position        : relative;
	        display         : flex;
	    }
	    
	    .com_name {
	        width           : 48%;
	        margin-right    : 20px;
	        float           : left;
	    }
	    
	    .holderbox > div > div {
	        margin-bottom   : 10px;
	    }
	    
	    .salary {
	        width           : 48%;
	        float           : right;
	    }
	    
	    .holderbox2 {
	        margin-top      : 25px;
	    }
	    
	    #accept_but {
	        background      : #409dd7;
	        height          : 40px;
	        width           : 120px;
	        margin-left     : 20px;
	        border          : none;
	        border-radius   : 5px;
	        font-size       : 20px;
	    }
	    
	    #accept_but:hover {
	        background      : #02132e;
	        color           : white;
	        cursor          : pointer;
	    }
    </style>

</head>
<body>   

<%
   	String job_id = null;
   	if(request.getAttribute("job_id") != null) {
   		job_id = (String) request.getAttribute("job_id");
   	}
%> 
    
<div class="container">
    <nav class="nav" style="padding : 5px;">
 	   <div style="height : 70px;">
    	   <div id="logo">HireMe</div>
       </div>
    </nav>

    <div class="sidebar">
    	<ul>
        	<li><input type="submit" value="My Profile" onclick="location.href='JSDashboard_ProfilePage.jsp'"/></li>
            <li><input type="submit" value="My Applications" onclick="location.href='JSDashboard_ApplicationsPage.jsp'"/></li>
            <li><input type="submit" value="Logout" onclick="location.href='JSLogoutPage.jsp'"/></li>
       	</ul>
   	</div>
        
	<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		Statement stmt = con.createStatement();
    		ResultSet rs = stmt.executeQuery("SELECT * FROM Jobs WHERE job_id=\"" + job_id + "\"");

    		while (rs.next()) {
    			if(rs.getString(1) != null) {
	%> 
    <div class="main-content">
    	<div class="title"><%= rs.getString(4) %></div>

    	<div class="holderbox">
    		<div class="com_name">
    			<div><b>Company name</b></div>
    			<div><%= rs.getString(3) %></div>
    		</div>
    		<div class="salary">
    			<div><b>Salary</b></div>
    			<div><%= rs.getString(8) %></div>
    		</div>
    	</div>
    		            
    	<div class="holderbox2">
    		<div style="margin-bottom : 10px;"><b>Minimum experience needed</b></div>
    		<div><%= rs.getString(5) %></div>
    	</div>
		<div class="holderbox2">
    		<div style="margin-bottom : 10px;"><b>Responsibility</b></div>
    		<div><%= rs.getString(6) %></div>
		</div>

    	<div class="holderbox2">
    		<div style="margin-bottom : 10px;"><b>Description</b></div>
    		<div><%= rs.getString(7) %>s</div>
    	</div>

    	<div class="holderbox2">
    		<form action="JSApplyJobView_JSApplyJobResult" style="display : flex;" method="post">
    			<div style="margin-top : 8px;">Would you like to apply for this job ?</div>
    			<input type="text" value="<%= session.getAttribute("emailID") %>" name="emailID" style="display : none">
    		    <input type="text" value="<%= rs.getString(2) %>" name="job_id" style="display : none">
    		    <input type="submit" value="Apply" id="accept_but"/>
    		</form>
    	</div>
	</div>	
	<%	
    	}
   		}
		rs.close();
    	stmt.close();
    	con.close();
    	} catch (Exception e) { }
    %>
</div>

</body>
</html>
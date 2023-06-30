<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Applicants Page</title>

<link rel="icon" type="image/x-icon" href="images/logo.png">
<link rel="stylesheet" href="styles/Dashboard.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Merriweather+Sans:wght@500&family=Poppins:wght@500&family=Roboto+Slab:wght@600&family=Varela+Round&display=swap');

#search_job_but {
    background    : #409dd7;
    height        : 40px;
    width         : 120px;
    margin-top    : 20px;
    border        : 1px solid;
    border-radius : 4px;
    font-size     : 16px;
}

#search_job_but:hover {
    background    :#02132e;
    color         : white;
    cursor        : pointer;
}

.job_box {
    background    : rgb(255, 255, 255);
    margin        : 10px 0 0 10px;
    padding       : 10px;
    border        : 2px solid black;
    border-radius : 3px;
    border-style  : outset;
}

.job_box:hover {
    padding       : 11px;
    cursor        : default;
    transition    : 0.2s;
}

#job_title {
    color         :#00154d;
    width         : 100%; 
    margin        : 0 10px 10px 10px;
    font-size     : 25px;
    font-weight   : 1000;
    float         : left; 
}

#job_status {
    background    : #00B050; 
    margin        : 10px;
    margin-top    : -40px;
    padding       : 5px;
    font-size     : 20px;
    border-radius : 5px; 
    float         : right; 
    text-align    : center;
}

#job_status:hover {
    background    : #00154d;
    color         : white;
    padding       : 6px;
    cursor        : pointer;
    transition    : 0.2s;
}

#job_company {
    margin-left   : 10px;
    font-size     : 22px;
}

#job_desc {
    color         :#656565;
    height        : 21px;
    margin        : 5px 0 10px 10px;
    font-size     : 18px;
    overflow      : hidden;
}

@media (max-width : 900px) {
    #job_status {
        width : 20%;
    }
}

</style>

</head>
<body>
     <%
     	String job_id = null;
    	if(request.getAttribute("job_id") != null ){
    		job_id = (String) request.getAttribute("job_id");
    	}
    %>
    
    <%!
    	public static String getName(String emailID) {
    		String name = null;
    		
    		try {
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    			PreparedStatement stmt = con.prepareStatement("SELECT first_name, last_name FROM Users WHERE email_id=?");
    			stmt.setString(1, emailID);
    			
    			ResultSet rs = stmt.executeQuery();
    			
    			while(rs.next()) {
    				name = rs.getString(1);
    			}
    			
    			rs.close();
    			stmt.close();
    			con.close();
    		}
    		catch(Exception e) {
    			
    		}

    		return name;
    }
    
    
    %>
    
    
<div class="container">
	<nav class="nav" style="padding : 5px;">
    	<div style="height : 65px;">
        	<div id="logo">HireMe</div>
        </div>
    </nav>

    <div class="sidebar">
    	<ul>
        	<li><input type="submit" value="My Profile" onclick="location.href='JPDashboard_ProfilePage.jsp'"/></li>
            <li><input type="submit" value="My Jobs" onclick="location.href='JPDashboard_JobsPage.jsp'"/></li>
            <li><input type="submit" value="Logout" onclick="location.href='JPLogoutPage.jsp'"/></li>
       	</ul>
   	</div>

    <div class="main-content">
    	<div style="width : 89%;">
        	<div style="position: relative; height : 50px;">
            	<h1 id="title" style="float: left; margin-top : 0px;">Applicants</h1>
            </div>
                
            <hr id="hr-sep">

            <div>Here is a list of applicants who applied for this job.</div>

            <div style="padding : 10px; margin-top : 20px;">
            <%
			try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT email_id FROM applications WHERE job_id=\"" + job_id + "\" AND status!=\"Offered\" ");  
					while(rs.next())  {
			%> 
				<div class="job_box">
		        	<div style='position : relative;'>
		            	<div id="job_title"><%= getName(rs.getString(1)) %></div>
		                	<form action="JPJobPage_JPApplicant" method="post">
		                    	<input type="text" name="job_id" value="<%= job_id %>" style="display : none;"/>
		                        <input type="text" name="emailID" value="<%= session.getAttribute("emailID") %>" style="display : none;"/>
		                       	<input type="text" name="ApplicantemailID" value="<%= rs.getString(1) %>" style="display : none;"/>
		                        <input type="submit" id="job_status" style="border : none;" value="More details"/>
		                    </form>
		                </div>
		            <div id="job_company">Contact : <%= rs.getString(1) %></div>
	            </div>
		    <%		
					}
					rs.close();
					stmt.close();
					con.close();
				}
				catch(Exception e) {}
			%>
			</div>
		</div>
	</div>
</div>
    
</body>
</html>
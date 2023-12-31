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
	
	<title>Dashboard - Applications Page</title>

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
		    background    : #02132e;
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
			transform     : scale(1.025);
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
		    background    : rgb(222, 15, 15); 
		    width         : 110px;
		    margin        : 10px;
		    padding       : 5px;
		    font-size     : 20px;
		    border-radius : 5px; 
		    float         : right; 
		    text-align    : center;
		}
		
		#job_status:hover {
		    padding       : 6px;
		    cursor        : default;
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
	</style>

</head>
<body>
    
	<%!
    	public static String getJobComp(String job_id) {
    		String res = null;
    		
    		try {
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    			Statement stmt = con.createStatement();
    			ResultSet rs = stmt.executeQuery("SELECT com_name FROM Jobs WHERE job_id=\"" + job_id + "\"");

    			while (rs.next()) {
    				if(rs.getString(1) != null) {
    					res = rs.getString(1);
    				}
    			}

    			rs.close();
    			stmt.close();
    			con.close();
    		} catch (Exception e) {

    		}
    		
    		return res;
    	}

    	public static String getJobTitle(String job_id) {
    		String res = null;
    		
    		try {
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    			Statement stmt = con.createStatement();
    			ResultSet rs = stmt.executeQuery("SELECT job_title FROM Jobs WHERE job_id=\"" + job_id + "\"");

    			while (rs.next()) {
    				if(rs.getString(1) != null) {
    					res = rs.getString(1);
    				}
    			}

    			rs.close();
    			stmt.close();
    			con.close();
    		} catch (Exception e) {

    		}
    		
    		return res;
    	}
    	public static String getJobDescr(String job_id) {
    		String res = null;
    		
    		try {
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    			Statement stmt = con.createStatement();
    			ResultSet rs = stmt.executeQuery("SELECT description FROM Jobs WHERE job_id=\"" + job_id + "\"");

    			while (rs.next()) {
    				if(rs.getString(1) != null) {
    					res = rs.getString(1);
    				}
    			}

    			rs.close();
    			stmt.close();
    			con.close();
    		} catch (Exception e) {

    		}
    		
    		return res;
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

	<div class="main-content">
    	<div style="width : 89%;">
    		<div style="position: relative; height : 50px;">
        		<h1 id="title" style="float: left; margin-top : 0px;">My Applications</h1>
        	</div>
                
        	<hr id="hr-sep">

        	<div style="font-size : 22px;">
                Jobs for which you have applied for appear here.                
                Click to search for new jobs.
                <br>
				<input type="submit" onclick="location.href='JSJobSearchingPage.jsp'" id="search_job_but" value="Search Jobs"/>
            </div>

            <div style="padding : 0px; margin-top : 20px;">
			<%  		
				try {
		    		Class.forName("com.mysql.cj.jdbc.Driver");
		    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
		    		Statement stmt = con.createStatement();
		    		ResultSet rs = stmt.executeQuery("SELECT job_id, status FROM Applications WHERE email_id=\"" + session.getAttribute("emailID") + "\"");
		
		    		while (rs.next()) {
		    			if(rs.getString(1) != null) {
			%>
		    	<div class="job_box">
		        	<div style='position : relative;'>
		            	<div id="job_title"><%= getJobTitle(rs.getString(1)) %></div>
		                <% if(rs.getString(2).equals("Reviewed")) {    %>                       
			            	<div id="job_status" style="background-color : #FFCC00;"><%= rs.getString(2) %></div>
			            <% }else if(rs.getString(2).equals("Not Seen")) { %>
			           	    <div id="job_status" style="background-color : #757575;"><%= rs.getString(2) %></div>
			           	<% }else if(rs.getString(2).equals("Rejected")) { %>
			            	<div id="job_status" style="background-color : rgb(222, 15, 15);"><%= rs.getString(2) %></div>
			        	<% }else if(rs.getString(2).equals("Offered")) { %>
			            	<form action="JSApplications_JSAcceptJobView" method="post">
			                	<input type="text" value="<%= rs.getString(1) %>" name="job_id" style="display : none"/>
			                	<input type="text" value="<%= session.getAttribute("emailID") %>" name="emailID" style="display : none"/>
					        	<input type="submit" id="job_status" style="background-color : #00B050; border : none;" value="Offered"/>
					        </form>
						<% }  %>
		            </div>
		            <div id="job_company"><%= getJobComp(rs.getString(1)) %></div>
		            <div id="job_desc"><%= getJobDescr(rs.getString(1)) %></div>
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
		</div>
	</div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard - Jobs page</title>

<link rel="stylesheet" href="styles/Dashboard.css">

<style>


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


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Courgette&family=Nunito&family=PT+Sans&family=Play:wght@700&family=Roboto+Slab:wght@600&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Merriweather+Sans:wght@500&family=Merriweather:wght@300&family=Poppins:wght@500&family=Varela+Round&display=swap" rel="stylesheet">
<body>
    
    <%
    	String emailID = null;
    	if(request.getAttribute("emailID") != null) {
    		emailID = (String) request.getAttribute("emailID");
    	}
    %>
    
    
    <%!

public ArrayList<ArrayList<String>> getJobs(String email_id) {
	ArrayList<ArrayList<String>> jobs_list = new ArrayList<ArrayList<String>>();
	
	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM Jobs WHERE email_id=\"" + email_id + "\"");  
			while(rs.next())  {
				
				ArrayList<String> tuple = new ArrayList<String>();	
				
				tuple.add(rs.getString(1));
				tuple.add(rs.getString(2));
				tuple.add(rs.getString(3));
				tuple.add(rs.getString(4));
				tuple.add(String.valueOf(rs.getInt(5)));
				tuple.add(rs.getString(6));
				tuple.add(rs.getString(7));
				tuple.add(String.valueOf(rs.getString(8)));
				
				jobs_list.add(tuple);
			}
			
			rs.close();
			stmt.close();
			con.close();
		}
		catch(Exception e) {
		}
		
		return jobs_list;
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
                <li>
                    <form action="JPDashboardRedirect" method="post">
                    	<input type="text" value="<%= emailID %>" name="emailID" style="display : none"/>
                        <input type="submit" value="My Profile">
                     </form>
                </li>
                <li>
                    <form action="JPJobsRedirect" method="post">
                    	<input type="text" value="<%= emailID %>" name="emailID" style="display : none"/>
                        <input type="submit" value="My Jobs">
                     </form>
                </li>
                <li>
                    <form action="JPLogout" method="post">
                    	<input type="text" value="<%= emailID %>" name="emailID" style="display : none"/>
                        <input type="submit" value="Logout">
                     </form>
                </li>
            </ul>
        </div>

        <div class="main-content">
            <div style="width : 89%;">
            	<div style="position: relative; height : 50px;">
                    <h1 id="title" style="float: left; margin-top : 0px;">My Jobs</h1>
                </div>
                
                <hr id="hr-sep">

            <div>
                The jobs which you have created appear here                
                Click to create a new job.
                <br>
                <form action="JPJobs_JPCreateJob" method="post">
                	
                	<input type="text" name="emailID" value="<%= emailID %>" style="display : none;"/>
                	<input type="submit" id="search_job_but" value="Create Job"/>
                
                </form>
            </div>

            <div style="padding : 10px; margin-top : 20px;">
            
             
            <% 
				for(ArrayList<String> i : getJobs(emailID)) {
			%>			
			    <div class="job_box">
                    <div style='position : relative;'>
                        <div id="job_title"><%= i.get(3) %></div>
                        <form action="JPJobs_JPJobPage" method="post">
                        	<input type="text" name="email_id" value="<%= emailID %>" style="display : none;"/>
                            <input type="text" name="job_id" value="<%= i.get(1) %>" style="display : none;"/>
                        
                            <input type="submit" id="job_status" style="border : none;" value="View Applicants"/>
                        </form>
                    </div>
                    <div id="job_company"><%= i.get(2) %></div>
                    <div id="job_desc"><%= i.get(6) %></div>
                </div>
			
			<%		
				}	
			%> 

                </div>
            </div>
            
        </div>

    </div>

</body>
</html>
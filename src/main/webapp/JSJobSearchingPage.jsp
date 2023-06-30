<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
	<title>Jobs Searching Page</title>
	
	<link rel="icon" type="image/x-icon" href="images/logo.png">
	<link rel="stylesheet" href="styles/Dashboard.css">

	<style>
		@import url('https://fonts.googleapis.com/css2?family=Merriweather+Sans:wght@500&family=Poppins:wght@500&family=Roboto+Slab:wght@600&family=Varela+Round&display=swap');
		
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
		    background    : #409dd7; 
		    width         : 110px;
		    margin        : 10px;
		    padding       : 5px;
		    font-size     : 20px;
		    border-radius : 5px; 
		    float         : right; 
		    text-align    : center;
		    border        : none;
		}
		
		
		#job_status:hover {
		    background      : #02132e;
		    color           : white;
		    cursor          : pointer;
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
static ArrayList<ArrayList<String>> JOBS = new ArrayList<ArrayList<String>>();

public static ArrayList<String> getJSSkills(String emailID) {
	ArrayList<String> tuple  = new ArrayList<String>();
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
		PreparedStatement stmt = con.prepareStatement("SELECT skill FROM JS_Skills WHERE email_id = ?");
		stmt.setString(1, emailID);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getString(1) != null) {
				tuple.add(rs.getString(1));
			}
		}
		
		rs.close();
		stmt.close();
		con.close();
	}
	catch(Exception e) {
	}
	
	return tuple;
}

public static void compareHowMany(ArrayList<String> users_list, String job_id) {
    ArrayList<String> tuple = new ArrayList<String>();

    int count = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
        PreparedStatement stmt = con.prepareStatement("SELECT skill FROM Job_Skills WHERE job_id=?");

        stmt.setString(1, job_id);

        ResultSet rs = stmt.executeQuery();

        while(rs.next()) {
            if(rs.getString(1) != null && users_list.contains(rs.getString(1))) {
                count += 1;
            }
        }
    }
    catch(Exception e) {
    }

    tuple.add(job_id);
    tuple.add(String.valueOf(count));

    JOBS.add(tuple);
}

public static ArrayList<ArrayList<String>> sortJOBS() {
    ArrayList<ArrayList<String>> sortedJOBS = new ArrayList<ArrayList<String>>();
    int a, b;

    int max;
    int limit = JOBS.size();

    while(sortedJOBS.size() < limit) {
    	max = 0;
        for(int i = 0;i < JOBS.size() - 1;i++) {
            a = Integer.parseInt(JOBS.get(i).get(1));
            b = Integer.parseInt(JOBS.get(max).get(1));

            if(b < a) {
                max = i;
            }
        }
        sortedJOBS.add(JOBS.get(max));
        JOBS.remove(max);
    }

    return sortedJOBS;
}

public static boolean notAlreadyApplied(String emailID, String job_id) {
	boolean valid = true;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
		PreparedStatement stmt = con.prepareStatement("SELECT status FROM Applications WHERE email_id=? AND job_id=?");
		
		stmt.setString(1, emailID);
		stmt.setString(2, job_id);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getString(1).equals("Not Seen")) {
				valid = false;
			}
		}
		
		rs.close();
		stmt.close();
		con.close();
	}
	catch(Exception e) {
	}
	
	return valid;
}

public static void getMatchingJobs(ArrayList<String> users_list, String emailID) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
		PreparedStatement stmt = con.prepareStatement("SELECT job_id, skill FROM Job_Skills");
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getString(1) != null && users_list.contains(rs.getString(2)) && notAlreadyApplied(emailID, rs.getString(1))) {
				compareHowMany(users_list, rs.getString(1));
			}
		}
		
		rs.close();
		stmt.close();
		con.close();
	}
	catch(Exception e) {
	}

}
%>
<%
	String emailID = (String) session.getAttribute("emailID");
	
	getMatchingJobs(getJSSkills(emailID), emailID);
	ArrayList<ArrayList<String>> sortedJOBS = sortJOBS();
	
	ArrayList<ArrayList<String>> finalJOBSList = new ArrayList<ArrayList<String>>();
	
	for(ArrayList<String> i : sortedJOBS) {
		if(!finalJOBSList.contains(i)) {
			finalJOBSList.add(i);
		}
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
			<h1 id="title" style="float: left; margin-top : 0px;">Jobs</h1>
		</div>
                
		<hr id="hr-sep">

		<div>
			<div style="margin-bottom : 30px;">Here are a list of jobs available that matches your skill set</div>
			<%!
				public static ArrayList<String> getJobDetails(String job_id) {
					ArrayList<String> tuple = new ArrayList<String>();
					try {
                		Class.forName("com.mysql.cj.jdbc.Driver");
                		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
                		PreparedStatement stmt = con.prepareStatement("SELECT job_id, job_title, com_name, description FROM Jobs WHERE job_id=?");
                			
                		stmt.setString(1, job_id);
                			
                		ResultSet rs = stmt.executeQuery();
                			
               			while(rs.next()) {
              				tuple.add(rs.getString(1));
               				tuple.add(rs.getString(2));
               				tuple.add(rs.getString(3));
               				tuple.add(rs.getString(4));               				
               			}
               		}
               		catch(Exception e) { }
 					return tuple;
                }%>
                
                <% 
                	for(ArrayList<String> i : finalJOBSList) {
                		ArrayList<String> tuple = getJobDetails(i.get(0)); %>    
                		   <div class="job_box">
			                    <div id="job_title"><%= tuple.get(1) %></div>
						             <form action="JSJobSearching_JSApplyJobView" method="post">
						             	<input type="text" value="<%= tuple.get(0) %>" name="job_id" style="display : none"/>
						                <input type="text" value="<%= emailID %>" name="emailID" style="display : none"/>
								        <input type="submit" id="job_status" value="Apply"/>
								     </form>
			    	            <div id="job_company"><%= tuple.get(2) %></div>
					            <div id="job_desc"><%= tuple.get(3) %></div>        
			                </div>
               	<% } %>
            </div>  
        </div>
    </div>
</div>

</body>
</head>
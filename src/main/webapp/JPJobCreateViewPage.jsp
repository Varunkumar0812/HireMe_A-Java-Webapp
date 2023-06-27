<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create new job</title>

<link rel="icon" type="image/x-icon" href="images/logo.png">
<link rel="stylesheet" href="styles/Dashboard.css">

<style>

.main-content {
    padding-right   : 100px;
}

.title {
    color          :#0E2954;
    margin-bottom  : 20px;
    padding        : 10px 0 10px 0;
    font-size      : 30px;
    font-weight    : 1000;
}

.holderbox {
    margin-top     : 20px;
    position       : relative;
    display        : flex;
}

.com_name {
    width         : 48%;
    margin-right  : 20px;
    float         : left;
}

.holderbox > div > div {
    margin-bottom : 10px;
}

.salary {
    width         : 48%;
    float         : right;
}

.holderbox2 {
    margin-top    : 25px;
}

#accept_but {
    background    : #409dd7;
    height        : 40px;
    width         : 120px;
    margin-top    : 20px;
    border        : 1px solid;
    border-radius : 4px;
    font-size     : 16px;
}

#accept_but:hover {
    background    :#02132e;
    color         : white;
    cursor        : pointer;
}

.text-box {
    height        : 40px;
    width         : 50%;
    padding       : 0 10px 0 10px;
    border        : 1px solid grey;
    border-radius : 8px;
    font-size     : 20px;
}

select {
	width         : 100%;
    margin-top    : 10px;
	padding       : 10px;
}

select::-webkit-scrollbar {
    width         : 10px;
}

select::-webkit-scrollbar-track {
    width         : 5px;
    background    : rgb(255, 255, 255);
    border-radius : 10px;
    border-left   : 2px solid #0E2954;
    border-top    : 2px solid #0E2954;
}

select::-webkit-scrollbar-thumb {
    background    : #00154d;
    border-radius : 10px;
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
                    <input type="text" value="<%= emailID %>" name="emailID" style="display : none">
                        <input type="submit" value="My Profile">
                     </form>
                </li>
                <li>
                    <form action="JPJobsRedirect" method="post">
                    <input type="text" value="<%= emailID %>" name="emailID" style="display : none">
                        <input type="submit" value="My Jobs">
                     </form>
                </li>
                <li>
                    <form action="JPLogout" method="post">
                    <input type="text" name="emailID" value="<%= emailID %>" style="display : none"/>
                        <input type="submit" value="Logout">
                     </form>
                </li>
            </ul>
        </div>
        

    	<div class="main-content">

            <form action="JPCreateJob" method="post">
    		            <div class="title">
    		                Create Job
    		            </div>

    		            <div class="holderbox">
    		                <div class="com_name">
    		                    <div><b>Job Title</b></div>
    		                    <input type="text" name="job_tit" class="text-box" required/>
    		                </div>
    		                <div class="salary">
    		                    <div><b>Salary</b></div>
    		                    <input type="number" name="salary" class="text-box" required/>
    		                </div>
    		            </div>
    		            
    		            <div class="holderbox2">
    		                <div style="margin-bottom : 10px;"><b>Minimum experience needed</b></div>
    		                <input type="number" name="min_exp" class="text-box" required/>
    		            </div>

    		            <div class="holderbox2">
    		                <div style="margin-bottom : 10px;"><b>Responsibility</b></div>
    		                <input type="text" name="respon" class="text-box" required/>
    		            </div>

    		            <div class="holderbox2">
    		                <div style="margin-bottom : 10px;"><b>Description</b></div>
    		                <textarea name="descr" style="height : 150px; width : 52%; font-family: 'Varela', 'round'; font-size: 20px;"></textarea>
    		            </div>

                        <div class="holderbox2">
                            <div><b>Skills</b></div>

			                <%
								ArrayList<String> skills = new ArrayList<String>();
								
								try {
									Class.forName("com.mysql.cj.jdbc.Driver");
									Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
									Statement stmt = con.createStatement();
									ResultSet rs = stmt.executeQuery("SELECT skill FROM Skills");  
									while(rs.next())  {
										skills.add(rs.getString(1));
									}
									
									rs.close();
									stmt.close();
									con.close();
								}
								catch(Exception e) {
									
								}
								
								Collections.sort(skills);
							%>
			                <select name="skills" multiple style="height : 100px; width : 100%;">
			                    <%
									for(String i : skills) {
								%>
								<option><%= i %></option>
								<% } %>
			                </select>
                            
                        </div>

    		            <div class="holderbox2">
    		                    <input type="text" value="<%= emailID %>" name="emailID"  style="display : none">
    		                    <input type="submit" value="Create" id="accept_but"/>
    		            </div>   		            
				  </form>
    		                
    		  </div>

    	 </div>	

</body>
</html>
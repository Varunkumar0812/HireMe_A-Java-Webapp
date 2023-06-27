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
<title>Profile - Edit Page</title>

<link rel="icon" type="image/x-icon" href="images/logo.png">
<link rel="stylesheet" href="styles/Dashboard.css">


<style>
    select {
        margin        : 10px;
        width         : 100%;
    }
    
    #edit_but {
        background    : #AEDEFC;
        float         : right; 
        height        : 30px;
        width         : 100px; 
        margin        : 5px 15px 0 0;
        margin-right  : 15px; 
        margin-top    : 5px;
        border        : 1px solid; 
        border-radius : 3px;
        font-size     : 16px;
    }
    
    #edit_but:hover {
        background    :#0B2447;
        color         :white;
        cursor        : pointer;
        transition    : 0.3s;
    }
    
    .text-box {
        width         : 100%; 
        height        : 30px; 
        margin-top    : 10px;
        padding-left  : 10px;
        border-radius : 5px; 
        border        : 1px solid grey; 
        font-size     : 20px; 
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
                    	<input type="text" name="emailID" value="<%= emailID %>" style="display : none"/>
                        <input type="submit" value="My Profile">
                     </form>
                </li>
                <li>
                    <form action="JPJobsRedirect" method="post">
                    	<input type="text" name="emailID" value="<%= emailID %>" style="display : none"/>
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
		<form action="JPProfileEdit_JPProfile" method="post">
        <div class="main-content">
            <div style="width : 89%;">
            	<div style="position: relative; height : 50px;">
                    <h1 id="title" style="float: left; margin-top : 0px;">My Profile</h1>
                    <div style="margin-top : 8px; float : right; height : 50px; width : 15%;">
                    	 <input type="text" value="<%= emailID %>" name="emailID" style="display : none"/>
                         <input type="submit" id="edit_but" value="Save"/>                  
                    </div>
                </div>
                
                <hr id="hr-sep">

                <div class="name_container" id="nc1">
                    <div id="name_container_left">
                        <div><b>Company name</b></div><input type="text" name="comp_name" class="text-box" required/>
                    </div>
                    <div id="name_container_right">
                        <div><b>Service provided</b></div><input type="text" name="serv_type" class="text-box" required/>
                    </div>
                </div>
                
                <hr style="height : 2px; background-color: #0E2954; margin-bottom : 30px;">

                <div class="name_container" id="nc2">
                    <div style="margin-bottom : 20px;"><b>Address</b></div>   

                    <div id="name_container_left" style="width : 32%;">
                        <div><b>Door no.</b></div><input type="text" name="doorNo" class="text-box" required/>
                    </div>
                    <div id="name_container_right" style="width : 62%;">
                        <div><b>Street name</b></div><input type="text" name="streetName" class="text-box" required/>
                    </div>
                </div>

                <div class="name_container" id="nc3">
                    <div id="name_container_left" style="width : 28%;">
                        <div><b>City</b></div><input type="text" name="city" class="text-box" required/>
                    </div>
                    <div id="name_container_left" style="width : 34%;">
                        <div><b>State</b></div>
                <%
					ArrayList<String> states = new ArrayList<String>();
					
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT state from States");  
						while(rs.next())  {
							states.add(rs.getString(1));
						}
						
						rs.close();
						stmt.close();
						con.close();
					}
					catch(Exception e) {
						
					}
					
					Collections.sort(states);
				%>  
                <select name="state" id="inputState" class="form-select" style="margin-top : 10px; border-radius : 5px; height : 35px; padding : 0px;" required>
                    <%
						for(String i : states) {
					%>
					<option><%= i %></option>
					<% } %>
                </select>
                    </div>
                    <div id="name_container_right" style="width : 29%;">
                        <div><b>Pincode</b></div><input type="text" name="pincode" class="text-box" required/>
                    </div>
                </div>

                <hr style="height : 2px; background-color: #0E2954; margin-bottom : 30px; margin-top : 10x;">
                
			</div>
        </div>
        
        </form>


    </div>
</body>
</html>
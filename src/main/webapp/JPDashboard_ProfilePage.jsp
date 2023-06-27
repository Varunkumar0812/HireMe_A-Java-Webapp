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
<title>Dashboard - Profile page</title>

<link rel="stylesheet" href="styles/Dashboard.css">
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

<%
	ArrayList<String> tuple = new ArrayList<String>();
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM Company WHERE email_id=\"" + emailID + "\"");

		while (rs.next()) {
			tuple.add(rs.getString(8));
			tuple.add(rs.getString(1));
			tuple.add(rs.getString(2));
			tuple.add(rs.getString(3));
			tuple.add(rs.getString(4));
			tuple.add(rs.getString(5));
			tuple.add(rs.getString(6));
			tuple.add(rs.getString(7));
		}

		rs.close();
		stmt.close();
		con.close();
	} catch (Exception e) {

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

        <div class="main-content">
            <div style="width : 89%;">
            	<div style="position: relative; height : 50px;">
                    <h1 id="title" style="float: left; margin-top : 0px;">My Profile</h1>
                    <form action="JPProfile_JPProfileEdit" method="post" style="margin-top : 8px; float : right; height : 50px; width : 15%;">
                        <input type="text" value="<%= emailID %>" name="emailID" style="display : none;"/>
                        <input type="submit" id="edit_but" style="background : url('images/edit.png') no-repeat center/contain" value="         "/>
                    </form>
                </div>
                
                <hr id="hr-sep">

                <div class="name_container" id="nc1">
                    <div id="name_container_left">
                        <div><b>Company name</b></div><div style="margin-top : 10px;"><%= tuple.get(1) %></div>
                    </div>
                    <div id="name_container_right">
                        <div><b>Service provided</b></div><div style="margin-top : 10px;"><%= tuple.get(2) %></div>
                    </div>
                </div>
                
                <hr style="height : 2px; background-color: #0E2954; margin-bottom : 30px;">

                <div class="name_container" id="nc2">
                    <div style="margin-bottom : 20px;"><b>Address</b></div>   

                    <div id="name_container_left" style="width : 32%;">
                        <div><b>Door no.</b></div><div style="margin-top : 10px;"><%= tuple.get(3) %></div>
                    </div>
                    <div id="name_container_right" style="width : 62%;">
                        <div><b>Street name</b></div><div style="margin-top : 10px;"><%= tuple.get(4) %></div>
                    </div>
                </div>

                <div class="name_container" id="nc3">
                    <div id="name_container_left" style="width : 28%;">
                        <div><b>City</b></div><div style="margin-top : 10px;"><%= tuple.get(5) %></div>
                    </div>
                    <div id="name_container_left" style="width : 34%;">
                        <div><b>State</b></div><div style="margin-top : 10px;"><%= tuple.get(6) %></div>
                    </div>
                    <div id="name_container_right" style="width : 29%;">
                        <div><b>Pincode</b></div><div style="margin-top : 10px;"><%= tuple.get(7) %></div>
                    </div>
                </div>


            </div>
        </div>

    </div>

</body>
</html>
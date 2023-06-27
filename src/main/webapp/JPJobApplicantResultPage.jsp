<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Offer Message Result Page</title>
    
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
		<link rel="stylesheet" href="styles/MessagePageTemplate.css">

		<style>
			.form_container {
				margin-top   : 7vw;
			}
		</style>

    </head>
    <body>
    
    
<%
	String emailID = null;
	if(request.getAttribute("emailID") != null) {
		emailID = (String) request.getAttribute("emailID");
	}
	
	boolean message = true;
	if(request.getAttribute("message") != null) {
		message = (boolean) request.getAttribute("message");
	}
%>
<%
	ArrayList<String> names = new ArrayList<String>();
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT first_name, last_name FROM Users WHERE email_id=\"" + emailID + "\"");
		
		while(rs.next()) {
			names.add(rs.getString(1));
			names.add(rs.getString(2));
		}
		
		rs.close();
		stmt.close();
		con.close();
	}
	catch(Exception e) {
		
	}
%>
    
        <div class="form_container">
            <form action="JPDashboardRedirect" method="post">
                <div style="text-align : center;margin-bottom: 20px;">
                	<%
                		if(message) {
                	%>
                    	<div id="login_title" style="font-size: 30px; font-weight : 600;">Congratulations <%= " " + names.get(0) + " " + names.get(1) %>, </div>
                	<%
                		} else if(message != true) {
                	%>
                		<div id="login_title" style="font-size: 30px; font-weight : 600;">Sorry <%= " " + names.get(0) + " " + names.get(1) %>, </div>
                	<%
                		}
                	%>
                </div>
                
                <div class="mb-3" style="text-align: center;">
                
                	<%
                		if(message) {
                	%>
                    	<label for="exampleInputEmail1" class="form-label" style="font-size: 18px; margin-top : 5px;">offer sent successfully !!</label>
                	<%
                		} else if(message != true) {
                	%>
                		<label for="exampleInputEmail1" class="form-label" style="font-size: 18px; margin-top : 5px;">an error occured, try later :(</label>
                	<%
                		}
                	%>
                
                  
                </div>
                
                <div style="text-align: center;">
                
                	<%
                		if(message) {
                	%>
                    	<img src="images/message_sent.jpg"  height="250px"></img>
                	<%
                		} else if(message != true) {
                	%>
                		<img src="images/message_sent_not.png"  height="100%"></img>
                	<%
                		}
                	%>
                
                    
                </div>

                <div class="but_holder">
                  <input type="text" value="<%= emailID %>" style="display : none;" name="emailID"/>
                  <button type="submit" class="btn btn-primary" id="sub_but">Go to dashboard</button>
                </div>
              </form>
    
        </div>
    </body>
    </html>
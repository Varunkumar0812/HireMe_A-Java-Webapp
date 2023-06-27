<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.util.Collections" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration - Personal details page</title>

	<link rel="stylesheet" href="styles/Login_Register.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <style>       
        .form_container {
            width          : 800px;
            margin         : 5vw auto 5vw auto;
        }

        #sub_but {
            width          : 30%;
        }

        select {
            width          : 100%;
            height         : 40px;
            border-radius  : 6px;
            border         : 1px solid rgb(199, 199, 199);
        }

        @media screen and (max-width : 980px) {
            .form_container {
                width      : 90%;
            }
        }
    </style>
</head>
<body>

    <%
		boolean[] err_mess = new boolean[3];
		if(request.getAttribute("err_messages") != null) {
			err_mess = (boolean[]) request.getAttribute("err_messages");
		}
		else {
			err_mess[0] = true;
			err_mess[1] = true;
			err_mess[2] = true;
		}
	
		String[] warnings = new String[3];
	%>
   
    <%
   		String emailID = null;
   		if(request.getAttribute("emailID") != null) {
   			emailID = (String) request.getAttribute("emailID");
   		}
    %>


    <div class="form_container">
        <div style="text-align : center;margin-bottom: 20px;">
            <div id="login_title" style="font-size: 40px; font-weight : 600;">Personal details</div>
        </div>
        <form class="row g-3" action="Register2_Register3" method="post">
            <div class="col-md-6" style="margin-top : 15px;">
              <label for="inputEmail4" class="form-label">First name</label>
              <input name="firstName" type="text" class="form-control" id="inputEmail4" placeholder="Metta" required>
            </div>
            
            <div class="col-md-6" style="margin-top : 15px;">
              <label for="inputPassword4" class="form-label">Last name</label>
              <input name="lastName" type="text" class="form-control" id="inputPassword4" placeholder="Surendhar" required>
            </div>
            
            <div id="err-mes" style="margin-top : 15px; margin-left: 15px; width : 46%;">
 					<%
					if(!err_mess[0]) {
					%>
						<div class="alert alert-danger" role="alert" style="margin-bottom : 0px;">
						  First name not valid!
						</div>
					<%
					}
					%>
			</div> 
			
            <div id="err-mes" style="margin-top : 15px; margin-left: 30px; width : 46%;">
 				<%
				if(!err_mess[1]) {
				%>
					<div class="alert alert-danger" role="alert" style="margin-bottom : 0px;">
					  Last name not valid!
					</div>
				<%			
					}
				%>
			</div>
            <div class="col-12" style="margin-top : 15px;">
              <label for="inputAddress" class="form-label">Door no</label>
              <input name="door_no" type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" required>
            </div>
            <div class="col-12" style="margin-top : 15px;">
              <label for="inputAddress2" class="form-label">Street name</label>
              <input name="streetName" type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" required>
            </div>
            <div class="col-md-6" style="margin-top : 15px;">
              <label for="inputCity" class="form-label">City</label>
              <input name="city" type="text" class="form-control" id="inputCity" required>
            </div>
            <div class="col-md-4" style="margin-top : 15px;">
              <label for="inputState" class="form-label">State</label>
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
                <select name="state" id="inputState" class="form-select" required>
                    <%
						for(String i : states) {
					%>
					<option><%= i %></option>
					<% } %>
                </select>
            </div>
            <div class="col-md-2" style="margin-top : 15px;">
              <label for="inputZip" class="form-label">Pincode</label>
              <input name="pincode" type="number" class="form-control" id="inputZip" maxlength="6" required >
            </div>
            <div id="err-mes" style="width : 100%; text-align : left; margin-top : 15px; display : inline-flex; justify-content : right; margin-right : 15px;">
 					<%
					if(!err_mess[2]) {
					%>
						<div class="alert alert-danger" role="alert" style="width : 30%; margin-bottom : 0px;">
						  Pincode not valid!
						</div>
					<%
					}
					%>
			</div> 
            <input name="emailID" style="display : none" value='<%= emailID%>'/>
            <div class="but_holder">
                <div style="float: left; margin-top : 15px;">Steps : </div>
                    <ul class="pagination pagination-sm" style="width : 50%; display : inline-flex; float : left; margin-left : 10px; margin-top : 15px;">
                      <li class="page-item" style="width : 10%; text-align : center;"><div class="page-link" style=" color : #0E2954;">1</div></li>
                      
                      <li class="page-item active" aria-current="page" style="width : 10%;  text-align : center; background-color : #0E2954;">
                        <span class="page-link" style="background-color : #0E2954; border-color: #0E2954;">2</span>
                      </li>
                      
                      <li class="page-item" style="width : 10%; text-align : center;"><div class="page-link" style=" color : #0E2954;">3</div></li>
                      <li class="page-item" style="width : 10%; text-align : center;"><div class="page-link" style=" color : #0E2954;">4</div></li>
                    </ul>
              <button type="submit" class="btn btn-primary" id="sub_but">Next</button>
            </div>
          </form>
    </div>
    
</body>
</html>
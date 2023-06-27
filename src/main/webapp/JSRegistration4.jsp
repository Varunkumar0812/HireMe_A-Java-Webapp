<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration - Professional Details page</title>
    
    	<link rel="stylesheet" href="styles/Login_Register.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
    
        <style>       
            .form_container {
                width          : 600px;
                margin         : 10vw auto auto auto;
            }
    
            #sub_but {
                width          : 50%;
                margin         : 20px 20px 0 0;
            }
               
            select {
                width          : 60%;
                height         : 40px;
                padding        : 0 10px 0 10px;
                border         : 1px solid rgb(199, 199, 199);
                border-radius  : 6px;
            }
    
            @media screen and (max-width : 780px) {
                .form_container {
                    width      : 90%;
                }
            }
        </style>

    </head>
    <body>
    
     	<% 
			String emailID = null;
			if(request.getAttribute("emailID") != null) {
				emailID = (String) request.getAttribute("emailID");
			}
		%>
    
        <div class="form_container">
            <form action="JSRegister4_JSResultPage" method="post">
                <div style="text-align : center;margin-bottom: 20px;">
                    <div id="login_title" style="font-size: 40px; font-weight : 600;">Professional details</div>
                </div>

                <div class="mb-3" style="text-align: center;">
                  <label for="exampleInputEmail1" class="form-label" style="font-size: 20px; margin-top : 15px;">Choose all the skills you dabble at</label>
                </div>

                <div style="text-align : center;">
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
                <select name="skills" multiple style="height : 100px; width : 75%;">
                     <%
						for(String i : skills) {
					%>
					<option><%= i %></option>
					<% } %> 
                </select>
                 </div>
                
                <div class="but_holder">
                    <div style="float: left; margin-top : 20px;">Steps : </div>
                        <ul class="pagination pagination-sm" style="width : 30%; display : inline-flex; float : left; margin-left : 10px; margin-top : 20px;">
                          <li class="page-item" style="width : 20%; text-align : center;"><div class="page-link" style=" color : #0E2954;">1</div></li>
                          <li class="page-item" style="width : 20%; text-align : center;"><div class="page-link" style=" color : #0E2954;">2</div></li>
                          <li class="page-item" style="width : 20%; text-align : center;"><div class="page-link" style=" color : #0E2954;">3</div></li>
                          
                          <li class="page-item active" aria-current="page" style="width : 20%;  text-align : center; background-color : #0E2954; border-radius : 4px;">
                            <span class="page-link" style="background-color : #0E2954; border-color: #0E2954;">4</span>
                          </li>
                        </ul>
                        
                  <input name="emailID" style="display : none" value='<%= emailID%>'/>   
                  <button type="submit" class="btn btn-primary" id="sub_but">Next</button>
                </div>
              </form>
        </div>
    </body>
    </html>
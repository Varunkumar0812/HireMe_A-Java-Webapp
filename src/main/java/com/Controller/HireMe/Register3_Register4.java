package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Modal.HireMe.DBMSOperations;

/**
 * Servlet implementation class Register3_Register4
 */
@WebServlet("/Register3_Register4")
public class Register3_Register4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Register3_Register4() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userType = request.getParameter("userType");
		String emailID  = request.getParameter("emailID");
		
		int c = 0;
		
		if(userType.equals("Job Seeker")) {
			c = DBMSOperations.updateUserType(emailID, "JS");
		}
		else {
			c = DBMSOperations.updateUserType(emailID, "JP");
		}
		
		RequestDispatcher obj =  null;
		

		if(c > 0 && userType.equals("Job Seeker")) {
			obj = request.getRequestDispatcher("JSRegistration4.jsp");
			request.setAttribute("emailID", emailID);
			obj.forward(request, response);
		}
		else {
			obj = request.getRequestDispatcher("JPRegistration4.jsp");
			request.setAttribute("emailID", emailID);
			obj.forward(request, response);
		}
	}
}

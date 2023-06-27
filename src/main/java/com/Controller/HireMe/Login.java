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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailID  = request.getParameter("email_id");
		String password = request.getParameter("password");
		
		RequestDispatcher obj = null;
		
		if(DBMSOperations.checkRecord(emailID, password) != null) {
			if(DBMSOperations.checkRecord(emailID, password).equals("JS")) {
				obj = request.getRequestDispatcher("JSDashboard_ProfilePage.jsp");
				request.setAttribute("emailID", emailID);
				obj.forward(request, response);
			}
			else if(DBMSOperations.checkRecord(emailID, password).equals("JP")) {
				obj = request.getRequestDispatcher("JPDashboard_ProfilePage.jsp");
				request.setAttribute("emailID", emailID);
				obj.forward(request, response);
			}
		}
		else {
			obj = request.getRequestDispatcher("Login.jsp");
			request.setAttribute("message", "Invalid username or password");
			obj.forward(request, response);
		}
	}
}


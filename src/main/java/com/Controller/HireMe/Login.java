package com.Controller.HireMe;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		if(DBMSOperations.checkRecord(emailID, password).get(0) != null) {
			ArrayList<String> tuple = DBMSOperations.checkRecord(emailID, password);
			
			HttpSession session = request.getSession();
			session.setAttribute("emailID", emailID);
			session.setAttribute("firstName", tuple.get(0));
			session.setAttribute("lastName",  tuple.get(1));
			
			if(DBMSOperations.checkRecord(emailID, password).get(2).equals("JS")) {
				obj = request.getRequestDispatcher("JSDashboard_ProfilePage.jsp");
				obj.forward(request, response);
			}
			else if(DBMSOperations.checkRecord(emailID, password).get(2).equals("JP")) {
				obj = request.getRequestDispatcher("JPDashboard_ProfilePage.jsp");
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


package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JPJobsRedirect
 */
@WebServlet("/JPJobsRedirect")
public class JPJobsRedirect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JPJobsRedirect() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailID = request.getParameter("emailID");
		
		RequestDispatcher obj = null;
		
		obj = request.getRequestDispatcher("JPDashboard_JobsPage.jsp");
		request.setAttribute("emailID", emailID);
		obj.forward(request, response);
	}

}

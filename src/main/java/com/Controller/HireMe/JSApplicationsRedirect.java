package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JSApplicationsRedirect
**/
@WebServlet("/JSApplicationsRedirect")
public class JSApplicationsRedirect extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JSApplicationsRedirect() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email_id = request.getParameter("emailID");
		
		RequestDispatcher obj = null;
		obj = request.getRequestDispatcher("JSDashboard_ApplicationsPage.jsp");
		request.setAttribute("emailID", email_id);
		obj.forward(request, response);
	}
}

package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JSDashboardRedirect
 */
@WebServlet("/JSDashboardRedirect")
public class JSDashboardRedirect extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JSDashboardRedirect() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailID = request.getParameter("emailID");
		
		RequestDispatcher obj = null;
		
		obj = request.getRequestDispatcher("JSDashboard_ProfilePage.jsp");
		request.setAttribute("emailID", emailID);
		obj.forward(request, response);
	}
}

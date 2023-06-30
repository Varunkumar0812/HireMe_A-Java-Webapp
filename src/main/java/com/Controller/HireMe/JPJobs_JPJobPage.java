package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JPJobs_JPJobPage
 */
@WebServlet("/JPJobs_JPJobPage")
public class JPJobs_JPJobPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JPJobs_JPJobPage() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String job_id = request.getParameter("job_id");
		
		RequestDispatcher obj = request.getRequestDispatcher("JPJobPage.jsp");
		request.setAttribute("job_id", job_id);
		obj.forward(request, response);
	}
}

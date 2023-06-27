package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JPJobs_JPCreateJob
 */
@WebServlet("/JPJobs_JPCreateJob")
public class JPJobs_JPCreateJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JPJobs_JPCreateJob() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email_id = request.getParameter("emailID");
		
		RequestDispatcher obj = null;
		
		obj = request.getRequestDispatcher("JPJobCreateViewPage.jsp");
		request.setAttribute("emailID", email_id);
		obj.forward(request, response);
	}

}

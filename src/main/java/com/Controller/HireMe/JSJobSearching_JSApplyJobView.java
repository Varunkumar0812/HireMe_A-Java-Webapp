package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JSJobSearching_JSApplyJobView
 */
@WebServlet("/JSJobSearching_JSApplyJobView")
public class JSJobSearching_JSApplyJobView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JSJobSearching_JSApplyJobView() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String job_id = request.getParameter("job_id");
		
		RequestDispatcher obj = request.getRequestDispatcher("JSApplyJobViewPage.jsp");
		request.setAttribute("job_id", job_id);
		obj.forward(request, response);
	}	
}

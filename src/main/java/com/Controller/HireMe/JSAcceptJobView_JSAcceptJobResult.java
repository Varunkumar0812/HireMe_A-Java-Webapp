package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Modal.HireMe.JSOperations;

/**
 * Servlet implementation class JSAcceptJobView_JSAcceptJobResult
 */
@WebServlet("/JSAcceptJobView_JSAcceptJobResult")
public class JSAcceptJobView_JSAcceptJobResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JSAcceptJobView_JSAcceptJobResult() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailID = request.getParameter("emailID");
		String job_id  = request.getParameter("job_id");
	 	
		int c = JSOperations.updateRecordAcceptJob(job_id);
		
		if(c > 0) {
			RequestDispatcher obj = null;
			obj = request.getRequestDispatcher("JSAcceptJobResultPage.jsp");
			request.setAttribute("emailID", emailID);
			obj.forward(request, response);	
		}
	}
}

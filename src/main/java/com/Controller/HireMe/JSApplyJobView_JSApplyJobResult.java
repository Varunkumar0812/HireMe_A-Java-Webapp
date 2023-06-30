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
 * Servlet implementation class JSApplyJobView_JSApplyJobResult
 */
@WebServlet("/JSApplyJobView_JSApplyJobResult")
public class JSApplyJobView_JSApplyJobResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JSApplyJobView_JSApplyJobResult() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String job_id = request.getParameter("job_id");
		String emailID = request.getParameter("emailID");
		
		int c = JSOperations.insertRecordApplyJob(job_id, emailID);
		boolean message = c > 0 ? true : false;
		
		RequestDispatcher obj = request.getRequestDispatcher("JSApplyJobResultPage.jsp");
		request.setAttribute("message", message);
		obj.forward(request, response);
	}
}

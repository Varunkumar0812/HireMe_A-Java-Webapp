package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Modal.HireMe.JPOperations;

/**
 * Servlet implementation class JPJobPage_JPApplicant
 */
@WebServlet("/JPJobPage_JPApplicant")
public class JPJobPage_JPApplicant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JPJobPage_JPApplicant() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailID = request.getParameter("emailID");
		String job_id  = request.getParameter("job_id");
		String ApplicantemailID = request.getParameter("ApplicantemailID");
		
		JPOperations.updateRecordApplicant(ApplicantemailID, job_id);
		
		RequestDispatcher obj = null;
		
		obj = request.getRequestDispatcher("JPJobApplicantViewPage.jsp");
		request.setAttribute("emailID", emailID);
		request.setAttribute("job_id", job_id);
		request.setAttribute("ApplicantemailID", ApplicantemailID);
		obj.forward(request, response);	
	}

}

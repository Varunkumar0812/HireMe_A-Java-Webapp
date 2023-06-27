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
 * Servlet implementation class JPHireApplicant
 */
@WebServlet("/JPHireApplicant")
public class JPHireApplicant extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JPHireApplicant() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailID = request.getParameter("emailID");
		String job_id  = request.getParameter("job_id");
		String ApplicantemailID = request.getParameter("ApplicantemailID");
		
		int c = JPOperations.updateRecordHireApplicant(ApplicantemailID, job_id);

		RequestDispatcher obj = null;
		
		if(c > 0) {
			obj = request.getRequestDispatcher("JPJobApplicantResultPage.jsp");
			request.setAttribute("emailID", emailID);
			request.setAttribute("message", true);
			obj.forward(request, response);
		}
		else {
			obj = request.getRequestDispatcher("JPJobApplicantResultPage.jsp");
			request.setAttribute("emailID", emailID);
			request.setAttribute("message", false);
			obj.forward(request, response);
		}
	}

}

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
 * Servlet implementation class JPCreateJob
 */
@WebServlet("/JPCreateJob")
public class JPCreateJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JPCreateJob() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email_id       = request.getParameter("emailID");
		String job_title      = request.getParameter("job_tit");
		String min_exp        = request.getParameter("min_exp");
		String responsibility = request.getParameter("respon");
		String description    = request.getParameter("descr");
		String salary         = request.getParameter("salary");
		String[] skills       = request.getParameterValues("skills");
		
		int min = 100000, max = 999999;
		
		String job_id = null;
		int num = 0;
		
		do {
			num = (int) (Math.random()*(max - min + 1) + min);
			job_id = email_id + String.valueOf(num);
		}while(!JPOperations.checkJobID(job_id));
		
		int c = JPOperations.insertRecordCreateJob(email_id, job_id, job_title, min_exp, responsibility, description, salary);
		
		int b = 0;
		for(String i : skills) {
			b += JPOperations.insertSkillsCreateJob(job_id, i);
		}
		
		RequestDispatcher obj = null;
		if(c > 0 && b == skills.length) {
			obj = request.getRequestDispatcher("JPJobCreateResultPage.jsp");
			obj.forward(request, response);
		}
	}

}

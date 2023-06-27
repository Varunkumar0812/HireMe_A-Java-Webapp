package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Modal.HireMe.DBMSOperations;

/**
 * Servlet implementation class JSRegister4_JSResultPage
 */
@WebServlet("/JSRegister4_JSResultPage")
public class JSRegister4_JSResultPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JSRegister4_JSResultPage() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailID = request.getParameter("emailID");
		String[] skills = request.getParameterValues("skills");
		
		int c = 0;
		
		for(String i : skills) {
			c += DBMSOperations.insertSkills(i, emailID);
		}
		
		RequestDispatcher obj = null;
		
		if(c > 0) {
			obj = request.getRequestDispatcher("JSResultPage.jsp");
			request.setAttribute("emailID", emailID);
			obj.forward(request, response);
		}
	}	
}

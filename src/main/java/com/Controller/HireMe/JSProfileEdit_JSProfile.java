package com.Controller.HireMe;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Modal.HireMe.JSOperations;

/**
 * Servlet implementation class JSProfileEdit_JSProfile
 */
@WebServlet("/JSProfileEdit_JSProfile")
public class JSProfileEdit_JSProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JSProfileEdit_JSProfile() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailID   = request.getParameter("emailID");
		String[] skills  = request.getParameterValues("skills");
		
		ArrayList<String> tuple = new ArrayList<String>();
		
		tuple.add(emailID);
		tuple.add(request.getParameter("firstName"));
		tuple.add(request.getParameter("lastName"));
		tuple.add(request.getParameter("doorNo"));
		tuple.add(request.getParameter("streetName"));
		tuple.add(request.getParameter("city"));
		tuple.add(request.getParameter("state"));
		tuple.add(request.getParameter("pincode"));
		
		int b = JSOperations.clearRecordProfileEdit(emailID);
		
		int a = JSOperations.updateRecordProfileEdit(tuple), c = 0;
		for(String i : skills) {
			c += JSOperations.updateSkillRecordProfileEdit(emailID, i);
		}
		
		RequestDispatcher obj = null;		
		if(a > 0 && c > 0 && b >= 0) {
			obj = request.getRequestDispatcher("JSDashboard_ProfilePage.jsp");
			obj.forward(request, response);
		}
	}
}

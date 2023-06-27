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
		String firstName = request.getParameter("firstName");
		String lastName  = request.getParameter("lastName");
		String doorNo    = request.getParameter("doorNo");
		String streetName = request.getParameter("streetName");
		String city      = request.getParameter("city");
		String state     = request.getParameter("state");
		String pincode   = request.getParameter("pincode");
		String[] skills = request.getParameterValues("skills");
		
		
		ArrayList<String> tuple = new ArrayList<String>();
		
		tuple.add(emailID);
		tuple.add(firstName);
		tuple.add(lastName);
		tuple.add(doorNo);
		tuple.add(streetName);
		tuple.add(city);
		tuple.add(state);
		tuple.add(pincode);
		
		int b = JSOperations.clearRecordProfileEdit(emailID);
		
		int a = JSOperations.updateRecordProfileEdit(tuple), c = 0;
		for(String i : skills) {
			c += JSOperations.updateSkillRecordProfileEdit(emailID, i);
		}
		
		RequestDispatcher obj = null;		
		if(a > 0 && c > 0) {
			obj = request.getRequestDispatcher("JSDashboard_ProfilePage.jsp");
			request.setAttribute("emailID", emailID);
			obj.forward(request, response);
		}
	}
}

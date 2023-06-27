package com.Controller.HireMe;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Modal.HireMe.JPOperations;

/**
 * Servlet implementation class JPProfileEdit_JPProfile
 */
@WebServlet("/JPProfileEdit_JPProfile")
public class JPProfileEdit_JPProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JPProfileEdit_JPProfile() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailID   = request.getParameter("emailID");
		String comp_name = request.getParameter("comp_name");
		String serv_type  = request.getParameter("serv_type");
		String doorNo    = request.getParameter("doorNo");
		String streetName = request.getParameter("streetName");
		String city      = request.getParameter("city");
		String state     = request.getParameter("state");
		String pincode   = request.getParameter("pincode");
		
		
		ArrayList<String> tuple = new ArrayList<String>();
		
		tuple.add(emailID);
		tuple.add(comp_name);
		tuple.add(serv_type);
		tuple.add(doorNo);
		tuple.add(streetName);
		tuple.add(city);
		tuple.add(state);
		tuple.add(pincode);
		
		int a = JPOperations.updateRecordProfileEdit(tuple);
		
		RequestDispatcher obj = null;		
		if(a > 0) {
			obj = request.getRequestDispatcher("JPDashboard_ProfilePage.jsp");
			request.setAttribute("emailID", emailID);
			obj.forward(request, response);
		}
	}

}

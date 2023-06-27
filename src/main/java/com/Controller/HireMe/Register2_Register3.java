package com.Controller.HireMe;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Modal.HireMe.DBMSOperations;
import com.Modal.HireMe.Validation;

/**
 * Servlet implementation class Register2_Register3
 */
@WebServlet("/Register2_Register3")
public class Register2_Register3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Register2_Register3() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> tuple = new ArrayList<String>();
		
		String firstName = request.getParameter("firstName");
		tuple.add(firstName);
		String lastName  = request.getParameter("lastName");
		tuple.add(lastName);
		String door_no   = request.getParameter("door_no");
		tuple.add(door_no);
		String streetName= request.getParameter("streetName");
		tuple.add(streetName);
		String city      = request.getParameter("city");
		tuple.add(city);
		String state     = request.getParameter("state");
		tuple.add(state);
		String pincode   = request.getParameter("pincode");
		tuple.add(pincode);
		String emailID   = request.getParameter("emailID");
		tuple.add(emailID);

		int c = DBMSOperations.updatePersonalDetails(tuple);

		if(c >= 0) {
			System.out.println("Success");
		}
		
		boolean[] err_mess = {Validation.nameValidity(firstName),
				Validation.nameValidity(lastName),
				Validation.pincodeValidity(pincode)
		};
		
		RequestDispatcher obj = null;
		
		if(Validation.nameValidity(firstName) && Validation.nameValidity(lastName) && Validation.pincodeValidity(pincode)) {
			obj = request.getRequestDispatcher("Registration3.jsp");
			request.setAttribute("emailID", emailID);
			obj.forward(request, response);
		}
		else {
			obj = request.getRequestDispatcher("Registration2.jsp");
			request.setAttribute("err_messages", err_mess);
			obj.forward(request, response);
		}
	}

}

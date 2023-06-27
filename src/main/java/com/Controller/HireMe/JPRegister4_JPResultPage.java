package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Modal.HireMe.DBMSOperations;
import com.Modal.HireMe.Validation;

/**
 * Servlet implementation class JPRegister4_JPResultPage
 */
@WebServlet("/JPRegister4_JPResultPage")
public class JPRegister4_JPResultPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JPRegister4_JPResultPage() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String com_name  = request.getParameter("com_name");
		String ser_type  = request.getParameter("ser_type");
		String door_no   = request.getParameter("door_no");
		String streetName= request.getParameter("streetName");
		String city      = request.getParameter("city");
		String state     = request.getParameter("state");
		String pincode   = request.getParameter("pincode");
		String emailID   = request.getParameter("emailID");
		
		int c = DBMSOperations.insertRecordCompanyDetails(emailID, com_name, ser_type, door_no, streetName, city, state, pincode);
		
		boolean[] err_mess = {Validation.nameValidity(com_name), Validation.nameValidity(ser_type), Validation.pincodeValidity(pincode)};
		
		RequestDispatcher obj = null;
		
		if(Validation.nameValidity(com_name) && Validation.nameValidity(ser_type) && Validation.pincodeValidity(pincode)) {
			obj = request.getRequestDispatcher("JPResultPage.jsp");
			request.setAttribute("emailID", emailID);
			obj.forward(request, response);
		}
		else {
			obj = request.getRequestDispatcher("JPRegistration4.jsp");
			request.setAttribute("err_messages", err_mess);
			request.setAttribute("emailID", emailID);
			obj.forward(request, response);
		}
	}

}

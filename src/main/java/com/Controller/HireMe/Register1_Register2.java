package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Modal.HireMe.DBMSOperations;
import com.Modal.HireMe.Validation;

/**
 * Servlet implementation class Register1_Register2
 */
@WebServlet("/Register1_Register2")
public class Register1_Register2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Register1_Register2() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailID    = request.getParameter("email_id");
		String password   = request.getParameter("password");
		String c_password = request.getParameter("c_password");
			
		boolean[] err_mess = { Validation.emailAlreadyExists(emailID), 
				Validation.passwordValidity(password), 
				password.equals(c_password)
		};
	
		if(err_mess[0]  && err_mess[1] && err_mess[2]) {
			DBMSOperations.insertEmailDetails(emailID, password);
		}
		
		
		System.out.println(Validation.emailAlreadyExists(emailID));
		System.out.println(Validation.passwordValidity(password));
		System.out.println(password.equals(c_password));
		
		RequestDispatcher obj = null;
		
		if(err_mess[0] && Validation.passwordValidity(password) && password.equals(c_password)) {
			HttpSession session = request.getSession();
			session.setAttribute("emailID", emailID);
			
			obj = request.getRequestDispatcher("Registration2.jsp");
			obj.forward(request, response);
		}
		else {
			obj = request.getRequestDispatcher("Registration1.jsp");
			request.setAttribute("err_messages", err_mess);
			obj.forward(request, response);
		}
	}
}

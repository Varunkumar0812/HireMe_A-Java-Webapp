package com.Controller.HireMe;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class JSLogout
 */
@WebServlet("/JSLogout")
public class JSLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JSLogout() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.removeAttribute("emailID");
			
			RequestDispatcher obj = request.getRequestDispatcher("LandingPage.jsp");
			obj.forward(request, response);
		}
	}
}

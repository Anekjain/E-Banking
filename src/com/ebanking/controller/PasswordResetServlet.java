package com.ebanking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ebanking.dao.Models;

@WebServlet("/passwordReset")
public class PasswordResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		
		Boolean status = false;
		String reset[] = {request.getParameter("Acno"),
		 request.getParameter("uname"),
		 request.getParameter("PANno"),
		 request.getParameter("pass")};
		
		
		
	 	Models m = new Models();
		status = m.passReset(reset);
		
		if(status)
		{
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request,response);
		}else{
	          request.setAttribute("erUnsccesfull", "Not Succesfull!!");
	          RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			  rd.forward(request,response);
		}
	}

}

package com.ebanking.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebanking.dao.Models;

/**
 * Servlet implementation class makeRequestServlet
 */
@WebServlet("/makeRequest")
public class makeRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		HttpSession s = request.getSession(true);
		
        java.util.Date date = new java.util.Date();
		
		Models m = new Models();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String Rdate = dateFormat.format(new Date());

		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		String Rtime = sdf.format(date);
		
		String Rby = s.getAttribute("acc").toString();
		String RType = request.getParameter("Rtype");
		String Rstatus = "P";

		boolean status = m.InsertRequest(Rby, RType, Rdate, Rtime, Rstatus);
	    if(status)
	    {
	    	RequestDispatcher rd = request.getRequestDispatcher("/requestSuccess.jsp");
	    	rd.forward(request, response);
	    }else{
	  
	    	RequestDispatcher rd = request.getRequestDispatcher("/requestError.jsp");
	    	rd.forward(request, response);
	  
	    }
		
	
	}

}

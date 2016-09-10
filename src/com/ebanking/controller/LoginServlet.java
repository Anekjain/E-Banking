package com.ebanking.controller;
import com.ebanking.dao.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Models lgn = new Models();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		HttpSession session = request.getSession();
        System.out.println(session);
		String n = request.getParameter("uname"); 
		String p = request.getParameter("upass"); 
		String er = "";
//		System.out.println(n);
//		System.out.println(p);		
		Boolean validation;
		try {
			validation = lgn.Authentication(n, p);
//			System.out.println(validation);
			if(validation){
				try {
					session.setAttribute("name", n);
					session.setAttribute("acc", lgn.AcNo);
					System.out.println(session.getAttribute("acc"));
					session.setAttribute("ip", request.getLocalAddr().toString());
					lgn.Account_info(session);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
				
	
//				System.out.println(session.getAttribute("acc"));
				
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/welcome.jsp"); 
				rd.forward(request,response);
			}
			else{
				
				if(validation == false)
				{
					er = "Invalid";
					request.setAttribute("emsg", er);
				}
				
				RequestDispatcher rd=request.getRequestDispatcher("/error.jsp");  
				rd.forward(request,response);  
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	 System.out.println(er);
		
		out.close();
	}

}

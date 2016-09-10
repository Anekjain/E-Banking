package com.ebanking.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ebanking.dao.Models;

@WebServlet("/update")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
		HttpSession s = request.getSession(true);
		System.out.println(s);
		String n = request.getParameter("AcName");
		boolean u1 = false;
		boolean u2 = false;
		String Acno =  s.getAttribute("acc").toString();
		String UserInfo[] = { request.getParameter("AcName"),
				request.getParameter("DoB"),
				request.getParameter("Address"),
				request.getParameter("City"),
				request.getParameter("State"),
				request.getParameter("Country"),
				request.getParameter("ContactNo"),
				request.getParameter("Email")
				};
      System.out.println(Acno);      
//		System.out.println(UserInfo[0]);
//		System.out.println(UserInfo[1]);
//		System.out.println(UserInfo[2]);
//		System.out.println(UserInfo[3]);
//		System.out.println(UserInfo[4]);
//		System.out.println(UserInfo[5]);
//		System.out.println(UserInfo[6]);
//		System.out.println(UserInfo[7]);
		
		Models m = new Models();
		u1 = m.updateUser(UserInfo,Acno);
		if(u1)
		{
			try {
				s.setAttribute("name", n);
				s.setAttribute("ip", request.getLocalAddr().toString());
				u2 = m.Account_info(s);
			    System.out.println(u1 +","+u2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/welcome.jsp"); 
			rd.forward(request,response);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("profileEdit.jsp");  
			rd.include(request,response);  
     		}
	}

}

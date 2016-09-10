package com.ebanking.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ebanking.dao.Models;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String ip;
	Models lgn = new Models();	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();  
		ip = request.getLocalAddr();
		String accno = request.getParameter("accno");
		String uid = request.getParameter("uid");
		String dob = request.getParameter("dob");
		String pan = request.getParameter("panno");
		String pwd = lgn.encryptPass(request.getParameter("pwd"));  //ENCRYPTING PASS
		String tpwd = request.getParameter("Tpwd");
		
		Boolean registered = false;
		
		try {
			registered = lgn.registration(accno, dob, pan, pwd, uid, tpwd, ip);
			System.out.println(registered);
			if(registered){
			System.out.println("Registered Succesfully !!");	
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
			rd.include(request,response);  
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	  out.close();
	}
	
	

}

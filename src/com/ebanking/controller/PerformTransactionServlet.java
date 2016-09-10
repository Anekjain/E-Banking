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


@WebServlet("/PerformTransaction")
public class PerformTransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		response.setContentType("text/html");
		HttpSession s = request.getSession(true);

        java.util.Date date = new java.util.Date();
		
		Models m = new Models();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String Tdate = dateFormat.format(new Date());

		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		String Ttime = sdf.format(date);
        
		String ByAccno = s.getAttribute("acc").toString();
		String ToAccno = request.getParameter("Tto");
		String Tpass = request.getParameter("Tpass");
		
		double TAmount = Double.parseDouble(request.getParameter("Tamount"));
		double ByBal = 0.0;
		double ToBal = 0.0;
		
		Boolean TranpassValidation = false;		
		Boolean SBalValidation = false;		
		Boolean ToAccnoValidation = false;
		Boolean InsertTransaction = false;
		
		
		
		TranpassValidation = m.TpassValidation(ByAccno, Tpass);
		ToAccnoValidation = m.AccValid(ToAccno);
		SBalValidation = m.SufficeintBal(ByAccno, TAmount);
		
		System.out.println("ByAcc: "+ByAccno);
		System.out.println("ToAcc: "+ToAccno);
		System.out.println("Amt: "+TAmount);
		System.out.println("Tpass: "+Tpass);
		System.out.println("Tdate: "+Tdate);
		System.out.println("Ttime: "+Ttime);
		System.out.println("TpassValidation: "+TranpassValidation);
		System.out.println("ToaccValidation: "+ToAccnoValidation);
		System.out.println("SBalVliation: "+SBalValidation);
		System.out.println("ByBal: "+ByBal);
		System.out.println("ToBal: "+ToBal);
		
		if(TranpassValidation)
		{
		  if(SBalValidation)
		  {
			if(ToAccnoValidation)
		    {
				ByBal = m.GetBal(ByAccno);
				ToBal = m.GetBal(ToAccno);
				ByBal = ByBal - TAmount;
				ToBal = ToBal + TAmount;
				m.UpdateBal(ByAccno, ByBal);
				m.UpdateBal(ToAccno, ToBal);
				InsertTransaction = m.InsertTransaction(ByAccno, ToAccno, TAmount, ToBal, ByBal, Tdate, Ttime);
				System.out.println("InsertTransaction : "+InsertTransaction);
      			if(InsertTransaction)
      			{
			     RequestDispatcher rd = request.getRequestDispatcher("/transactionSuccess.jsp");
                 rd.forward(request, response);
		         }else{
		        	 RequestDispatcher rd = request.getRequestDispatcher("/transactionError.jsp");
		 	    	rd.forward(request, response);
		         }
		    }else{
      				RequestDispatcher rd = request.getRequestDispatcher("/transactionError.jsp");
      		    	rd.forward(request, response);
  				}
      		}else{
      		RequestDispatcher rd = request.getRequestDispatcher("/transactionError.jsp");
	    	rd.forward(request, response);
             	  }
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/transactionError.jsp");
	    	rd.forward(request, response);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/transactionError.jsp");
    	rd.forward(request, response);
   }

}

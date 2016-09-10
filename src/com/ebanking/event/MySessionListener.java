package com.ebanking.event;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.ebanking.bean.User;
import com.ebanking.dao.Models;

public class MySessionListener implements HttpSessionListener
{
	public void sessionCreated(HttpSessionEvent arg0) {
		
	}
	public void sessionDestroyed(HttpSessionEvent se) {
		boolean status = false;
		HttpSession session = se.getSession();
		User u1 = (User)session.getAttribute("user");
		String ip = session.getAttribute("ip").toString();
		Models m1 = new Models();
		status = m1.updateIp(u1.getAc_no(), ip);
	//	System.out.println(u1.getAc_no());
	//	System.out.println(ip);
		System.out.println("IP UPDATE " + status);
	}
}

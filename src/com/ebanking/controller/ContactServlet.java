package com.ebanking.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ebanking.util.EmailUtility;
 
/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 *
 * @author www.codejava.net
 *
 */
@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private String host;
    private String port;
    private String recipient;
    private String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        recipient = context.getInitParameter("recipient");
       
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
 
        String resultMessage = "";
 
        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            System.out.println("Emailed !!");
            getServletContext().getRequestDispatcher("welcome.jsp").forward(
                    request, response);
        }
    }
} 
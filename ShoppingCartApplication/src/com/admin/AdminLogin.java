package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		HttpSession hs = request.getSession();
		if(uname.equals("admin") && password.equals("admin")){
			hs.setAttribute("uname", uname);
			response.sendRedirect("admin-dashboard.jsp");	
		}else{
			String message="You have enter wrong credentials";
			hs.setAttribute("credential", message);
			response.sendRedirect("admin-login.jsp");
		}
	}

}

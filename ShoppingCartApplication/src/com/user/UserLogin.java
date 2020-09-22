package com.user;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResultSet resultset = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		HttpSession hs = request.getSession();
		try {
			resultset = DatabaseConnection.getResultFromSqlQuery("select * from users where uname='" + uname + "' and password='" + password + "'");
			if (uname != null && password != null) {
				if (resultset.next()) {
					hs.setAttribute("uname", uname);
					response.sendRedirect("user-dashboard.jsp");
				} else {
					String message="You have enter wrong credentials";
					hs.setAttribute("credential", message);
					response.sendRedirect("index.jsp");
				}
			} else {
				System.out.println("User name or Password null");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

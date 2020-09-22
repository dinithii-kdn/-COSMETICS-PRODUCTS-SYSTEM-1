package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import com.connection.DatabaseConnection;


@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=0;
		String uname = request.getParameter("uname");
		String passwd = request.getParameter("passwd");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		try{
			Connection connection=DatabaseConnection.getConnection();
			Statement statement=connection.createStatement();
			int addUser=statement.executeUpdate("insert into users values('"+id+"','"+uname+"','"+passwd+"','"+name+"','"+email+"')");
			if(addUser>0){
				response.sendRedirect("user-login.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}

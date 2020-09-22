<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<%
	int oid = Integer.parseInt(request.getParameter("oid"));
	try {
		Connection connection = DatabaseConnection.getConnection();
		Statement statement = connection.createStatement();
		int cancelProduct = statement.executeUpdate("delete from product_orders where oid='"+oid+"' and uname='"+session.getAttribute("uname")+"'");
		response.sendRedirect("view-cart.jsp");
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
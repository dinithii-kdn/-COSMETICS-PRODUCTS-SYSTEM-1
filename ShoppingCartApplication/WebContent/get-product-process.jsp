<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<%
	int id = 0;
	String pname = request.getParameter("pname");
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	int price = Integer.parseInt(request.getParameter("price"));
	int purchaseQuantity = Integer.parseInt(request.getParameter("purchaseQuantity"));
	int totalPrice = price * purchaseQuantity;
	try {
		Connection connection = DatabaseConnection.getConnection();
		Statement statement = connection.createStatement();
		int i = statement.executeUpdate("insert into product_orders values('" + id + "','" + pname + "','"+ purchaseQuantity + "','" + totalPrice + "','" + session.getAttribute("uname") + "')");
		if (i > 0) {
			int updateProductQuantity = statement.executeUpdate("update products set product_quantity=product_quantity-'"+ purchaseQuantity + "' where pid='" + session.getAttribute("pid") + "'");
			response.sendRedirect("user-dashboard.jsp");
		} else {
			response.sendRedirect("get-product.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
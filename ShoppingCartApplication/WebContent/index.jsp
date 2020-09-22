<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart Application</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand/logo -->
		<a class="navbar-brand" href="index.jsp">Shopping Cart Application</a>
		<a class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a> <a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a> <a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a> <a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a><a class="navbar-brand" href="">&nbsp;</a>
		 <a
			class="navbar-brand" href="">&nbsp;</a> <a class="navbar-brand"
			href="">&nbsp;</a><a class="navbar-brand" href="">&nbsp;</a> <a
			class="navbar-brand" href="user-login.jsp">Customer Login</a> <a
			class="navbar-brand" href="admin-login.jsp">Admin Login</a> <a
			class="navbar-brand" href=""><%=(new java.util.Date()).toLocaleString()%></a>

		<!-- Links -->
	</nav>
	<div class="container">
		<br>
		<h2>All Products</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Product Name</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Product Image</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					Connection connection = DatabaseConnection.getConnection();
					Statement statement = connection.createStatement();
					ResultSet resultset = statement.executeQuery("select * from products");
					while (resultset.next()) {
						if (resultset.getInt(3) != 0) {
				%>
				<tr>
					<td><%=resultset.getInt(1)%></td>
					<td><%=resultset.getString(2)%></td>
					<td><%=resultset.getInt(3)%></td>
					<td><%=resultset.getInt(4)%></td>
					<td><image src="uploads/<%=resultset.getString(5)%>"
							width="60" height="70"></image></td>
					<td><a href="user-login.jsp" class="btn btn-danger">Buy
							Product</td>
				</tr>
				<%
					}
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>

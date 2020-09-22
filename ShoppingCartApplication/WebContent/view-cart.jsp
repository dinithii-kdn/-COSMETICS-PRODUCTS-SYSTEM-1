<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Shopping Cart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="user-dashboard.jsp">Online Shopping
			Cart</a>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="user-dashboard.jsp">Products</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>&nbsp;<%=session.getAttribute("uname")%>
			</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="view-cart.jsp">View Cart</a> <a
						class="dropdown-item" href="logout.jsp">Logout</a>

				</div></li>

		</ul>
	</nav>
	<div class="container">
		<br>
		<h2>My Orders</h2>
		<table class="table">
			<thead>
				<tr>
					<th>Order Id</th>
					<th>Product Name</th>
					<th>Quantity</th>
					<th>Total Product Price</th>
					<th>Remove Product From Cart</th>
				</tr>
			</thead>
			<tbody>
				<%
					int count=1;
					Connection connection = DatabaseConnection.getConnection();
					Statement statement = connection.createStatement();
					ResultSet resultset = statement
							.executeQuery("select * from product_orders where uname='" + session.getAttribute("uname") + "'");
					while (resultset.next()) {
				%>
				<tr>
					<td><%=count++%></td>
					<td><%=resultset.getString(2)%></td>
					<td><%=resultset.getInt(3)%></td>
					<td><%=resultset.getInt(4)%></td>
					<td><a href="cancel-product.jsp?oid=<%=resultset.getInt(1)%>" class="btn btn-danger">Cancel Product</td>
				</tr>
				<%
					}
				%>
				<%
					Statement st = connection.createStatement();
					ResultSet rs = st.executeQuery(
							"select sum(total_price) from product_orders where uname='" + session.getAttribute("uname") + "' ");
					rs.next();
					int totalBill = rs.getInt(1);
				%>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><strong>Total Bill</strong></td>
					<td><font color="red"><%=totalBill%> Rs/-</font></td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>

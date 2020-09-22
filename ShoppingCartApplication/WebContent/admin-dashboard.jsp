<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
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
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"> <a
		class="navbar-brand" href="admin-dashboard.jsp">Online Shopping
		Cart</a>

	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link"
			href="admin-dashboard.jsp">Products</a></li>
		<li class="nav-item"><a class="nav-link" href="add-products.jsp">Add
				Products</a></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="navbardrop" data-toggle="dropdown"> <span
				class="glyphicon glyphicon-user"></span>&nbsp;<%=session.getAttribute("uname")%>
		</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="logout.jsp">Logout</a>
			</div></li>
	</ul>
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
					<td><image src="uploads/<%=resultset.getString(5)%>" width="60"
													height="70"></image></td>
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

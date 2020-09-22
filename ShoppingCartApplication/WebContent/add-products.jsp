<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart</title>
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
		<form role="form" action="AddProducts" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="pname">Product Name:</label> <input type="text"
					class="form-control" id="pname" placeholder="Enter Product Name"
					name="pname">
			</div>
			<div class="form-group">
				<label for="quantity">Quantity:</label> <input type="text"
					class="form-control" id="quantity" placeholder="Enter Quantity"
					name="quantity">
			</div>
			<div class="form-group">
				<label for="price">Price:</label> <input type="text"
					class="form-control" id="price" placeholder="Enter Price"
					name="price">
			</div>
			<div class="form-group">
				<label for="price">Upload Image:</label> <input class="form-control"
					type="file" name="uploadLogo" style="height: 45px">
			</div>
			<button type="submit" class="btn btn-primary">Add Product</button>
		</form>
	</div>
</body>
</html>
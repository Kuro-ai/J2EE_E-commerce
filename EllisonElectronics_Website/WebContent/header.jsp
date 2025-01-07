<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.kmh.service.impl.*,com.kmh.service.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Logout Header</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body style="background-color: #007bff;">

	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>

	<!-- Starting Navigation Bar -->
	<nav class="navbar navbar-default"
		style="background-color: #106F7B; padding: 20px; margin-top: -5px;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<form class="form-inline" action="index.jsp" method="get">
					<a class="navbar-brand" href="index.jsp"><span
						class="glyphicon glyphicon-home">&nbsp;</span>Electronics</a>
				</form>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login.jsp">Login</a></li>
					<li><a href="register.jsp">Register</a></li>
					<li><a href="index.jsp">Products</a></li>
				</ul>
			</div>
		</div>
		<div class="container mt-5"
			style="background-color: #4BD5E7; padding: 2%;">
			<div class="row d-flex justify-content-center">
				<div class="">
					<div class="card">
						<div class="row">
							<form class="form-inline" action="index.jsp" method="get">
							<div class="col-md-3"
								style="margin: 2%">
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										id="dropdownMenuButton" data-toggle="dropdown"
										aria-expanded="false">Filter Search</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<li><a href="index.jsp">All Products</a></li>
										<li><a href="index.jsp?type=mobile">Mobiles</a></li>
										<li><a href="index.jsp?type=tv">TVs</a></li>
										<li><a href="index.jsp?type=laptop">Laptops</a></li>
										<li><a href="index.jsp?type=camera">Camera</a></li>
										<li><a href="index.jsp?type=speaker">Speakers</a></li>
										<li><a href="index.jsp?type=tablet">Tablets</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-6" style="margin: 2%">
								<div class="input-group">
									<input type="text" class="form-control"  size="100" name="search"
										placeholder="Search Items" required>
									<div class="input-group-btn">
										<input type="submit" class="btn btn-success" value="Search" />
									</div>
								</div>
							</div>						
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<%
	} else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
	%>
	<nav class="navbar navbar-default"
		style="background-color: #106F7B; padding: 20px; margin-top: -5px;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<form class="form-inline" action="index.jsp" method="get">
					<a class="navbar-brand" href="index.jsp"><span
						class="glyphicon glyphicon-home">&nbsp;</span>Electronics</a>
				</form>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userHome.jsp">Products</a></li>
					<%
					if (notf == 0) {
					%>
					<li><a href="cartDetails.jsp"> <span
							class="glyphicon glyphicon-shopping-cart"></span>Cart
					</a></li>

					<%
					} else {
					%>
					<li><a href="cartDetails.jsp"
						style="margin: 0px; padding: 0px;" id="mycart"><i
							data-count="<%=notf%>"
							class="fa fa-shopping-cart fa-3x icon-white badge"
							style="background-color: #333; margin: 0px; padding: 0px; padding-bottom: 0px; padding-top: 5px;">
						</i></a></li>
					<%
					}
					%>
					<li><a href="orderDetails.jsp">Orders</a></li>
					<li><a href="./LogoutSrv">Logout</a></li>
				</ul>
			</div>
		</div>
		<div class="container mt-5"
			style="background-color: #4BD5E7; padding: 2%;">
			<div class="row d-flex justify-content-center">
				<div class="">
					<div class="card">
						<div class="row">
							<form class="form-inline" action="index.jsp" method="get">
							<div class="col-md-3"
								style="margin: 2%">
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										id="dropdownMenuButton" data-toggle="dropdown"
										aria-expanded="false">Filter Search</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<li><a href="userHome.jsp">All Products</a></li>
										<li><a href="userHome.jsp?type=mobile">Mobiles</a></li>
										<li><a href="userHome.jsp?type=tv">TVs</a></li>
										<li><a href="userHome.jsp?type=laptop">Laptops</a></li>
										<li><a href="userHome.jsp?type=camera">Camera</a></li>
										<li><a href="userHome.jsp?type=speaker">Speakers</a></li>
										<li><a href="userHome.jsp?type=tablet">Tablets</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-6" style="margin: 2%">
								<div class="input-group">
									<input type="text" class="form-control"  size="100" name="search"
										placeholder="Search Items" required>
									<div class="input-group-btn">
										<input type="submit" class="btn btn-success" value="Search" />
									</div>
								</div>
							</div>						
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<%
	} else { //ADMIN HEADER
	%>
	<nav class="navbar navbar-default"
		style="background-color: #106F7B; padding: 20px; margin-top: -5px;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<form class="form-inline" action="adminViewProduct.jsp" method="get">
					<a class="navbar-brand" href="adminViewProduct.jsp"><span
						class="glyphicon glyphicon-home">&nbsp;</span>Electronics</a>
				</form>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="adminViewProduct.jsp">Products</a></li>
					<li><a href="adminStock.jsp">Stock</a></li>
					<li><a href="shippedItems.jsp">Shipped</a></li>
					<li><a href="unshippedItems.jsp">Orders</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Update Items <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="addProduct.jsp">Add Product</a></li>
							<li><a href="removeProduct.jsp">Remove Product</a></li>
							<li><a href="updateProductById.jsp">Update Product</a></li>
						</ul></li>
					<li><a href="./LogoutSrv">Logout</a></li>
				</ul>
			</div>
		</div>
		<div class="container mt-5"
			style="background-color: #4BD5E7; padding: 2%;">
			<div class="row d-flex justify-content-center">
				<div class="">
					<div class="card">
						<div class="row">
							<form class="form-inline" action="index.jsp" method="get">
							<div class="col-md-3"
								style="margin: 2%">
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										id="dropdownMenuButton" data-toggle="dropdown"
										aria-expanded="false">Filter Search</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<li><a href="adminViewProduct.jsp">All Products</a></li>
										<li><a href="adminViewProduct.jsp?type=mobile">Mobiles</a></li>
										<li><a href="adminViewProduct.jsp?type=tv">TVs</a></li>
										<li><a href="adminViewProduct.jsp?type=laptop">Laptops</a></li>
										<li><a href="adminViewProduct.jsp?type=camera">Camera</a></li>
										<li><a href="adminViewProduct.jsp?type=speaker">Speakers</a></li>
										<li><a href="adminViewProduct.jsp?type=tablet">Tablets</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-6" style="margin: 2%">
								<div class="input-group">
									<input type="text" class="form-control"  size="100" name="search"
										placeholder="Search Items" required>
									<div class="input-group-btn">
										<input type="submit" class="btn btn-success" value="Search" />
									</div>
								</div>
							</div>						
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<%
	}
	%>
	<!-- End of Navigation Bar -->

	<p align="center"
		style="color: blue; font-weight: bold; margin-top: 5px; margin-bottom: 5px;"
		id="message"></p>
</body>
</html>
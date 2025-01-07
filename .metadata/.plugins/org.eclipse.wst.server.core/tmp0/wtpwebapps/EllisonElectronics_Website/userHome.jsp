<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.kmh.service.impl.*,com.kmh.service.*,com.kmh.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Ellison Electronics</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #B7EEF5;">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	}

	ProductServiceImpl prodDao = new ProductServiceImpl();
	List<ProductBean> products = new ArrayList<ProductBean>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "All Products";
	if (search != null) {
		products = prodDao.searchAllProducts(search);
		message = "Showing Results for '" + search + "'";
	} else if (type != null) {
		products = prodDao.getAllProductsByType(type);
		message = "Showing Results for '" + type + "'";
	} else {
		products = prodDao.getAllProducts();
	}
	if (products.isEmpty()) {
		message = "No items found for the search '" + (search != null ? search : type) + "'";
		products = prodDao.getAllProducts();
	}
	%>



	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: black; font-size: 14px; font-weight: bold; margin-top: 50px; margin-bottom: 105px">
		<h1><%=message%></h1>
	</div>

	<!-- Start of Product Items List -->
	<div class="container" style="background-color: #4BD5E7;">
		<div class="row text-center">

			<%
			for (ProductBean product : products) {
				int cartQty = new CartServiceImpl().getCartItemCount(userName, product.getProdId());
			%>
			<div class="col-sm-12 col-lg-6">
				<div class="card mb-3" style="max-width: 540px; margin: 0 auto; padding-top: 10px;">
					<div class="row no-gutters thumbnail">
						<div class="col-md-4">
							<img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product"
								style="height: 150px; max-width: 180px">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h3 class="productname card-title"><%=product.getProdName()%>
								</h3>
								<%
								String description = product.getProdInfo();
								description = description.substring(0, Math.min(description.length(), 100));
								%>
								<p class="productinfo card-text"><%=description%>..
								</p>
								<p class="price card-text">
									Ks
									<%=product.getProdPrice()%>
								</p>
								<form method="post">
									<%
									if (cartQty == 0) {
									%>
									<button type="submit"
										formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
										class="btn btn-success">Add to Cart</button>
									&nbsp;&nbsp;&nbsp;
									<button type="submit"
										formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
										class="btn btn-primary">Buy Now</button>
									<%
									} else {
									%>
									<button type="submit"
										formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0"
										class="btn btn-danger">Remove From Cart</button>
									&nbsp;&nbsp;&nbsp;
									<button type="submit" formaction="cartDetails.jsp"
										class="btn btn-success">Checkout</button>
									<%
									}
									%>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<!-- ENd of Product Items List -->


	<%@ include file="footer.html"%>

</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.Ecommer.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Ecommer.connection.*"%>
<%@ page import="com.Ecommer.model.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProduct();

ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
if(cart_list!=null){
	request.setAttribute("cart_list",cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="includes/NavBar.jsp"%>

	<div class="container">
		<div class="card-header my-3">
			<div class="row">
				<%
				if (!products.isEmpty()) {
					for (Product p : products) {%>
						<div class="col-md-3 my-3">
						<div class="card w-100" style="width: 18rem;">
							<img class="card-img-top" src="product-image/<%=p.getImage() %>" class="card-img-top" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title"><%=p.getName() %></h5>
								<h6 class="price">Price:<%=p.getPrice() %> Rs</h6>
								<h6 class="Category">Category:<%=p.getCategory() %></h6>
								<div class="mt-3 d-flex justify-content-between">
									<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark">Add to Cart</a> <a href="#"
										class="btn btn-primary">Buy Now</a>
								</div>
							</div>
						</div>
					</div>
				<% 	}
				}
				%>
				
			</div>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>


</body>
</html>
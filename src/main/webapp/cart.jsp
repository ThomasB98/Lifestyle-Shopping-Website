<%@page import="com.Ecommer.dao.ProductDao"%>
<%@page import="com.Ecommer.connection.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.Ecommer.model.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
	
}else{
	response.sendRedirect("login.jsp");
}
ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
List<Cart> cartProduct =null;
if(cart_list!=null){
	ProductDao pDao=new ProductDao(DbCon.getConnection());
	cartProduct=pDao.getCartProduct(cart_list);
	request.setAttribute("cart_list",cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>E-Commerce Cart</title>
<style type="text/css">
	.table tbody td{
		vartical-align:middle;
	}
	.btn-incre,.btn-decre{
		box-shadow:none;
		font-size=25px;
	}
</style>
</head>
<body>
	<%@include file="includes/NavBar.jsp"%>
	<div class="container my-3">
		<div class="d-flex py-3">
			<h3>Total Price:$</h3>
			<a class="mx-3 btn btn-primary" href="#">Check out</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				
				<%if(cart_list!=null){
					for(Cart c:cart_list){%>
						<tr>
						<td><%=c.getName() %></td>
						<td><%=c.getCategory() %></td>
						<td><%=c.getPrice() %>Rs</td>
						<td>
							<form action="" method="post" class="form-inline">
								<input type="hidden" name="id" value="<%=c.getId() %>" class="form-input">
								<div class="form-group d-flex justify-content-between">
										<a class="btn bnt-sm btn-incre" href=""><i class="fas fa-plus-square"></i></a> 
									<input type="text" name="quantity" class="form-control"  value="1" readonly> 
									<a class="btn btn-sm btn-decre" href=""><i class="fas fa-minus-square"></i></a>
								</div>
							</form>
						</td>
						<td><a class="btn btn-sm btn-danger" href="">Remove</a></td>
					</tr>
				<% 	}
				}
					%>
				
					
			</tbody>
		</table>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>
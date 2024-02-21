<%@page import="com.Ecommer.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<a class="navbar-brand" href="index.jsp">Shopping</a>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<%
				if (auth != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">cart<span class="badge badge-danger">${cart_list.size()}</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="orders.jsp">orders</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="log-out">LogOut</a>
				</li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
				</li>
				<%
				}
				%>

			</ul>
		</div>
	</div>
</nav>

<%@include file="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.Ecommer.model.*" %> 
<%
User auth=(User) request.getSession().getAttribute("auth");
if(auth!=null){
	request.setAttribute("auth", auth);
}
ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
if(cart_list!=null){
	request.setAttribute("cart_list",cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"  %>
<title>Insert title here</title>
</head>
<body>
<%@include file="includes/NavBar.jsp" %>

<%@include file="includes/footer.jsp"  %>
</body>
</html>
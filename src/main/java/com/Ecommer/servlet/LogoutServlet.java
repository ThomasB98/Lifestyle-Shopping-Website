package com.Ecommer.servlet;

import java.io.PrintWriter;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/log-out")
public class LogoutServlet extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response) {
		try(PrintWriter out=response.getWriter()) {
			if(request.getSession().getAttribute("auth")!=null) {
				request.getSession().removeAttribute("auth");
				response.sendRedirect("login.jsp");
			}else {
				response.sendRedirect("index.jsp");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
}

package com.Ecommer.servlet;

import java.io.PrintWriter;

import com.Ecommer.connection.DbCon;
import com.Ecommer.dao.UserDao;
import com.Ecommer.model.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter()) {
			String email=request.getParameter("login-email");
			String password=request.getParameter("login-Password");
			UserDao udao=new UserDao(DbCon.getConnection());
			User user =udao.userLogin(email, password);
			if(user!=null) {
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("index.jsp");
			}else {
				out.print("user login failed");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}

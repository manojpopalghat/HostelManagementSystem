<%@page import="java.util.Random"%>
<%@page import="com.User.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body bgcolor="#e4f7f5">
	<%
		String role = request.getParameter("role");
		String userId = request.getParameter("userId");
		User user = UserDAO.validateEmailId(role, userId);
		if(user.getUid() <= 0)
		{
			response.sendRedirect("forgotPassword.jsp?isValidUser=false");
		}	
		else
		{
			
			Random random = new Random();
			int otp = random.nextInt(900000)+100000;
			session.setAttribute("user", user);
			session.setAttribute("otp", otp);
			System.out.println("***************************");
			System.out.println("OTP : "+otp);
			System.out.println("***************************");
			
			/*
			Do your work here for sending email with above otp on above emailId=userId
			
			*/
			RequestDispatcher rd = request.getRequestDispatcher("validateOTP.jsp");
			rd.forward(request, response);
		}
	%>
</body>
</html>
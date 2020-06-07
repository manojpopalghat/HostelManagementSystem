<%@page import="com.Administration.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Notifications Success ?</title>
</head>
<body>
	<%
		String []nids = request.getParameterValues("nids");
		if(nids == null )
		{
			response.sendRedirect("deleteNotifications.jsp");
		}
		else
		{	
			int successFlag = 0;
			successFlag = AdminDAO.deleteNotifications(nids);
			response.sendRedirect("deleteNotifications.jsp?successFlag="+successFlag);
		}
	%>
</body>
</html>
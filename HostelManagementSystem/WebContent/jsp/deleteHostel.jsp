<%@page import="com.Administration.AdminDAO"%>
<%@page import="com.hostel.Hostel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Hostel ?</title>
</head>
<body>
	<%
	
	int hId = Integer.parseInt(request.getParameter("hId"));
		
	int successFlag = AdminDAO.deleteHostel(hId);
	%>
	<%if(successFlag>0){%>
	<script>
		alert("Hostel deleted successfully.");
		window.location.href = "manageHostels.jsp";
	</script>
	<%}else{%>
	<script>
		alert("Some error occured.\nHostel not deleted successfully.\nPlease TRY AGAIN !!!");
		window.location.href = "manageHostels.jsp";
	</script>
	<%}	%>

</body>
</html>
<%@page import="com.Administration.AdminDAO"%>
<%@page import="com.hostel.Hostel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Hostel ?</title>
</head>
<body>
	<%
	Hostel hostel = new Hostel();
	hostel.setName(request.getParameter("newHostelName"));
	hostel.setGender(request.getParameter("newHostelGender"));
	hostel.setRooms(Integer.parseInt(request.getParameter("newHostelRooms")));
	hostel.setCapacity(Integer.parseInt(request.getParameter("newHostelCapacity")));
	hostel.setRector(request.getParameter("newHostelRector"));
	
	int successFlag = AdminDAO.addHostel(hostel);
	%>
	<%if(successFlag>0){%>
	<script>
		alert("Hostel added successfully.");
		window.location.href = "manageHostels.jsp";
	</script>
	<%}else{%>
	<script>
		alert("Some error occured.\nHostel not added successfully.\nPlease TRY AGAIN !!!");
		window.location.href = "manageHostels.jsp";
	</script>
	<%}	%>

</body>
</html>
<%@page import="com.Administration.AdminDAO"%>
<%@page import="com.hostel.Hostel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Hostel ?</title>
</head>
<body>
	<%
	Hostel hostel = new Hostel();
	hostel.sethId(Integer.parseInt(request.getParameter("hId")));
	hostel.setGender(request.getParameter("gender"));
	hostel.setRooms(Integer.parseInt(request.getParameter("rooms")));
	hostel.setCapacity(Integer.parseInt(request.getParameter("capacity")));
	hostel.setAllotedRooms(Integer.parseInt(request.getParameter("allotedRooms")));
	hostel.setUnallotedRooms(Integer.parseInt(request.getParameter("unallotedRooms")));
	hostel.setFilledStudents(Integer.parseInt(request.getParameter("filledStudents")));
	hostel.setRemainingSpace(Integer.parseInt(request.getParameter("remainingSpace")));
	hostel.setRector(request.getParameter("rector"));
	
	int successFlag = AdminDAO.updateHostel(hostel);
	%>
	<%if(successFlag>0){%>
	<script>
		alert("Hostel updated successfully.");
		window.location.href = "manageHostels.jsp";
	</script>
	<%}else{%>
	<script>
		alert("Some error occured.\nHostel not updated successFully.\nPlease TRY AGAIN !!!");
		window.location.href = "manageHostels.jsp";
	</script>
	<%}	%>

</body>
</html>
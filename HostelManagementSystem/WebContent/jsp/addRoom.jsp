<%@page import="com.Administration.AdminDAO"%>
<%@page import="com.hostel.Room"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Room ?</title>
</head>
<body>
	<%
	Room room = new Room();
	String hId = request.getParameter("hId");
	room.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
	room.setAllotedFor(request.getParameter("allotedFor"));
	room.setCapacity(Integer.parseInt(request.getParameter("capacity")));
	room.setFilledStudents(Integer.parseInt(request.getParameter("filledStudents")));
	room.setRemainingSpace(Integer.parseInt(request.getParameter("remainingSpace")));
	room.setIsRoomFulled(request.getParameter("isRoomFulled"));
	room.sethId(Integer.parseInt(hId));
	
	int successFlag = AdminDAO.addRoom(room);
	%>
	<input type="hidden" id="hId" value="<%=hId%>">
	<%if(successFlag>0){%>
	<script>
		var hId = document.getElementById("hId").value;
		alert("Room added successfully.");
		window.location.href = "manageHostel.jsp?hId="+hId;
	</script>
	<%}else{%>
	<script>
		var hId = document.getElementById("hId").value;
		alert("Some error occured.\nRoom not added successfully.\nPlease TRY AGAIN !!!");
		window.location.href = "manageHostel.jsp?hId="+hId;
	</script>
	<%}	%>

</body>
</html>
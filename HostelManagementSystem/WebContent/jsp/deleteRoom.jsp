<%@page import="com.Administration.AdminDAO"%>
<%@page import="com.hostel.Hostel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Room ?</title>
</head>
<body>
	<%
	
	int hId = Integer.parseInt(request.getParameter("hId"));
	int rId = Integer.parseInt(request.getParameter("rId"));
	int successFlag = AdminDAO.deleteRoom(hId,rId);
	%>
	<input type="hidden" id="hId" value="<%=hId%>">
	<%if(successFlag>0){%>
	<script>
		var hId = document.getElementById("hId").value;
		alert("Room deleted successfully.");
		window.location.href = "manageHostel.jsp?hId="+hId;
	</script>
	<%}else{%>
	<script>
		var hId = document.getElementById("hId").value;
		alert("Some error occured.\nRoom not deleted successfully.\nPlease TRY AGAIN !!!");
		window.location.href = "manageHostel.jsp?hId="+hId;
	</script>
	<%}	%>

</body>
</html>
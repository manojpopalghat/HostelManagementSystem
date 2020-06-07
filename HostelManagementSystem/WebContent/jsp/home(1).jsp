<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Hostel Facility</title>
</head>
<body bgcolor="#e4f7f5">
	<table width="100%" border="1" >
		<tr>
			<td width="100%"><img src="../images/header.jpg" width="100%"
				height="150"></td>
		</tr>
		<tr>
			<td >
				<%@page import="com.User.User"%>
				<%
				User user1 = (User)session.getAttribute("user");
				if(user1 == null){
				%>
			   <%@ include file="topMenusForPublic.jsp" %>
			   <%
			   	}
				else{
					String role = user1.getRole();
				%>
					<%
					if(role.equalsIgnoreCase("student")){
					%>
					<%@ include file="topMenusForStudent.jsp" %>
					<!-- <script>alert("Welcome : "+document.getElementById("welcome").value);</script> -->
					
					<%}else if(role.equalsIgnoreCase("security")){ %>
					<%@ include file="topMenusForSecurity.jsp" %>
					<!-- <script>alert("Welcome : "+document.getElementById("welcome").value);</script> -->
					
					<%}else if(role.equalsIgnoreCase("rector")){ %>
					<%@ include file="topMenusForRector.jsp" %>
					<!-- <script>alert("Welcome : "+document.getElementById("welcome").value);</script> -->
					
					<%}else if(role.equalsIgnoreCase("admin")){ %>
					<%@ include file="topMenusForAdmin.jsp" %>
					<!-- <script>alert("Welcome : "+document.getElementById("welcome").value);</script> -->
					
					<%}else{ %>
					<%@ include file="topMenusForPublic.jsp" %>
					<%} %>
					
				<%}%>
			</td>
		</tr>
		<tr>
			<td  align="center" style="font-size: 22;"><u><b>Hostel
					Details</b></u></td>
		</tr>
		
		<!-- Start Work From Here -->
		
		<tr>
			<td>
				<table border="1" cellspacing="0" cellpadding="0">
					<tr>
						<th width="33%" style="font: bold; color:#226327;">Hostel Facilities for Students of Indian Nationality</td>
						<th width="34%" style="font: bold; color:#ff0000;">News And Announcements</th>
						<th width="33%" style="font: bold; color:#04ff00;">From Chief Rector,SPPU</th>
					</tr>
					<tr>
						<td width="33%" align="center" style="color:#804d00;font:italic;">University of Pune provides hostel facility to both girls
							and boys. <br> The hostel facility is granted to the
							students of the University strictly on the basis of merit.<br>
							The number of seats for each department depends on the department
							size<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
						</td>
						<td width="34%" align="justify" style="color:#804d00;font:italic;">
							<iframe src="notifications.jsp" frameborder="0" scrolling="No" height="360px" width="100%"></iframe>
						</td>
						<td width="33%" align="center" style="color:#804d00;font:italic;">
							<img src="sppu.com"><br/>
							Hey ! Hey !Hey !Hey !Hey !Hey !
							
						</td>
					</tr>				
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
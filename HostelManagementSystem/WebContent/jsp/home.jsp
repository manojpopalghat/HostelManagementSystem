
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Hostel </title>
</head>
<body bgcolor="white">
	
	<table width="100%" border="0" >
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
			<td  align="center" style="font-size: 22;"><h3><u><b>Hostel Details</b></u></h3></td>
		</tr>
		<tr>
		   <td bgcolor="#085753"><br></td>
		</tr>
		
		
		<!-- Start Work From Here -->
		
		<tr>
			<td>
				<table border="0">
					<tr>
						<th width="33%" style="font: bold; color:#226327;"><h3><u>Hostel Facilities for Students of Indian Nationality</u></h3></td>
						<th width="34%" style="font: bold; color:#ff0000;"><h3><u>News And Announcements</u></h3></th>
						<th width="33%" style="font: bold; color:#04ff00;"><h3><u>From Chief Rector,SPPU</u></h3></th>
					</tr>
					<tr>
						<td width="33%" align="center" style="color:#804d00;font:italic;">University of Pune provides hostel facility to both girls
							and boys. The hostel facility is granted to the
							students of the <br>University strictly on the basis of merit.
							The number of seats for each department depends on the department
							size<br><br><br><br><br><br><br><br>
						</td>
						<td width="34%" align="center" style="color:#804d00;font:italic;">

						<iframe src="notifications.jsp" width="90%" height="250">
<%-- 							<marquee scrollamount="1" style="text-align: center;" direction="up" >
								<%@include file="notifications.jsp" %>
							</marquee> --%>
						</iframe>
						</td>
						<td width="33%" align="center" style="color:#804d00;font:italic; ma">
							<img src="../images/profile.jpg" width="25%" height="30%"><br/>
							Dr. S. B. Ballal<hr>
							We provides hostel facility to both girls
							and boys. <br> The hostel facility is granted to the
							students of the University strictly on the basis of merit.<br>
							The number of seats for each department depends on the department
							size
							
						</td>
					</tr>				
				</table>
			</td>
		</tr>
		<tr>
		     <td><br><br><br></td>
		</tr>
		<tr>
		     <td bgcolor="#085753" ><marquee><font color="white">#HostelLife &nbsp&nbsp&nbsp Here's to the nights that turns into mornings with the friends that turns into family  &nbsp&nbsp&nbsp #HostelLife</font></marquee></td>
		</tr>
	</table>
</body>
</html>
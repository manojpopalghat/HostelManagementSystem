<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.Administration.AdminDAO"%>
<%@page import="com.notification.Notification"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Notification</title>
</head>
<body bgcolor="#e4f7f5">
	<table width="100%" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td width="100%" colspan="5"><img src="../images/header.jpg"
				width="100%" height="150"></td>
		</tr>
		<tr>
			<td colspan="5">
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
			<td align="center" colspan="5" height="30px"><u><b>Update
						Notification</b></u></td>
		</tr>

		<!-- Start Work From Here -->

		<%
			/* ArrayList <Notification> notificationList = AdminDAO.getNotificationList(); */
		%>
		<tr>
			<td align="center" width="100%"><br>
				<form name="frm" method="post" action="updateNotification.jsp">
					<table style="width: 100%; height: 100%;" border="1"
						cellspacing="0" cellpadding="0">
						<tr bgcolor="#a5c9c6">
							<th width="10%">Start Date <br>
							<font size="2px" color="blue">[dd-MM-yyyy]</font></th>
							<th width="10%">End Date <br>
							<font size="2px" color="blue">[dd-MM-yyyy]</font></th>
							<th width="40%">Notification Details</th>
							<th width="40%">Attached File</th>
						</tr>

						<%
							int nid;
							String startDate = "";
							String endDate = "";
							String nDetails = "";
							String linkPath = "";
							String linkStatus = "";
							String startDateArray[];
							String endDateArray[];

							ArrayList<Notification> notificationList = AdminDAO.getNotificationList();
							for (int i = 0; i < notificationList.size(); i++) {
								nid = notificationList.get(i).getNid();
								startDate = notificationList.get(i).getStartDate();
								startDateArray = startDate.split("-");
								endDate = notificationList.get(i).getEndDate();
								endDateArray = endDate.split("-");
								linkPath = notificationList.get(i).getLinkPath();
								linkStatus = notificationList.get(i).getLinkStatus();
								nDetails = notificationList.get(i).getnDetails();
						%>
						<tr>
							<td width="10%" align="center"><%=startDateArray[2]+"-"+startDateArray[1]+"-"+startDateArray[0]%></td>
							<td width="10%" align="center"><%=endDateArray[2]+"-"+endDateArray[1]+"-"+endDateArray[0]%></td>
							<td width="40%" align="left">&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="updateNotification.jsp?nid=<%=nid%>"> <%=nDetails%>
							</a>
							</td>
							<td width="40%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<%=linkPath%>
							</td>
						</tr>

						<%
							}
						%>

						<tr>
							<td colspan="5">&nbsp;</td>
						</tr>
						<!-- <tr>
							<td align="center" colspan="5">
								<input type="submit" name="add" value="Next" style="width:100px ;height: 25px;font-size: 17px">&nbsp;&nbsp;&nbsp;
								<input type="reset" name="reset" value="Reset" style="width: 100px;height: 25px;font-size: 17px">
							</td>
						</tr> -->
						<tr>
							<td colspan="5">&nbsp;</td>
						</tr>

					</table>
				</form></td>
		</tr>

		<tr>
			<td colspan="5"><br>
			<br>
			<br>
			<br>
			<br>
			<br></td>
		</tr>
	</table>
</body>
</html>
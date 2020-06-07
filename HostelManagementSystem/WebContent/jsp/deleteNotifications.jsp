<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.Administration.AdminDAO"%>
<%@page import="com.notification.Notification"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Notifications</title>
<script>
	function checkAll(select)
	{
		var selectAll = document.getElementById("selectAll").checked;
		var nids = document.getElementsByClassName("nids");
		if(selectAll==true)
			for(var i in nids)
				nids[i].checked=true;
		else
			for(var i in nids)
				nids[i].checked=false;	
	}
</script>
</head>
<body bgcolor="#e4f7f5">
	<table width="100%" border="1" cellspacing="0" cellpadding="0" >
		<tr>
			<td width="100%" colspan="5"><img src="../images/header.jpg"
				width="100%" height="150"></td>
		</tr>
		<tr height="3">
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
			<td align="center" colspan="5" height="30px"><u><b>Delete
						Notifications</b></u></td>
		</tr>

		<!-- Start Work From Here -->

		<%
			/* ArrayList <Notification> notificationList = AdminDAO.getNotificationList(); */
		%>
		<tr>
			<td align="center" width="100%"><br>
				<form name="frm" method="post" action="deleteNotificationsSuccess.jsp">
					<table style="width: 100%; height: 100%;" border="1"
						cellspacing="0" cellpadding="0">
						<tr bgcolor="#a5c9c6">
							<th width="10%">Select All<br>
								<input type="checkbox" name="selectAll" id="selectAll" onchange="checkAll(this)">
							</th>
							<th width="10%">Start Date <br>
							<font size="2px" color="blue">[dd-MM-yyyy]</font></th>
							<th width="10%">End Date <br>
							<font size="2px" color="blue">[dd-MM-yyyy]</font></th>
							<th width="40%">Notification Details</th>
							<th width="30%">Attached File</th>
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
							
							String successFlag = request.getParameter("successFlag");
							if(successFlag==null){successFlag="-1";}
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
							<td width="10%" align="center"><input type="checkbox" name="nids" class="nids" value="<%=nid%>"></td>
							<td width="10%" align="center"><%=startDateArray[2]+"-"+startDateArray[1]+"-"+startDateArray[0]%></td>
							<td width="10%" align="center"><%=endDateArray[2]+"-"+endDateArray[1]+"-"+endDateArray[0]%></td>
							<td width="40%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<%=nDetails%></td>
							<td width="30%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<%=linkPath%>
							</td>
						</tr>

						<%
							}
						%>

						<!-- <tr>
							<td colspan="5">&nbsp;</td>
						</tr> -->
						<tr>
							<td align="center" colspan="5" height="50px">
								<input type="submit" value="Delete" style="width:100px ;height: 25px;font-size: 17px;color: red;">&nbsp;&nbsp;&nbsp;
								<input type="reset" value="Reset" style="width: 100px;height: 25px;font-size: 17px">
							</td>
						</tr>
						<tr>
							<%if(successFlag.equals("-1")){ %>
							<td colspan="5" style="color: red;" align="center"><h3>&nbsp;</h3></td>
							<%}else if(successFlag.equals("0")){ %>
							<td colspan="5" style="color: red;" align="center" ><h3>Notifications Is/Are Not Deleted SuccessFully ,<br>Please Try Again !!! </h3></td>
							<%}else{%>
							<td colspan="5" style="color: green;" align="center" ><h3><%=successFlag %>&nbsp;Notifications Deleted SuccessFully. </h3></td>
							<%} %>
						
						</tr>
						<!-- <tr>
							<td colspan="5">&nbsp;</td>
						</tr>  -->

					</table>
				</form></td>
		</tr>

		<tr>
			<td colspan="5"><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</td>
		</tr>
	</table>
</body>
</html>
<%@page import="com.Administration.AdminDAO"%>
<%@page import="com.notification.Notification"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Notification</title>
<script type="text/javascript">
	
	function setFile()
	{
		var linkStatusYes = document.getElementById("linkStatusYes").checked;
		var linkStatusNo = document.getElementById("linkStatusNo").checked;
		if(linkStatusYes == true && linkStatusNo == false)
		{
			document.getElementById("linkPath").disabled = false;
		}
		else
		{
			document.getElementById("linkPath").disabled = true;
		}	
	}
	function back() {
		document.frm.action="updateNotificationList.jsp";
		document.frm.method="post";
		document.frm.submit();
	}
</script>
</head>
<body bgcolor="#e4f7f5">
	<table width="100%" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td width="100%" colspan="5"><img src="../images/header.jpg" width="100%"
				height="150"></td>
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
			<td align="center"  height="30px"><u><b>Update Notification</b></u></td>
			<td align="center"  height="30px" style="font: bold; color:#ff0000;"><u><b>Notifications</b></u></td>
			
		</tr>
		
		<!-- Start Work From Here -->
		
		
		<% 
			String successFlag = request.getParameter("successFlag");
			if(successFlag == null){successFlag = "-1";}
			
			String stringNid = request.getParameter("nid");
			if(stringNid == null){stringNid = "-1";}
			int nid = Integer.parseInt(stringNid);
			
			Notification notification = AdminDAO.getNotification(nid);
			
		%>
		<tr>
			<td align="center"  width="50% " rowspan="15"><br/>
				<table border="0" cellspacing="0" cellpadding="0" >
					<tr>
						<td align="center">	
							<form name="frm" method="post" action="updateNotificationSuccess.jsp" enctype="multipart/form-data">
								<table border="0" cellspacing="2" cellpadding="0" >				
									<tr>
										<td>Start Date</td>
										<td>:</td>
										<td><input name="startDate" id="startDate" type="date" value="<%=notification.getStartDate()%>"></td>
									</tr>
									<tr>
										<td>End Date</td>
										<td>:</td>
										<td><input name="endDate" id="endDate" type="date" value="<%=notification.getEndDate()%>"></td>
									</tr>
									<tr>
										<td>Notification<font color="red">*</font></td>
										<td>:</td>
										<td><textarea name="nDetails" id="nDetails" rows="4" cols="40" required><%=notification.getnDetails()%></textarea></td>
									</tr>
									
									<tr>
										<td>Attached File</td>
										<td>:</td>
										<td><i><%=notification.getLinkPath()%></i></td>
									</tr>
									<tr>
										<td>Want to Attach<br> New File ?</td>
										<td>:</td>
										<td>
											<input name="linkStatus" id="linkStatusYes" type="radio" value="Y" onchange="setFile()">Yes&nbsp;&nbsp;
											<input name="linkStatus" id="linkStatusNo" type="radio" value="N" onchange="setFile()" checked>No
										</td>
									</tr>
									<input type="hidden" name="oldLinkStatus" id="oldLinkStatus" value="<%=notification.getLinkStatus()%>" >
									<input type="hidden" name="oldLinkPath" id="oldLinkPath" value="<%=notification.getLinkPath()%>">
									<input type="hidden" name="nid" id="nid" value="<%=notification.getNid()%>">
									
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>
											<input name="linkPath" id="linkPath" type="file" required disabled>
										</td>
									</tr>
										
									<tr><td colspan="3">&nbsp;</td></tr>
									<tr>
										<td align="center" colspan="3">
											<input type="submit" value="Update" style="width: 100px;height: 25px;font-size: 17px;color: orange;">&nbsp;&nbsp;&nbsp;
											<input type="button" value="Back" onclick="back()" style="width: 100px;height: 25px;font-size: 17px">
										</td>
									</tr>
									
									<tr>
										<%if(successFlag.equals("1")){ %>
										<td colspan="3" style="color: green;" align="center"><h3>Notification Updated SuccessFully.</h3></td>
										<%}else if(successFlag.equals("0")){ %>
										<td colspan="3" style="color: red;" align="center"><h3>Notification is Not Updated SuccessFully ,<br>Please Try Again !!! </h3></td>
										<%}else{%>
										<td colspan="3" style="color: red;" align="center">&nbsp; </td>
										<%} %>
						
									</tr>
									 
								</table>	
							</form>		
							<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>					
						</td>
					</tr>
				</table>
			</td>
			<td align="center">
				<iframe src="notifications.jsp" frameborder="0"  height="600px" width="100%"></iframe>
				
			</td>
			
		</tr>
	</table>
</body>
</html>

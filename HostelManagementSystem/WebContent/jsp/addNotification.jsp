<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add Notification</title>
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
			<td align="center"  height="30px"><u><b>Add Notification</b></u></td>
			<td align="center"  height="30px" style="font: bold; color:#ff0000;"><u><b>Notifications</b></u></td>
			
		</tr>
		
		<!-- Start Work From Here -->
		
		<%
			Date date = new Date();
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
			String currentDate = simpleDate.format(date);
			int day = date.getDate();
			int month = date.getMonth();
			int year = date.getYear();
			Date date2 = new Date(year,(month+1)%12,day);
			String dateAfterOneMonth = simpleDate.format(date2);
		%>
		<% 
			String successFlag = request.getParameter("successFlag");
			if(successFlag == null){successFlag = "-1";}
		%>
		<tr>
			<td align="center"  width="50% " rowspan="15"><br/>
				<table border="0" cellspacing="0" cellpadding="0" >
					<tr>
						<td align="center">	
							<form name="frm" method="post" action="addNotificationSuccess.jsp" enctype="multipart/form-data">
								<table border="0" cellspacing="2" cellpadding="0" >				
									<tr>
										<td>Start Date</td>
										<td>:</td>
										<td><input name="startDate" id="startDate" type="date" value="<%=currentDate%>"></td>
									</tr>
									<tr>
										<td>End Date</td>
										<td>:</td>
										<td><input name="endDate" id="endDate" type="date" value="<%=dateAfterOneMonth%>"></td>
									</tr>
									<tr>
										<td>Notification<font color="red">*</font></td>
										<td>:</td>
										<td><textarea name="nDetails" id="nDetails" rows="4" cols="40" required></textarea></td>
									</tr>
									
									<tr>
										<td>Attach File</td>
										<td>:</td>
										<td>
											<input name="linkStatus" id="linkStatusYes" type="radio" value="Y" onchange="setFile()">Yes&nbsp;&nbsp;
											<input name="linkStatus" id="linkStatusNo" type="radio" value="N" onchange="setFile()" checked>No
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>
											<input name="linkPath" id="linkPath" type="file" required disabled accept="application/pdf, .doc, .docx, .odf">
										</td>
									</tr>
										
									<tr><td colspan="3">&nbsp;</td></tr>
									<tr>
										<td align="center" colspan="3">
											<input type="submit" name="add" value="Add" style="width: 100px;height: 25px;font-size: 17px">&nbsp;&nbsp;&nbsp;
											<input type="reset" name="reset" value="Reset" style="width: 100px;height: 25px;font-size: 17px">
										</td>
									</tr>
									
									<tr>
										<%if(successFlag.equals("1")){ %>
										<td colspan="3" style="color: green;" align="center"><h3>Notification Added SuccessFully.</h3></td>
										<%}else if(successFlag.equals("0")){ %>
										<td colspan="3" style="color: red;" align="center"><h3>Notification is Not Added SuccessFully ,<br>Please Try Again !!! </h3></td>
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

<%@page import="java.text.DateFormat,java.text.ParseException,java.text.SimpleDateFormat,java.util.Calendar,java.util.Date,java.util.*" %>
<%@page import="com.Vehicle.VehicleVO"%>
<%@page import="com.Vehicle.VehicleDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Unleaved Vehicle Details</title>
	</head>
	<body bgcolor="#e4f7f5">
		<table width="100%" border="0">
			<tr>
				<td width="100%"><img src="../images/header.jpg" width="100%" height="150"></td>
			</tr>
			<tr>
				<td>
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
				<td align="center"><h2><b>Unleaved Vehicle Details</b></h2></td>
			</tr>
        	<tr>
       			<td align="center">
       				<form name="frm" id="frm" method="post" action="vehicleLeavedSuccessfully.jsp" onsubmit="" >
       					<table align ="center" width="65%" border="0">
							<hr>
							<%
								ArrayList<VehicleVO> al=VehicleDAO.fetchUnleavedVehicleDetails();
							
								VehicleVO responsetvo = new VehicleVO();
							%>
							<%
								for(int j=0;j<al.size();j++)
								{
									responsetvo=(VehicleVO)al.get(j);
									if(j==0){
							%>
								<tr>
									<th width="14%" align="left" class="th_style" style="font-family:'Courier New', Courier, monospace">
										<strong><font size="+0.35">Vehicle Type</font></strong>
									</th>
									<th width="14%" align="left" class="th_style" style="font-family:'Courier New', Courier, monospace">
										<strong><font size="+0.35">Vehicle Number</font></strong>
									</th>
									<th width="16%" align="left" class="th_style" style="font-family:'Courier New', Courier, monospace">
										<strong><font size="+0.35">Driver Name</font></strong>
									</th>
									<th width="20%" align="left" class="th_style" style="font-family:'Courier New', Courier, monospace">
										<strong><font size="+0.35">Driver Mobile Number </font></strong>
									</th>
									<th width="14%" align="left" class="th_style" style="font-family:'Courier New', Courier, monospace">
										<strong><font size="+0.35">InTime</font></strong>
									</th>
								</tr>
							<% } %>
								<tr>
								<td width="16%" align="left"><%=responsetvo.getVehicleType()%></td>
								<td width="16%" align="left"><%=responsetvo.getVehicleNumber()%></td>
								<td width="16%" align="left"><%=responsetvo.getDriverName()%></td>								
								<td width="16%" align="left"><%=responsetvo.getDriverMobileNumber()%></td>
								<td width="16%" align="left"><%=responsetvo.getInTime()%></td>
								</tr>
							<%}%>
	       				</table>
	       				<table>
	       					<tr><td>&nbsp</td></tr>
	       					<tr><td>&nbsp</td></tr>
	       					<tr><td>&nbsp</td></tr>
							<tr>
								<td>For Save Out Time</td>
								<td>
									<select type="text" name="vehicleNumber" id="vehicleNumber" onchange="" style="width: 100%;">
										<option value="">Select Vehicle Number</option>
									<%for (int i = 0; i < al.size(); i++) {%>
										<option value="<%=al.get(i).getVehicleNumber()%>"><%=al.get(i).getVehicleNumber()%></option>
									<%}%>
									</select>
								</td>
							</tr>
							<tr>
								<td align="center" width="100%" colspan="2">
									<br>
									<input type="submit" name="submit" value="Save" id="submit" style="width: 180px;height: 20px;font-size: 15px">
								</td>
							</tr>
					</form>
       			</td>
            </tr>
        
        </table>
	</body>
</html>
<%@page import="java.text.DateFormat,java.text.ParseException,java.text.SimpleDateFormat,java.util.Calendar,java.util.Date" %>
<%@page import="com.Vehicle.VehicleVO"%>
<%@page import="com.Vehicle.VehicleDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Vehicle Entry Success?</title>
	</head>
	<body bgcolor="#e4f7f5">
		<table width="100%" border="1">
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
				<td align="center"><h2><b>Vehical Entry Success Screen</b></h2></td>
			</tr>
        	<tr>
       			<td align="center">
       				<form name="frm" id="frm" method="post" action="vehicleEntry.jsp" >
       					<table align ="center" width="50%" border="0">
							<%
								String vehicleType = request.getParameter("vehicleType");
								String vehicleNumber = request.getParameter("vehicleNumber");
								String driverName = request.getParameter("driverName");
								String driverMobileNumber = request.getParameter("driverMobileNumber");
								String date = request.getParameter("date");
								String inTime = request.getParameter("inTime");
								String outTime = "null";
						
								VehicleVO requestvo = new VehicleVO();
	
								
								requestvo.setVehicleType(vehicleType);
								requestvo.setVehicleNumber(vehicleNumber);
								requestvo.setDriverName(driverName);
								requestvo.setDriverMobileNumber(driverMobileNumber);
								requestvo.setDate(date);
								requestvo.setInTime(inTime);
								requestvo.setOutTime(outTime);
							
								int successFlag = VehicleDAO.saveVehicleEntryDetails(requestvo);
							%>
							<%
								if (successFlag == 1) {
							%>
							<tr>
								<td width="15%" align="center"><font color="Green"><b>Vehicle Entry Details Are Added SuccessFully!!!</b></font></td>
							</tr>
							<%
								} else {
							%>
							<tr>
								<td width="15%" align="center"><font color="red"><b>Vehicle Entry Details Are Not Added SuccessFully.</b></font></td>
							</tr>
							<%
								}
							%>
							<tr>
	       						<td align="center" colspan="4">
	       							<input type="submit" name="submit" value="Click TO Add More Data" id="submit" style="width: 180px;height: 20px;font-size: 15px">
	       						</td>
	    	   				</tr>
	       				</table>
       				</form>
       			</td>
            </tr>
        
        </table>
	</body>
</html>
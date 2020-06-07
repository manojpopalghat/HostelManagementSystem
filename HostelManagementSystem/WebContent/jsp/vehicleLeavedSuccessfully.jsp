<%@page import="java.text.DateFormat,java.text.ParseException,java.text.SimpleDateFormat,java.util.Calendar,java.util.Date" %>
<%@page import="com.Vehicle.VehicleVO"%>
<%@page import="com.Vehicle.VehicleDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Vehicle Leaved Success?</title>
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
				<td align="center"><h2><b>Vehical Leave Success Screen</b></h2></td>
			</tr>
        	<tr>
       			<td align="center">
       				<form name="frm" id="frm" method="post" action="unleavedVehicleDetails.jsp" >
       					<table align ="center" width="50%" border="0">
							<%
								String vehicleNumber = request.getParameter("vehicleNumber");
								
								VehicleVO requestvo = new VehicleVO();
	
								int successFlag = VehicleDAO.updateOutTimeOfVehicle(vehicleNumber);
							%>
							<%
								if (successFlag > 0) {
							%>
							<tr>
								<td width="15%" align="center"><font color="Green"><b>Vehicle Leaved SuccessFully!!!</b></font></td>
							</tr>
							<%
								} else {
							%>
							<tr>
								<td width="15%" align="center"><font color="red"><b>Vehicle NOT Leaved SuccessFully.</b></font></td>
							</tr>
							<%
								}
							%>
							<tr>
	       						<td align="center" colspan="4">
	       							<input type="submit" name="submit" value="Unlived Vehicle Detail" id="submit" style="width: 180px;height: 20px;font-size: 15px">
	       						</td>
	    	   				</tr>
	       				</table>
       				</form>
       			</td>
            </tr>
        
        </table>
	</body>
</html>
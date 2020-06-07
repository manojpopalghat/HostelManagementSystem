<%@page import="java.text.DateFormat,java.text.ParseException,java.text.SimpleDateFormat,java.util.Calendar,java.util.Date,java.util.ArrayList" %>
<%@page import="com.Vehicle.VehicleVO"%>
<%@page import="com.Vehicle.VehicleDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Vehicle Report success Screen</title>
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
				<td align="center"  height="30px"><h2 align="center" style="color: blue;"><u>Vehicle Report Screen</u></h2></td>
			</tr>
			
			<!-- Start Work From Here -->
			
			
			<tr>
				<td align="center"  width="50% " rowspan="15"><br/>
					<table border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td align="center">	
								<form name="frm" method="post" action="vehicleReport.jsp">
								<%
		
									String vehicleType = "";
									String vehicleNumber = request.getParameter("vehicleNumber");
									String driverName = "";
									String driverMobileNumber = "";
									String date = "";
									String inTime = "";
									String outTime = "";
									
									String fromDate = request.getParameter("fromDate");
									String toDate = request.getParameter("toDate");
						
									System.out.println("fromDate:" + request.getParameter("fromDate") + " toDate:" + request.getParameter("toDate"));
									
									VehicleVO responsetvo = new VehicleVO();
									
									ArrayList<VehicleVO> al = VehicleDAO.fetchVehicleDetails(vehicleNumber,fromDate,toDate);
								%>
									<table border="0" cellspacing="2" cellpadding="0" >				
										<%
											for (int j = 0; j < al.size(); j++) {
												responsetvo = (VehicleVO) al.get(j);
												if (j == 0) {
										%>

									<tr>
										<th width="8%" align="center" class="th_style"
											style="font-family: 'Courier New', Courier, monospace">
											<strong><font size="+0.35">Vehicle Type</font></strong>
										</th>
										<th width="10%" align="center" class="th_style"
											style="font-family: 'Courier New', Courier, monospace">
											<strong><font size="+0.35">Vehicle No</font></strong>
										</th>
										<th width="16%" align="center" class="th_style"
											style="font-family: 'Courier New', Courier, monospace">
											<strong><font size="+0.35">Driver Name</font></strong>
										</th>
										<th width="16%" align="center" class="th_style"
											style="font-family: 'Courier New', Courier, monospace">
											<strong><font size="+0.35">Driver No.</font></strong>
										</th>
										<th width="9%" align="center" class="th_style"
											style="font-family: 'Courier New', Courier, monospace">
											<strong><font size="+0.35">Date</font></strong>
										</th>
										<th width="9%" align="center" class="th_style"
											style="font-family: 'Courier New', Courier, monospace">
											<strong><font size="+0.35">InTime</font></strong>
										</th>
										<th width="9%" align="center" class="th_style"
											style="font-family: 'Courier New', Courier, monospace">
											<strong><font size="+0.35">OutTime</font></strong>
										</th>
									</tr>
									<%
										}
									%>
									<tr>
										<td width="8%" align="center"><%=responsetvo.getVehicleType()%></td>
										<td width="8%" align="center"><%=responsetvo.getVehicleNumber()%></td>
										<td width="8%" align="center"><%=responsetvo.getDriverName()%></td>
										<td width="8%" align="center"><%=responsetvo.getDriverMobileNumber()%></td>
										<td width="8%" align="center"><%=responsetvo.getDate()%></td>
										<td width="8%" align="center"><%=responsetvo.getInTime()%></td>
										<td width="8%" align="center"><%=responsetvo.getOutTime()%></td>
									</tr>
									<%
										}
									%>

									<tr>
										<td colspan="10">
											<%
												if(al.size()==0)
												{
											%>
											<font color=red><b>
											No Record Found for Vehicle Number <%=vehicleNumber %>
											between <%=fromDate %> and <%=toDate %>
											</b></font>
											<%} %>
										</td>
									</tr>

									<tr>
										<td width="60%" align="center" colspan="10"><input
											name="btnSchAdd" id="btnSchAdd" type="submit" value="Back"
											style="width: 120px; height: 30px; font-family: 'Courier New', verdana, monospace"
										 /> &nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
										
										
										 
									</table>	
								</form>		
								<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>					
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
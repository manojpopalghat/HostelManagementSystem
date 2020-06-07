<%@page import="java.text.DateFormat,java.text.ParseException,java.text.SimpleDateFormat,java.util.Calendar,java.util.Date,java.util.ArrayList" %>
<%@page import="com.Vehicle.VehicleVO"%>
<%@page import="com.Vehicle.VehicleDAO"%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Generate Vehicle Report</title>
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
				<td align="center"  height="30px"><h2 align="center" style="color: blue;"><u>Generate Vehicle Report</u></h2></td>
			</tr>
			
			<!-- Start Work From Here -->
			
			<%
				String vehicleNumber = "";
				int i, hr;
				Date date = new Date();
		
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
				String toDate = simpleDate.format(date);
				
				Date date1 = new Date();
				int day = date1.getDay();
				int month = date1.getMonth();
				int year = date1.getYear();
				
				if(day < 7)
				{	
					if(month == 1)
					{
						day = 24+day;
						month = 12;
						year = year-1;
					}
					else if((month == 2)||(month == 4)||(month == 6)||(month == 9)||(month == 11))
					{
						day = 24+day;
						month = month-1;
					}
					else if(month == 3)
					{
						if(year%4==0)
						{
							if(year%100==0 && year%400!=0)
							{
								day = 21 + day;
								month = month - 1;
							}
							day = 22 + day;
							month = month - 1;
						}
						else
						{
							day = 21 + day;
							month = month - 1;
						}
					}
					else
					{
						day = 23+day;
						month = month-1;
					}
				}
				
				date1.setDate(day);
				date1.setMonth(month);
				date1.setYear(year);
				
				SimpleDateFormat simpleDate1 = new SimpleDateFormat("yyyy-MM-dd");
				String fromDate = simpleDate.format(date1);
			%>
			
			<tr>
				<td align="center"  width="50% " rowspan="15"><br/>
					<table border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td align="center">	
								<form name="frm" method="post" action="vehicleReportSuccess.jsp">
									<table border="0" cellspacing="2" cellpadding="0" >				
										<tr>
											<td>From Date</td>
											<td>:</td>
											<td><input name="fromDate" id="fromDate" type="date" value="<%=fromDate%>"></td>
										</tr>
										<tr>
											<td>To Date</td>
											<td>:</td>
											<td><input name="toDate" id="toDate" type="date" value="<%=toDate%>"></td>
										</tr>
										<tr>
											<td>Vehicle No.<font color="red">*</font></td>
											<td>:</td>
											<td>
												<%ArrayList<VehicleVO> vehicleNumberList = VehicleDAO.fetchVehicleNumber();%>
												<input type="text"
												placeholder="Select / Enter Vehicle Number"
												name="vehicleNumber" id="vehicleNumber"
												value="<%=vehicleNumber %>" list="vehicleNumberList" required> <datalist
													id="vehicleNumberList">
													<%for(int j=0;j<vehicleNumberList.size();j++){ %>
													<option><%=vehicleNumberList.get(j).getVehicleNumber()%></option>
													<%} %>
												</datalist>
											</td>
										</tr>
										<tr>
											<td align="center" colspan="3">
												<input type="submit" name="add" value="Ganerate" onclick="" style="width: 100px;height: 25px;font-size: 17px">&nbsp;&nbsp;&nbsp;
												<input type="reset" name="reset" value="Reset" style="width: 100px;height: 25px;font-size: 17px">
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

<%@page import="java.text.DateFormat,java.text.ParseException,java.text.SimpleDateFormat,java.util.Calendar,java.util.Date,java.util.ArrayList" %>
<%@page import="com.Vehicle.VehicleVO"%>
<%@page import="com.Vehicle.VehicleDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vehicle Entry</title>
<style>
.background {
	background: url(../images/registration.jpg);
	border: 1px solid black;
}

.transbox {
	margin: 30px;
	background-color: white;
	border: 1px solid black;
	opacity: 0.9;
}

.transbox p {
	margin: 2%;
	font-weight: bold;
	color: #000000;
}
</style>

</head>
<body bgcolor="#e4f7f5">
	<%
		int i, hr;
		Date date = new Date();

		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = simpleDate.format(date);

		SimpleDateFormat simpleDate1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
		String currentDate1 = simpleDate1.format(date);
		System.out.println(currentDate1);

		String currentTime = "";
		char a[] = currentDate1.toCharArray();

		for (i = 0; i < 11; i++) {
			currentTime = currentTime + a[i + 11];
		}
	%>
	<%
		
		
		String vehicleType = request.getParameter("vehicleType");
		if (vehicleType == null)
		{
			vehicleType = "";
		}

		String vehicleNumber = request.getParameter("vehicleNumber");
		if (vehicleNumber == null)
		{
			vehicleNumber = "";
		}

		String driverName = request.getParameter("driverName");
		if (driverName == null)
		{
			driverName = "";
		}

		String driverMobileNumber = request.getParameter("driverMobileNumber");
		if (driverMobileNumber == null)
		{
			driverMobileNumber = "";
		}

		if (driverName != "")
		{
			driverMobileNumber = VehicleDAO.fetchDriverMobileNumber1(driverName);
		}
		
 
		if (vehicleNumber != "" && vehicleType=="")
		{
				vehicleType = VehicleDAO.fetchVehicleType1(vehicleNumber);
				driverName = VehicleDAO.fetchDriverName1(vehicleNumber);
				driverMobileNumber = VehicleDAO.fetchDriverMobileNumber1(driverName);
		}
		
	%>

	<table style="width: 100%;" border="1" cellspacing="0" cellpadding="0">
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
			<td class="background" width="100%" align="center"><br>
			<br>
			<br>
			<br>
			<br>
			<br>

				<form name="frm" id="frm" method="post"
					action="vehicleEntrySuccess.jsp">
					<table align="center" width="50%" border="0">
						<tr>
							<td class="transbox" width="90%" align="center">
								<h2 align="center" style="color: blue;">
									<u>Vehicle Detail</u>
								</h2>
								<hr> <!-- Vehicle Details -->

								<table>
									<tr>
										<td align="right">Vehicle
											Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td width="5%"><b>:</b></td>
										<td><input name="vehicleType" id="vehicleType" value="<%=vehicleType %>"
											style="width: 160px;" placeholder="select/insert"
											list="vehicleList" required> <datalist
												id="vehicleList">
												<option value="Ambulence">
												<option value="Bike">
												<option value="Truck">
												<option value="Tanker">
												<option value="Car">
											</datalist></td>
									</tr>
									<tr>
										<td align="right">Vehicle No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td width="5%"><b>:</b></td>
										<td>
											<%ArrayList<VehicleVO> vehicleNumberList = VehicleDAO.fetchVehicleNumber();%>
											<input type="text"
											placeholder="Select / Enter Vehicle Number"
											name="vehicleNumber" id="vehicleNumber"
											value="<%=vehicleNumber %>" list="vehicleNumberList"
											onchange="onLoad(this)" required> <datalist
												id="vehicleNumberList">
												<%for(int j=0;j<vehicleNumberList.size();j++){ %>
												<option><%=vehicleNumberList.get(j).getVehicleNumber()%></option>
												<%} %>
											</datalist>
										</td>
									</tr>
									<tr>
										<td align="right">Driver
											Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td width="5%"><b>:</b></td>
										<td>
											<%ArrayList<VehicleVO> driverNameList=VehicleDAO.fetchDriverName(); %>
											<input type="text" placeholder="Select / Enter Driver Name"
											name="driverName" id="driverName" value="<%=driverName %>"
											list="driverNameList" onchange="onLoad(this)" onkeypress="javascript:return lettersOnly(event)" required> <datalist
												id="driverNameList" >
												<%for(int j=0;j<driverNameList.size();j++){ %>
												<option><%=driverNameList.get(j).getDriverName()%></option>
												<%} %>
											</datalist>
										</td>
									</tr>
									<tr>
										<td align="right">Driver Mobile No.</td>
										<td width="5%"><b>:</b></td>
										<td width="45%"><input name="driverMobileNumber"
											id="driverMobileNumber" value="<%=driverMobileNumber%>"
											type="text" placeholder=""
											onkeypress="javascript:return numberOnly(event)" required>
									</tr>
									<tr>
										<td align="right">Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td width="5%"><b>:</b></td>
										<td width="45%"><input name="date" id="date"
											value="<%=currentDate%>" type="date" readonly></td>
									</tr>
									<tr>
										<td align="right">In
											Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td width="5%"><b>:</b></td>
										<td width="45%"><input name="inTime" id="inTime"
											value="<%=currentTime%>" type="text" readonly></td>
									</tr>
								</table> <br>
								<hr>
								<table>
									<tr>
										<td align="center">
											<input type="submit" value="Submit" style="width: 180px; font: bolder; font-size: large; font-weight: bolder; color: white; background-color: blue;"onclick="return validate()" > 
											<input type="reset" value="Reset" style="width:180px; font: bolder;font-size: large;font-weight: bolder;color: white;background-color: red;" />
											<br><br>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>

<script type="text/javascript">
	function lettersOnly(evt)
	{
	    evt = (evt) ? evt : event;
	    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
		    if (charCode > 33 && (charCode < 65) && (charCode < 97 || charCode > 122)) 
		    {
		    	alert("Please Enter letters only.");
		       return false;
		    }
	    return true;
	  }
	
	function numberOnly(evt) 
	{
	    var iKeyCode = (evt.which) ? evt.which : evt.keyCode;
		    if (iKeyCode!=13 && (iKeyCode<48 || iKeyCode > 57))
		    {
		    	alert("Please Enter numbers only.");
		    	return false;
		    }	
		  return true;
	}
	
	function isValidMobileNumber() 
	{
		if(form.driverMobileNumber.value.length != 10)
		{
			alert("Please Enter Valid Mobile Number !\nMobile Number should be of 10 digits.");
			return false;
		}
		else
			return true;
	}
	
	function validate()
	{
		form = document.getElementById("frm");
		
		if(isValidMobileNumber()==false)	
			return false;
		
		return true;
	}	
	
	function onLoad(select)
	{
		document.frm.action="vehicleEntry.jsp";
		document.frm.method="post";
		document.frm.submit();
	}

</script>
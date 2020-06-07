<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.hostel.Hostel" %>	
<%@page import="com.Administration.AdminDAO" %>	
<%@page import="java.util.ArrayList" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Hostels</title>
<script>
	function edit(id)
	{
		var hId = document.getElementById("hId:"+id);
		var edit = document.getElementById("edit:"+id);
		var gender = document.getElementById("gender:"+id);
		var rooms = document.getElementById("rooms:"+id);
		var capacity = document.getElementById("capacity:"+id);
		var allotedRooms = document.getElementById("allotedRooms:"+id);
		var unallotedRooms = document.getElementById("unallotedRooms:"+id);
		var filledStudents = document.getElementById("filledStudents:"+id);
		var remainingSpace = document.getElementById("remainingSpace:"+id);
		var rector = document.getElementById("rector:"+id);
		if(edit.value=="Edit")
		{
			edit.value="Save"
			gender.readOnly=false;
			rooms.readOnly=false;
			capacity.readOnly=false;
			rector.readOnly=false;
			allotedRooms.readOnly=false;
			unallotedRooms.readOnly=false;
			filledStudents.readOnly=false;
			remainingSpace.readOnly=false;
			
		}
		else
		{
			window.location.href = "editHostel.jsp?hId="+hId.value+"&gender="+gender.value+"&rooms="+rooms.value+"&capacity="+capacity.value+"&allotedRooms="+allotedRooms.value+"&unallotedRooms="+unallotedRooms.value+"&filledStudents="+filledStudents.value+"&remainingSpace="+remainingSpace.value+"&rector="+rector.value;
		}	
	}
	function remove(id)
	{
		var hId = document.getElementById("hId:"+id);
        var confirm = prompt("Are you sure to DELETE.\n If yes type y|Y\nOtherwise enter any other key","N"); 
		if(confirm == 'Y' || confirm == 'y')
		{
			window.location.href = "deleteHostel.jsp?hId="+hId.value;
		}
		return false;
	}
	function onChangeAllotedRooms(id)
	{
		var rooms = document.getElementById("rooms:"+id);
		var allotedRooms = document.getElementById("allotedRooms:"+id);
		var unallotedRooms = document.getElementById("unallotedRooms:"+id);
		unallotedRooms.value = rooms.value - allotedRooms.value;
	}
	
	function onChangeFilledStudents(id)
	{
		var capacity = document.getElementById("capacity:"+id);
		var filledStudents = document.getElementById("filledStudents:"+id);
		var remainingSpace = document.getElementById("remainingSpace:"+id);
		remainingSpace.value = capacity.value - filledStudents.value;
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
			<td align="center" colspan="5" height="30px"><u><b>Manage Hostels</b></u></td>
		</tr>

		<!-- Start Work From Here -->

		<%
		ArrayList <Hostel> hostelList = AdminDAO.getHostelList(); 
		int totalRooms = 0;
		int totalCapacity = 0;
		int totalAllotedRooms = 0;
		int totalAnallotedRooms = 0;
		int totalFilledStudents = 0;
		int totalRemainingSpace = 0;
		%>
		<tr>
			<td align="center" width="100%"><br>
				<table style="width: 100%; height: 100%;" border="1" cellspacing="0" cellpadding="2">
					<tr bgcolor="#a5c9c6">
						<th width="15%">Name<br><font size="2px" color="blue">[Click for More Details]</font></th>
						<th width="15%">Gents/Ladies</th>
						<th width="5%">Rooms</th>
						<th width="5%">Capacity</th>
						<th width="5%">Alloted Rooms</th>
						<th width="5%">Unalloted Rooms</th>
						<th width="5%">Filled Students</th>
						<th width="5%">Remaining Space</th>
						<th width="20%">Rector</th>
						<th width="20%">Actions</th>
					</tr>
					
					<%for(int i=0;i<hostelList.size();i++){
						totalRooms+=hostelList.get(i).getRooms();
						totalAllotedRooms+=hostelList.get(i).getAllotedRooms();
						totalAnallotedRooms+=hostelList.get(i).getUnallotedRooms();
						totalCapacity+=hostelList.get(i).getCapacity();
						totalFilledStudents+=hostelList.get(i).getFilledStudents();
						totalRemainingSpace+=hostelList.get(i).getRemainingSpace();
					%>
					<tr>
						<td align="center" width="15%">
							<input type="hidden" name="hId:<%=i%>" id="hId:<%=i%>" value="<%=hostelList.get(i).gethId()%>">
							<a href="manageHostel.jsp?hId=<%=hostelList.get(i).gethId()%>"><%= hostelList.get(i).getName()%></a></td>
						<td align="center" width="15%"><input type="text" name="gender:<%=i%>" id="gender:<%=i%>" value="<%=hostelList.get(i).getGender()%>" style="width:95%" readonly></td>
						<td align="center" width="5%"><input type="number" name="rooms:<%=i%>" id="rooms:<%=i%>" value="<%=hostelList.get(i).getRooms()%>" style="width:95%" readonly></td>
						<td align="center" width="5%"><input type="number" name="capacity:<%=i%>" id="capacity:<%=i%>" value="<%=hostelList.get(i).getCapacity()%>" style="width:95%" readonly></td>
						<td align="center" width="5%"><input type="number" name="allotedRooms:<%=i%>" id="allotedRooms:<%=i%>" onchange="onChangeAllotedRooms(<%=i %>)" value="<%=hostelList.get(i).getAllotedRooms()%>" style="width:95%" readonly></td>
						<td align="center" width="5%"><input type="number" name="unallotedRooms:<%=i%>" id="unallotedRooms:<%=i%>" value="<%=hostelList.get(i).getUnallotedRooms()%>" style="width:95%" readonly></td>
						<td align="center" width="5%"><input type="number" name="filledStudents:<%=i%>" id="filledStudents:<%=i%>" onchange="onChangeFilledStudents(<%=i %>)" value="<%=hostelList.get(i).getFilledStudents()%>" style="width:95%" readonly></td>
						<td align="center" width="5%"><input type="number" name="remainingSpace:<%=i%>" id="remainingSpace:<%=i%>" value="<%=hostelList.get(i).getRemainingSpace()%>" style="width:95%" readonly></td>
						<td align="center" width="20%"><input type="text" name="rector:<%=i%>" id="rector:<%=i%>" value="<%=hostelList.get(i).getRector()%>" style="width:95%" readonly></td>
						<td align="center" width="20%">
							<input type="button" onclick="edit(<%=i%>);" name="edit:<%=i%>" id="edit:<%=i%>" value="Edit" style="width:40%; background-color: blue;color:white;font-weight: bold;font-size: 13px;font-style: italic;" >&nbsp;&nbsp;
							<input type="button" onclick="remove(<%=i%>);" name="edit:<%=i%>" id="edit:<%=i%>" value="Delete" style="width:40%; background-color: red;color:white;font-weight: bold;font-size: 13px;font-style: italic;" >
						</td>
					</tr>
					<%} %>
					<tr>
						<th align="center" width="15%">Total</th>
						<td align="center" width="15%">&nbsp;</td>
						<td align="left" width="5%"><%=totalRooms%></td>
						<td align="left" width="5%"><%=totalCapacity%></td>
						<td align="left" width="5%"><%=totalAllotedRooms%></td>
						<td align="left" width="5%"><%=totalAnallotedRooms%></td>
						<td align="left" width="5%"><%=totalFilledStudents%></td>
						<td align="left" width="5%"><%=totalRemainingSpace%></td>
						<td align="center" width="20%">&nbsp;</td>
						<td align="center" width="20%">&nbsp;</td>
					</tr>
					<form name="frm" method="post" action="addHostel.jsp">
					<tr>
						<td align="center" width="15%"><input type="text" name="newHostelName" id="newHostelName" placeholder="e.g. G10" required></td>
						<td align="center" width="15%"><input type="text" name="newHostelGender" id="newHostelGender" style="width:95%" placeholder="e.g. Gents" required></td>
						<td align="center" width="5%"><input type="number" name="newHostelRooms" id="newHostelRooms" style="width:95%" placeholder="e.g. 10" required="required"></td>
						<td align="center" width="5%"><input type="number" name="newHostelCapacity" id="newHostelCapacity" style="width:95%" placeholder="e.g. 50" required></td>
						<td align="center" width="5%">&nbsp;</td>
						<td align="center" width="5%">&nbsp;</td>
						<td align="center" width="5%">&nbsp;</td>
						<td align="center" width="5%">&nbsp;</td>
						<td align="center" width="20%"><input type="text" name="newHostelRector" id="newHostelRector" style="width:95%" placeholder="e.g. S A Kandekar" required></td>
						<td align="center" width="20%">
							<input type="submit" onclick="return validate();" name="add" id="add" value="Add" style="width:86%; background-color:green;color:white; font-weight: bold;font-size: 13px;font-style: italic;" >
						</td>
					</tr>
					</form>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="5"><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</td>
		</tr>
	</table>
</body>
</html>
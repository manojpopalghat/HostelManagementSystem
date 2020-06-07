<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.hostel.Hostel" %>
<%@page import="com.hostel.Room" %>	
<%@page import="com.Student.Student" %>	
<%@page import="com.Administration.AdminDAO" %>	
<%@page import="java.util.ArrayList" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Hostel</title>
<script>
	function edit(id)
	{
		var rId = document.getElementById("rId:"+id);
		var hId = document.getElementById("hId");
		var edit = document.getElementById("edit:"+id);
		var allotedFor = document.getElementById("allotedFor:"+id);
		var capacity = document.getElementById("capacity:"+id);
		var filledStudents = document.getElementById("filledStudents:"+id);
		var remainingSpace = document.getElementById("remainingSpace:"+id);
		var isRoomFulled = document.getElementById("isRoomFulled:"+id);

		if(edit.value=="Edit")
		{
			edit.value="Save"
			allotedFor.readOnly=false;
			capacity.readOnly=false;
			filledStudents.readOnly=false;
			remainingSpace.readOnly=false;
			//isRoomFulled.readOnly=false;
		}
		else
		{
			window.location.href = "editRoom.jsp?hId="+hId.value+"&rId="+rId.value+"&allotedFor="+allotedFor.value+"&capacity="+capacity.value+"&filledStudents="+filledStudents.value+"&remainingSpace="+remainingSpace.value+"&isRoomFulled="+isRoomFulled.value;
		}	
	}
	function remove(id)
	{
		var hId = document.getElementById("hId");
		var rId = document.getElementById("rId:"+id);
        var confirm = prompt("Are you sure to DELETE.\n If yes type y|Y\nOtherwise enter any other key","N"); 
		if(confirm == 'Y' || confirm == 'y')
		{
			window.location.href = "deleteRoom.jsp?hId="+hId.value+"&rId="+rId.value;
		}
		return false;
	}
		
	function onChangeFilledStudents(id)
	{
		var capacity = document.getElementById("capacity:"+id);
		var filledStudents = document.getElementById("filledStudents:"+id);
		var remainingSpace = document.getElementById("remainingSpace:"+id);
		var isRoomFulled = document.getElementById("isRoomFulled:"+id);
		if(capacity.value < filledStudents.value)
		{
			alert("'Filled Students' value should be less than 'Capacity' value");
			return false;
		}
		remainingSpace.value = capacity.value - filledStudents.value;
		if(capacity.value==filledStudents.value)
			isRoomFulled.value="Yes";
		else
			isRoomFulled.value="No";
	}
	function onChangeNewFilledStudents()
	{
		var capacity = document.getElementById("capacity");
		var filledStudents = document.getElementById("filledStudents");
		var remainingSpace = document.getElementById("remainingSpace");
		var isRoomFulled = document.getElementById("isRoomFulled");
		if(capacity.value < filledStudents.value)
		{
			alert("'Filled Students' value should be less than 'Capacity' value");
			return false;
		}
		remainingSpace.value = capacity.value - filledStudents.value;
		if(capacity.value==filledStudents.value)
			isRoomFulled.value="Yes";
		else
			isRoomFulled.value="No";
	}
	function selectRoom(select) 
	{
		var rId = select.value;
		var hId = document.getElementById("hId").value;
		if(rId!="")
			window.location.href = "manageHostel.jsp?hId="+hId+"&rId="+rId;
		else
			window.location.href = "manageHostel.jsp?hId="+hId;
	}
	function removeStudent(id,roomNo)
	{
		alert(id+","+roomNo)
		var hId = document.getElementById("hId");
		var rId = document.getElementById("rId");
		var studId = document.getElementById("studentId:"+id);
      	window.location.href = "deleteStudentFromRoom.jsp?hId="+hId.value+"&rId="+rId.value+"&studId="+studId.value;
      	
      	var capacity = document.getElementById("capacity:"+roomNo);
		var filledStudents = document.getElementById("filledStudents:"+roomNo);
		var remainingSpace = document.getElementById("remainingSpace:"+roomNo);
		
		filledStudents.value = parseInt(filledStudents.value) - 1;
		remainingSpace.value = parseInt(capacity.value) - parseInt(filledStudents.value);
			
		document.getElementById("edit:"+roomNo).value="Save";
		edit(roomNo);
		
		return true;
      	
      	
	}
	function onClickAddStudent(id)
	{
		//alert(id);
		if(document.getElementById("studId").value=="")
			return false;
		var capacity = document.getElementById("capacity:"+id);
		var filledStudents = document.getElementById("filledStudents:"+id);
		var remainingSpace = document.getElementById("remainingSpace:"+id);
		var isRoomFulled = document.getElementById("isRoomFulled:"+id);
		if(capacity.value == filledStudents.value)
		{
			alert("Room is fulled you can not add");
			document.getElementById("addStudent").disabled=true;
			return false;
		}
		else
		{
			
			filledStudents.value = parseInt(filledStudents.value) + 1;
			alert(filledStudents.value);
			remainingSpace.value = parseInt(capacity.value) - parseInt(filledStudents.value);
			if(capacity.value==filledStudents.value)
			{
				isRoomFulled.value="Yes";
			}	
			else
			{
				isRoomFulled.value="No";
			}
				
		}
		document.getElementById("edit:"+id).value="Save";
		edit(id);
		
		return true;
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

		<!-- Start Work From Here -->

		<%
		int hId = Integer.parseInt(request.getParameter("hId")); 
		Hostel hostel = AdminDAO.getHostel(hId);
		ArrayList<Room> roomList = hostel.getRoomList(); 
		ArrayList <Student> studentList = AdminDAO.getStudentList();
		%>
		<input type="hidden" name="hId" id="hId" value="<%=hId%>">
		<tr><td colspan="5" align="center"><h2 style="color: blue;"><u><%=hostel.getName() %> Hostel</u></h2><br></td></tr>
		<tr>
			<td align="center" width="30%">
				<table style="width: 100%; height: 100%;" border="0" cellspacing="0" cellpadding="2">
					<caption>
						<select id="room" name="room" onchange="selectRoom(this)">
							<option value="">Select Room Number</option>
							<%for(int i=0;i<roomList.size();i++){%>
							<option value="<%=roomList.get(i).getrId()%>"><%=roomList.get(i).getRoomNo() %></option>	
							<%} %>							
						</select>
					</caption>
					<% 
					String rId = request.getParameter("rId");
					if(rId!=null){
						Room room = AdminDAO.getRoom(Integer.parseInt(rId));
					%>
					<tr>
						<th align="right" width="50%">Room No.&nbsp;</th>
						<td align="left" width="50%">&nbsp;<%=room.getRoomNo() %></td>
					</tr>
					<tr>
						<th align="right" width="50%">Alloted For&nbsp;</th>
						<td align="left" width="50%">&nbsp;<%=room.getAllotedFor() %></td>
					</tr>
					<tr>
						<th align="right" width="50%">Capacity&nbsp;</th>
						<td align="left" width="50%">&nbsp;<%=room.getCapacity() %></td>
					</tr>
					<tr>
						<th align="right" width="50%">Filled Students&nbsp;</th>
						<td align="left" width="50%">&nbsp;<%=room.getFilledStudents() %></td>
					</tr>
					<tr>
						<th align="right" width="50%">Remaining Space&nbsp;</th>
						<td align="left" width="50%">&nbsp;<%=room.getRemainingSpace() %></td>
					</tr>
					<tr>
						<th align="right" width="50%">Is Room Fulled ?&nbsp;</th>
						<td align="left" width="50%">&nbsp;<%=room.getIsRoomFulled() %></td>
					</tr>
					<tr>
						<th align="right" width="50%">Students&nbsp;</th>
						<td align="left" width="50%">&nbsp;
							<form action="addStudentInRoom.jsp" method="post">
							<table border="0">
								<tr>
									<td>
										<input type="hidden" name="hId" id="hId" value="<%=hId%>">
										<input type="hidden" name="hostelName" id="hostelName" value="<%=hostel.getName()%>">
										<input type="hidden" name="rId" id="rId" value="<%=room.getrId()%>">
										<input type="hidden" name="roomNum" id="roomNum" value="<%=room.getRoomNo()%>">
										<select id="studId" name="studId" required="required">
											<option value="">Select Student</option>
											<%
											for(int i=0;i<studentList.size();i++){
												String name = studentList.get(i).getFirstName()+" "+studentList.get(i).getMiddleName()+" "+studentList.get(i).getLastName();
												int studId = studentList.get(i).getStudId();
						
											%>
											<option value="<%=studId%>"><%=name %></option>
											<%} %>
										</select>
									</td>
									<td><input name="addStudent" id="addStudent" value="Add" type="submit" onclick="return onClickAddStudent(<%=room.getRoomNo()%>)" style="background-color:green;color:white; font-weight: bold;font-size: 13px;font-style: italic;"></td>
								</tr>
								<%
								ArrayList<Student> students = room.getStudents();
								for(int i=0;i<students.size();i++){
									String student = students.get(i).getFirstName()+" "+students.get(i).getMiddleName()+" "+students.get(i).getLastName() +"["+studentList.get(i).getDeptName()+"]";
									int studId = studentList.get(i).getStudId();
								%>
								<tr>
									<td><a href="student.jsp?studId=<%=studId%>"><%=i+1+")"+student+studId %></a></td>
									<td>
										<%-- <input type="hidden" name="rNo" id="rNo" value="<%=room.getRoomNo()%>"> --%>
										<input type="hidden" name="studentId:<%=studId%>" id="studentId:<%=studId%>" value="<%=studId%>">
										<input value="Delete" type="button" name="del" onclick="removeStudent(<%=studId+","+students.get(i).getRoomNo()%>)" style="background-color:red;color:white; font-weight: bold;font-size: 13px;font-style: italic;">
									</td>
								</tr>
								<%} %>
							</table>
							</form>	
						</td>
					</tr>
					<%} %>
					
				</table>
			</td>
		<!-- </tr>
		<tr> -->
			<td align="center" width="70%">
				<table style="width: 100%; height: 100%;" border="1" cellspacing="0" cellpadding="2">
					<tr bgcolor="#a5c9c6">
						<th width="10%">Room No.</th>
						<th width="20%">Alloted For</th>
						<th width="5%">Capacity</th>
						<th width="5%">Filled Students</th>
						<th width="5%">Remaining Space</th>
						<th width="5%"> Is Room Fulled ?</th>
						<th width="20%">Actions</th>
					</tr>
					
					<%for(int i=0;i<roomList.size();i++){ int roomNo = roomList.get(i).getRoomNo();%>
					<tr>
						<td align="center" width="10%"><%=roomNo%><input type="hidden" name="rId:<%=roomNo %>" id="rId:<%=roomNo %>" value="<%=roomList.get(i).getrId()%>"></td>
						<td align="center" width="20%"><input type="text" name="allotedFor:<%=roomNo%>" id="allotedFor:<%=roomNo%>" value="<%=roomList.get(i).getAllotedFor()%>" style="width:95%" readonly></td>
						<td align="center" width="5%"><input type="number" name="capacity:<%=roomNo%>" id="capacity:<%=roomNo%>" value="<%=roomList.get(i).getCapacity()%>" style="width:95%" readonly></td>
						<td align="center" width="5%"><input type="number" name="filledStudents:<%=roomNo%>" id="filledStudents:<%=roomNo%>" value="<%=roomList.get(i).getFilledStudents()%>" onchange="return onChangeFilledStudents(<%=roomNo %>)" style="width:95%" readonly></td>
						<td align="center" width="5%"><input type="number" name="remainingSpace:<%=roomNo%>" id="remainingSpace:<%=roomNo%>" value="<%=roomList.get(i).getRemainingSpace()%>" style="width:95%" readonly></td>
						<td align="center" width="5%"><input type="text" name="isRoomFulled:<%=roomNo%>" id="isRoomFulled:<%=roomNo%>" value="<%=roomList.get(i).getIsRoomFulled()%>" style="width:95%" readonly></td>
						<td align="center" width="20%">
							<input type="button" onclick="edit(<%=roomNo%>);" name="edit:<%=roomNo%>" id="edit:<%=roomNo%>" value="Edit" style="width:40%; background-color: blue;color:white;font-weight: bold;font-size: 13px;font-style: italic;" >&nbsp;&nbsp;
							<input type="button" onclick="remove(<%=roomNo%>);" name="edit:<%=roomNo%>" id="edit:<%=roomNo%>" value="Delete" style="width:40%; background-color: red;color:white;font-weight: bold;font-size: 13px;font-style: italic;" >
						</td>
					</tr>
					<%} %>
					<form name="frm" method="post" action="addRoom.jsp">
					<tr>
						<td align="center" width="10%">
							<input type="hidden" name="hId" id="hId" value="<%=hId%>">
							<input type="number" name="roomNo" id="roomNo" placeholder="e.g. 10" style="width:95%" required>
						</td>
						<td align="center" width="20%"><input type="text" name="allotedFor" id="allotedFor" style="width:95%" placeholder="e.g. Students" style="width:95%" required></td>
						<td align="center" width="5%"><input type="number" name="capacity" id="capacity" style="width:95%" placeholder="e.g. 5" style="width:95%" required></td>
						<td align="center" width="5%"><input type="number" name="filledStudents" id="filledStudents" onchange="return onChangeNewFilledStudents()" style="width:95%" placeholder="e.g. 0" style="width:95%" required></td>
						<td align="center" width="5%"><input type="number" name="remainingSpace" id="remainingSpace" style="width:95%" placeholder="e.g. 5" style="width:95%" required></td>
						<td align="center" width="5%"><input type="text" name="isRoomFulled" id="isRoomFulled" style="width:95%" placeholder="e.g. No" style="width:95%" required></td>
						
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
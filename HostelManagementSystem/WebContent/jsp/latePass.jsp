<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.User.User" %>s
<%@ page import="com.Student.StudentDAO" %>
<%@page import="com.Student.Student" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Late Pass</title>
		<script >
		
		
		</script>
		
	</head>
	<body bgcolor="white">
		<table width="100%">
			<tr>
				<td width="100%"><img src="../images/header.jpg" width="100%" height="150"></td>
			</tr>
			<tr>
				<td >
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
				<td  align="center"><h1><b>Late Pass</b></h1></td>
			</tr>
			<%	
				User user=new User();
				user=(User)session.getAttribute("user");
				session.setAttribute("user",user);
				Student student=new Student();
				student=StudentDAO.getStudentDetails(user.getUserId());
				String name= student.getFirstName()+" "+student.getMiddleName()+" "+student.getLastName();
				Date date1 = new Date();
				SimpleDateFormat simpleDate2 = new SimpleDateFormat("yyyy-MM-dd");
				String appliedDate= simpleDate2.format(date1);
				SimpleDateFormat simpleDate = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
				String currentDate = simpleDate.format(date1);
				int hour1 = date1.getHours();
				int min1 = date1.getMinutes();
				Date time1= new Date ();
				SimpleDateFormat simpleTime= new SimpleDateFormat("hh:mm a");
				int hour2= time1.getHours();
				int currentHour=hour1;
				/*if(hour2>=12){
					 currentHour=hour2%12;
				}
				int currentMin=time1.getMinutes();*/
				time1=new Date(0,0,0,hour1,min1);
				String currentTime= simpleTime.format(time1);
				int hour=12;
				int min=00;
				Date time2=new Date(0,0,0,hour,min);
				String reportTime=simpleTime.format(time2);
			%>
			
			<tr>
				<td align="center">
					<form name="frm"  id="frm" action="latePassSuccess.jsp" method="post">
					<table width="100%" align="center">
						<td width="30%"></td>
						<td width="40%" bgcolor="black" align="center" >
									<table align="right">
										<tr align="left">
											<td ><font color="white">Date<font color="red">*</font></font></td>
											<td ><font color="white">:</font></td>
											<td ><font color="white"><%= currentDate %></font></td>
										</tr>
									</table>
									<table align="center" width="70%" height="100%">
									    <tr>
									    	<td><br>
									    		<input type="hidden" name="appliedDate"  id="appliedDate" value="<%=appliedDate %>" readonly>
									    	</td>
									    </tr>
										<tr align="center">
										    <td  align="left"><font color="white">Name<font color="red">*</font></font></td>
							 				<td ><font color="white">:</font></td>
							 				<td ><input type="text" name="name" id="name" value= "<%=name %>" placeholder=" Bhushan Kumar " onkeypress="javascript:return lettersOnly(event)" readonly></td>
										</tr>
										<tr align="center">
										   <td align="left"><font color="white">Class<font color="red">*</font></font></td>
				 						   <td><font color="white">:</font></td>
				 						   <td><font color="white"><input type="text" name="classN" id="class" placeholder=" Msc IMCA 2" value="<%=student.getCourseName()+" "+student.getCourseYear() %>" required></font>
										</tr>
										<tr align="center">
											<td align="left"><font color="white">Department<font color="red">*</font></font></td>
							 				<td><font color="white">:</font></td>
							 				<td><input type="text" name="department" id="department" placeholder=" Mathematics" value="<%=student.getDeptName() %>" required></td>
										</tr>
										<tr align="center">
											<td align="left"><font color="white">Roll No<font color="red">*</font></font></td>
							 				<td><font color="white">:</font></td>
							 				<td><input type="text" name="rollNo" id="rollNo" value="" placeholder=" 18228" required></td>
										</tr>
										<tr align="center">
											<td align="left"><font color="white">Room No<font color="red">*</font></font></td>
				 							<td><font color="white">:</font></td>
				 							<td><input type="text" name="roomNo" id="roomNo" value="<%=student.getRoomNo() %>" placeholder=" 200" onkeypress="javascript:return numberOnly(event)" required></td>
										</tr>
										<tr align="center">
											<td align="left"><font color="white">Hostel No<font color="red">*</font></font></td>
				 							<td><font color="white">:</font></td>
				 							<td><input type="text" name="hostelNo" id="hostelNo" value="<%=student.getHostelNo() %>" placeholder=" L8" required></td>
										</tr>
										<tr align="center">
											<td align="left"><font color="white">Time to leave the hostel<font color="red">*</font></font></td>
											<td><font color="white">:</font></td>
											<td align="center" width="30%">
												<font color="white"><input type="time"  name="leaveTime" value=<%=currentTime %> onchange="return isValidTime() ;"></font>
												<select name="duration"  width="5%"  id="duration"required>
											     	<option value="AM">AM</option>
											     	<option value="PM" selected>PM</option>
												</select>
												
											</td>
										</tr>
										<tr align="center">
											<td align="left"><font color="white">Time to report at hostel <font color="red">*</font></font></td>
				 				            <td><font color="white">:</font></td>
				 				            <td>
				 				              <font color="white"> <%=reportTime %> </font>
				 				              
				 				            </td>
										</tr>
										<tr align="center">
								            <td align="left"><font color="white">Address<font color="808080">(where you are going)</font></font></td>
								            <td><font color="white">:</font></td>
								            <td><textarea name="address" rows="2" cols="20"></textarea></td>
										</tr>
										<tr align="center">
										   <td align="left"><font color="white">Contact No <font color="red">*</font></font> </td>
										   <td> <font color="white">:</font> </td>
										   <td><input  placeholder="e.g. 9876543210" type="number" value="<%=student.getContact() %>" name="contact" onkeypress="javascript:return numberOnly(event)" required ></td>
										</tr>
										<tr align="center">
											<td align="left"><font color="white">parents/Guardian contact</font></td>
											<td><font color="white">:</font></td>
 											<td><input type="number" name="guardianContact" value="<%=student.getGuardianContact() %>"placeholder="5566778899" onkeypress="javascript:return numberOnly(event)" ></td>
										</tr>
										<tr>
											<td><br></td>
										</tr>
									</table>
									<table align="center">
										<tr align="center">
										 	<td>
											 	<input type="reset" value ="Reset" style="width:100px; font: bolder;font-size: large;font-weight: bolder;color: white;background-color: red;"/>
											 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										 		<input type="submit" value="submit" style="width:100px; font: bolder;font-size: large;font-weight: bolder;color: white;background-color: blue;" onclick="return validate()"/>
										 	</td>
										</tr>
										<tr>
											<td><br></td>
										</tr>
							    </table>				
						     </td>
						<td width="40%"></td>
					</table>
					</form>
				</td>
			</tr>
			<tr>
            <td><br><br><td>
         </tr>
         <tr>
		     <td bgcolor="#085753" ><marquee><font color="white">#HostelLife &nbsp;&nbsp;&nbsp; Here's to the nights that turns into mornings with the friends that turns into family  &nbsp;&nbsp;&nbsp; #HostelLife</font></marquee></td>
		</tr>
			
        </table>     
	</body>
</html>
<script type="text/javascript">

	var form ;
	var date = new Date();
	var currentHour =date.getHour();
	var currentMinutes= date.getMinutes();
	var currentYear = date.getFullYear();
	var currentMonth = date.getMonth()+1;
	var currentDate = date.getDate();
	var currentMonthToShow = currentMonth; //becomes string so for that ,new variable
	if(currentMonth < 10)
		currentMonthToShow = "0"+currentMonth;
	document.getElementById("appliedDate").value = currentYear+"-"+currentMonthToShow+"-"+currentDate;
	function numberOnly(evt) 
	{
	    var iKeyCode = (evt.which) ? evt.which : evt.keyCode;
		if (iKeyCode!=13 && (iKeyCode<48||iKeyCode>57)){
		    	alert("Enter numbers only. ");
		    	return false;
		    }	
		  return true;
	}
	
	function lettersOnly(evt) {
	    evt = (evt) ? evt : event;
	    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
	       ((evt.which) ? evt.which : 0));
	    if (charCode> 33 && (charCode<65) &&
	           (charCode< 97||charCode>122)) {
	    	   alert("Enter letters only.");
	       return false;
	    }
	    return true;
	  }
	
	/*function alphanumeric(evt) {
	    evt = (evt) ? evt : event;
	    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
	       ((evt.which) ? evt.which : 0));
	    if (charCode> 33 && (charCode< 65) &&
	      	 (charCode < 97 || charCode> 122)&&(charCode<48 || charCode>57)) {
	    	   alert("Enter letters only.");
	       return false;
	    }
	    return true;
	  }*/
	
	function isValidContact() 
	{
		if(form.contact.value.length != 10)
		{
			alert("Please Enter Valid Contact Number !\nContact Number should be of 10 digits.");
			return false;
		}
		else
			return true;
	}
	function isValidGuardianContact() 
	{
		if(form.guardianContact.value.length != 10)
		{
			alert("Please Enter Valid Guardian's Contact No !\nContact Number should be of 10 digits.");
			return false;
		}	
		return true;
	}
	function isValidTime() 
	{
	    var leaveTime = document.getElementById("leaveTime").value;
	    var duration= document.getElementById("duration").value;
	    var timeArr=leaveTime.split(":");
	    var hour=timeArr[0];
	    var min=timeArr[1];
	    //document.write("hour")
	    if(hour>12|| hour==0|| hour==00)
	      {
	    	alert("you have entered wrong time !\nhour is within 1-12 ");
	    	return false;
	      }
	    return true;
	    
	}
	function checkLeaveTime(){
		var leaveTime = document.getElementById("leaveTime").value;
		var duration = document.getElementById("duration").value;
		var timeArr=leaveTime.split(":");
		var hour=timeArr[0];
		var min=timeArr[1];
		if(duration.equals("PM")){
			if(hour>=8){
				alert("you can't leave hostel after 8 PM");
				return false;
			}
		}else if(duration.equals("AM")){
			if(hour<=6){
				alert("you can't leave the hostel befor 6 AM");
			    return false;
			}
		}
		Date time1= new Date ();
		SimpleDateFormat simpleTime= new SimpleDateFormat ("HH:mm a");
	    var hour = time1.getHours();
		var min = time1.getMinutes();
		String duration="";
		if(hour>=12){
			duration="PM";
			hour=hour%12;
			if(hour>=8){
				alert("you can't leave hostel after 8 PM");
				return false;
			}
		}else{
			duration="AM";
			if(hour<6){
				alert("you can't leave hostel before 6 AM");
				return false;
			}
		}
		return true;
	}
	function validate(){
		form=document.getElementById("frm");
		if(isValidContact()==false){
			return false;
		}
		if(isValidGuardianContact()==false){
			return false;
		}
		if(isValidLeaveTime()==false){
			return false;
		}
		if(checkLeaveTime()==false){
			return false;
		}
		return true;
	}
</script>
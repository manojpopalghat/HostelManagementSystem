<%@page import="com.Administration.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.Student.Student" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Profile Page</title>
	<style>
	.background {
	  background: url(../images/registration.jpg);
	  border: 1px solid black;
	}
	
	.transbox {
	  margin: 30px;
	  background-color:white;
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
	<body>
	<%
	int studId = Integer.parseInt(request.getParameter("studId"));
	Student student=AdminDAO.getStudent(studId);
	%>	
	<table style="width: 100%;" border="1" cellspacing="0" cellpadding="0">
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
		<td class="background" width="80%" align="center"><br><br><br><br><br><br>
			<form name="frm" id="frm" method="post" action="manageHostels.jsp">
				<table width="80%">
				<tr>
				<td class="transbox" width="60%" align="center" >
				
					<h2 align="center" style="color: black;"><u>Profile</u></h2>
					
					
					<table align="center" width="100%" >
					<tr>
					<td>
					<table align="right" width="80%">
						<tr>
						<td align="right" width="70%">
							<table width="100%" align="left">
								<tr>
						    		<td  style="font-size:15;" align="center"colspan="9"><b>Personal Details</b><br><br></td>
								</tr>
								<tr> 
									<td  width="33.3%"style="font-size:15;" align="center"><font color="blue">First Name</font></td>
									   
									<td  width="33.3%"style="font-size:15;" align="center"><font color="blue">Middle Name</font></td>
									 	   
									<td  width="33.3%" style="font-size:15;" align="center"><font color="blue">Last Name</font></td>
								</tr>
								<tr>
									<td align="center" ><input style="background-color: white;" type="text" bgcolor= "silver" value=<%=student.getFirstName() %> readonly></td>
									<td align="center"><input  style="background-color: white;" type="text" bgcolor="silver" value=<%=student.getMiddleName() %> readonly></td>
									<td align="center"><input  style="background-color: white;" type="text" bgcolor="silver" value=<%=student.getLastName() %> readonly></td>	
								</tr>
								<tr>
									<td style="font-size:15;" align="center"><font color="blue">Date Of Birth</font></td>
								 
									<td style="font-size:15;" align="center"><font color="blue">Gender</font></td>
							 
									<td style="font-size:15;" align="center"><font color="blue">Aadhaar No</font></td>
							   </tr>
							   <tr>
							   	<td align="center" ><input style="background-color: white;" type="text" bgcolor= "silver" value=<%=student.getDob() %> readonly></td>
							   	<td align="center" ><input style="background-color: white;" type="text" bgcolor= "silver" value=<%=student.getGender() %> readonly></td>
							   	<td align="center" ><input style="background-color: white;" type="text" bgcolor= "silver" value=<%=student.getUid() %> readonly></td>
							   </tr>
								<tr>
									<td style="font-size:15;" align="center"><font color="blue">Email-Id</font></td>
									
									<td style="font-size:15;" align="center"><font color="blue">Contact No</font></td>
									 
									<td style="font-size:15;" align="center"><font color="blue">Parent's Contact</font></td>		    
								</tr>
								<tr>
									<td align="center"><input style="background-color: white;" type="text" bgcolor= "silver" value=<%=student.getEmail() %> readonly></td>
									<td align="center"><input style="background-color: white;" type="text" bgcolor= "silver" value=<%=student.getContact() %> readonly></td>
									<td align="center"><input style="background-color: white;" type="text" bgcolor= "silver" value=<%=student.getParentContact() %> readonly></td>
								</tr>
							</table>
						</td>
						<td align="left" width="30%">
							<table align="center" width="100%">
								<tr>
									<td align="center">
										<img src="./students/photo/<%=student.getPhoto() %>" width="35%" height="80"/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<img src="./students/sign/<%=student.getSign() %>" width="35%" height="20"/>		
									</td>
								</tr>
							</table>
						</td>
						</tr>
						<tr>
							<td>
								<table align="center">
									<tr>
										<td style="font-size:15;" align="center"><font color="blue">Current Address</font></td>
										<td></td>
										<td style="font-size:15;" align="center"><font color="blue">Permanent Address</font></td>
									</tr>
									<tr>
										<td align="center"><input name="currentAddress"  style="background-color: white;" value=<%=student.getCurrentAddress() %> rows="4" cols="30" readonly></td>
										<td>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center"><input name="currentAddress"  style="background-color: white;" value=<%=student.getPermanentAddress() %> rows="4" cols="30" readonly></td>
									</tr>
							</table>
						</td>
					</tr>
				 </table>
				</td>
				</tr>	  
			    <hr>
				
				<!-- Guardian Details -->
					
					<tr>
						<td align="center">
						   <br>
						   <hr>
							<table width="60%">
								<tr>
									<td style="font-size:15;" align="center" colspan="9"><b>Guardian Details</b><br><br></td>
								</tr>
								<tr>
									<td align="center" style="font-size:15;"><font color="blue">Guardian Name</font></td>
									<td align="center" style="font-size:15;"><font color="blue">Occupation</font></td>
									<td align="center" style="font-size:15;"><font color="blue">Address</font></td>
								</tr>
								<tr>
									<td align="center"><input style="background-color: white;" type="text" bgcolor= "silver" value=<%=student.getGuardianName() %> readonly></td>
									<td align="center"><input style="background-color: white;" type="text" bgcolor= "silver" value=<%=student.getGuardianOccupation() %> readonly></td>
									<td rowspan="2">
									    &nbsp;&nbsp;&nbsp;&nbsp;
										<input name="guardianAddress"  style="background-color: white;" value=<%=student.getGuardianAddress() %> rows="4" cols="30" readonly>
									</td>	 
								</tr>
								<tr>
									<td align="center" style="font-size:15;"><font color="blue">Email</font></td>
									<td align="center" style="font-size:15;"><font color="blue">Contact</font></td>
								</tr>
								<tr>
									<td align="center"><input style="background-color: white;" type="text" bgcolor= "silver" value=<%=student.getGuardianEmail() %> readonly></td>
									<td align="center"><input style="background-color: white;" type="text" bgcolor= "silver" value=<%=student.getGuardianContact() %> readonly></td>
								</tr>
							</table>
							<hr>
						</td>
					</tr>
					<!-- Acadmic Deatails -->
					<tr>
						<td align="center">
							<table lign="center" width="60%">
								<tr>
								   <td  style="font-size:15;" align="center" colspan="9"><b>Academic Details</b><br><br></td>
							   </tr>
								<tr>
									<td align="center" style="font-size:15;"><font color="blue">Department Name</font></td>
									<td align="center" style="font-size:15;"><font color="blue">Qualification Level</font></td>
									<td align="center" style="font-size:15;"><font color="blue">Course Name</font></td>
								</tr>
								<tr>
									<td align="center"><input style="background-color: white;" type="text"  value=<%=student.getDeptName() %> readonly></td>
									<td align="center"><input style="background-color: white;" type="text"  value=<%=student.getQualification() %> readonly></td>
									<td align="center"><input style="background-color: white;" type="text"  value=<%=student.getCourseName() %> readonly></td>
								</tr>
								<tr>
									<td align="center" style="font-size:15;"><font color="blue">Course Duration</font></td>
									<td align="center" style="font-size:15;"><font color="blue">Current Course year</font></td>
									<td align="center" style="font-size:15;"><font color="blue">Eligibility No</font></td>
								</tr>
								<tr>
									<td align="center"><input style="background-color: white;" type="text"  value=<%=student.getCourseDuration() %> readonly></td>
									<td align="center"><input style="background-color: white;" type="text" value=<%=student.getCourseYear() %> readonly></td>
									<td align="center"><input style="background-color: white;" type="text" value=<%=student.getEligibilityNo() %> readonly></td>
								</tr>
								<tr>
									<td align="center" style="font-size:15;"><font color="blue">Admission Date</font></td>
								</tr>
								<tr>
									<td align="center"><input style="background-color: white;" type="text"  value=<%=student.getAdmissionDate() %> readonly></td>
								</tr>
							</table>
							<hr>
						</td>
					</tr>
					<tr>
						<td align="center">
							<table>
								<tr>
						 			<td  style="font-size:15;" align="center" colspan="9"><b>Hostel Details</b><br><br></td>
					   			</tr>
								<tr>
									<td align="center" style="font-size:15;"><font color="blue">Hostel No</font></td>
									<td align="center" style="font-size:15;"><font color="blue">Room No</font></td>
								</tr>
								<tr>
									<td align="center"><input style="background-color: white;" type="text"  value=<%=student.getHostelNo() %> readonly></td>
								    <td align="center"><input style="background-color: white;" type="text"  value=<%=student.getRoomNo() %> readonly></td>
								</tr>
							</table>
							<hr>
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
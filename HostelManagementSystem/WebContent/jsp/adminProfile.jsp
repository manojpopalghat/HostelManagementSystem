<%@page import="com.User.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.Administration.Admin" %>
<%@ page import="com.Administration.AdminDAO" %>
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
		User user=(User)session.getAttribute("user");
	     Admin admin = new Admin();
	     admin=AdminDAO.getAdminDetails(user.getUserId());
		 session.setAttribute("user",user);
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
			<form name="frm" id="frm" method="post" action="logInHome.jsp" enctype="multipart/form-data">
				<table width="80%">
				<tr>
				<td class="transbox" width="70%" align="center" >
				
					<h2 align="center" style="color: black;"><u>Profile</u></h2>
					<hr>

					<table align="center" width="100%" >
					<tr>
					<td>
					<table align="right" width="80%">
						<tr>
						<td align="right" width="70%">
							<table width="100%" align="center">
							   <tr>
							   		<td  style="font-size:15;" align="center"colspan="9"><b>Personal Details</b><br><br></td>
							   </tr>
								<tr> 
									<td  width="33.3%"style="font-size:15;" align="center"><font color="blue">First Name</font></td>
									   
									<td  width="33.3%"style="font-size:15;" align="center"><font color="blue">Middle Name</font></td>
									 	   
									<td  width="33.3%" style="font-size:15;" align="center"><font color="blue">Last Name</font></td>
								</tr>
								<tr>
									<td align="center" ><input style="background-color: silver;" type="text" bgcolor= "silver" value=<%=admin.getFirstName() %> readonly></td>
									<td align="center"><input  style="background-color: silver;" type="text" bgcolor="silver" value=<%=admin.getMiddleName() %> readonly></td>
									<td align="center"><input  style="background-color: silver;" type="text" bgcolor="silver" value=<%=admin.getLastName() %> readonly></td>	
								</tr>
								<tr>
									<td style="font-size:15;" align="center">Date Of Birth<font color="red">*</font></td>
								 
									<td style="font-size:15;" align="center">Gender<font color="red">*</font></td>
							 
									<td style="font-size:15;" align="center">Aadhaar No<font color="red">*</font></td>
							   </tr>
							   <tr>
							   	<td align="center" ><input style="background-color: silver;" type="text" bgcolor= "silver" value=<%=admin.getDob() %> readonly></td>
							   	<td align="center" ><input style="background-color: silver;" type="text" bgcolor= "silver" value=<%=admin.getGender() %> readonly></td>
							   	<td align="center" ><input style="background-color: silver;" type="text" bgcolor= "silver" value=<%=admin.getUid() %> readonly></td>
							   </tr>
								<tr>
									<td style="font-size:15;" align="center"><font color="blue">Email-Id</font></td>
									
									<td style="font-size:15;" align="center"><font color="blue">Contact No</font></td>
									 
									<td style="font-size:15;" align="center"><font color="blue">Alternate Contact</font></td>		    
								</tr>
								<tr>
									<td align="center"><input style="background-color: silver;" type="text" bgcolor= "silver" value=<%=admin.getEmail() %> readonly></td>
									<td align="center"><input style="background-color: silver;" type="text" bgcolor= "silver" value=<%=admin.getContact() %> readonly></td>
									<td align="center"><input style="background-color: silver;" type="text" bgcolor= "silver" value=<%=admin.getAlternateContact() %> readonly></td>
								</tr>
							</table>
						</td>
						<td align="right" width="30%">
							<table align="center" width="100%">
								<tr>
									<td align="right">
										<img src="../images/my photo 2_1.jpg" width="35%" height="80"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td align="right">
										<img src="../images/my signature.jpg" width="35%" height="20"/>	
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
									</td>
								</tr>
							</table>
						</td>
						</tr>
						<br>
						<tr>
							<td>
								<table align="center">
									<tr>
										<td style="font-size:15;" align="center"><font color="blue">Current Address</font></td>
										<td></td>
										<td style="font-size:15;" align="center"><font color="blue">Permanent Address</font></td>
									</tr>
									<tr>
										<td align="center"><input name="currentAddress"  style="background-color: silver;" value=<%=admin.getCurrentAddress() %> rows="4" cols="30" readonly></td>
										<td>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center"><input name="currentAddress"  style="background-color: silver;" value=<%=admin.getPermanentAddress() %> rows="4" cols="30" readonly></td>
									</tr>
							</table>
						</td>
					</tr>
				 </table>
				 <br>
				</td>
				</tr>	  
				<!-- Offical Details -->
				
				<tr>
						<td align="center">
						<hr>
							<table width="60%">
								<tr>
										<td style="font-size:15;" align="center" colspan="9"><b>Official Details</b><br><br></td>
								</tr>
								<tr>
									<td align="center" style="font-size:15;"><font color="blue">Empolyee Id</font></td>
									<td align="center" style="font-size:15;"><font color="blue">Qualification</font></td>
									<td align="center" style="font-size:15;"><font color="blue">Designation</font></td>
								</tr>
								<tr>
									<td align="center"><input style="background-color: silver;" type="text" bgcolor= "silver" value=<%=admin.getEmployeeId() %> readonly></td>
									<td align="center"><input style="background-color: silver;" type="text" bgcolor= "silver" value=<%=admin.getQualification() %> readonly></td>
									<td align="center"><input name="guardianAddress"  style="background-color: silver;" value=<%=admin.getDesignation() %> readonly></td>	 
								</tr>
								<tr>
									<td align="center" style="font-size:15;"><font color="blue">Experience</font></td>
								</tr>
								<tr>
									<td align="center"><input style="background-color: silver;" type="text" bgcolor= "silver" value=<%=admin.getExperience() %> readonly></td>
								</tr>
							</table>
							<hr>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="submit" value="Back" style="width:180px; font: bolder;font-size: large;font-weight: bolder;color: white;background-color: red;" />
						</td>
					</tr>
					<td>
						<br>
					</td>
				</table>
			    </td>
		      </tr>
		      <tr>
		      	<td>
		      		<br><br>
		      	</td>
		      </tr>
	        </table>
	      </form>
	    </td>
	  </tr>
	</table>
  </body>
</html>
	
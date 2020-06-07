<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Forgot Password</title>
</head>

<body bgcolor="#e4f7f5">
	<table width="100%" border="1" cellspacing="0" cellpadding="0">
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
			<td align="center"><u><b>Forgot Password</b></u></td>
		</tr>
		
		<!--Start work from here -->
		
		<%
			String isValidUser = request.getParameter("isValidUser");
			if(isValidUser == null){isValidUser = "true";}
		%>
		<tr>
			<td><br>
				<table width="100%" border="0">
					<tr >
						<td width="100px" align="center" >
						<form name="frm" action="validateForgotPassword.jsp" method="post" >
							<table width="230px" height="100%" border="0" style="background-color: black; opacity: 70%;">
								
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
								    <td align="left"><font color="white">Role</font></td>
								</tr>
			
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
								    <td align="left">
								         <select name="role" id="role" style="width:144px;" required>
								              <option value="">Select Role</option>
										      <option value="Student">Student</option>
											  <option value="Rector">Rector</option>
											  <option value="Security Staff">Security Staff</option>
											  <option value="Admin">Admin</option>
											  
								         </select>
								      </td>   
								</tr>
								
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="left"><font color="white">User Id</font></td>
								</tr>
	
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="left"><input placeholder="Eg. john@mymail.com" type="email" name="userId" required></td>
								</tr>
	
								<tr>
									
									<td align="center" colspan="2">
										<br>
											<input type="submit" value="Submit" style="background-color: blue; color: White;" onclick="">
										<br><br>
									</td>
								</tr>
							</table>
							</form>
							<br>	
						</td>
					</tr>
					<tr>
						<%if(isValidUser.equals("true")){ %>
						<td colspan="3" style="color: green;" align="center"><h3>&nbsp;<br><br><br><br><br><br><br><br><br><br><br><br><br><br></h3></td>
						<%}else{%>
						<td colspan="3" style="color: red;" align="center"><h3><i>Please Enter Valid User Id !!!<br><br><br><br><br><br><br><br><br><br><br><br><br><br></i></h3></td>
						<%} %>
					</tr>	
				</table>
			</td>
		</tr>
       </table>     
</body>
</html>
<%@page import="com.User.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Set New Password</title>
	<script type="text/javascript">
		function arePasswordsMatched() 
		{
			var password = document.getElementById("password").value;
			var rePassword = document.getElementById("rePassword").value;
			if(password == rePassword)
				return true;
			return false;
		}
		
		function isValidPassword() 
		{
			var password = document.getElementById("password").value;
			if(password.length >= 6 )
				return true;
			return false;
		}
		
		function checkVal()
		{
			if(isValidPassword()==false)
			{
				alert("Length of Password should not be Less than 6 !!!");
				return false;
			}	
			if(arePasswordsMatched()==false)
			{
				alert("Both Passwords Should be Matched !!!");
				return false;
			}
			return true;
		}
	</script>
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
			<td align="center"><u><b>Set New Password</b></u></td>
		</tr>
		
		<!--Start work from here -->
		
		<%
			int userOTP = Integer.parseInt(request.getParameter("userOTP"));
			int otp = (int)session.getAttribute("otp");
			User user = (User)session.getAttribute("user");
			if(otp != userOTP)
			{
				response.sendRedirect("validateOTP.jsp?isValidOTP=false");
			}
			else
			{	
				session.removeAttribute("otp");
				
		%>
		<tr>
			<td><br>
				<table width="100%" border="0">
					<tr >
						<td width="100px" align="center" >
						<form name="frm" action="setNewPasswordSuccess.jsp" method="post" >
							<table width="230px" height="100%" border="0" style="background-color: black; opacity: 70%;">
								
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
								    <td align="left"><font color="white">Role</font></td>
								</tr>
			
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
								    <td align="left">
								         <input name="role" id="role" value="<%=user.getRole() %>" readonly>
								      </td>   
								</tr>
								
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="left"><font color="white">User Id</font></td>
								</tr>
	
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="left"><input name="userId" id="userId" value="<%=user.getUserId()%>" readonly></td>
								</tr>
								
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="left"><font color="white">New Password</font></td>
								</tr>
								
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="left"><input type="password" name="password" id="password" required></td>
								</tr>
								
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="left"><font color="white">Confirm Password</font></td>
								</tr>
								
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="left"><input type="password" name="rePassword" id="rePassword" required></td>
								</tr>
	
								<tr>
									
									<td align="center" colspan="2">
										<br>
											<input type="submit" value="Submit" onclick="return checkVal()"  style="background-color: blue; color: White;" onclick="">
										<br><br>
									</td>
								</tr>
							</table>
							</form>
							<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>	
						</td>
					</tr>
					
				</table>
			</td>
		</tr>
		<%} %>
       </table>     
</body>
</html>
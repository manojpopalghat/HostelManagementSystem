<%@page import="com.User.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Enter OTP</title>
</head>

<body bgcolor="white">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
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
		<!--Start work from here -->
		
		<%
			User user = (User)session.getAttribute("user");
			session.setAttribute("user", user);
			int otp =(int)session.getAttribute("otp");
			session.setAttribute("otp",otp);
			String isValidOtp= request.getParameter("isValidOtp");
			if(isValidOtp == null){isValidOtp = "true";}
		%>
		<tr>
			<td><br>
				<table width="100%" border="0">
					<tr>
						<td align="center">
							<h2><u><b>Enter OTP </b></u></h2>
						</td>
					</tr>
					<tr >
						<td width="100px" align="center" >
						<form name="frm" action="createUserVarifyOtpSuccess.jsp" method="post" >
							<table width="250px" height="100%" border="0" style="background-color: black; opacity: 90%;">
								<tr>
									<td>
									<br>
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
									<td align="left"><font color="white">One Time Password</font></td>
								</tr>
								
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="left"><input name="userOTP" id="userOTP" placeholder="Enter One Time Password" required></td>
								</tr>
	
								<tr>
									
									<td align="center" colspan="2">
										<br>
											<input type="submit" value="Submit"  style="background-color: blue; color: White;" onclick="">
										<br><br>
									</td>
								</tr>
							</table>
							</form>
							<br>	
						</td>
					</tr>
					<tr>
						<%
						  if(isValidOtp.equals("false")){%>
							<td colspan ="3" style="color: red;" align="center">	<h3><i>Please Enter Correct OTP !!!<br><br><br><br><br><br><br><br><br><br><br><br><br><br></i></h3></td>
						<% }%>
					</tr>
					<tr>
					</tr>
				</table>
			</td>
		</tr>
       </table>     
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.io.File" %>
<%@page import="com.notification.Notification"%>
<%@page import="com.User.User"%>
<%@page import="com.User.UserDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add Notification Success ?</title>
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
			<td align="center" colspan="5" height="30px"><u><b>Add Notification Result</b></u></td>
		</tr>
		
		<!-- Start Work From Here -->
		
		<%
			User user = (User)session.getAttribute("user");
			String newPassword = request.getParameter("password");
			session.removeAttribute("user");
			user.setPassword(newPassword);
			int successFlag = UserDAO.updatePassword(user);
		%>
		<tr>
			<td align="center" colspan="5" width="40% "><br>
				<form name="addForm" method="post"  action="forgotPassword.jsp" >
					<table border="0" cellspacing="0" cellpadding="0">
						<%if(successFlag>0){ %>
							<tr>
								<td style="color: green;" align="center"><h1>Password Reset SuccessFully.</h1></td>
							</tr>
						<%}else{ %>	
							<tr>	
								<td style="color: red;" align="center"><h1>Password Reset Is Not Done , SuccessFully <br>Please Try Again !!! </h1></td>
							</tr>	
							<tr><td colspan="3">&nbsp;</td></tr>
							<tr>
								<td align="center" colspan="3">
									<input type="submit"  name="add" value="Try To Reset Again" style="width: 50%;height: 25px;font-size: 17px">&nbsp;&nbsp;&nbsp;
								</td>		
							</tr>
						<%} %>
							
					</table>
				</form>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</td>
		</tr>
	</table>
</body>
</html>
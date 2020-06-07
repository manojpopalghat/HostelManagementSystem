<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Log In</title>
	</head>
	
	<body bgcolor="white">
	
		<%
		 	String validateCredentials = request.getParameter("validateCredentials");
			if(validateCredentials == null){validateCredentials = "true";}
		 %>
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
				<td  align="center"><h1><b>Login Here</b></h1></td>
			</tr>
			
			<tr>
				<td>
					<form name="frm" action="logInSuccess.jsp" method="post" enctype="multipart/form-data">
						<table width="100%">
							<td width="40%"></td>
							<td width="25%" align="center" bgcolor="black" >
										<table align="center" width="70%" height="100%">
											<tr>
												<td align="center">
													<h2>
														<b><font color="white">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspLog In</font></b>
													</h2>
												</td>
											</tr>
											
											<tr>
											    <td align="left"><font color="white">Role</font></td>
											</tr>
						
											<tr>
											    <td align="left">
											         <select name="role" id="role" style="width:144px;" required>
											              <option value="">Select Role</option>
													      <option value="Student">Student</option>
														  <option value="Rector">Rector</option>
														  <option value="Security">Security</option>
														  <option value="Admin">Admin</option>
														  <!-- <option value="Other">Other</option> -->
											         </select>
											      </td>   
											</tr>
											
											<tr>
												<td align="left"><font color="white">UserId</font></td>
											</tr>
				
											<tr>
												<td align="left"><input placeholder="Eg. xyz12@gmail.com" type="email" name="userId" required></td>
											</tr>
				
											<tr>
												<td align="left"><font color="white">Password</font></td>
											</tr>
				
											<tr>
												<td align="left"><input placeholder="" type="password" name="password"></td>
											</tr>
				
											<tr>
												<td align="center" width="33.34%">
													<br>
														&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<input type="submit" value="Log In" style="background-color: blue; color: White;" onclick="">
													<br>
												</td>
											</tr>
											<tr>
												<td align="left">
													<br>
													<a href="forgotPassword.jsp" style=" color:#ffffff;">Forgot<br>Password</a>
												</td>
												<td align="left">
													<br>
													<a href="createUser.jsp" style=" color:#ffffff;">Create Account</a>
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
				<%if(validateCredentials.equals("true")){ %>
					<td colspan="3" style="color: green;" align="center"><h3>&nbsp;<br><br><br><br><br><br><br><br><br><br><br><br><br><br></h3></td>
				<%}else{%>
					<td colspan="3" style="color: red;" align="center"><h3><i>Please Enter Valid Credentials !!!<br><br><br><br><br><br><br><br><br><br><br><br><br><br></i></h3></td>
				<%} %>
								</td>
			</tr>
			<tr>
            <td><br><br><td>
         </tr>
         <tr>
		     <td bgcolor="#085753" ><marquee><font color="white">#HostelLife &nbsp&nbsp&nbsp Here's to the nights that turns into mornings with the friends that turns into family  &nbsp&nbsp&nbsp #HostelLife</font></marquee></td>
		</tr>
			
        </table>     
	</body>
</html>
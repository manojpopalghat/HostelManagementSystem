<%@page import="javax.tools.ForwardingFileObject"%>
<%@ page import="java.io.*"%> 
<%@page import="com.User.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Account</title>
</head>
<body bgcolor="white">
     <script type="text/javascript">
     function validate(){
    		var password = document.getElementById("password").value;
    		var rePassword = document.getElementById("cpassword").value;
    		var userId = document.getElementById("userId").value;
    		var alert=document.getElementById("alert").value;
    		if(password.length<6){
    			alert("password should be of minimum 6 characters");
    			return false;
    		}
    		if(password != rePassword){
    			alert("both passwords are not matching");
    			return false;
    		}
    	return true;
    	} 	
     </script>
 	<body>
		 <%
		 	String isValidUser = request.getParameter("isValidUser");
			if(isValidUser == null){isValidUser = "true";}
		 %>
		 <form name="frm" action="createUserVarifyEmail.jsp" method="post" enctype="multipart/form-data">
			<table width="100%"  cellspacing="0" cellpadding="0">
				<tr>
					<td width="100%"><img src="..\images\header.jpg" width="100%"
						height="150">
					</td>
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
				   <td><br></td>
				</tr>
				<tr>
					<td  align="center" style="font-size: 22;"><h2><u><b>LogIn Details</b></u></h2></td>
				</tr>
		        <tr>
		            <td><br></td>
		        </tr>
				<tr>
					<td>
						<table  align="center" width="33%">
						<tr>
							<td>
								<input type="hidden" name="appliedDate" id="appliedDate" readonly>
							</td>
						</tr>
						  <tr>
						    <td bgcolor="black">
						     <table width="70%" align="center">
						    <tr>
						        <td  style="font-size:15;" align="center" colspan=3><b> <font color="white">Enter Details</font></b></td>
						    </tr>
						    <tr>
						       <td width="45%" style="font-size:15;" align="center"> <font color="white">Email </font> <font color="red">*</font></font></td>
						       <td width="10%"><font color="white">:</font></td>
						       <td> <input  placeholder="Enter User-Id" type= "text" name="userId" id="userId" width=20 required> </td>
						    </tr>
						   <tr>
						     <td style="font-size:15;" align="center"><font color="white">Password</font><font color="red">*</font></td>
						       <td><font color="white">:</font></td>
						       <td><input  placeholder="Enter password" type= "password" name="password" id="password" width=20 required></td>
						   </tr>
						   <tr>
						     <td style="font-size:15;" align="center"><font color="white"> confirm Password </font><font color="red">*</font></td>
						      <td><font color="white">:</font></td>
						      <td><input  placeholder="ReEnter password" type= "password" name="cpassword" id="cpassword"width=20 required></td>
						   </tr>
						   <tr>
						   <td style="font-size:15;" align="center"><font color="white">Role</font></td>
						   <td><font color="white">:</font></td>
						   <td >
							     <select name="role" id="role" style="width:160px;" required>
								   	   <option value="">Select Type</option>
								   	   <option value="Student">Student</option>
								   	   <option value="Security">Security</option>
								   	   <option value="Rector">Rector</option>
								   	   <option value="Admin" selected>Admin</option>
								   	   <!-- <option value="Other">Other</option> -->
								  </select> 
							 </td>	 
						   </tr>
						   <tr>
						       <td><br></td>
						   </tr>
						  </table>
						  <table align="center">
						   <tr>
						     	<td align="center">
						     		<input type="reset" value="Reset" style="width:70px; font: bolder;font-size: small;font-weight: bolder;color: white;background-color: red;" />
							   		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   		<input type="submit" value="Submit" style="width:70px; font: bolder;font-size: small;font-weight: bolder;color: white;background-color: blue;" onclick="return validate()"/>
							   		<br><br>
								</td>
							</tr>
		                </table>
		            	</td>
		         	</tr>
		        	 <tr>
						<%if(isValidUser.equals("true")){ %>
								<td colspan="3" style="color: green;" align="center"><h3>&nbsp;<br><br><br><br><br><br><br><br><br><br><br><br><br><br></h3></td>
								<%}else{%>
								<td colspan="3" style="color: red;" align="center"><h3><i>Please Enter Valid User Id !!!<br><br><br><br><br><br><br><br><br><br><br><br><br><br></i></h3></td>
								<%} %>
								</td>
						</tr>
		         	</table>
		         </td>
		       </tr>
		       <tr>
		            <td><br><br><td>
		       </tr>
		        <tr>
				     <td bgcolor="#085753" ><marquee><font color="white">#HostelLife &nbsp&nbsp&nbsp Here's to the nights that turns into mornings with the friends that turns into family  &nbsp&nbsp&nbsp #HostelLife</font></marquee></td>
				</tr>
		      </table>
    	</form>
	</body>
</html>
<script>
var form ; //make it global variable
var date = new Date();
var currentYear = date.getFullYear();
var currentMonth = date.getMonth()+1;
var currentDate = date.getDate();
var currentMonthToShow =currentMonth; //becomes string so for that ,new variable
if(currentMonth < 10)
	currentMonthToShow = "0"+currentMonth;
document.getElementById("appliedDate").value = currentYear+"-"+currentMonthToShow+"-"+currentDate;
</script>
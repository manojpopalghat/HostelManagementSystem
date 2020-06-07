<%@page import="com.Security.SecurityDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
	<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.io.File" %>
<%@page import="com.Security.Security"%>
<%@page import="com.User.User" %>
<%@page import="com.User.UserDAO" %>
<%@page import="com.Mail.createUserMail" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title> Security Create Account ?</title>
	</head>
	<body>
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
		<tr bgcolor="white">
			<td align="center" colspan="5" height="30px"><u><b>Security Create Account</b></u></td>
		</tr> 
		
		<!-- Start Work From Here -->
		
			<%
			User user=(User)session.getAttribute("user");
			ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
			
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			
			int successFlag1 = 0;
			int successFlag2 = 0;
			Security security = new Security();
			
			while (iter.hasNext()) 
			{
			    FileItem item = (FileItem) iter.next();
			    String name = item.getFieldName();
			    if (item.isFormField()) 
			    {
					String value = item.getString();
					System.out.println("\n\nname : "+name+"\tvalue : "+value);
					if(name.equals("appliedDate"))
						security.setAppliedDate(value);
					else if(name.equals("firstName"))
						security.setFirstName(value);
					else if(name.equals("middleName"))
						security.setMiddleName(value);
					else if(name.equals("lastName"))
						security.setLastName(value);
					else if(name.equals("dob"))
						security.setDob(value);
					else if(name.equals("gender"))
						security.setGender(value);
					else if(name.equals("uid"))
						security.setUid(value);
					else if(name.equals("email"))
						security.setEmail(value);
					else if(name.equals("contact"))
						security.setContact(value);
					else if(name.equals("alternateContact"))
						security.setAlternateContact(value);
					else if(name.equals("currentAddress"))
						security.setCurrentAddress(value);
					else if(name.equals("permanentAddress"))
						security.setPermanentAddress(value);
					else if(name.equals("employeeId"))
						security.setEmployeeId(value);
					else if(name.equals("qualification"))
						security.setQualification(value);
					else if(name.equals("designation"))
						security.setDesignation(value);
					else if(name.equals("experience"))
						security.setExperience(value);
			    }
			    else
			    {
			    	String value = security.getEmail()+":"+item.getName();
					System.out.println("\n\nname : "+name+"\tvalue : "+value);
			    	
			    	if(name.equals("photo"))
			    	{	
			    		item.write(new File("/home/manoj/eclipse-workspace/HostelManagementSystem/WebContent/jsp/securities/photo/"+security.getEmail()+":"+item.getName()));
			    		security.setPhoto(security.getEmail()+":"+item.getName());	
			    	}
			    	else if(name.equals("sign"))
			    	{	
			    		item.write(new File("/home/manoj/eclipse-workspace/HostelManagementSystem/WebContent/jsp/securities/sign/"+security.getEmail()+":"+item.getName()));
			    		security.setSign(security.getEmail()+":"+item.getName());	
			    	} 
			        
			    }
			}
			
			successFlag1 = SecurityDAO.addsecurity(security);
		    %>
		    
		    <tr>
				<td align="center" colspan="5" width="40% "><br>
					<form name="frm" method="post"  action="createSecurity.jsp" >
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<%if(successFlag1>0){ %>
								<script>
								<% 
									successFlag2=UserDAO.addUser(user);
									if(successFlag2>0){
										try{
											String userId=user.getUserId();
											String password=user.getPassword();
						      				//createUserMail.sendCreateUserMail(userId,password);
						      			    RequestDispatcher rd = request.getRequestDispatcher("logIn.jsp");
						    			    rd.forward(request, response); 
									    }catch (Exception e){
										    System.out.println("in main \nerror occur while  sending  the mail");
											e.printStackTrace();
									  }
								%>
								alert("Your Request Forwarded For Approval");
								document.frm.submit();
								</script>
	<!-- 							<td style="color: green;" align="center"><h1>Your Request Forwarded For Approval</h1></td>
	 -->							<%}
	 									}else{ %>
								<script>
								alert("Your Request Not Forwarded Successfully For Approval\nSome Error Is Occurred\nPlease Try Again !!!");
								document.frm.submit();
								</script>
	<!-- 							<td style="color: red;" align="center"><h1>Your Request Not Forwarded Successfully For Approval<br>Some Error Is Occurred <br>Please Try Again !!! </h1></td>
	 -->							<%} %>
							</tr>
							
							<tr><td colspan="3">&nbsp;</td></tr>
							<tr>
								<td align="center" colspan="3">
									<input type="submit"  name="add" value="Add More Data" style="width: 50%;height: 25px;font-size: 17px">&nbsp;&nbsp;&nbsp;
								</td>		
							</tr>
						</table>
					</form>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				</td>
			</tr> 
		</table>
	</body>
</html>
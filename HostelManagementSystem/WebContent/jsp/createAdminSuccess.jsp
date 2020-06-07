<%@page import="com.Administration.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
	<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.io.File" %>
<%@page import="com.Administration.Admin"%>
<%@page import="com.User.UserDAO"%>
<%@page import="com.User.User"%>
<%@page import="com.Mail.createUserMail" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title> Admin Create Account ?</title>
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
			<td align="center" colspan="5" height="30px"><u><b>Admin Create Account</b></u></td>
		</tr> 
		
		<!-- Start Work From Here -->
		
			<%
			User user=(User)session.getAttribute("user");
			ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
			
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			
			int successFlag2 = 0;
			int successFlag1 = 0;
			Admin admin = new Admin();
			
			while (iter.hasNext()) 
			{
			    FileItem item = (FileItem) iter.next();
			    String name = item.getFieldName();
			    if (item.isFormField()) 
			    {
					String value = item.getString();
					System.out.println("\n\nname : "+name+"\tvalue : "+value);
					if(name.equals("appliedDate"))
						admin.setAppliedDate(value);
					else if(name.equals("firstName"))
						admin.setFirstName(value);
					else if(name.equals("middleName"))
						admin.setMiddleName(value);
					else if(name.equals("lastName"))
						admin.setLastName(value);
					else if(name.equals("dob"))
						admin.setDob(value);
					else if(name.equals("gender"))
						admin.setGender(value);
					else if(name.equals("uid"))
						admin.setUid(value);
					else if(name.equals("email"))
						admin.setEmail(value);
					else if(name.equals("contact"))
						admin.setContact(value);
					else if(name.equals("alternateContact"))
						admin.setAlternateContact(value);
					else if(name.equals("currentAddress"))
						admin.setCurrentAddress(value);
					else if(name.equals("permanentAddress"))
						admin.setPermanentAddress(value);
					else if(name.equals("employeeId"))
						admin.setEmployeeId(value);
					else if(name.equals("qualification"))
						admin.setQualification(value);
					else if(name.equals("designation"))
						admin.setDesignation(value);
					else if(name.equals("experience"))
						admin.setExperience(value);
			    }
			    else
			    {
			    	String value = admin.getEmail()+":"+item.getName();
					System.out.println("\n\nname : "+name+"\tvalue : "+value);
			    	
			    	if(name.equals("photo"))
			    	{	
			    		item.write(new File("/home/manoj/eclipse-workspace/HostelManagementSystem/WebContent/jsp/admins/photo/"+admin.getEmail()+":"+item.getName()));
			    		admin.setPhoto(admin.getEmail()+":"+item.getName());	
			    	}
			    	else if(name.equals("sign"))
			    	{	
			    		item.write(new File("/home/manoj/eclipse-workspace/HostelManagementSystem/WebContent/jsp/admins/sign/"+admin.getEmail()+":"+item.getName()));
			    		admin.setSign(admin.getEmail()+":"+item.getName());	
			    	} 
			        
			    }
			}
			
			successFlag1 = AdminDAO.addAdmin(admin);
		    %>
		    
		    <tr>
				<td align="center" colspan="5" width="40% "><br>
					<form name="frm" method="post"  action="createUser.jsp" >
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<%if(successFlag1>0){
									successFlag2 = UserDAO.addUser(user);
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
								<script>
								alert("Your Request Forwarded For Approval");
								document.frm.submit();
								</script>
	<!-- 							<td style="color: green;" align="center"><h1>Your Request Forwarded For Approval</h1></td>
	 -->					    <%   }
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
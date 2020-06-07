<%@page import="com.Student.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
	<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.io.File" %>
<%@page import="com.Student.Student"%>
<%@page import="com.User.UserDAO"%>
<%@page import="com.User.User"%>
<%@page import="com.Mail.createUserMail" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Student Create Account ?</title>
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
			<td align="center" colspan="5" height="30px"><u><b>Student Create Account</b></u></td>
		</tr> 
		
		<!-- Start Work From Here -->
		
		<%
		User user=(User)session.getAttribute("user");
		ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
					
		List items = upload.parseRequest(request);
		Iterator iter = items.iterator();
		
		int successFlag1 = 0; 
		int successFlag2 = 0;
		Student student = new Student();
	
		while (iter.hasNext()) 
		{
		    FileItem item = (FileItem) iter.next();
		    String name = item.getFieldName();
		    if (item.isFormField()) 
		    {
				String value = item.getString();
				System.out.println("\n\nname : "+name+"\tvalue : "+value);
				if(name.equals("appliedDate"))
					student.setAppliedDate(value);
				else if(name.equals("firstName"))
					student.setFirstName(value);
				else if(name.equals("middleName"))
					student.setMiddleName(value);
				else if(name.equals("lastName"))
					student.setLastName(value);
				else if(name.equals("dob"))
					student.setDob(value);
				else if(name.equals("gender"))
					student.setGender(value);
				else if(name.equals("uid"))
					student.setUid(value);
				else if(name.equals("email"))
					student.setEmail(value);
				else if(name.equals("contact"))
					student.setContact(value);
				else if(name.equals("parentContact"))
					student.setParentContact(value);
				else if(name.equals("currentAddress"))
					student.setCurrentAddress(value);
				else if(name.equals("permanentAddress"))
					student.setPermanentAddress(value);
				else if(name.equals("guardianName"))
					student.setGuardianName(value);
				else if(name.equals("guardianOccupation"))
					student.setGuardianOccupation(value);
				else if(name.equals("guardianAddress"))
					student.setGuardianAddress(value);
				else if(name.equals("guardianEmail"))
					student.setGuardianEmail(value);
				else if(name.equals("guardianContact"))
					student.setGuardianContact(value);
				else if(name.equals("deptName"))
					student.setDeptName(value);
				else if(name.equals("qualification"))
					student.setQualification(value);
				else if(name.equals("courseName"))
					student.setCourseName(value);
				else if(name.equals("courseDuration"))
					student.setCourseDuration(value);
				else if(name.equals("courseYear"))
					student.setCourseYear(value);
				else if(name.equals("eligibilityNo"))
					student.setEligibilityNo(value);
				else if(name.equals("admissionDate"))
					student.setAdmissionDate(value);
				else if(name.equals("admissionYear"))//admissionYear not comes
					student.setAdmissionYear(value);
				else if(name.equals("isRoomAllotted"))
					student.setIsRoomAllotted(value);
				else if(name.equals("hostelNo"))
					student.setHostelNo(value);
				else if(name.equals("roomNo"))
					student.setRoomNo(value);
		    }
		    else
		    {
		    	String value = student.getEmail()+":"+item.getName();
				System.out.println("\n\nname : "+name+"\tvalue : "+value);
		    	
		    	if(name.equals("photo"))
		    	{	
		    		item.write(new File("/home/manoj/eclipse-workspace/HostelManagementSystem/WebContent/jsp/students/photo/"+student.getEmail()+":"+item.getName()));
		    		student.setPhoto(student.getEmail()+":"+item.getName());	
		    	}
		    	else if(name.equals("sign"))
		    	{	
		    		item.write(new File("/home/manoj/eclipse-workspace/HostelManagementSystem/WebContent/jsp/students/sign/"+student.getEmail()+":"+item.getName()));
		    		student.setSign(student.getEmail()+":"+item.getName());	
		    	} 
		        
		    }
		}
		successFlag1 = StudentDAO.addStudent(student);
		
			
		%>
			
		<tr>
			<td align="center" colspan="5" width="40% "><br>
				<form name="frm" method="post"  action="createUser.jsp">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<%if(successFlag1>0){ %>
							<script>
							<% successFlag2 = UserDAO.addUser(user);
								if(successFlag2>0){
									try{
										String userId=user.getUserId();
										String password=user.getPassword();
					      				createUserMail.sendCreateUserMail(userId,password);
					      			    RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
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
 -->							<% }
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
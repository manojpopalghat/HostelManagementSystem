<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.Administration.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
	<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.io.File" %>
<%@page import="com.User.UserDAO"%>
<%@page import="com.User.User"%>
<%@page import="java.util.Random" %>
<%@page import ="com.Mail.createUserMail" %>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title> Create User Successful ?</title>
	</head>
	<body>
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
			<td align="center" colspan="5" height="30px"><u><b> Varify Email</b></u></td>
		</tr> 
		<!-- Start Work From Here -->
		
			<%
			ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
			
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			
			//int successFlag = 0; 
			int checkFlag =0;
			User user = new User();
		//	String role="";
				while (iter.hasNext()) 
				{
				    FileItem item = (FileItem) iter.next();
				    String name = item.getFieldName();
				    
				    if (item.isFormField()) 
				    {
						String value = item.getString();
						System.out.println("\n\nname : "+name+"\tvalue : "+value);
						if (name.equals("appliedDate"))
							user.setAppliedDate(value);
						else if(name.equals("userId"))
							user.setUserId(value);
						else if(name.equals("password"))
							user.setPassword(value);
						else if (name.equals("role"))
							user.setRole(value);
				    }
							
				}
				checkFlag=UserDAO.checkUser(user.getUserId());
				  if(checkFlag==0){
	                Random random = new Random();
	      			int otp = random.nextInt(900000)+100000;
	      			session.setAttribute("user", user);
	      			session.setAttribute("otp", otp);
	      			System.out.println("***************************");
	      			System.out.println("OTP : "+otp);
	      			System.out.println("***************************");
	      			String userId=user.getUserId();
	      			try{
	      				createUserMail.varifyEmail(userId, otp);
	      			    RequestDispatcher rd = request.getRequestDispatcher("createUserVarifyOtp.jsp");
	    				rd.forward(request, response); 
				  }catch (Exception e){
					    System.out.println("in main \nerror occur while  sending  the mail");
						e.printStackTrace();
				  } 
				  }
				  RequestDispatcher rd = request.getRequestDispatcher("createUserVarifyOtp.jsp");
  					rd.forward(request, response); 
				  %>
			<tr>
				<td align="center" colspan="5" width="40% "><br>
					<form name="frm" method="post"  action="" >
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							<%if(checkFlag!=0){
								response.sendRedirect("createUser.jsp?isValidUser=false");	 
							}
							%>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>
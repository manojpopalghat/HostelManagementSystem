<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator" %>
<%@page import="com.User.User" %>
<%@page import="com.User.UserDAO" %>

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title> check credentials ?</title>
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
			<td align="center" colspan="5" height="30px"><u><b>check credentials</b></u></td>
		</tr> 

		<%
				ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
				
				List items = upload.parseRequest(request);
				Iterator iter = items.iterator();
				User user=new User();
				int successFlag=0;
				
				while (iter.hasNext()) 
				{
				    FileItem item = (FileItem) iter.next();
				    String name = item.getFieldName();
				    if (item.isFormField()) 
				    {
						String value = item.getString();
						System.out.println("\n\nname : "+name+"\tvalue : "+value);
						if(name.equals("role"))
							user.setRole(value);
						else if(name.equals("userId"))
							user.setUserId(value);
						else if(name.equals("password"))
							user.setPassword(value);
				    }
				}
				
				successFlag = UserDAO.validateCredentials(user);
		%>
		
		 <tr>
				<td align="center" colspan="5" width="40% "><br>
					<form name="frm" method="post"  action="createUser.jsp" >
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							<% if(successFlag==0){
								response.sendRedirect("logIn.jsp?validateCredentials=false");
							}else{
								session.setAttribute("user",user);
								response.sendRedirect("home.jsp");
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
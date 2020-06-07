<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.io.File" %>
<%@page import="com.notification.Notification"%>
<%@page import="com.Administration.AdminDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add Notification Success ?</title>
</head>
<body bgcolor="#e4f7f5">
	<table width="100%" border="1" cellspacing="0" cellpadding="0">
		<%-- <tr>
			<td width="100%" colspan="5"><img src="../images/header.jpg" width="100%"
				height="150"></td>
		</tr>
		<tr>
			<td colspan="5">
			<%@ include file="topMenusForPublic.jsp" %>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="5" height="30px"><u><b>Add Notification Result</b></u></td>
		</tr> --%>
		
		<!-- Start Work From Here -->
		
		<%
			ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
						
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			int successFlag = 0; 
			Notification notification = new Notification();
			while (iter.hasNext()) 
			{
			    FileItem item = (FileItem) iter.next();

			    if (item.isFormField()) 
			    {
			      String name = item.getFieldName();
			      String value = item.getString();
			      if(name.equals("startDate"))
			    	  notification.setStartDate(value);
			      else if(name.equals("endDate"))
					notification.setEndDate(value);
			      else if(name.equals("nDetails"))
					notification.setnDetails(value);
			      else if(name.equals("linkStatus"))
			    	  notification.setLinkStatus(value);
			      
			    } else {
			        item.write(new File("/home/manoj/eclipse-workspace/HostelManagementSystem/WebContent/jsp/notifications/"+item.getName()));
			        notification.setLinkPath(item.getName());
			    }
			}
			successFlag = AdminDAO.addNotification(notification);
			
		%>
		
		<%-- <input type="hidden" name="successFlag" id="successFlag" value="<%=successFlag%>"> --%>
		
		<%
			response.sendRedirect("addNotification.jsp?successFlag="+successFlag);
		%>
		<%-- <tr>
			<td align="center" colspan="5" width="40% "><br>
				<form name="addForm" method="post"  action="addNotification.jsp" >
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<%if(successFlag>0){ %>
							<td style="color: green;" align="center"><h1>Notification Added SuccessFully.</h1></td>
							<%}else{ %>
							<td style="color: red;" align="center"><h1>Notification is Not Added SuccessFully ,<br>Please Try Again !!! </h1></td>
							<%} %>
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
		</tr> --%>
	</table>
</body>
</html>
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


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Notification Updated ?</title>
</head>
<body>
	<%
		ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());

		List items = upload.parseRequest(request);
		Iterator iter = items.iterator();
		int successFlag = 0;
		String linkStatus = "";
		String linkPath ="";
		String oldLinkStatus = "";
		String oldLinkPath ="";
		Notification notification = new Notification();
		while (iter.hasNext()) {
			FileItem item = (FileItem) iter.next();

			if (item.isFormField()) {
				String name = item.getFieldName();
				String value = item.getString();
				if (name.equals("startDate"))
					notification.setStartDate(value);
				else if (name.equals("endDate"))
					notification.setEndDate(value);
				else if (name.equals("nDetails"))
					notification.setnDetails(value);
				else if (name.equals("linkStatus"))
					linkStatus = value;
				else if(name.equals("oldLinkStatus"))
					oldLinkStatus = value;
				else if(name.equals("oldLinkPath"))
					oldLinkPath = value;
				else if(name.equals("nid"))
					notification.setNid(Integer.parseInt(value));
			}
			else 
			{
				item.write(new File(
						"/home/manoj/eclipse-workspace/HostelManagementSystem/WebContent/jsp/notifications/"
								+ item.getName()));
				linkPath = item.getName();
			}
			
		}
		if(linkStatus.equals("Y"))
		{
			notification.setLinkStatus(linkStatus);
			notification.setLinkPath(linkPath);
		}	
		else if(linkStatus.equals("N"))
		{
			notification.setLinkStatus(oldLinkStatus);
			notification.setLinkPath(oldLinkPath);
		}
		successFlag = AdminDAO.updateNotification(notification);
	%>

	
	<%
		response.sendRedirect("updateNotification.jsp?successFlag="+successFlag+"&nid="+notification.getNid());
	%>

</body>
</html>
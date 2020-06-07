<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.notification.Notification" %>	
<%@page import="com.Administration.AdminDAO" %>	
<!DOCTYPE html>
<html>
<body bgcolor="#e4f7f5" >		
	<%
		ArrayList <Notification> notificationList = AdminDAO.getNotificationListToShow();
	%>	
	<div class="col-md-12" id="datacontainer" style="position: absolute; left: 10px; top: 10px; width: 100%; " onMouseover="scrollspeed=0" onmouseout="scrollspeed=1">
		
		<%
			for(int i=0;i<notificationList.size();i++){
				//String filePath="C:/Users/Manoj/workspace/HostelManagementSystem/WebContent/jsp/notifications";
				String fileName = notificationList.get(i).getLinkPath();
				String linkStatus = notificationList.get(i).getLinkStatus();
				if(linkStatus == null){linkStatus = "N";}
				if(linkStatus.equals("Y")){
		%>
		<br/><br/><br/><a href = "<%= "../DownloadFile?fileName="+fileName %>" ><%=i+1+")"+notificationList.get(i).getnDetails() %></a>&nbsp;&nbsp;<img src="../images/new.gif" height="20px" />
		<% }else{%>		
		<font><br/><br/><br/><%=i+1+")"+notificationList.get(i).getnDetails() %></font>&nbsp;&nbsp;<img src="../images/new.gif" height="20px" />
					
		<%	}
		} %>
		
		</div>
		
</body>
</html>

<script type="text/javascript">
        var scrollspeed = cache = 1
        var initialdelay = 1000

        function initializeScroller() {
            dataobj = document.all ? document.all.datacontainer : document.getElementById("datacontainer")
            dataobj.style.top = "5px"
            setTimeout("getdataheight()", initialdelay)
        }

        function getdataheight() {
            thelength = dataobj.offsetHeight
            if (thelength == 0)
                setTimeout("getdataheight()", 10)
            else
                scrollDiv()
        }

        function scrollDiv() {
            dataobj.style.top = parseInt(dataobj.style.top) - scrollspeed + "px"
            if (parseInt(dataobj.style.top) < thelength * (-1))
                dataobj.style.top = "5px"
            setTimeout("scrollDiv()", 40)
        }

        if (window.addEventListener)
            window.addEventListener("load", initializeScroller, false)
        else if (window.attachEvent)
            window.attachEvent("onload", initializeScroller)
        else
            window.onload = initializeScroller

    </script>
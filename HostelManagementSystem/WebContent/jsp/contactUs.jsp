<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Contact Us</title>
		
		<style>
            p.ex1
            {
                margin-left: 10%;
            }
        </style>
	</head>
	<body bgcolor="#e4f7f5">
		<table width="100%" border="1">
			<tr>
				<td width="100%"><img src="../images/header.jpg" width="100%" height="150"></td>
			</tr>
			<tr>
				<td>
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
				<td  align="center" style="font-size: 22;"><b>Contact Us :</b></td>
			</tr>
            
            <tr>
            <td>
                <table border="1">
                    <font size="4"> 
                        <p class="ex1">
                            <b>Hostel Office Address :</b>
                            <br>Hostel Office,
                            <br>Near Main Gate,
                            <br>Savitribai Phule Pune University,Pune
                            <br>Ganeshkhind-411007
                            <br><u><b>Contact No :</b></u>*********
                        </p>
                    </font>    
                </table>
             </td>   
            </tr>
            
            <tr>
            	<td align="right">
            				<iframe src="https://www.google.com/maps/d/embed?mid=1ZkhlJfXpdE8W4BY7Pd8_ERMK29GSihdZ" 
						width="300" height="200"></iframe>
      			</td>	
			</tr>
			
		</table>  
	</body>
</html>
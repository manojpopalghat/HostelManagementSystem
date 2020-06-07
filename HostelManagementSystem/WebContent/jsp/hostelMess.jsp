<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Hostel Mess</title>
		
		<style>
            p.ex1
            {
                margin-left: 10%;
                margin-right: 10%;'
            }
            
            p.ex2
            {
                margin-left: 5%;
                margin-right: 5%;
            }
            
            *{
				box-sizing: border-box;
			}
		
			.container
			{
				position: relative;
				width: "95%";
				margin-left: 5%;
                margin-right: 5%;
			}
		
			.container img
			{
				vertical-align: middle;
			}
		
			.container .content 
			{
				position: absolute;
				bottom: 0;
				background: rgb(0, 0, 0);
				background: rgba(0, 0, 0, 0.5);
				color: #f1f1f1;
				width: 100%;
				padding: 20px;
			}
        </style>
        
	</head>
	
	<body bgcolor="white">
		<table width="100%" border="1">
			<tr>
				<td width="100%"><img src="../images/header.jpg" width="100%" height="150"></td>
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
				<td>
					<table>
						<br><br>
					</table>
				</td>
			</tr>
			<tr>
				<td  align="center"><h1><b>About Hostel Mess :</b></h1></td>
			</tr>
			<tr>
				<td>
					<table>
						<br><br>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%">
						<tr>
							<td>
								<div class="container">
									<img src="../images/hostelMess.jpg" alt="Hostel mess image is not found."
										style="width: 100%;">
									<div class="content">
										<font size="4">
											<p class="ex1">
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
												The hostel premises comprises of a separate dining facility for hostel residents. 
												The hostel mess has a separate dining hall and a well-equipped kitchen catering 
												to about 250 Girls and 200 Boy's students in their respective hostels.Mess serves 
												breakfast, lunch, evening tea and dinner every day and the weekly menu is available 
												with the mess in-charge.The food served is of high quality and meets the nutritional 
												quality standards. Particular focus is laid to provide a well-balanced, nutritious 
												diet with varying food tastes to all the students.
											</p>
										</font>
									</div>
								</div>
							</td>	
						</tr>
						<tr >
							<table bgcolor="#e4f7f5" width="90%" align="center" >
								<td>
									<p class="ex2">
										<font size="6"><b><u>Highlights</u>:</b></font>
										<br>&nbsp&nbsp>Separate dining facility for all hostel residents.
										<br>&nbsp&nbsp>Clean and hygienic environment.
										<br>&nbsp&nbsp>Self-service system is promoted in the mess.
										<br>&nbsp&nbsp>The menu is designed considering the nutritional requirements of the students.
										<br>&nbsp&nbsp>The mess offers morning tea with regular breakfast, lunch, evening snacks and tea, dinner and milk to all hostellers.
										<br>
									</p>
								</td>
							</table>	
						</tr>	
					</table>
				</td>		
			</tr>
        </table>     
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Reading Hall</title>
		
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
	
	<body bgcolor="#e4f7f5">
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
				<td  align="center" style="font-size: 22;"><h1><b>About Reading Hall :</b></h1></td>
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
									<img src="../images/readingHall.jpg" alt="Reading hall"
										style="width: 100%;">
									<div class="content">
										<font size="4">
											<p class="ex1">
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp We have a spacious
												reading hall enough to accommodate about 150 Girls and 100 Boy's
												students in their respective hostels. The ambience is just right
												for students study and other reading activities. Reading hall
												 a well furnished reading room with an fan, charching
												sockets for charging Laptops for comfortable reading. The reading
												room is having sufficient number of both English and Hindi news
												papers,magazines of different genre along with the popular
												regional magazines. <br>&nbsp&nbsp&nbsp&nbsp For Boy's
												reading hall is open for 24 hours and Girls reading hall is open
												from 6Am and closed at 12AM. There are Separate rooms for reading
												hall which are in hostel campus.
											</p>
										</font>
									</div>
								</div>
							</td>	
						</tr>
						<tr>
							<td>
								<p class="ex2">
									<font size="6"><b><u>Do and Don't inside reading hall</u>:</b></font>
									<br>&nbsp&nbsp>Please maintain strict silence inside the reading hall.
									<br>&nbsp&nbsp>Dont't mark, spoil or damage any reading material and furniture.
									<br>&nbsp&nbsp>Food materials are not allowed inside reading room.
									<br>&nbsp&nbsp>Taking any reading hall material outside reading hall is strictly prohibited.
									<br>&nbsp&nbsp>Please switch off all lights and fans when there is nobody inside the reading room.
									<br>
								</p>
							</td>	
						</tr>	
					</table>
				</td>		
			</tr>
        </table>     
	</body>
</html>
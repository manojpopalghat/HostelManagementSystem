<%@page import="com.User.User" %>

<html>
	<body>
	<form name="frm" action="">
		<table>
			<tr>
				<td >
<% 
						User user=(User)session.getAttribute("user");
						int otp=(int)session.getAttribute("otp");
						int userOTP=Integer.parseInt(request.getParameter("userOTP"));
						if(userOTP==otp){ 
								String role=user.getRole();
									if(role.equals("Student")){
							    		System.out.println("student found!!!");
							    		response.sendRedirect("createStudent.jsp");
							    	}
							    	else if(role.equals("Rector")){
							    		System.out.println("Rector found");
							    		response.sendRedirect("createRector.jsp");
							    	}
							    	else if(role.equals("Security")){
							    		System.out.println("Security found");
							    		response.sendRedirect("createSecurity.jsp");
							    	}
							    	else if(role.equals("Admin")){
							    		System.out.println("Admin found");
							    		response.sendRedirect("createAdmin.jsp");
							    	}
							    	else if(role.equals("Other")){
							    		System.out.println("Other found");
							    		response.sendRedirect("home.jsp");
							    	 }
						 }
					   else{
						response.sendRedirect("createUserVarifyOtp.jsp?isValidOtp=false");	
					   } %>
					</td>
					</tr>
				</table>
			</form>
		</body>			
</html>
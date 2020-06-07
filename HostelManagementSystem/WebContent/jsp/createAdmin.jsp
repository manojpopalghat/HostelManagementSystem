<%@page import="com.User.User"%>
<!DOCTYPE html>
<%@page import="com.sun.glass.ui.Size"%>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Administration Registration</title>
		<style>
			.background {
			  background: url(../images/registration.jpg);
			  border: 1px solid black;
			}
			
			.transbox {
			  margin: 30px;
			  background-color:white;
			  border: 1px solid black;
			  opacity: 0.9;
			}
			
			.transbox p {
			  margin: 2%;
			  font-weight: bold;
			  color: #000000;
			}
		</style>
	
	</head>
    <body>
    	<%
    	    User user=(User)session.getAttribute("user");
    		session.setAttribute("user",user);
    		String userId=user.getUserId();
    	%>
        <table style="width: 100%;" border="1" cellspacing="0" cellpadding="0">
            <tr>
				<td width="100%" colspan="5"><img src="../images/header.jpg" width="100%" height="150"></td>
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
				<td class="background" width="100%" align="center"><br><br><br><br><br><br>
					<form name="frm" id="frm" method="post" action="createAdminSuccess.jsp" enctype="multipart/form-data">
					<table>
						<tr>
							<td class="transbox" width="90%" align="center">
							
								<input type="hidden" name="appliedDate" id="appliedDate" readonly>
								<input type="hidden" name="userId" id="userId" value=>
							
							<h2 align="center" style="color: blue;"><u>Application Form</u></h2>
							<hr>
							
							<!-- Personal Details -->
								<table >
									<tr>
									    <td  style="font-size:15;" align="center"colspan="9"><b>Personal Details</b><br><br></td>
									</tr>
									<tr> 
										<td style="font-size:15;" align="left">First Name<font color="red">*</font></td>
										<td>:</td>
										<td><input style="width:150px;" placeholder="e.g. Suraj" type= "text" name="firstName" onkeypress="javascript:return lettersOnly(event)" required></td>	 
									  
										<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Middle Name<font color="red">*</font></td>
										<td >:</td>
										<td><input style="width:150px;" placeholder="e.g. Kailas" type= "text" name="middleName" onkeypress="javascript:return lettersOnly(event)" required></td>	 
									   
									   	<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name<font color="red">*</font></td>
									    <td>:</td>
									 	<td><input style="width:150px;" placeholder="e.g. Kale" type= "text" name="lastName" onkeypress="javascript:return lettersOnly(event)"  required></td>	 
									</tr>
									<tr>
										<td style="font-size:15;" align="left">Date Of Birth<font color="red">*</font></td>
										<td>:</td>
										<td><input style="width:150px;" placeholder="e.g. yyyy-MM-dd" type= "date" name="dob" required ></td>	
										 
										<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gender<font color="red">*</font></td>
										<td>:</td>
										<td>
										  <select name="gender" id="gender" style="width:154px;" required>
											   	<option value="">Select Gender</option>
											   	<option value="Male">Male</option>
											   	<option value="Female">Female</option>
											   	<option value="Other">Other</option>
											  </select> 
										</td>	
										 
										<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Aadhaar No<font color="red">*</font></td>
										<td>:</td>
										<td><input style="width:150px;" placeholder="e.g. 123456489012" type= "number" name="uid" onkeypress="javascript:return numberOnly(event)"  required ></td>	
									</tr>
									<tr>
										<td style="font-size:15;" align="left">Email-Id<font color="red">*</font></td>
										<td>:</td>
										<td><input style="width:150px;background-color: silver;" value=<%=userId %> type="email" name="email" readonly required ></td>
										
										<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact No<font color="red">*</font></td>
										<td>:</td>
										<td><input style="width:150px;" placeholder="e.g. 9876543210" type="number" name="contact" onkeypress="javascript:return numberOnly(event)" required ></td>	 
										 
										<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alternate Contact</td>
										<td>:</td>
										<td><input style="width:150px;" placeholder="e.g. 9988776655" type="number" name="alternateContact" onkeypress="javascript:return numberOnly(event)"></td>	 			    
									</tr>
								</table>
								
								<!-- Upload & address -->
								<br>	
								<table> 
									<tr>
										<td style="font-size:15;" align="left">Upload Photo<font color="red">*</font><br><small style="color: red;">max-size:2 MB<br>dimensions:25-35 mm</small></td>
										<td>:<br><br><br></td>
										<td><input type="file" name="photo" onchange="ValidatePhotoSize(this)" accept="image/*" required><br><br><br></td>
										 
										<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Upload Signature<font color="red">*</font><br><small style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;max-size:2 MB<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dimensions:25-35 mm</small></td>
										<td>:<br><br><br></td>
										<td><input  type= "file" name="sign" onchange="ValidateSignSize(this)" accept="image/*" required > <br><br><br></td>  
									</tr>	
									<tr align="center">
										<td style="font-size:15;" align="left">Current Address<font color="red">*</font></td>
										<td>:</td>
										<td> 
											<textarea name="currentAddress" id="currentAddress" rows="4" cols="30" required></textarea>
										</td>
									 	
										<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Permanent Address<font color="red">*</font></td>
										<td>:</td>
										<td>
											<textarea name="permanentAddress" id="permanentAddress" rows="4" cols="30" required></textarea>	
										</td>
									</tr>			 
								</table>		
								<br>	  
								<hr>
									
								<!-- Official Details -->	  
								<table>
									<tr>
										<td style="font-size:15;" align="center" colspan="9"><b>Official Details</b><br><br></td>
									</tr>
									<tr>
										<td style="font-size:15;" align="left">Employee Id<font color="red">*</font></td>
										<td>:</td>
										<td>
											<input  placeholder="e.g E123456789" type= "text" name="employeeId" width=20 required >
										</td>	 
													  
									    <td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Qualification<font color="red">*</font></td>
										<td >:</td>
										<td >
											<input type="text" name="qualification" placeholder="e.g. Graduation" onkeypress="javascript:return lettersOnly(event)" required>
										</td>	 
											     
											     
										<td style="font-size:15;" align="left">Designation<font color="red">*</font></td>
										<td>:</td>
										<td>
											<input  placeholder="current designation" type= "text" name="designation" width=20 onkeypress="javascript:return lettersOnly(event)" required>
										</td>	 	 
									</tr>
									<tr>
										<td> Experience</td>
										<td>:</td>
										<td>
											 <input placeholder="In years" type="numeric" name="experience" width=20 required>
										</td> 
									</tr>
								</table>
								<br>
								<hr>
								
								<!-- Buttons -->
								<table>
									<tr>
										<td align="center" >
											<input type="reset" value="Reset" style="width:180px; font: bolder;font-size: large;font-weight: bolder;color: white;background-color: red;" />
									   		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									   		<input type="submit" value="Create Account" style="width:180px; font: bolder;font-size: large;font-weight: bolder;color: white;background-color: blue;" onclick="return validate()"/>
									   		<br><br>
									   	</td>		
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			  </td>
			</tr>
		</table>
	</body>
</html>
<script type="text/javascript">
	var form ; //make it global variable
	var date = new Date();
	var currentYear = date.getFullYear();
	var currentMonth = date.getMonth()+1;
	var currentDate = date.getDate();
	var currentMonthToShow =currentMonth; //becomes string so for that ,new variable
	if(currentMonth < 10)
		currentMonthToShow = "0"+currentMonth;
	document.getElementById("appliedDate").value = currentYear+"-"+currentMonthToShow+"-"+currentDate;
	
	function numberOnly(evt) 
	{
	   var iKeyCode = (evt.which) ? evt.which : evt.keyCode;
	    if (iKeyCode!=13 && (iKeyCode<48||iKeyCode>57))
	    {
	    	alert("Enter numbers only.");
	    	return false;
	    }	
	    return true;
	}
	
	function lettersOnly(evt) {
	    evt = (evt) ? evt : event;
	    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
	       ((evt.which) ? evt.which : 0));
	    if (charCode > 33 && (charCode < 65) && 
	       (charCode < 97 ||charCode > 122)) {
	       alert("Enter letters only.");
	       return false;
	    }
	    return true;
	  }
	/*function alphanumeric(evt) {
	    evt = (evt) ? evt : event;
	    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
	       ((evt.which) ? evt.which : 0));
	    if (((charCode> 33 && charCode< 65) && (charCode>97 || charCode< 122))&&(charCode < 48 || charCode> 57) &&  charCode!=13) {
	      alert("Enter Letters or Numbers only.");
	       return false;
	    }
	    return true;
	  }
	    return true;
	  }*/

	function ValidatePhotoSize(file) 
	{
	    var FileSize = file.files[0].size / 1024 / 1024; // in MB
		    if (FileSize > 2) 
		    {
		        alert('File size exceeds 2 MB');
		       return false;
		    } 
		    else 
				return true;
		
	}
	
	function ValidateSignSize(file) {
	    var FileSize = file.files[0].size /1024 / 1024; // in MB
		    if (FileSize > 2) 
		    {
		        alert('File size exceeds 2 MB');
		       return false;
		    } 
		    else
				return true;
	}
	function isValidDOB() 
	{
		var dob = form.dob.value;
		if(dob.charAt(4) != "-")
		{
			alert("You entered wrong date format !\nDate should be in yyyy-MM-dd format .");
			return false;
		}
		var dobArr = dob.split("-");
		var dobYear = parseInt(dobArr[0]);
		var dobMonth = parseInt(dobArr[1]);
		var dobDate = parseInt(dobArr[2]);
		
		if(dobYear < currentYear)
			return true;
		
		else if(dobYear == currentYear)
		{
			if(dobMonth < currentMonth)
				return true;
			
			else if(dobMonth == currentMonth)
			{
				if(dobDate <= currentDate)
					return true;
				else //dobDate > currentDate
				{
					alert("Please enter valid date of birth !\nShould be before today's date .");
					return false;
				}
				
			}
			else //dobMonth > currentMonth
			{
				alert("Please enter valid date of birth !\nShould be before today's date .");
				return false;
			}
			
		}	
		else //dobYear > currentYear
		{
			alert("Please enter valid date of birth !\nShould be before today's date .");
			return false;
		}	
	}
	function isValidUID() 
	{
		if(form.uid.value.length != 12)
		{
			alert("Please Enter Valid Aadhar Number !\nAadhaar Number Should be of 12 digit .");
			return false;
		}
		return true;
	}
	
	function isValidEmail()
	{
		var email = form.email.value;
		regx = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,10}$/;
		if(regx.test(email))
			return true;
		else
		{
			alert("Please enter valid email-id !");
			return false;
		}	
	}
	
	function isValidContact() 
	{
		if(form.contact.value.length != 10)
		{
			alert("Please Enter Valid Contact Number !\nContact Number should be of 10 digits.");
			return false;
		}
		else
			return true;
	}
	function isValidAlternateContact() 
	{
		var parentContact = form.alternateContact.value;
		if(parentContact.length > 0)
		{
			if(parentContact.length != 10)
			{
				alert("Please Enter Valid Alternate Contact Number !\nContact Number should be of 10 digits.");
				return false;
			}
			else
				return true;
		}
		else
			return true;
	}
	function validate()
	{
		form = document.getElementById("frm");
		if(isValidDOB()==false)
			return false;
		if(isValidUID()==false)
			return false; 
		/* if(isValidEmail()==false)	//remains to check
			return false;   */
		if(isValidContact()==false)	
			return false;
		if(isValidAlternateContact()==false)
			return false;
		if(ValidatePhotoSize(form.photo)==false)
			return false;
		if(ValidateSignSize(form.sign)==false)
			return false;
		
		return true;
	}
</script>

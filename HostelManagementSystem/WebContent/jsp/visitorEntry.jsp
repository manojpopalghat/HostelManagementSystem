<%@page import="com.User.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Visitor Entry</title>
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
		
	%>	
	<table style="width: 100%;" border="1" cellspacing="0" cellpadding="0">
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
		<tr>
		<td class="background" width="100%" align="center"><br><br><br><br><br><br>
			<form name="frm" id="frm" method="post" action="createStudentSuccess.jsp">
			<table>
				<tr>
				<td class="transbox" width="90%" align="center">
				
				<input type="hidden" name="appliedDate" id="appliedDate" readonly>
				
				<h2 align="center" style="color: blue;"><u>Visitor Entry</u></h2>
				<hr>
				
				<!-- Host Details -->
					<table >
						<tr>
						    <td  style="font-size:15;" align="center"colspan="9"><b>Host Details</b><br><br></td>
						</tr>
						<tr> 
							<td style="font-size:15;" align="left">Hostel No.<font color="red">*</font></td>
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
							<td><input style="width:150px;background-color: silver;" value=userId %> type="email" name="email" readonly required ></td>
							
							<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact No<font color="red">*</font></td>
							<td>:</td>
							<td><input style="width:150px;" placeholder="e.g. 9876543210" type="number" name="contact" onkeypress="javascript:return numberOnly(event)" required ></td>	 
							 
							<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Parent's Contact</td>
							<td>:</td>
							<td><input style="width:150px;" placeholder="e.g. 9988776655" type="number" name="parentContact" onkeypress="javascript:return numberOnly(event)"></td>	 			    
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
					
					<!-- Guardian Details -->	  
					<table>
						<tr>
							<td style="font-size:15;" align="center" colspan="9"><b>Guardian Details</b><br><br></td>
						</tr>
						<tr> 
							<td style="font-size:15;" align="left">Guardian Name<font color="red">*</font></td>
						   	<td>:</td>
							<td><input style="width:150px;" placeholder="e.g. kailas Kale" type= "text" name="guardianName" onkeypress="javascript:return lettersOnly(event)" required ></td>
							 
							<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Occupation</td>
							<td>:</td> 
							<td> <input style="width:150px;" placeholder="e.g. Teacher" type= "text" name="guardianOccupation" onkeypress="javascript:return lettersOnly(event)"></td>	
									   
							<td style="font-size:15;" align="left" rowspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address<font color="red">*</font></td>
							<td rowspan="2">:</td>
							<td rowspan="2">
								<textarea name="guardianAddress" id="guardianAddress" rows="4" cols="30" required></textarea>
							</td>	 
						</tr>
						<tr>
							<td style="font-size:15;" align="right">Email-Id</td>
							<td>:</td>
							<td> <input style="width:150px;" placeholder="e.g. user@mymail.com" type= "email" name="guardianEmail" ></td>	
									  
							<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact No<font color="red">*</font></td>
							<td>:</td>
							<td> <input style="width:150px;" placeholder="e.g. 9966332211" type="number" name="guardianContact" onkeypress="javascript:return numberOnly(event)" required></td>				  
						</tr>
					</table>
					<br>
					<hr>	   
						   
					<!-- Academic Details -->	    
					<table >
						<tr>
							<td  style="font-size:15;" align="center" colspan="9"><b>Academic Details</b><br><br></td>
						</tr>
						<tr> 
							<td style="font-size:15;" align="left">Department Name<font color="red">*</font></td>
						 	<td>:</td>
						 	<td><input style="width:150px;" placeholder="e.g. Mathematics" type="text" name="deptName" onkeypress="javascript:return lettersOnly(event)" required ></td>	 
								  
							<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Qualification Level<font color="red">*</font></td>
						   	<td>:</td>
							<td>
								<select name="qualification" id="qualification" style="width:154px;" required>
									<option value="">Select Qualification</option>
									<option value="Under Graduate">Under Graduate Course</option>
									<option value="Post Graduate">Post Graduate Course</option>
									<option value="Ph.D">Ph.D</option>
									<option value="M.Phill">M.Phill</option>
									<option value="Vocational">Vocational Course</option>
									<option value="Other">Other</option>
								</select> 
						 	</td>	 
						    
						  	<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Course Name<font color="red">*</font></td>
							<td>:</td> 
							<td> <input style="width:150px;" placeholder="e.g. M.Sc. Mathematics" type="text" name="courseName"  required ></td>	 
						</tr> 
						<tr>
							<td style="font-size:15;" align="left">Course Duration<font color="red">*</font></td>
							<td>:</td>
						   	<td>
						   		<!--  <input  placeholder="Enter Duration" type="numeric" name=""  > -->
								<select name="courseDuration" id="courseDuration" style="width:154px;" required >
										<option value="">Select Duration</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="5+">5+</option>
								</select>
							</td>	 
									  
							<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Current Course year<font color="red">*</font></td>
							<td >:</td>
							<td > 
								<!-- <input  placeholder="Enter current year" type= "numeric" name="cyear"  > -->
								<select name="courseYear" id="courseYear" style="width:154px;" required>
										<option value="">Select Course Year</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="5+">5+</option>
								</select>
							</td>
								 
							<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Eligibility No<font color="red">*</font></td>
							<td>:</td>
							<td><input style="width:150px;" placeholder="e.g.22018000494" type="text" name="eligibilityNo"  required></td>	 
						</tr>
						<tr>
							<td style="font-size:15;" align="left">Admission Date<font color="red">*</font></td>
							<td>:</td>
						   	<td><input style="width:150px;" placeholder="e.g. yyyy-MM-dd" type="date" name="admissionDate" id="admissionDate" onchange="writeAdmissionYear()" required ></td>	 
														
							<td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Admission Year<font color="red">*</font></td>
							<td>:</td>
						   	<td><input style="width:150px;background-color: silver;" type="number" name="admissionYear" id="admissionYear" value="" required readonly></td>	
						
							<td style="font-size:15;" align="left">&nbsp;</td>
							<td>&nbsp;</td>
						   	<td>&nbsp;</td>			  
						</tr>
					</table>
					<br>
					<hr>
					
					<!-- Hostel Details -->	   
					<table >
					   	<tr>
						 	<td  style="font-size:15;" align="center" colspan="9"><b>Hostel Details</b><br><br></td>
					   </tr>
					   <tr>
							<td  style="font-size:15;" align="center" colspan="9"><font size="3px" style="font:bold; font-style: italic;">Is already Room allotted in hostel ? </font>
						 		&nbsp;&nbsp;<input type="radio" name="isRoomAllotted" id="isRoomAllottedYes" Value="Y" onchange="showHostelDetails()">Yes
						 		&nbsp;&nbsp;<input type="radio" name="isRoomAllotted" id="isRoomAllottedNo" Value="N" onchange="showHostelDetails()" checked>No
						 		<br><br>
						 	</td>
					   	</tr>
					   	<tr id="hostelDetails" hidden="true"> 										  
							<td style="font-size:15;" align="left">Hostel No<font color="red">*</font></td>
					    	<td>:</td>
							<td>
								<select name="hostelNo" id="hostelNo" style="width:154px;" >
									<option value="">Select Hostel</option>
									<optgroup label="Gents Hostel">
										<option value="G1">G1</option>
										<option value="G2">G2</option>
										<option value="G3">G3</option>
										<option value="G4">G4</option>
										<option value="G5">G5</option>
										<option value="G6">G6</option>
										<option value="G7">G7</option>
										<option value="G8">G8</option>
									</optgroup>
									<optgroup label="Ladies Hostel">
										<option value="L1">L1</option>
										<option value="L2">L2</option>
										<option value="L3">L3</option>
										<option value="L4">L4</option>
										<option value="L5">L5</option>
										<option value="L6">L6</option>
										<option value="L7">L7</option>
										<option value="L8">L8</option>
										<option value="L9">L9</option>
									</optgroup>
								</select> 
					   		</td>	 
						     
						    <td style="font-size:15;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Room No<font color="red">*</font></td>
							<td>:</td> 
							<td> <input style="width:150px;" placeholder="e.g. 1 " type="number" name="roomNo" id="roomNo" onkeypress="javascript:return numberOnly(event)" ></td>	
						
							<td style="font-size:15;" align="left">&nbsp;</td>
							<td>&nbsp;</td> 
							<td>&nbsp;</td>	 
					 	</tr> 
					</table>
					<br>
					<hr>
					
					<!-- Buttons -->
					<table>
						<tr>
							<td align="center" >
						   		<input type="submit" value="Create Account" style="width:180px; font: bolder;font-size: large;font-weight: bolder;color: white;background-color: blue;" onclick="return validate()"/>
						   		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   		<input type="reset" value="Reset" style="width:180px; font: bolder;font-size: large;font-weight: bolder;color: white;background-color: red;" />
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

<script>
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
		    if (iKeyCode!=13 && (iKeyCode<48 || iKeyCode > 57))
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
		       (charCode < 97 || charCode > 122)) {
		       alert("Enter letters only.");
		       return false;
		    }
	    return true;
	  }
	
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
        var FileSize = file.files[0].size / 1024 / 1024; // in MB
        if (FileSize > 2) 
        {
            alert('File size exceeds 2 MB');
           return false;
        } 
        else
			return true;
    }
	
	function writeAdmissionYear() 
	{
		var admissionDate = document.getElementById("admissionDate").value;
		if(admissionDate.charAt(4)=="-")
		{
			admissionDateArray = admissionDate.split("-");
			document.getElementById("admissionYear").value = admissionDateArray[0]; //assigns yyyy
		}	
	}
	
	function showHostelDetails()
	{
		var yesButton = document.getElementById("isRoomAllottedYes").checked;
		if(yesButton == true)
		{
			document.getElementById("hostelDetails").hidden=false;
			document.getElementById("hostelNo").required=true;
			document.getElementById("roomNo").required=true;
		}	
		else
		{
			document.getElementById("isRoomAllottedNo").checked
			document.getElementById("hostelDetails").hidden=true;
		}	
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
	function isValidParentContact() 
	{
		var parentContact = form.parentContact.value;
		if(parentContact.length > 0)
		{
			if(parentContact.length != 10)
			{
				alert("Please Enter Valid Parent's Contact Number !\nContact Number should be of 10 digits.");
				return false;
			}
			else
				return true;
		}
		else
			return true;
	}
		
	function isValidGuardianEmail()
	{
		var email = form.guardianEmail.value;
		if(email.length > 0)
		{
			regx = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,10}$/;
			if(regx.test(email))
				return true;
			else
			{
				alert("Please enter valid Guardian's email-id !");
				return false;
			}	
		}	
		else
			return true;
	}
	
	function isValidGuardianContact() 
	{
		if(form.guardianContact.value.length != 10)
		{
			alert("Please Enter Valid Guardian's Contact No !\nContact Number should be of 10 digits.");
			return false;
		}	
		return true;
	}
	
	function isValidCurrentYear()
	{
		var currentYear = form.courseYear.value;
		if(currentYear=="5+")
			currentYear="6";
		var courseDuration = form.courseDuration.value;
		if(courseDuration=="5+")
			courseDuration="6";
		
		var currentYear = parseInt(currentYear);
		var courseDuration = parseInt(courseDuration);
		if(currentYear > courseDuration)
		{
			alert("Plaese enter valid Current Year !\nCurrent Year should be not greater than Course Duration.");
			return false;
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
		if(isValidParentContact()==false)
			return false;
		if(ValidatePhotoSize(form.photo)==false)
			return false;
		if(ValidateSignSize(form.sign)==false)
			return false;
		if(isValidGuardianEmail()==false)
			return false;
		if(isValidGuardianContact()==false)
			return false;
		if(isValidCurrentYear()==false)
			return false;
		
		return true;
	}
		
		
		
	</script>
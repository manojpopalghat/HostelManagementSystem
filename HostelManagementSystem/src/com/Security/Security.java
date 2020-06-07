package com.Security;

 public class Security extends com.Person.Person{
	 
	 private String securId="-1";
     
	 private String alternateContact = "";
	 
	 private String employeeId = "";
	 private String qualification = "";
	 private String designation = "";
	 private String experience="";
	 
	 /**
		 * 
		 * all getters and setters
	*/
	 
    public String getSecurId() {
		return securId;
	}
	public void setSecurId(String securId) {
		this.securId = securId;
	}
	 public String getAlternateContact() {
		return alternateContact;
	}
	public void setAlternateContact(String alternateContact) {
		this.alternateContact = alternateContact;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId= employeeId;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification=qualification;
	}
	public String getDesignation(){
		return designation;
	}
	public void setDesignation( String designation) {
		this.designation=designation;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience=experience;
	}
	
/*	public static void main(String args[]) {
		Security security=new Security();
		security.setFirstName("ankita");
		System.out.println("name="+security.getFirstName());
	}*/
}
package com.Rector;

public class Rector extends com.Person.Person{
	private String rectorId = "-1";
	
	private String alternateContact = "";
	
	private String department = "";
	private String designation = "";
	private String employeeId = "";
	private String hostelAllocated = "";
	private String hostelNo = "";
	
	/**
	 * 
	 * all getters and setters
    */
	public String getRectorId() {
		return rectorId;
	}
	public void setRectorId(String rectorId) {
		this.rectorId = rectorId;
	}
	public String getAlternateContact() {
		return alternateContact;
	}
	public void setAlternateContact(String alternateContact) {
		this.alternateContact = alternateContact;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId= employeeId;
	}
	public String getHostelAllocated() {
		return hostelAllocated;
	}
	public void setHostelAllocated(String hostelAllocated) {
		this.hostelAllocated = hostelAllocated;
	}
	public String getHostelNo() {
		return hostelNo;
	}
	public void setHostelNo(String hostelNo) {
		this.hostelNo = hostelNo;
	}
}
package com.Student;

public class LatePass{
	private int lateId = -1;
	
	private String appliedDate = "";
	private String userId = "";
	private String name = "";
	private String classN = "";
	private String department = "";
	private String rollNo = "";
	private String roomNo = "";
	private String hostelNo = "";
	private String leaveTime = "";
	private String address = "";
	private String contact = "";
	private String guardianContact = "";
	/**
	 * 
	 * all getters and setters
	 */
	
	public int getLateId() {
		return lateId ;
	}
	public void setLateId(int lateId) {
		this.lateId = lateId;
	}
	public String getAppliedDate() {
		return appliedDate;
	}
	public void setAppliedDate(String appliedDate) {
		this.appliedDate=appliedDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	public String getClassN() {
		return classN;
	}
	public void setClassN(String classN) {
		this.classN=classN;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department=department;
	}
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo=rollNo;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo= roomNo;
	}
	public String getHostelNo() {
		return hostelNo;
	}
	public void setHostelNo(String hostelNo) {
		this.hostelNo= hostelNo;
	}
	public String getLeaveTime() {
		return leaveTime;
	}
	public void setLeaveTime(String leaveTime) {
		this.leaveTime=leaveTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address=address;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact=contact;
	}
	public String getGuardianConatct() {
		return guardianContact;
	}
	public void setGuardianContact(String guardianContact) {
		this.guardianContact=guardianContact;
	}
	
	/*public static void main(String args[]) {
		latePass latepass=new latePass();
		System.out.println("latepassId="+latepass.getLateId());
	}*/
}
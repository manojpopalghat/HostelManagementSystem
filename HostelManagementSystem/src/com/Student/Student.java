package com.Student;

public class Student extends com.Person.Person
{
	private int studId = -1;
	
	private String parentContact = "";
	
	private String guardianName ="";
	private String guardianOccupation = "";
	private String guardianAddress = "";
	private String guardianEmail = "";
	private String guardianContact = "";
	
	private String deptName = "";
	private String qualification = "";
	private String courseName = "";
	private String courseDuration = "";
	private String courseYear = "";
	private String eligibilityNo = "";
	private String admissionDate = "";
	private String admissionYear = "";
	
	private String isRoomAllotted = "";
	private String hostelNo = "";
	private String roomNo = "";
	
	private int rId = -1;
	
	/**
	 * 
	 * all getters and setters
	 */
	
	public int getStudId() {
		return studId;
	}
	public void setStudId(int studId) {
		this.studId = studId;
	}
	public String getParentContact() {
		return parentContact;
	}
	public void setParentContact(String parentContact) {
		this.parentContact = parentContact;
	}
	public String getGuardianName() {
		return guardianName;
	}
	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
	}
	public String getGuardianOccupation() {
		return guardianOccupation;
	}
	public void setGuardianOccupation(String guardianOccupation) {
		this.guardianOccupation = guardianOccupation;
	}
	public String getGuardianAddress() {
		return guardianAddress;
	}
	public void setGuardianAddress(String guardianAddress) {
		this.guardianAddress = guardianAddress;
	}
	public String getGuardianEmail() {
		return guardianEmail;
	}
	public void setGuardianEmail(String guardianEmail) {
		this.guardianEmail = guardianEmail;
	}
	public String getGuardianContact() {
		return guardianContact;
	}
	public void setGuardianContact(String guardianContact) {
		this.guardianContact = guardianContact;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseDuration() {
		return courseDuration;
	}
	public void setCourseDuration(String courseDuration) {
		this.courseDuration = courseDuration;
	}
	public String getCourseYear() {
		return courseYear;
	}
	public void setCourseYear(String courseYear) {
		this.courseYear = courseYear;
	}
	public String getEligibilityNo() {
		return eligibilityNo;
	}
	public void setEligibilityNo(String eligibilityNo) {
		this.eligibilityNo = eligibilityNo;
	}
	public String getAdmissionDate() {
		return admissionDate;
	}
	public void setAdmissionDate(String admissionDate) {
		this.admissionDate = admissionDate;
	}
	public String getAdmissionYear() {
		return admissionYear;
	}
	public void setAdmissionYear(String admissionYear) {
		this.admissionYear = admissionYear;
	}
	public String getIsRoomAllotted() {
		return isRoomAllotted;
	}
	public void setIsRoomAllotted(String isRoomAllotted) {
		this.isRoomAllotted = isRoomAllotted;
	}
	public String getHostelNo() {
		return hostelNo;
	}
	public void setHostelNo(String hostelNo) {
		this.hostelNo = hostelNo;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	@Override
	public String toString() {
		return "Student [studId=" + studId + ", parentContact=" + parentContact + ", guardianName=" + guardianName
				+ ", guardianOccupation=" + guardianOccupation + ", guardianAddress=" + guardianAddress
				+ ", guardianEmail=" + guardianEmail + ", guardianContact=" + guardianContact + ", deptName=" + deptName
				+ ", qualification=" + qualification + ", courseName=" + courseName + ", courseDuration="
				+ courseDuration + ", courseYear=" + courseYear + ", eligibilityNo=" + eligibilityNo
				+ ", admissionDate=" + admissionDate + ", admissionYear=" + admissionYear + ", isRoomAllotted="
				+ isRoomAllotted + ", hostelNo=" + hostelNo + ", roomNo=" + roomNo + ", rId=" + rId + "]";
	}
	
		/*public static void main(String[] args) {
		Student student = new Student();
		System.out.println(student.getAppliedDate()); 
	}*/
		
}

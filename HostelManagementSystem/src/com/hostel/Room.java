package com.hostel;

import java.util.ArrayList;

import com.Student.Student;

public class Room {
	private int rId;
	private int roomNo;
	private int capacity;
	private int filledStudents;
	private int remainingSpace;
	private String isRoomFulled; 
	private String allotedFor;
	private int hId;
	private String hostelName;
	private String deleteStatus;
	private ArrayList<Student> students = new ArrayList<Student>();
	public Room() {
		super();
		this.roomNo = 0;
		this.capacity = 0;
		this.filledStudents = 0;
		this.remainingSpace = 0;
		this.isRoomFulled = "";
		this.allotedFor = "";
		this.hostelName = "";
		this.hId=0;
	}
	public Room(int roomNo, int capacity, int filledStudents, int remainingSpace, String isRoomFulled,
			String allotedFor, int hId, String hostelName, String deleteStatus, ArrayList<Student> students) {
		super();
		this.roomNo = roomNo;
		this.capacity = capacity;
		this.filledStudents = filledStudents;
		this.remainingSpace = remainingSpace;
		this.isRoomFulled = isRoomFulled;
		this.allotedFor = allotedFor;
		this.hId = hId;
		this.hostelName = hostelName;
		this.deleteStatus = deleteStatus;
		this.students = students;
	}
	@Override
	public String toString() {
		return "Room [rId=" + rId + ", roomNo=" + roomNo + ", capacity=" + capacity + ", filledStudents="
				+ filledStudents + ", remainingSpace=" + remainingSpace + ", isRoomFulled=" + isRoomFulled
				+ ", allotedFor=" + allotedFor + ", hId=" + hId + ", hostelName=" + hostelName + ", deleteStatus="
				+ deleteStatus + ", students=" + students + "]";
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getFilledStudents() {
		return filledStudents;
	}
	public void setFilledStudents(int filledStudents) {
		this.filledStudents = filledStudents;
	}
	public int getRemainingSpace() {
		return remainingSpace;
	}
	public void setRemainingSpace(int remainingSpace) {
		this.remainingSpace = remainingSpace;
	}
	public String getIsRoomFulled() {
		return isRoomFulled;
	}
	public void setIsRoomFulled(String isRoomFulled) {
		this.isRoomFulled = isRoomFulled;
	}
	public String getAllotedFor() {
		return allotedFor;
	}
	public void setAllotedFor(String allotedFor) {
		this.allotedFor = allotedFor;
	}
	public int gethId() {
		return hId;
	}
	public void sethId(int hId) {
		this.hId = hId;
	}
	public String getHostelName() {
		return hostelName;
	}
	public void setHostelName(String hostelName) {
		this.hostelName = hostelName;
	}
	public String getDeleteStatus() {
		return deleteStatus;
	}
	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}
	public ArrayList<Student> getStudents() {
		return students;
	}
	public void setStudents(ArrayList<Student> students) {
		this.students = students;
	}	
}

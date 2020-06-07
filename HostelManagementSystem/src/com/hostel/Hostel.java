package com.hostel;

import java.util.ArrayList;

public class Hostel 
{
	private int hId;
	private String name;
	private String gender;
	private int rooms;
	private ArrayList<Room> roomList = new ArrayList<Room>();
	private int capacity;
	private int allotedRooms;
	private int unallotedRooms;
	private int filledStudents;
	private int remainingSpace;
	private String rector;
	private String deleteStatus;
	
	public Hostel() 
	{
		super();
		hId=-1;
		name="";
		gender="";
		rooms=0;
		capacity=0;
		allotedRooms=0;
		unallotedRooms=0;
		filledStudents=0;
		remainingSpace=0;
		rector="";
		deleteStatus="N";
	}

	public Hostel(String name, String gender, int rooms, ArrayList<Room> roomList, int capacity, int allotedRooms,
			int unallotedRooms, int filledStudents, int remainingSpace, String rector, String deleteStatus) {
		super();
		this.name = name;
		this.gender = gender;
		this.rooms = rooms;
		this.roomList = roomList;
		this.capacity = capacity;
		this.allotedRooms = allotedRooms;
		this.unallotedRooms = unallotedRooms;
		this.filledStudents = filledStudents;
		this.remainingSpace = remainingSpace;
		this.rector = rector;
		this.deleteStatus = deleteStatus;
	}

	@Override
	public String toString() {
		return "Hostel [hId=" + hId + ", name=" + name + ", gender=" + gender + ", rooms=" + rooms + ", roomList="
				+ roomList + ", capacity=" + capacity + ", allotedRooms=" + allotedRooms + ", unallotedRooms="
				+ unallotedRooms + ", filledStudents=" + filledStudents + ", remainingSpace=" + remainingSpace
				+ ", rector=" + rector + ", deleteStatus=" + deleteStatus + "]";
	}

	public int gethId() {
		return hId;
	}

	public void sethId(int hId) {
		this.hId = hId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getRooms() {
		return rooms;
	}

	public void setRooms(int rooms) {
		this.rooms = rooms;
	}

	public ArrayList<Room> getRoomList() {
		return roomList;
	}

	public void setRoomList(ArrayList<Room> roomList) {
		this.roomList = roomList;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getAllotedRooms() {
		return allotedRooms;
	}

	public void setAllotedRooms(int allotedRooms) {
		this.allotedRooms = allotedRooms;
	}

	public int getUnallotedRooms() {
		return unallotedRooms;
	}

	public void setUnallotedRooms(int unallotedRooms) {
		this.unallotedRooms = unallotedRooms;
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

	public String getRector() {
		return rector;
	}

	public void setRector(String rector) {
		this.rector = rector;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}
	
	
	
}

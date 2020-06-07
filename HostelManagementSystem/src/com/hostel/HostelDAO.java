package com.hostel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.Administration.DBConnection;
import com.Student.Student;

public class HostelDAO 
{
	/**
	 * This Method Retrives Hostel List from Hostels Table
	 * @param 
	 * @return ArrayList<Hostel>
	 */
	public static ArrayList<Hostel> getHostelList()
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Hostel> hostelList = new ArrayList<Hostel>();
		Hostel hostel= null;

		try
		{
			// Retrieving hostels ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="SELECT * FROM Hostels where deleteStatus='N'";
				stmt=conn.createStatement();
				System.out.println("Query : "+query);
				rs=stmt.executeQuery(query);
				while(rs.next())
				{
					hostel = new Hostel();
					hostel.sethId(rs.getInt("hId"));
					hostel.setName(rs.getString("name"));
					hostel.setGender(rs.getString("gender"));
					hostel.setRooms(rs.getInt("rooms"));
					hostel.setCapacity(rs.getInt("capacity"));
					hostel.setAllotedRooms(rs.getInt("allotedRooms"));
					hostel.setUnallotedRooms(rs.getInt("unallotedRooms"));
					hostel.setFilledStudents(rs.getInt("filledStudents"));
					hostel.setRemainingSpace(rs.getInt("remainingSpace"));
					hostel.setRector(rs.getString("rector"));
					
					//add hostel Object to ArrayList
					hostelList.add(hostel);
				}
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Getting/Retrieving hostels !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return hostelList;
	}
	
	/**
	 * This Method Add new Hostel into Hostels Table
	 * @param hostel
	 * @return successFlag
	 */
	public static int addHostel(Hostel hostel)
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		int successFlag = 0;
		try
		{
			// adding hostel ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="INSERT INTO Hostels (name,gender,rooms,capacity,allotedRooms,unallotedRooms,filledStudents,remainingSpace,rector) VALUES (?,?,?,?,?,?,?,?,?)";
				stmt=conn.prepareStatement(query);
				stmt.setString(1, hostel.getName());
				stmt.setString(2, hostel.getGender());
				stmt.setInt(3, hostel.getRooms());
				stmt.setInt(4, hostel.getCapacity());
				stmt.setInt(5, 0);
				stmt.setInt(6, hostel.getRooms());
				stmt.setInt(7, 0);
				stmt.setInt(8, hostel.getCapacity());
				stmt.setString(9, hostel.getRector());
				System.out.println("Query : "+query);
				successFlag=stmt.executeUpdate();
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Adding hostel !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return successFlag;
	}

	/**
	 * This Method Update Hostel from Hostels Table
	 * @param hostel
	 * @return successFlag
	 */
	public static int updateHostel(Hostel hostel)
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		int successFlag = 0;
		try
		{
			// updating hostel ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="UPDATE Hostels SET gender=?, rooms=?, capacity=?, allotedRooms=?, unallotedRooms=?, filledStudents=?, remainingSpace=?, rector=? WHERE hId=? and deleteStatus='N'";
				stmt=conn.prepareStatement(query);
				stmt.setString(1, hostel.getGender());
				stmt.setInt(2, hostel.getRooms());
				stmt.setInt(3, hostel.getCapacity());
				stmt.setInt(4, hostel.getAllotedRooms());
				stmt.setInt(5, hostel.getUnallotedRooms());
				stmt.setInt(6, hostel.getFilledStudents());
				stmt.setInt(7, hostel.getRemainingSpace());
				stmt.setString(8, hostel.getRector());
				stmt.setInt(9, hostel.gethId());
				System.out.println("Query : "+query);
				successFlag=stmt.executeUpdate();
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Updating hostel !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return successFlag;
	}
	
	/**
	 * This Method Delete Hostel from Hostels Table (Update : deleteStatus='Y')
	 * @param hId
	 * @return successFlag
	 */
	public static int deleteHostel(int hId)
	{
		Connection conn = null;
		Statement stmt = null;
		int successFlag = 0;
		try
		{
			// deleting hostel ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="UPDATE Hostels SET deleteStatus='Y' WHERE hId="+hId;
				stmt=conn.createStatement();
				System.out.println("Query : "+query);
				successFlag=stmt.executeUpdate(query);
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Deleting hostel !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return successFlag;
	}
	
	/**
	 * This Method Retrives Hostel Containing List Of Rooms from Rooms Table
	 * @param hId
	 * @return Hostel
	 */
	public static Hostel getHostel(int hId)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs1 = null;	//for Rooms Table
		ResultSet rs2 = null;	//for Hostels Table
		ArrayList<Room> roomList = new ArrayList<Room>();
		Hostel hostel= new Hostel();
		Room room = null;

		try
		{
			// Retrieving hostel ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query1="SELECT * FROM Rooms where hId="+hId+" and deleteStatus='N'";
				stmt = conn.createStatement();
				System.out.println("Query : "+query1);
				rs1=stmt.executeQuery(query1);
				while(rs1.next())
				{
					room = new Room();
					room.sethId(hId);
					room.setrId(rs1.getInt("rId"));
					room.setRoomNo(rs1.getInt("roomNo"));
					room.setAllotedFor(rs1.getString("allotedFor"));
					room.setCapacity(rs1.getInt("capacity"));
					room.setFilledStudents(rs1.getInt("filledStudents"));
					room.setRemainingSpace(rs1.getInt("remainingSpace"));
					room.setIsRoomFulled(rs1.getString("isRoomFulled"));
					
					//add room in ArrayList
					roomList.add(room);
				}
							
				String query2="SELECT * FROM Hostels where hId="+hId+" and deleteStatus='N'";
				System.out.println("Query : "+query2);
				rs2=stmt.executeQuery(query2);
				if(rs2.next())
				{
					hostel.sethId(rs2.getInt("hId"));
					hostel.setName(rs2.getString("name"));
					hostel.setGender(rs2.getString("gender"));
					hostel.setRooms(rs2.getInt("rooms"));
					hostel.setCapacity(rs2.getInt("capacity"));
					hostel.setAllotedRooms(rs2.getInt("allotedRooms"));
					hostel.setUnallotedRooms(rs2.getInt("unallotedRooms"));
					hostel.setFilledStudents(rs2.getInt("filledStudents"));
					hostel.setRemainingSpace(rs2.getInt("remainingSpace"));
					hostel.setRector(rs2.getString("rector"));
				}
				hostel.setRoomList(roomList);
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Getting hostel !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				if(rs1!=null){rs1.close();}
				if(rs2!=null){rs2.close();}
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return hostel;
	}
	
	/**
	 * This Method Retrives Room from Rooms Table
	 * @param rid
	 * @return Room
	 */
	public static Room getRoom(int rId)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs1 = null;	//for Students Table
		ResultSet rs2 = null;	//for Rooms Table
		ArrayList<Student> studentList = new ArrayList<Student>();
		Room room = new Room();
		Student student = null;

		try
		{
			// Retrieving room ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query1="SELECT * FROM Students where rId="+rId+" and deleteStatus='N'";
				stmt = conn.createStatement();
				System.out.println("Query : "+query1);
				rs1=stmt.executeQuery(query1);
				while(rs1.next())
				{
					student = new Student();
					student.setStudId(rs1.getInt(1));
					student.setAppliedDate(rs1.getString(2));
					student.setFirstName(rs1.getString(3));
					student.setMiddleName(rs1.getString(4));
					student.setLastName(rs1.getString(5));
					student.setDob(rs1.getString(6));
					student.setGender(rs1.getString(7));
					student.setUid(rs1.getString(8));
					student.setEmail(rs1.getString(9));
					student.setContact(rs1.getString(10));
					student.setParentContact(rs1.getString(11));
					student.setCurrentAddress(rs1.getString(14));
					student.setPermanentAddress(rs1.getString(15));
					student.setGuardianName(rs1.getString(16));
					student.setGuardianOccupation(rs1.getString(17));
					student.setGuardianAddress(rs1.getString(18));
					student.setGuardianEmail(rs1.getString(19));
					student.setGuardianContact(rs1.getString(20));
					student.setDeptName(rs1.getString(21));
					student.setQualification(rs1.getString(22));
					student.setCourseName(rs1.getString(23));
					student.setCourseDuration(rs1.getString(24));
					student.setCourseYear(rs1.getString(25));
					student.setEligibilityNo(rs1.getString(26));
					student.setAdmissionDate(rs1.getString(27));
					student.setAdmissionYear(rs1.getString(28));
					student.setIsRoomAllotted(rs1.getString(29));
					student.setHostelNo(rs1.getString(30));
					student.setRoomNo(rs1.getString(31));
					//add student in ArrayList
					studentList.add(student);
					
				}
				
				String query2="SELECT * FROM Rooms where rId="+rId;
				System.out.println("Query : "+query2);
				rs2=stmt.executeQuery(query2);
				if(rs2.next())
				{
					room.sethId(rs2.getInt("hId"));
					room.setrId(rs2.getInt("rId"));
					room.setRoomNo(rs2.getInt("roomNo"));
					room.setAllotedFor(rs2.getString("allotedFor"));
					room.setCapacity(rs2.getInt("capacity"));
					room.setFilledStudents(rs2.getInt("filledStudents"));
					room.setRemainingSpace(rs2.getInt("remainingSpace"));
					room.setIsRoomFulled(rs2.getString("isRoomFulled"));
					room.setStudents(studentList);
				}
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Getting room !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				if(rs1!=null){rs1.close();}
				if(rs2!=null){rs2.close();}
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return room;
	}
	
	/**
	 * This Method Add new Room into Rooms Table
	 * @param room
	 * @return successFlag
	 */
	public static int addRoom(Room room)
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		int successFlag = 0;
		try
		{
			// adding room ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="INSERT INTO Rooms (roomNo,allotedFor,capacity,filledStudents,remainingSpace,isRoomFulled,hId) VALUES (?,?,?,?,?,?,?)";
				stmt=conn.prepareStatement(query);
				stmt.setInt(1, room.getRoomNo());
				stmt.setString(2, room.getAllotedFor());
				stmt.setInt(3, room.getCapacity());
				stmt.setInt(4, room.getFilledStudents());
				stmt.setInt(5, room.getRemainingSpace());
				stmt.setString(6, room.getIsRoomFulled());
				stmt.setInt(7, room.gethId());
				System.out.println("Query : "+query);
				successFlag=stmt.executeUpdate();
				System.out.println("successFlag = "+successFlag);
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Adding room !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return successFlag;
	}
	
	/**
	 * This Method Update Room from Rooms Table
	 * @param room
	 * @return successFlag
	 */
	
	public static int updateRoom(Room room)
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		int successFlag = 0;
		try
		{
			// updating room ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="UPDATE Rooms SET allotedFor=?, capacity=?, filledStudents=?, remainingSpace=?, isRoomFulled=? WHERE hId=? AND rId=? AND deleteStatus='N'";
				stmt=conn.prepareStatement(query);
				stmt.setString(1, room.getAllotedFor());
				stmt.setInt(2, room.getCapacity());
				stmt.setInt(3, room.getFilledStudents());
				stmt.setInt(4, room.getRemainingSpace());
				stmt.setString(5, room.getIsRoomFulled());
				stmt.setInt(6, room.gethId());
				stmt.setInt(7, room.getrId());
				System.out.println("Query : "+query);
				successFlag=stmt.executeUpdate();
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Updating room !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return successFlag;
	}
	
	/**
	 * This Method Delete Room from Rooms Table (Update : deleteStatus='Y')
	 * @param hId,rId
	 * @return successFlag
	 */
	public static int deleteRoom(int hId,int rId)
	{
		Connection conn = null;
		Statement stmt = null;
		int successFlag = 0;
		try
		{
			// deleting room ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="UPDATE Rooms SET deleteStatus='Y' WHERE rId="+rId+" AND hId="+hId;
				stmt=conn.createStatement();
				System.out.println("Query : "+query);
				successFlag=stmt.executeUpdate(query);
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Deleting room !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return successFlag;
	}
	
	/**
	 * This Method add RoomId in Students Table
	 * @param hId,hostelName,rId,roomNo,studId
	 * @return successFlag
	 */
	public static int addStudentInRoom(String hostelName,int rId,int roomNo,int studId)
	{
		Connection conn = null;
		Statement stmt = null;
		int successFlag = 0;
		try
		{
			// Adding Student in room  ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="UPDATE Students SET isRoomAllotted='Y', hostelNo='"+hostelName+"',"+"roomNo='"+roomNo+"',"+"rId="+rId+" WHERE studId="+studId;
				stmt=conn.createStatement();
//				stmt.setString(1, hostelName);
//				stmt.setString(2, roomNo+"");
//				stmt.setInt(3, rId);
//				stmt.setInt(4,studId );
				System.out.println("Query : "+query);
				successFlag=stmt.executeUpdate(query);
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Adding Student in Room !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return successFlag;
	}
	
	/**
	 * This Method delete RoomId from Students Table
	 * @param studId
	 * @return successFlag
	 */
	public static int deleteStudentFromRoom(int studId)
	{
		Connection conn = null;
		Statement stmt = null;
		int successFlag = 0;
		try
		{
			// deleting student from Students ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="UPDATE Students SET isRoomAllotted='N', hostelNo='',roomNo='',"+"rId=-1 WHERE studId="+studId;
				stmt=conn.createStatement();
				System.out.println("Query : "+query);
				successFlag=stmt.executeUpdate(query);
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Deleting Student From Room !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return successFlag;
	}
	
}

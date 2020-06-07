package com.Administration;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.Student.Student;
import com.Student.StudentDAO;
import com.hostel.Hostel;
import com.hostel.HostelDAO;
import com.hostel.Room;
import com.notification.Notification;
import com.notification.NotificationDAO;

public class AdminDAO {
	
	/**
	*This Method inserts  admin into admin table
	*@param security
	*@return successFlag 
*/
	public static int addAdmin(Admin admin) {
			
			Connection conn = null;
			Statement stmt = null;
			int successFlag = 0;
			
			try {
				conn = (Connection)DBConnection.getConnection();
				
				if(conn != null)
				{
					stmt = conn.createStatement();
					String sql ="insert into admin (appliedDate,firstName,middleName,lastName,dob,gender,uid,email,contact,alternateContact,photo,sign,currentAddress,permanentAddress,employeeId,qualification,designation,experience) values ('"+admin.getAppliedDate()+"','"+admin.getFirstName()+"','"+admin.getMiddleName()+"','"+admin.getLastName()+"','"+admin.getDob()+"','"+admin.getGender()+"','"+admin.getUid()+"','"+admin.getEmail()+"','"+admin.getContact()+"','"+admin.getAlternateContact()+"','"+admin.getPhoto()+"','"+admin.getSign()+"','"+admin.getCurrentAddress()+"','"+admin.getPermanentAddress()+"','"+admin.getEmployeeId()+"','"+admin.getQualification()+"','"+admin.getDesignation()+"','"+admin.getExperience()+"')";
					System.out.println("Query : "+sql);
					successFlag = stmt.executeUpdate(sql);
					System.out.println("Admin added with successFlag = "+successFlag);
				}else {
					System.out.println("Database connection is NULL");
				}
			}
			catch(Exception e)
			{
				//Handle Exception
				System.out.println("An Exception Occured while Adding Admin");
				System.out.println(e.getMessage());		
			}
			finally 
			{
				try
				{
					if(stmt != null)
						stmt.close();
				}
				catch(Exception e)
				{
					System.out.println(e.getMessage());
				}
			}
			return successFlag;
		}
		/*public static void main(String args[]) {
			AdminDAO adminDao=new AdminDAO();
			Admin admin = new Admin();
			int a=adminDao.addadmin(admin);
			System.out.println("success"+a);
		}*/

	/**
	 * This Method Inserts Notification in Notifications Table
	 * @param notification
	 * @return successFlag
	 */
	public static int addNotification(Notification notification)
	{
		return NotificationDAO.addNotification(notification);
	}

	/**
	 * This Method Updates Notification in Notifications Table
	 * @param notification
	 * @return successFlag
	 */
	public static int updateNotification(Notification notification)
	{
		return NotificationDAO.updateNotification(notification);
	}

	/**
	 * This Method Gives List of all Non-deleted Notifications in currentDate between StartDate And EndDate
	 * @param 
	 * @return ArrayList
	 */
	public static ArrayList<Notification> getNotificationListToShow()
	{
		return NotificationDAO.getNotificationListToShow();
	}	

	/**
	 * This Method Gives List of all Non-deleted Notifications 
	 * @param 
	 * @return ArrayList
	 */
	public static ArrayList<Notification> getNotificationList()
	{
		return NotificationDAO.getNotificationList();
	}	

	/**
	 * This Method Gives Non-deleted Notification
	 * @param nid
	 * @return Notification
	 */
	public static Notification getNotification(int nid)
	{
		return NotificationDAO.getNotification(nid);
	}

	/**
	 * This Method Updates Notification DeleteStatus='Y' in Notifications Table
	 * @param nids[]
	 * @return successFlag
	 */
	public static int deleteNotifications(String nids[])
	{
		return NotificationDAO.deleteNotifications(nids);
	}

	//HostelDAO Operations
	
	/**
	 * This Method Retrives Hostel List from Hostels Table
	 * @param 
	 * @return ArrayList<Hostel>
	 */
	public static ArrayList<Hostel> getHostelList()
	{
		return HostelDAO.getHostelList();
	}
	
	/**
	 * This Method Add new Hostel into Hostels Table
	 * @param hostel
	 * @return successFlag
	 */
	public static int addHostel(Hostel hostel)
	{
		return HostelDAO.addHostel(hostel);
	}
	/**
	 * This Method Update Hostel from Hostels Table
	 * @param hostel
	 * @return successFlag
	 */
	
	public static int updateHostel(Hostel hostel)
	{
		return HostelDAO.updateHostel(hostel);
	}
	
	/**
	 * This Method Delete Hostel from Hostels Table (Update : deleteStatus='Y')
	 * @param hId
	 * @return successFlag
	 */
	public static int deleteHostel(int hId)
	{
		return HostelDAO.deleteHostel(hId);
	}
	
	//Room Operations
	/**
	 * This Method Retrives Hostel Containing List Of Rooms from Rooms Table
	 * @param hId
	 * @return Hostel
	 */
	public static Hostel getHostel(int hId)
	{
		return HostelDAO.getHostel(hId);
	}
	
	/**
	 * This Method Add new Room into Rooms Table
	 * @param room
	 * @return successFlag
	 */
	public static int addRoom(Room room)
	{
		return HostelDAO.addRoom(room);
	}
	
	/**
	 * This Method Update Room from Rooms Table
	 * @param room
	 * @return successFlag
	 */
	
	public static int updateRoom(Room room)
	{
		return HostelDAO.updateRoom(room);
	}
	
	/**
	 * This Method Delete Room from Rooms Table (Update : deleteStatus='Y')
	 * @param hId,rId
	 * @return successFlag
	 */
	public static int deleteRoom(int hId,int rId)
	{
		return HostelDAO.deleteRoom(hId,rId);
	}
	
	/**
	 * This Method Retrives Room from Rooms Table
	 * @param rid
	 * @return Room
	 */
	public static Room getRoom(int rId)
	{
		return HostelDAO.getRoom(rId);
	}
	
	/**
	 * This Method add RoomId in Students Table
	 * @param hId,hostelName,rId,roomNo,studId
	 * @return successFlag
	 */
	public static int addStudentInRoom(String hostelName,int rId,int roomNo,int studId)
	{
		return HostelDAO.addStudentInRoom(hostelName,rId,roomNo,studId);
	}
	/**
	 * This Method delete RoomId from Students Table
	 * @param studId
	 * @return successFlag
	 */
	public static int deleteStudentFromRoom(int studId)
	{
		return HostelDAO.deleteStudentFromRoom(studId);
	}
	
	/**
	 * This Method Retrives Students ArrayList from Students Table
	 * @param 
	 * @return ArrayList<Student>
	 */
	public static ArrayList<Student> getStudentList() 
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Student student= null;
		ArrayList<Student> studentList = new ArrayList<Student>();
		try
		{
			conn = (Connection)DBConnection.getConnection();
			if(conn != null)
			{
				stmt = conn.createStatement();
				String sql = "select * from Students where deleteStatus='N' or deleteStatus IS NULL ";
				System.out.println("Query : "+sql);
				rs =stmt.executeQuery(sql);
				while(rs.next())
				{
					student = new Student();
					student.setStudId(rs.getInt(1));
					student.setAppliedDate(rs.getString(2));
					student.setFirstName(rs.getString(3));
					student.setMiddleName(rs.getString(4));
					student.setLastName(rs.getString(5));
					student.setDob(rs.getString(6));
					student.setGender(rs.getString(7));
					student.setUid(rs.getString(8));
					student.setEmail(rs.getString(9));
					student.setContact(rs.getString(10));
					student.setParentContact(rs.getString(11));
					student.setCurrentAddress(rs.getString(14));
					student.setPermanentAddress(rs.getString(15));
					student.setGuardianName(rs.getString(16));
					student.setGuardianOccupation(rs.getString(17));
					student.setGuardianAddress(rs.getString(18));
					student.setGuardianEmail(rs.getString(19));
					student.setGuardianContact(rs.getString(20));
					student.setDeptName(rs.getString(21));
					student.setQualification(rs.getString(22));
					student.setCourseName(rs.getString(23));
					student.setCourseDuration(rs.getString(24));
					student.setCourseYear(rs.getString(25));
					student.setEligibilityNo(rs.getString(26));
					student.setAdmissionDate(rs.getString(27));
					student.setAdmissionYear(rs.getString(28));
					student.setIsRoomAllotted(rs.getString(29));
					student.setHostelNo(rs.getString(30));
					student.setRoomNo(rs.getString(31));
					
					//add student in ArrayList
					studentList.add(student);
				}
			}	
			else
				System.out.println("Database connection is NULL");
		}
		catch(Exception e)
		{
			//Handle Exception
			System.out.println("An Exception Occured while getting Students ArrayList");
			System.out.println(e);		
		}
		finally 
		{
			try
			{
				if(rs!=null){rs.close();}
				if(stmt != null) {stmt.close();}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		return studentList;
	}
	
	/**
	 * This Method Retrives Student from Students Table
	 * @param studId
	 * @return Student
	 */
	public static Student getStudent(int studId)
	{
		return StudentDAO.getStudent(studId);
	}
}

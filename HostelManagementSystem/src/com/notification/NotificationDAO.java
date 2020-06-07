package com.notification;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.Administration.DBConnection;

public class NotificationDAO 
{
	/**
	 * This Method Inserts Notification in Notifications Table
	 * @param notification
	 * @return successFlag
	 */
	public static int addNotification(Notification notification)
	{

		Connection conn = null;
		Statement stmt = null;
		//ResultSet rs = null;
		int successFlag = 0;

		try
		{
			// Inserting Notification ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				stmt = conn.createStatement();
				String query = "INSERT INTO Notifications (nDetails,startDate,endDate,linkStatus,linkPath) VALUES ('"+notification.getnDetails()+"','"+notification.getStartDate()+"','"+notification.getEndDate()+"','"+notification.getLinkStatus()+"','"+notification.getLinkPath()+"')";
				System.out.println("Query : "+query);
				successFlag = stmt.executeUpdate(query);
				System.out.println("Notification Is Added with successFlag = "+successFlag);
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Adding Notification !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				//if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return successFlag;
	}

	/**
	 * This Method Updates Notification in Notifications Table
	 * @param notification
	 * @return successFlag
	 */
	public static int updateNotification(Notification notification)
	{

		Connection conn = null;
		Statement stmt = null;
		//ResultSet rs = null;
		int successFlag = 0;

		try
		{
			// Updating Notification ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				stmt = conn.createStatement();
				String query = "UPDATE Notifications SET nDetails='"+notification.getnDetails()+"',startDate='"+notification.getStartDate()+"',endDate='"+notification.getEndDate()+"',linkStatus='"+notification.getLinkStatus()+"',linkPath='"+notification.getLinkPath()+"' where nid="+notification.getNid();
				System.out.println("Query : "+query);
				successFlag = stmt.executeUpdate(query);
				System.out.println("Notification Is Updated with successFlag = "+successFlag);
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Updating Notification !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				//if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return successFlag;
	}

	/**
	 * This Method Gives List of all Non-deleted Notifications in currentDate between StartDate And EndDate
	 * @param 
	 * @return ArrayList
	 */
	public static ArrayList<Notification> getNotificationListToShow()
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Notification> notificationList = new ArrayList<Notification>();
		Notification notification= null;

		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = simpleDate.format(date);

		try
		{
			// Retrieving Notification ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="SELECT * FROM Notifications where deleteStatus='N' and startDate <= '"+currentDate+"' and endDate >= '"+currentDate+"'";
				stmt=conn.createStatement();
				System.out.println();
				System.out.println("Query : "+query);
				rs=stmt.executeQuery(query);
				while(rs.next())
				{
					notification = new Notification();
					notification.setNid(rs.getInt("nid"));
					notification.setnDetails(rs.getString("nDetails"));
					notification.setStartDate(rs.getString("startDate"));
					notification.setEndDate(rs.getString("endDate"));
					notification.setLinkStatus(rs.getString("linkStatus"));		
					notification.setLinkPath(rs.getString("linkPath"));
					//add Notification Object to ArrayList
					notificationList.add(notification);
				}
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Getting/Retrieving Notifications !");
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
		return notificationList;
	}	

	/**
	 * This Method Gives List of all Non-deleted Notifications 
	 * @param 
	 * @return ArrayList
	 */
	public static ArrayList<Notification> getNotificationList()
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Notification> notificationList = new ArrayList<Notification>();
		Notification notification= null;

		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = simpleDate.format(date);

		try
		{
			// Retrieving Notifications ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="SELECT * FROM Notifications where deleteStatus='N' ";
				stmt=conn.createStatement();
				System.out.println();
				System.out.println("Query : "+query);
				rs=stmt.executeQuery(query);
				while(rs.next())
				{
					notification = new Notification();
					notification.setNid(rs.getInt("nid"));
					notification.setnDetails(rs.getString("nDetails"));
					notification.setStartDate(rs.getString("startDate"));
					notification.setEndDate(rs.getString("endDate"));
					notification.setLinkStatus(rs.getString("linkStatus"));		
					notification.setLinkPath(rs.getString("linkPath"));
					//add Notification Object to ArrayList
					notificationList.add(notification);
				}
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Getting/Retrieving Notifications !");
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
		return notificationList;
	}	

	/**
	 * This Method Gives Non-deleted Notification
	 * @param nid
	 * @return Notification
	 */
	public static Notification getNotification(int nid)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Notification notification= new Notification();

		try
		{
			// Retrieving Notification ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="SELECT * FROM Notifications where deleteStatus='N' and nid="+nid;
				stmt=conn.createStatement();
				System.out.println();
				System.out.println("Query : "+query);
				rs=stmt.executeQuery(query);
				while(rs.next())
				{
					notification.setNid(rs.getInt("nid"));
					notification.setnDetails(rs.getString("nDetails"));
					notification.setStartDate(rs.getString("startDate"));
					notification.setEndDate(rs.getString("endDate"));
					notification.setLinkStatus(rs.getString("linkStatus"));		
					notification.setLinkPath(rs.getString("linkPath"));
				}
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Getting/Retrieving Notification !");
			e.printStackTrace();
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
		return notification;
	}

	/**
	 * This Method Updates Notification DeleteStatus='Y' in Notifications Table
	 * @param nids[]
	 * @return successFlag
	 */
	public static int deleteNotifications(String nids[])
	{

		Connection conn = null;
		Statement stmt = null;
		//ResultSet rs = null;
		int successFlag = 0;
		String nidRange = "";
		try
		{
			//creating Nid's Range to String Format
			nidRange = nids[0];
			for(int i=1;i<nids.length;i++)
			{
				nidRange =nidRange +","+nids[i];
			}	
			System.out.println(nidRange);

		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception occured in creating Nid's Range to String Format");
			System.out.println(e.getMessage());
		}

		try
		{
			// Deleting Notification ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				stmt = conn.createStatement();
				String query = "UPDATE Notifications SET deleteStatus='Y' where nid IN ("+nidRange+")";
				System.out.println("Query : "+query);
				successFlag = stmt.executeUpdate(query);
				System.out.println("Notification Is Updated with successFlag = "+successFlag);
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Updating Notification !");
			System.out.println(e.getMessage());
		}
		finally 
		{
			//Close all the Resources
			try
			{
				//if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
			}
			catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return successFlag;
	}

}

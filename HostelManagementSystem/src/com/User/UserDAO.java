package com.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.Administration.DBConnection;


public class UserDAO 
{
	/**
	 * 
	 * @param UserId
	 * @return checkFlag
	 */
	public static int checkUser (String UserId) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int checkFlag = 0;
		
		try {
			conn = (Connection)DBConnection.getConnection();
			
			if(conn != null)
			{
				System.out.println("userId ="+UserId);
				stmt = conn.createStatement();
				String sql = "select * from users where userId='"+UserId+"' and ( deleteStatus='N' or deleteStatus is NULL )";
				System.out.println("Query : "+sql);
				rs=stmt.executeQuery(sql);
				if(rs.next()==true){
					System.out.println("user already exist \n user found with same user name");
					checkFlag=checkFlag+1;
			    }
			}else {
				System.out.println("Database connection is NULL");
			}
		}
		catch(Exception e)
		{
			//Handle Exception
			System.out.println("An Exception Occured while chceking  User");
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
		return checkFlag;
	}
	
	/**
	 * 
	 * @param user
	 * @return successFlag
	 */
	public static int addUser(User user) {
		Connection conn = null;
		Statement stmt = null;
		int successFlag = 0;
		
		try {
			conn = (Connection)DBConnection.getConnection();
			
			if(conn != null)
			{
				stmt = conn.createStatement();
				String sql ="insert into users (userId,password,role) values('"+user.getUserId()+"','"+user.getPassword()+"','"+user.getRole()+"')";
				System.out.println("Query : "+sql);
				successFlag = stmt.executeUpdate(sql);
				System.out.println("User added with successFlag = "+successFlag);
			}else {
				System.out.println("Database connection is NULL");
			}
		}
		catch(Exception e)
		{
			//Handle Exception
			System.out.println("An Exception Occured while Adding User");
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
	 
	public static int validateCredentials(User user) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int successFlag = 0;
		
		try {
			conn = (Connection)DBConnection.getConnection();
			
			if(conn != null)
			{
				System.out.println("userId ="+user.getUserId());
				stmt = conn.createStatement();
				String sql = "select * from users where userId='"+user.getUserId()+"'and password = '"+user.getPassword()+"'and role='"+user.getRole()+"' and ( deleteStatus='N' or deleteStatus is NULL )";
				System.out.println("Query : "+sql);
				rs=stmt.executeQuery(sql);
				if(rs.next()==true){
					System.out.println("valid credentials!!!");
					successFlag=successFlag+1;
			    }
			}else {
				System.out.println("Database connection is NULL");
			}
		}
		catch(Exception e)
		{
			//Handle Exception
			System.out.println("An Exception Occured while chceking  User");
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
	/**
	 * This Method Gives List of all Non-deleted Notifications in currentDate between StartDate And EndDate
	 * @param 
	 * @return ArrayList
	 */
	public static User validateEmailId(String role,String emailId)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		User user = new User();
		try
		{
			// Retrieving Notification ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				String query="SELECT * FROM users where deleteStatus='N' and role='"+role+"' and userId='"+emailId+"'";
				stmt=conn.createStatement();
				System.out.println();
				System.out.println("Query : "+query);
				rs=stmt.executeQuery(query);
				while(rs.next())
				{
					user.setUid(rs.getInt("uid"));
					user.setRole(rs.getString("role"));
					user.setUserId(rs.getString("userId"));
					user.setPassword(rs.getString("password"));
				}
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Getting/Retrieving User Credentials !");
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
		return user; 
	}	
	
	/**
	 * This Method Update Password in Users Table
	 * @param User
	 * @return successFlag
	 */
	public static int updatePassword(User user)
	{

		Connection conn = null;
		Statement stmt = null;
		//ResultSet rs = null;
		int successFlag = 0;

		try
		{
			// Updating User Password ....
			conn=DBConnection.getConnection();
			if(conn!=null)
			{
				stmt = conn.createStatement();
				String query = "UPDATE users SET password='"+user.getPassword()+"' where deleteStatus='N' and userId='"+user.getUserId()+"' and uid="+user.getUid()+" and role='"+user.getRole()+"'";
				System.out.println("Query : "+query);
				successFlag = stmt.executeUpdate(query);
				System.out.println("User's Password Is Updated with successFlag = "+successFlag);
			}
			else
				System.out.println("Database Connection is NULL !");
		}
		catch(Exception e)
		{
			//Handle exceptions
			System.out.println("An error occured while Updating User's Password !");
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

package com.Administration;
import java.sql.*;

public class DBConnection 
{
	public static Connection getConnection()
	{
		Connection conn=null;
		try
		{
			if(conn==null)
			{
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost:3306/HostelMS";
				String user="root";
				String password="admin00";
				
				conn= DriverManager.getConnection(url,user,password);
				System.out.println("conn: "+conn);
			}			
		}	
		catch (Exception e)
		{
			//  handle exception
			System.out.println("An Exception Occured, Connection is not Created !");
			e.printStackTrace();
		}
		
		return conn;
		
	}
	/*public static void main(String[] args)
	{
		System.out.println(getConnection());
	}*/
}

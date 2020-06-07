package com.Vehicle;

import com.Administration.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.text.*;


import com.Vehicle.VehicleVO;

public class VehicleDAO {
	
	/**
	 * This Method Inserts vehicleDetail in vehicleEntry Table
	 * @param vehicle
	 * @return successFlag
	 */
	
	public static int saveVehicleEntryDetails(VehicleVO requestvo) throws SQLException
	{
		Connection conn=DBConnection.getConnection();
		Statement stmt = null;
		int successFlag = 0;
		
		if(conn != null)
		{		
			stmt  =  (Statement) conn.createStatement();

			String rptQuery = "insert into VehicleEntry (vehicleType,vehicleNumber,driverName,driverMobileNumber,date,inTime,outTime) values ('"+requestvo.getVehicleType()+"','"+requestvo.getVehicleNumber()+"','"+requestvo.getDriverName()+"','"+requestvo.getDriverMobileNumber()+"','"+requestvo.getDate()+"','"+requestvo.getInTime()+"','"+requestvo.getOutTime()+"')";	
			System.out.println("query:" + rptQuery); 

			successFlag  = stmt.executeUpdate(rptQuery);
			System.out.println("successFlag: "+successFlag);

		} else {
			System.out.println("TicketDAO :: Database Connection is  NULL");
		}
		return successFlag;
	}
	
	
	/**
	 * This Method gives all unleaved Vehicle
	 * @return Arraylist
	 */
	
	public static ArrayList<VehicleVO> fetchUnleavedVehicleDetails() throws SQLException
	{
		Connection conn = (Connection) DBConnection.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		VehicleVO responsetvo=null;
		String rptQuery ="";

		ArrayList<VehicleVO> al = new ArrayList<VehicleVO>();
		if(conn != null)
		{
			stmt = (Statement) conn.createStatement();

				rptQuery = "select * from VehicleEntry where outTime='null'";
				System.out.println("query :" + rptQuery);  
			
			rs = stmt.executeQuery(rptQuery);

			while(rs.next())
			{
				responsetvo= new VehicleVO();

				responsetvo.setVehicleType(rs.getString("vehicleType"));
				responsetvo.setVehicleNumber(rs.getString("vehicleNumber"));
				responsetvo.setDriverName(rs.getString("driverName"));
				responsetvo.setDriverMobileNumber(rs.getString("driverMobileNumber"));
				responsetvo.setDate(rs.getString("date"));
				responsetvo.setInTime(rs.getString("inTime"));
				al.add(responsetvo);
			}
		} 
		else	
		{ 
			System.out.println("Database Connection is NULL");
		}

		System.out.println("DAO ArrayList size: "+al.size());
		return al;
	}
	
	/**
	 * This Method gives Vehicle details related to given Vehicle Number
	 * @param vehiclenumber, Start Date, End date
	 * @return Arraylist
	 */
	
	public static ArrayList<VehicleVO> fetchVehicleDetails(String vehicleNumber,String fromDate,String toDate) throws SQLException
	{
		Connection conn = (Connection) DBConnection.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		VehicleVO responsetvo=null;
		String rptQuery ="";

		ArrayList<VehicleVO> al = new ArrayList<VehicleVO>();
		if(conn != null)
		{
			stmt = (Statement) conn.createStatement();

			rptQuery = "select * from VehicleEntry where (date between '"+fromDate+"' and '"+toDate+"') and vehicleNumber ='"+vehicleNumber+"'";
			System.out.println("query :" + rptQuery); 
			
			rs = stmt.executeQuery(rptQuery);

			while(rs.next())
			{
				responsetvo= new VehicleVO();

				responsetvo.setVehicleType(rs.getString("vehicleType"));
				responsetvo.setVehicleNumber(rs.getString("vehicleNumber"));
				responsetvo.setDriverName(rs.getString("driverName"));
				responsetvo.setDriverMobileNumber(rs.getString("driverMobileNumber"));
				responsetvo.setDate(rs.getString("date"));
				responsetvo.setInTime(rs.getString("inTime"));
				responsetvo.setOutTime(rs.getString("outTime"));
				al.add(responsetvo);
			}
		} 
		else	
		{ 
			System.out.println("Database Connection is NULL");
		}

		System.out.println("DAO ArrayList size: "+al.size());
		return al;
	}
	/**
	 * This Method Inserts vehicleDetail in vehicleEntry Table
	 * @param vehiclenumber
	 * @return successFlag
	 */
	
	public static int updateOutTimeOfVehicle(String vehicleNumber) throws SQLException
	{
				Date date = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
				
				String currentDate = simpleDate.format(date);

				System.out.println(simpleDate.format(date));	

				String currentTime="";
				char a[]=currentDate.toCharArray();

				for (int i=0;i<11;i++)
				{
					currentTime=currentTime+a[i+11];	
				}
				
		
		Connection conn=DBConnection.getConnection();
		Statement stmt = null;
		int successFlag = 0;
		
		if(conn != null)
		{		
			stmt  =  (Statement) conn.createStatement();

			String rptQuery = "update VehicleEntry set outTime ='"+currentTime+"' where vehicleNumber = '"+vehicleNumber+"'";
			System.out.println("query:" + rptQuery);
			
			successFlag  = stmt.executeUpdate(rptQuery);
			System.out.println("successFlag: "+successFlag);
			
		} else {
			System.out.println("TicketDAO :: Database Connection is  NULL");
		}
		return successFlag;
	}
	
	/**
	 * This Method Inserts vehicleDetail in vehicleEntry Table
	 * @param vehiclenumber
	 * @return successFlag
	 */
	
	public static ArrayList<VehicleVO> fetchDriverName() throws SQLException
	{

		Connection conn = (Connection) DBConnection.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String rptQuery ="";
		VehicleVO responsetvo=null;

		ArrayList<VehicleVO> al = new ArrayList<VehicleVO>();
		if(conn != null)
		{
			stmt = (Statement) conn.createStatement();
				
			rptQuery = "select distinct(driverName) from VehicleEntry";
			System.out.println("query :" + rptQuery);  
			
			rs = stmt.executeQuery(rptQuery);

			while(rs.next())
			{
				responsetvo= new VehicleVO();
				responsetvo.setDriverName(rs.getString("driverName"));
				al.add(responsetvo);
			}
		} 
		else	
		{ 
			System.out.println("Database Connection is NULL");
		}

		System.out.println("DAO ArrayList size: "+al.size());
		return al;
	}
	
	/**
	 * This Method Inserts vehicleDetail in vehicleEntry Table
	 * @param vehiclenumber
	 * @return successFlag
	 */
	
	public static ArrayList<VehicleVO> fetchVehicleNumber() throws SQLException
	{
		Statement stmt = null;
		ResultSet rs = null;
		String rptQuery ="";
		VehicleVO responsetvo=null;

		ArrayList<VehicleVO> al = new ArrayList<VehicleVO>();
		try {
		Connection conn = (Connection) DBConnection.getConnection();
		
		
			if(conn != null)
			{
				
				stmt = (Statement) conn.createStatement();
					
				rptQuery = "select distinct(vehicleNumber) from VehicleEntry";
				System.out.println("query :" + rptQuery);  
				
				rs = stmt.executeQuery(rptQuery);
	
				while(rs.next())
				{
					responsetvo= new VehicleVO();
					responsetvo.setVehicleNumber(rs.getString("vehicleNumber"));
					al.add(responsetvo);
				}
			} 
			else	
			{ 
				System.out.println("Database Connection is NULL");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		

		System.out.println("DAO ArrayList size: "+al.size());
		return al;
	}
	
	/**
	 * This Method 
	 * @param vehicleNumber
	 * @return VehicleType
	 */
	public static String fetchVehicleType1(String vehicleNumber) throws SQLException
	{

		Connection conn = (Connection) DBConnection.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String rptQuery="";
		String vehicleType="";
		if(conn != null)
		{
			stmt = (Statement) conn.createStatement();
			
			if(vehicleNumber!=null && vehicleNumber.length() > 0)
			{
				rptQuery = "select vehicleType from VehicleEntry where vehicleNumber='"+vehicleNumber+"'";
				System.out.println("query :" + rptQuery);  
				rs = stmt.executeQuery(rptQuery);

				boolean isNext = rs.next();
				if(isNext)
					vehicleType=rs.getString("vehicleType");
				else
					return "";
				System.out.println(vehicleType);
			}
			else
				System.out.println("NULL/Other Object of Driver Name");
		} 
		else	
		{ 
			System.out.println("Database Connection is NULL");
		}
		
		return vehicleType;
	}
	
	/**
	 * This Method 
	 * @param vehicleNumber
	 * @return VehicleType
	 */
	public static String fetchDriverName1(String vehicleNumber) throws SQLException
	{

		Connection conn = (Connection) DBConnection.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String rptQuery="";
		String driverName="";
		if(conn != null)
		{
			stmt = (Statement) conn.createStatement();
			
			if(vehicleNumber!=null && vehicleNumber.length() > 0)
			{
				rptQuery = "select driverName from VehicleEntry where vehicleNumber='"+vehicleNumber+"'";
				System.out.println("query :" + rptQuery);  
				rs = stmt.executeQuery(rptQuery);

				boolean isNext = rs.next();
				if(isNext)
					driverName=rs.getString("driverName");
				else
					return "";
				System.out.println(driverName);
			}
			else
				System.out.println("NULL/Other Object of Driver Name");
		} 
		else	
		{ 
			System.out.println("Database Connection is NULL");
		}
		
		return driverName;
	}
	
	
	/**
	 * This Method 
	 * @param driverName
	 * @return driverMobileNumber
	 */
	
	public static String fetchDriverMobileNumber1(String driverName) throws SQLException
	{

		Connection conn = (Connection) DBConnection.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String rptQuery="";
		String driverMobileNumber="";
		if(conn != null)
		{
			stmt = (Statement) conn.createStatement();

			if(driverName!=null && driverName.length() > 0)
			{
				rptQuery = "select driverMobileNumber from VehicleEntry where driverName='"+driverName+"'";
				System.out.println("query :" + rptQuery);  
				rs = stmt.executeQuery(rptQuery);

				boolean isNext = rs.next();
				if(isNext)
					driverMobileNumber=rs.getString("driverMobileNumber");
				else
					return "";
				System.out.println(driverMobileNumber);
			}
			else
				System.out.println("NULL/Other Object of Driver Name");
		} 
		else	
		{ 
			System.out.println("Database Connection is NULL");
		}


		return driverMobileNumber;
	}
}

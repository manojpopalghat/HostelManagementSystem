package com.Security;

import com.Administration.DBConnection;
import java.sql.Connection;
import java.sql.Statement;

/**
	*This Method inserts  security into security table
	*@param security
	*@return successFlag 
*/

public class SecurityDAO{
	public static int addsecurity(Security security) {
		
		Connection conn = null;
		Statement stmt = null;
		int successFlag = 0;
		
		try {
			conn = (Connection)DBConnection.getConnection();
			
			if(conn != null)
			{
				stmt = conn.createStatement();
				String sql ="insert into security (appliedDate,firstName,middleName,lastName,dob,gender,uid,email,contact,alternateContact,photo,sign,currentAddress,permanentAddress,employeeId,qualification,designation,experience) values ('"+security.getAppliedDate()+"','"+security.getFirstName()+"','"+security.getMiddleName()+"','"+security.getLastName()+"','"+security.getDob()+"','"+security.getGender()+"','"+security.getUid()+"','"+security.getEmail()+"','"+security.getContact()+"','"+security.getAlternateContact()+"','"+security.getPhoto()+"','"+security.getSign()+"','"+security.getCurrentAddress()+"','"+security.getPermanentAddress()+"','"+security.getEmployeeId()+"','"+security.getQualification()+"','"+security.getDesignation()+"','"+security.getExperience()+"')";
				System.out.println("Query : "+sql);
				successFlag = stmt.executeUpdate(sql);
				System.out.println("Security added with successFlag = "+successFlag);
			}else {
				System.out.println("Database connection is NULL");
			}
		}
		catch(Exception e)
		{
			//Handle Exception
			System.out.println("An Exception Occured while Adding Security");
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
		SecurityDAO securityDao=new SecurityDAO();
		Security security = new Security();
		int a=securityDao.addsecurity(security);
		System.out.println("success"+a);
	}*/
}
package com.Rector;

import com.Administration.DBConnection;
import java.sql.Connection;
import java.sql.Statement;

/**
	*This Method inserts  rector into rector table
	*@param rector
	*@return successFlag 
*/

public class RectorDAO{
	public static int addRector(Rector rector) {
		
		Connection conn = null;
		Statement stmt = null;
		int successFlag = 0;
		
		try {
				conn = (Connection)DBConnection.getConnection();
				
				if(conn != null)
				{
					stmt = conn.createStatement();
					String sql ="insert into rector (appliedDate,firstName,middleName,lastName,dob,gender,uid,email,contact,alternateContact,photo,sign,currentAddress,permanentAddress,department,designation,employeeId,hostelAllocated,hostelNo) values ('"+rector.getAppliedDate()+"','"+rector.getFirstName()+"','"+rector.getMiddleName()+"','"+rector.getLastName()+"','"+rector.getDob()+"','"+rector.getGender()+"','"+rector.getUid()+"','"+rector.getEmail()+"','"+rector.getContact()+"','"+rector.getAlternateContact()+"','"+rector.getPhoto()+"','"+rector.getSign()+"','"+rector.getCurrentAddress()+"','"+rector.getPermanentAddress()+"','"+rector.getDepartment()+"','"+rector.getDesignation()+"','"+rector.getEmployeeId()+"','"+rector.getHostelAllocated()+"','"+rector.getHostelNo()+"')";
					System.out.println("Query : "+sql);
					String query="UPDATE Hostels SET rector='"+rector.getFirstName()+" "+rector.getMiddleName()+""+rector.getLastName()+"' WHERE name='"+rector.getHostelNo()+"' and deleteStatus='N'";
					successFlag = stmt.executeUpdate(sql);
					stmt.executeUpdate(query);
					System.out.println("Rector added with successFlag = "+successFlag);
				}else {
					System.out.println("Database connection is NULL");
				}
			}
			catch(Exception e)
			{
				//Handle Exception
				System.out.println("An Exception Occured while Adding Rector");
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
		RectorDAO rectorDao=new RectorDAO();
		Rector rector = new Rector();
		int a=rectorDao.addRector(rector);
		System.out.println("success"+a);
	}*/
	
}
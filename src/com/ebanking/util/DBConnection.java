package com.ebanking.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	public static Connection createConnection()
	{
		Connection con = null;
		try
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");// differs from DB server to server
			}
			catch (ClassNotFoundException e)
			{
				e.printStackTrace(); 
			}

			con = DriverManager.getConnection(Props.URL, Props.USER, Props.PASS);

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		return con;
	}
	
}


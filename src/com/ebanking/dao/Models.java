package com.ebanking.dao;
import com.ebanking.bean.Request;
import com.ebanking.bean.Transaction;
import com.ebanking.bean.User;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.ebanking.util.*;


public class Models {

	public String n = null;
	public String p = null;
	public String AcName = null;
	public String DoB = null;
	public String Address = null;
	public String City = null;
	public String State = null;
	public String Country = null;
	public String Contact_no = null;
	public String Email = null;
	public int PAN_no = 0;
	public int Balance = 0;
	public String Type = null;
	public int AcNo = 0;


	//               AUTHENTICATION                     //

	public boolean Authentication(String name, String pass) throws SQLException
	{
		String n = name;
		String p = encryptPass(pass);
		String sql = "Select * from eaccounts where Uid=? and Password=?";
		Boolean status = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = DBConnection.createConnection();

		if(con != null)
		{
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, n);
				ps.setString(2, p);
				rs = ps.executeQuery();
				status = rs.next();
				AcNo = rs.getInt("AcNo");

				con.close();
			} catch (SQLException e) 
			{
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}


		}
		con.close();
		System.out.println("Authentication :"+status);
		return status;
	}

	//                       ACCOUNT INFO        (LOGIN PAGE)               //

	public boolean Account_info(HttpSession session) throws SQLException
	{
		boolean status = false;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "SELECT accountInfo.* FROM accountInfo WHERE accountInfo.AcNo='"+session.getAttribute("acc")+"'";
		con = DBConnection.createConnection();
		if(con != null)
		{
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				if(rs.next()){
					status = true;
					User u = new User();
					u.setAc_name(rs.getString("AcName"));
					u.setAc_no(rs.getString("AcNo"));
					u.setDoB(rs.getString("DoB"));
					u.setAddress(rs.getString("Address"));
					u.setCity(rs.getString("City")); 
					u.setState(rs.getString("State"));
					u.setCountry(rs.getString("Country"));
					u.setContact(rs.getString("ContactNo"));
					u.setEmail(rs.getString("Email"));
					u.setPAN_no(rs.getString("PANno"));
					u.setBalance(rs.getString("Balance"));
					u.setType(rs.getString("Ac_Type"));
					session.setAttribute("user", u);

					//					System.out.println(u.getAc_no());
					//					System.out.println(u.getAc_name());
					//					System.out.println(u.getDoB());
					//					System.out.println(u.getAc_no());
					//					System.out.println(u.getAddress());
					//					System.out.println(u.getCity());
					//					System.out.println(u.getState());
					//					System.out.println(u.getCountry());
					//					System.out.println(u.getContact());
					//					System.out.println(u.getEmail());
					//					System.out.println(u.getPAN_no());
					//					System.out.println(u.getBalance());
					//					System.out.println(u.getType());
				}
				else{
					status=false;
				}
			} catch (SQLException e) 
			{
				e.printStackTrace();
			}			
		}
		con.close();
		System.out.println("Account Info :" +status);
		return status;
	}

	//                   ACCOUNT INFO (HOME PAGE)

	@SuppressWarnings("rawtypes")
	public ArrayList Account_Userinfo(String acc) throws SQLException
	{
		boolean status = false;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<User> AccInfo = new ArrayList<User>();	
		String sql = "SELECT accountInfo.* FROM accountInfo WHERE accountInfo.AcNo='"+acc+"'";
		con = DBConnection.createConnection();
		if(con != null)
		{
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				if(rs.next()){
					status = true;
					User u = new User();
					u.setAc_name(rs.getString("AcName"));
					u.setAc_no(rs.getString("AcNo"));
					u.setDoB(rs.getString("DoB"));
					u.setAddress(rs.getString("Address"));
					u.setCity(rs.getString("City"));
					u.setState(rs.getString("State"));
					u.setCountry(rs.getString("Country"));
					u.setContact(rs.getString("ContactNo"));
					u.setEmail(rs.getString("Email"));
					u.setPAN_no(rs.getString("PANno"));
					u.setBalance(rs.getString("Balance"));
					u.setType(rs.getString("Ac_Type"));
					AccInfo.add(u);
				}
				else{
					status=false;
				}
			} catch (SQLException e) 
			{
				e.printStackTrace();
			}			
		}
		con.close();
		System.out.println("Account Info :" +status);
		return AccInfo;
	}


	//    SHOW TRANSACTION INFO
	public ArrayList<Transaction> TransactionInfo(String Accno)
	{

		ArrayList<Transaction> TransactionResult = new ArrayList<Transaction>();	
		boolean status = false;
		int row = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs; 
		String sql = null;
		try{
			sql = "SELECT Tid,"
					+ "Tby,"
					+ "Tto,"
					+ "Amount,"
					+ "ByBal,"
					+ "Tdate,"
					+ "Ttime"
					+ " FROM ebank.transaction"
					+ " where ebank.transaction.Tby = '"+Accno+"'";
			con = DBConnection.createConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				status = true;
				Transaction t = new Transaction();
				t.setTid(rs.getString("Tid"));
				t.setTby(rs.getString("Tby"));
				t.setTto(rs.getString("Tto"));
				t.setAmount(rs.getString("Amount"));
				t.setByBal(rs.getString("ByBal"));
				t.setTdate(rs.getString("Tdate"));
				t.setTtime(rs.getString("Ttime"));
				TransactionResult.add(t);
			}
			con.close();

			row = TransactionResult.size();

			
		}

		catch(SQLException e){
			e.printStackTrace();
		}

		System.out.println("Show Transaction :"+status+" No. of Row: "+row);
		return TransactionResult;
	}
	
	
//  SHOW REQUEST INFO
	public ArrayList<Request> RequestInfo(String Accno)
	{

		ArrayList<Request> RequestResult = new ArrayList<Request>();	
		boolean status = false;
		int row = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs; 
		String sql = null;
		try{
			sql = "SELECT Rid,"
					+ "Rtype,"
					+ "Rdate,"
					+ "Rtime,"
					+ "Rstatus"
					+ " FROM ebank.request"
					+ " where ebank.request.Rby = '"+Accno+"'";
			con = DBConnection.createConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				status = true;
				Request t = new Request();
				t.setRid(rs.getString("Rid"));
				t.setRtype(rs.getString("Rtype"));
				t.setRdate(rs.getString("Rdate"));
				t.setRtime(rs.getString("Rtime"));
				t.setRstatus(rs.getString("Rstatus"));
				RequestResult.add(t);
			}
			con.close();

			row = RequestResult.size();

			
		}

		catch(SQLException e){
			e.printStackTrace();
		}

		System.out.println("Show RequestResult:"+status+" No. of Row: "+row);
		return RequestResult;
	}

	//                    INSERT TRANSACTION              //

	public boolean InsertTransaction(String Tby, String Tto, double tAmount, double toBal, double byBal, String Tdate, String Ttime)
	{ 
		boolean status = false;
		int n = 0;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;
		try{
			sql = "INSERT INTO ebank.transaction"
					+ " (Tby,"
					+ " Tto,"
					+ " Amount,"
					+ " ToBal,"
					+ " ByBal,"
					+ " Tdate,"
					+ " Ttime)"
					+ " VALUES (?,?,?,?,?,?,?)";
			con = DBConnection.createConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, Tby);
			ps.setString(2, Tto);
			ps.setDouble(3, tAmount);
			ps.setDouble(4, toBal);
			ps.setDouble(5, byBal);
			ps.setString(6, Tdate);
			ps.setString(7, Ttime);
			n = ps.executeUpdate();
			if(n!=0){
				status= true;

			}else{
				status = false;
			}
			con.close();

		}catch(SQLException e){
			e.printStackTrace();
		}
		return status;
	}

	//  INSERT REQUEST             //
	public boolean InsertRequest(String Rby, String RType, String Rdate, String Rtime, String Rstatus)
	{
		boolean status = false;
		int n = 0;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;
        try{
        	sql = "INSERT INTO ebank.request"
				+ " (Rby,"
				+ " RType,"
				+ " Rdate,"
				+ " Rtime,"
				+ " Rstatus)"
				+ " VALUES (?,?,?,?,?)";
		con = DBConnection.createConnection();
		ps = con.prepareStatement(sql);
		ps.setString(1, Rby);
		ps.setString(2, RType);
		ps.setString(3, Rdate);
		ps.setString(4, Rtime);
		ps.setString(5, Rstatus);
		n = ps.executeUpdate();
		if(n!=0){
			status= true;

		}else{
			status = false;
		}
		con.close();

	}catch(SQLException e){
		e.printStackTrace();
	}
        System.out.println("Insert Request :" + status);
		return status;
	}







	//  REGISTRATION                 //

	public boolean registration(String accno, String DoB, String pan,String pwd, String uid, String tpwd, String ip) throws SQLException{
		Boolean registervalidation = null;
		Boolean status = false;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT accountInfo.* FROM accountInfo WHERE accountInfo.AcNo="+accno;
		con = DBConnection.createConnection();		
		if(con != null)
		{
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				registervalidation = rs.next();
				if(registervalidation != null){
					sql = "Insert into eaccounts(AcNo, Uid, Password, TPassword, IP)values(?,?,?,?,?)";	
					try {
						ps = con.prepareStatement(sql);
						ps.setString(1, accno);
						ps.setString(2, uid);
						ps.setString(3, pwd);
						ps.setString(4, tpwd);
						ps.setString(5, ip);
						if(1==ps.executeUpdate()){									
							status = true;
						}
					}catch(SQLException e){
						e.printStackTrace();
					}
				}
			}catch (SQLException e) 
			{
				e.printStackTrace();
			}		
		}

		con.close();
		System.out.println("Registration :"+status);
		return status;
	}






	//                             UPDATE INTERNET PROTOCOL           //

	public boolean updateIp(String ac_no, String ip){

		boolean status = false;
		Connection con = null;
		PreparedStatement ps = null;
		//		ResultSet rs = null;
		int n;
		//		String ac_no = user.getAc_no();
		//		System.out.println(ac_no);
		//		System.out.println(ip);
		String sql = "UPDATE ebank.eaccounts SET IP='"+ip+"'WHERE AcNo='"+ac_no+"'";
		con = DBConnection.createConnection();		
		if(con != null)
		{
			try{
				ps = con.prepareStatement(sql);
				n = ps.executeUpdate();
				//				System.out.println(n);
				if(n >= 0){
					status = true;
					con.close();
				}

			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		System.out.println("IP Updated :"+status);
		return status;
	}

	//                         UPDATE USER                    //

	public boolean updateUser(String[] User, String Acno){
		boolean updated = false;
		int n;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "UPDATE ebank.accountInfo SET AcName='"+User[0]+"',"
				+ "DoB='"+User[1]+"',"
				+ "Address='"+User[2]+"',"
				+ "City='"+User[3]+"',"
				+ "State='"+User[4]+"',"
				+ "Country='"+User[5]+"',"
				+ "ContactNo='"+User[6]+"',"
				+ "Email='"+User[7]+"'"
				+ "where AcNo = '"+Acno+"'";

		//		System.out.println(User[0]);
		con = DBConnection.createConnection();
		if(con != null){
			try{
				ps = con.prepareStatement(sql);
				n = ps.executeUpdate(sql);
				if(n!=0){
					updated = true;
				}
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}

		System.out.println("Profile Edited: "+updated);
		return updated; 
	}


	//              PASSWORD RESET         

	public boolean passReset(String[] reset)
	{    
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		int n = 0;

		boolean status = false;
		String acno = reset[0];
		String uname = reset[1];
		String Panno = reset[2];
		String pass = reset[3];
		String enpass = encryptPass(pass);
		// CHECKING VALUES
		System.out.println("Acno:"+acno);
		System.out.println("Uname:"+uname);
		System.out.println("PANno:"+Panno);
		System.out.println("Pass:"+enpass);

		con = DBConnection.createConnection();

		sql= "UPDATE ebank.eaccounts INNER JOIN ebank.accountInfo ON"
				+ "  ebank.accountInfo.AcNo and ebank.eaccounts.AcNo = '"+acno+"' "
				+ "and ebank.accountInfo.PANno = '"+Panno+"' "
				+ "SET ebank.eaccounts.Password = '"+enpass+"'";
		try
		{
			ps = con.prepareStatement(sql);
			n = ps.executeUpdate(sql);
			if(n!=0){
				status = true;
			}else{
				status =false;
			}
			con.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		System.out.println("Password Reset: "+status);
		return status;
	}


	// ENCRYPTION USING SHA-256 FOR PASSWORDS.

	public String encryptPass(String password)
	{

		StringBuffer sb = null;
		String enpass = "";
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());

			byte byteData[] = md.digest();

			//convert the byte to hex format method 1
			sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
				enpass = sb.toString();
			}
		} 
		catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		System.out.println("Encrypted Password: " + enpass );
		return enpass;
	}


	//         TRANSACTION PASSWORD VALIDATION	

	public boolean TpassValidation(String Acno, String Tpass)
	{
		boolean status = false;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs;

		String sql = null;
		try{
			con = DBConnection.createConnection();
			sql = "SELECT * FROM ebank.eaccounts where AcNo = '"+Acno+"' and TPassword = '"+Tpass+"'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				status = true;
			}
			con.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}

		System.out.println("Transaction Password Validation:" + status);
		return status;
	}


	// ACCOUNT VALIDATION FOR TRANSACTION	
	public boolean AccValid(String Acno)
	{
		boolean status = false;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs;
		String sql = null;
		try{
			sql = "SELECT * FROM ebank.eaccounts"
					+ "  inner join ebank.accountInfo"
					+ " on ebank.accountInfo.AcNo = '"+Acno+"' "
					+ "and"
					+ " ebank.eaccounts.AcNo = '"+Acno+"'";
			con = DBConnection.createConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			if(rs.next()){
				status = true;
			}
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

		System.out.println("Account Validated For Transaction: "+status);    
		return status;
	}

	// SUFFICIENT AMOUNT FOR TRANSACTION CHECK	

	public boolean SufficeintBal(String Acno, double Amount)
	{   
		boolean status = false;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;
		ResultSet rs;
		try{
			sql = "SELECT * FROM ebank.accountInfo where ebank.accountInfo.AcNo = '"+Acno+"' and ebank.accountInfo.Balance >= '"+Amount+"'";
			con = DBConnection.createConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			if(rs.next()){
				status = true;
			}
			con.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}

		System.out.println("Sufficient Balance Check: "+status);
		return status;
	}

	//                  UPDATE BALANCE 

	public boolean UpdateBal(String Acno, double Bal)
	{   
		boolean status = false;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;
		int n;
		try{
			sql = "Update ebank.accountInfo"
					+ " SET ebank.accountInfo.Balance = '"+Bal+"'"
					+ " Where "
					+ "ebank.accountInfo.AcNo = '"+Acno+"'";
			con = DBConnection.createConnection();
			ps = con.prepareStatement(sql);
			n = ps.executeUpdate();
			if(n!=0){
				status = true;
			}
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		System.out.println("Balance Updation: "+status);
		return status;
	}

	//            GET BALANCE BY ACCOUNT NO
	public double GetBal(String Acno)
	{

		double bal = 0.0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs; 
		String sql = null;
		try{
			sql = "select ebank.accountInfo.Balance"
					+ " from ebank.accountInfo"
					+ " Where ebank.accountInfo.AcNo = '"+Acno+"'";
			con = DBConnection.createConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			bal = rs.getDouble("Balance");
			con.close();

		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		System.out.println("Account :"+Acno +" & "+" Balance : "+bal);
		return bal;
	}



}


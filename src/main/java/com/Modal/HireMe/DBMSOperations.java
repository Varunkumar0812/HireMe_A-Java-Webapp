package com.Modal.HireMe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBMSOperations {
    public static ArrayList<String> checkRecord(String email_id, String password) {
    	ArrayList<String> tuple = new ArrayList<String>();
    	tuple.add(null);
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("SELECT first_name, last_name, user_type FROM Users WHERE email_id=? AND password=?");
    		stmt.setString(1, email_id);
    		stmt.setString(2, Encryption.encrypt(password));
    		
    		ResultSet rs = stmt.executeQuery();
    		
    		while(rs.next()) {
    			tuple.remove(0);
    			tuple.add(rs.getString(1));
    			tuple.add(rs.getString(2));
    			tuple.add(rs.getString(3));
    		}
    		
    		rs.close();
    		stmt.close();
    		con.close();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return tuple;
    }
    
    public static int insertEmailDetails(String emailID, String password) {
    	int c = 0;
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/DemoProject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("INSERT INTO Users (email_id, password) VALUES (?, ?)");
    		stmt.setString(1, emailID);
    		stmt.setString(2, Encryption.encrypt(password));
    		
    		c = stmt.executeUpdate();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	return c;
    }
    
    public static int updatePersonalDetails(ArrayList<String> tuple) {
    	int c = 0;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("UPDATE Users SET first_name=?, last_name=?, door_no=?, street_name=?, city=?, state=?, pincode=? WHERE email_id=?");
    		
    		stmt.setString(1, tuple.get(0));
    		stmt.setString(2, tuple.get(1));
    		stmt.setString(3, tuple.get(2));
    		stmt.setString(4, tuple.get(3));
    		stmt.setString(5, tuple.get(4));
    		stmt.setString(6, tuple.get(5));
    		stmt.setString(7, tuple.get(6));
    		stmt.setString(8, tuple.get(7));
    		
    		c = stmt.executeUpdate();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	return c;
    }
    
    public static int updateUserType(String emailID, String user_type) {
    	int c = 0;
    	
    	try 
    	{
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("UPDATE Users SET user_type=? WHERE email_id=?");
    		
    		stmt.setString(1, user_type);
    		stmt.setString(2, emailID);
    		
    		c = stmt.executeUpdate();  		
    	}
    	catch(Exception e) 
    	{
    		System.out.println(e);
    	}
    	
    	return c;
    }

    public static int insertSkills(String skill, String emailID) {
    	int c = 0;
    	
    	try 
    	{
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("INSERT INTO JS_Skills VALUES (?, ?)");
    		
    		stmt.setString(1, emailID);
    		stmt.setString(2, skill);
    		
    		c = stmt.executeUpdate();
    	}
    	catch(Exception e) 
    	{
    		System.out.println(e);
    	}
    	
    	return c;
    }
    
    public static int insertRecordCompanyDetails(String emailID, String comp_name, String serv_type, String door_no, String street_name, String city, String state, String pincode) {
    	int c = 0;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("INSERT INTO Company VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    		
    		stmt.setString(1, comp_name);
    		stmt.setString(2, serv_type);
    		stmt.setString(3, door_no);
    		stmt.setString(4, street_name);
    		stmt.setString(5, city);
    		stmt.setString(6, state);
    		stmt.setString(7, pincode);
    		stmt.setString(8, emailID);
    		
    		c = stmt.executeUpdate();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return c;
    }
}

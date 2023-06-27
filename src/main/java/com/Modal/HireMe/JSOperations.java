package com.Modal.HireMe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class JSOperations {
    public static int updateRecordProfileEdit(ArrayList<String> tuple) {
    	int c = 0;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("UPDATE Users SET first_name=?, last_name=?, door_no=?, street_name=?, city=?, state=?, pincode=? WHERE email_id=?");
    		
    		stmt.setString(1, tuple.get(1));
    		stmt.setString(2, tuple.get(2));
    		stmt.setString(3, tuple.get(3));
    		stmt.setString(4, tuple.get(4));
    		stmt.setString(5, tuple.get(5));
    		stmt.setString(6, tuple.get(6));
    		stmt.setString(7, tuple.get(7));
    		stmt.setString(8, tuple.get(0));
    		
    		c = stmt.executeUpdate();
    		
    		stmt.close();
    		con.close();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return c;
    }
    
    public static int clearRecordProfileEdit(String emailID) {
    	int c = 0;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("DELETE FROM JS_Skills WHERE email_id=?");
    		
    		stmt.setString(1, emailID);
    		
    		c = stmt.executeUpdate();
    		
    		stmt.close();
    		con.close();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return c;
    }
    
    public static int updateSkillRecordProfileEdit(String emailID, String skill) {
    	int c = 0;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("INSERT INTO JS_Skills VALUES (?, ?)");
    		
    		stmt.setString(1, emailID);
    		stmt.setString(2, skill);
    		
    		c = stmt.executeUpdate();
    		
    		stmt.close();
    		con.close();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return c;
    }
    
    public static int updateRecordAcceptJob(String job_id) {
    	int c = 0;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("DELETE FROM Applications WHERE job_id=?");
    		
    		stmt.setString(1, job_id);
    		
    		c = stmt.executeUpdate();

    		stmt.close();
    		con.close();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return c;
    }
    
    public static int insertRecordApplyJob(String job_id, String email_id) {
    	int c = 0;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("INSERT INTO Applications VALUES (?, ?, ?)");
    		
    		stmt.setString(1, email_id);
    		stmt.setString(2, job_id);
    		stmt.setString(3, "Not Seen");
    		
    		c = stmt.executeUpdate();
    		
    		stmt.close();
    		con.close();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return c;
    }
}

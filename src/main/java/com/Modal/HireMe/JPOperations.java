package com.Modal.HireMe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class JPOperations {
    public static int updateRecordProfileEdit(ArrayList<String> tuple) {
    	int c = 0;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("UPDATE Company SET comp_name=?, serv_type=?, door_no=?, street_name=?, city=?, state=?, pincode=? WHERE email_id=?");
    		
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
    
    public static void updateRecordApplicant(String ApplicantemailID, String job_id) {
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("UPDATE Applications SET status=\"Reviewed\" WHERE email_id=? AND job_id=?");
    		
    		stmt.setString(1, ApplicantemailID);
    		stmt.setString(2, job_id);
    		
    		int c = stmt.executeUpdate();
    		
    		System.out.println(c);
    		
    		stmt.close();
    		con.close();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    }
    
    public static int updateRecordHireApplicant(String ApplicantemailID, String job_id) {
    	int c = 0;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("UPDATE Applications SET status=\"Offered\" WHERE job_id=? AND email_id=?");
    		
    		stmt.setString(1, job_id);
    		stmt.setString(2, ApplicantemailID);
    		
    		c = stmt.executeUpdate();
    		
    		stmt.close();
    		con.close();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return c;
    }
    
    public static boolean checkJobID(String job_id) {
    	boolean valid = true;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("SELECT job_id FROM Jobs");
    		
    		ResultSet rs = stmt.executeQuery();
    		
    		while(rs.next()) {
    			if(rs.getString(1).equals(job_id)) {
    				valid = false;
    			}
    		}
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return valid;
    }
    
    public static String getCompanyName(String email_id) {
    	String com_name = null;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		Statement stmt = con.createStatement();
    		ResultSet rs   = stmt.executeQuery("SELECT comp_name FROM Company WHERE email_id=\"" + email_id + "\"");
    		
    		while(rs.next()) {
    			com_name = rs.getString(1);
    		}
    		
    		rs.close();
    		stmt.close();
    		con.close();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return com_name;
    }
    
    public static int insertRecordCreateJob(String email_id, String job_id, String job_title, String min_exp, String responsibility, String description, String salary) {
    	int c = 0;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("INSERT INTO Jobs VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    		
    		stmt.setString(1, email_id);
    		stmt.setString(2, job_id);
    		stmt.setString(3, getCompanyName(email_id));
    		stmt.setString(4, job_title);
    		stmt.setString(5, min_exp);
    		stmt.setString(6, responsibility);
    		stmt.setString(7, description);
    		stmt.setString(8, salary);
    		
    		c = stmt.executeUpdate();
    		
    		stmt.close();
    		con.close();  	
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return c;
    }
    
    public static int insertSkillsCreateJob(String job_id, String skill) {
    	int c = 0;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("INSERT INTO Job_skills VALUES (?, ?)");
    		
    		stmt.setString(1, job_id);
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
}

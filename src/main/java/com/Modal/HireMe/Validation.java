package com.Modal.HireMe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Pattern;

public class Validation {
    public static boolean emailAlreadyExists(String emailID) {
    	boolean valid = true;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoproject", "root", "Tvarun@0812");
    		PreparedStatement stmt = con.prepareStatement("SELECT email_id FROM Users");
    		
    		ResultSet rs = stmt.executeQuery();
    		
    		while(rs.next()) {
    			if(rs.getString(1).equals(emailID)) {
    				valid = false;
    			}
    		}
    		
    		rs.close();
    		stmt.close();
    		con.close();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    	return valid;
    }
    
    public static boolean passwordValidity(String password) {
    	int uppercase = 0;
		int symbols   = 0;
		int numbers   = 0;
			
		String numberSet = "0123456789";
		String symbolSet = "`~!@#$%^&*()_-+=/'|[]{};:\\\"";
		
		for(int i = 0;i < password.length();i++) {
			if(Character.isUpperCase(password.charAt(i))) {
				uppercase += 1;
			}
			else if(numberSet.contains(String.valueOf(password.charAt(i)))) {
				numbers += 1;
			}
			else if(symbolSet.contains(String.valueOf(password.charAt(i)))) {
				symbols += 1;
			}
		}
		
		boolean valid = true;
				
		if(!(uppercase >= 1 && symbols >= 1 && numbers >= 1)) {
			valid = false;
		}
		
		return valid;
    }
    
    public static boolean nameValidity(String name) {
    	return Pattern.compile("^[a-zA-Z0-9 _., ]+$").matcher(name).matches();
    }
    
    public static boolean pincodeValidity(String pincode) {
    	int pin = Integer.parseInt(pincode);
    	if(pin >= 110001 && pin <= 855140) {
    		return true;
    	}
    	else {
    		return false;
    	}
    }
}

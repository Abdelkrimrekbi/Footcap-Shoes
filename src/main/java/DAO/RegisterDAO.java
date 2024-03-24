package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Connection_JBDC.MyConnection;
import Model_Beans.RegisterBean;

public class RegisterDAO {
	public RegisterDAO() {}
	
	        public String RegisterUser(RegisterBean rb){
		 //private Date birth;
		    
		    String  username = rb.getUsername();
		    String  email = rb.getEmail();
		    String  phone = rb.getPhone();
			String  address = rb.getAddress();
			String  password = rb.getPassword();
			String  ConPassword = rb.getConPassword();
			
			
			Connection con =MyConnection.getConnection();
			
			try {
				
			String sqlQuery = "INSERT INTO usertables (username, email, phone, address ,password,ConPassword) VALUES (?,?,?,?,?,?)";
             PreparedStatement  prepareS = con.prepareStatement(sqlQuery);	
             prepareS.setString(1, username);
			  
			  prepareS.setString(2, email);
			  prepareS.setString(3,phone);
			  prepareS.setString(4,address);
			  prepareS.setString(5,password);
			  prepareS.setString(6, ConPassword);
			  
					int i =	prepareS.executeUpdate();
					System.out.println("la valeur de i :  "+ i);
					if(i!=0) {
				  SendingEmail se = new SendingEmail(email,password);
						se.sendMail();
						return "Success";					}
				
			}catch(Exception e) {
				System.out.println("not insertion in database ::"+ e);
			}
		   
		return "error"; 
		
		   
	   }

	

}

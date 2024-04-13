// RegisterDAO.java
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.UUID;

import Connection_JBDC.MyConnection;
import Model_Beans.RegisterBean;

import jakarta.servlet.http.HttpServletRequest; 

public class RegisterDAO {
    
    public String RegisterUser(RegisterBean rb, HttpServletRequest request) {
        String username = rb.getUsername();
        String email = rb.getEmail();
        String phone = rb.getPhone();
        String address = rb.getAddress();
        String password = rb.getPassword();
        String ConPassword = rb.getConPassword();
        
        String token = UUID.randomUUID().toString(); // Generate unique token
        Timestamp creationTime = new Timestamp(System.currentTimeMillis()); // Record creation time
        Timestamp activationTime = null; // Activation time
        
        String ipAddress = request.getRemoteAddr(); // Get IP address from request
        
        Connection con = MyConnection.getConnection();
        
        try {
            String sqlQuery = "INSERT INTO usertables (username, email, phone, address, password, ConPassword, token, active, token_creation_time, token_activation_time, ip_address) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement prepareS = con.prepareStatement(sqlQuery); 
            prepareS.setString(1, username);
            prepareS.setString(2, email);
            prepareS.setString(3, phone);
            prepareS.setString(4, address);
            prepareS.setString(5, password);
            prepareS.setString(6, ConPassword);
            prepareS.setString(7, token); // Store token
            prepareS.setBoolean(8, false); // Set active to false initially
            prepareS.setTimestamp(9, creationTime); // Store creation time
            prepareS.setTimestamp(10, activationTime); // Store activation time
            prepareS.setString(11, ipAddress); // Store IP address
            
            int i = prepareS.executeUpdate(); // Execute the query
            if(i != 0) {
                // Sending email logic here
            	SendingEmail se = new SendingEmail(email);
				se.sendMail(token);
                return "Success";
            }
        } catch(Exception e) {
            // Handle exceptions
            System.out.println("Error occurred while registering user: " + e.getMessage());
        }
        
        return "error"; 
    }
}


//X=read.csv("etudiants.csv",header = TRUE, sep = ",", quote = "\"", dec = ".")
//setwd("C:/Users/karim/Desktop/ANALyse DD")

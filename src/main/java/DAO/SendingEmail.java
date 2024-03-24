package DAO;

import java.util.Properties;


import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendingEmail {
    
    private String UserEmail;
    private String Upassword;
    
    
    
   
	public SendingEmail(String email, String password) {
		 this.UserEmail = email;
	     this.Upassword = password;
	}


	public void sendMail() {
        String email = "karimerokbi203@gmail.com";
        String password ="kzyzmzgbaliebago";
        Properties properties = new Properties();
        
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.starttls.enable","true");
        properties.put("mail.smtp.host","smtp.gmail.com");
        properties.put("mail.smtp.port","587");
        
        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email,password);
            }
        });
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(UserEmail));
            message.setSubject("Email verification link");
            
            // Constructing the verification link
            String verificationLink = "http://localhost:8080/A-PPoject-JEE/ActivateAccounte?key1=" + UserEmail + "&key2=" + Upassword;
            
            // Setting the message body
            String body = "Your verification link: \n" + verificationLink;
            message.setText(body);
            
            Transport.send(message);
        } catch(Exception e) {
            System.out.println("Error occurred while sending email: " + e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        SendingEmail emailSender = new SendingEmail("recipient@example.com", "password");
        emailSender.sendMail();
    }
}

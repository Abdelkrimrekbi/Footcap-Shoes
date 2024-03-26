package Controller;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class ContactEmail {

    private final String emailHost = "smtp.gmail.com";
    private final String emailPort = "587";
    private final String fromUser = "karimerokbi203@gmail.com";
    private final String fromUserEmailPassword = "your_password"; // Update with your actual password
    private final String[] toEmails = {"karimerokbi203@gmail.com"};

    public void sendEmail(String name, String email, String messageContent) throws MessagingException {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", emailHost);
        properties.put("mail.smtp.port", emailPort);

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromUser, fromUserEmailPassword);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromUser));
        for (String toEmail : toEmails) {
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        }
        message.setSubject("Contact Form Submission");
        message.setText("Name: " + name + "\nEmail: " + email + "\nMessage: " + messageContent);

        Transport.send(message);
    }
}

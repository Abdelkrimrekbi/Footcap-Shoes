<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Controller.ContactEmail"%>
<%@ page import="javax.mail.MessagingException"%>
<%
<<<<<<< HEAD
	String message = null;
	String status = null;
	if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null) {
		ContactEmail javaEmail = new ContactEmail();
		javaEmail.setMailServerProperties();
		String emailSubject = "Contact Form using Java JSP GMail";
		String emailBody = "";
		if (request.getParameter("name") != null) {
			emailBody = "Sender Name: " + request.getParameter("name")
					+ "<br>";
		}
		if (request.getParameter("email") != null) {
			emailBody = emailBody + "Sender Email: "
					+ request.getParameter("email") + "<br>";
		}
		if (request.getParameter("message") != null) {
			emailBody = emailBody + "Message: " + request.getParameter("message")
					+ "<br>";
		}
		javaEmail.createEmailMessage(emailSubject, emailBody);
		try {
			javaEmail.sendEmail();
			status = "success";
			message = "Email sent Successfully!";
		} catch (MessagingException me) {
			status = "error";
			message = "Error in Sending Email!";
		}
		request.setAttribute("submit", null);
	}
=======
    String message = null;
    String status = null;
    if (request.getParameter("submit") != null) {
        ContactEmail javaEmail = new ContactEmail();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String messageContent = request.getParameter("message");
        try {
            javaEmail.sendEmail(name, email, messageContent);
            status = "success";
            message = "Email sent Successfully!";
            response.sendRedirect("contact.jsp?status=" + status + "&message=" + java.net.URLEncoder.encode(message, "UTF-8"));
            return; // Added return to prevent further execution
        } catch (MessagingException me) {
            status = "error";
            message = "Error in Sending Email!";
        }
    }
>>>>>>> karim
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Contact Us Form in Html Css</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/StyleCont.css">
</head>
<body>
    <div class="contact-form">
        <h1>Contact Us</h1>
        <div class="container">
            <div class="main">
                <div class="content">
                <a href="#" onclick="goBack()"  ><i class="fas fa-arrow-left"></i></a>
                
                    <h2>Contact Us</h2>
                    <form action="#" method="post">
                        <input type="text" name="name" placeholder="Enter Your Name">
                        <input type="email" name="email" placeholder="Enter Your Email">
                        <textarea name="message" placeholder="Your Message"></textarea>                   
                        <button class="btn" type="submit" name="submit" id="send-message" style="clear: both;">Send <i class="fas fa-paper-plane"></i></button>
                    </form>
                </div>
                <div class="form-img">
<<<<<<< HEAD
                    <img src="<%= request.getContextPath() %>/img/bg1.png" alt="">
=======
                    <img src="<%= request.getContextPath() %>/img/bg12.png" alt="">
>>>>>>> karim
                </div>
            </div>
        </div>
    </div> 
    <script>
        // JavaScript function to go back
        function goBack() {
            window.history.back() ;
        }
    </script>
</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> karim

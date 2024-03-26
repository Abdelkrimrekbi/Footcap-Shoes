<%@ page import="Controller.ContactEmail"%>
<%@ page import="javax.mail.MessagingException"%>
<%
	String message = null;
	String status = null;
	if (request.getParameter("submit") != null) {
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
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/StyleCont.css">
<title>Insert title here</title>
</head>
<body>
<section class="section-bg" style="background-image: url(https://st4.depositphotos.com/8692642/30914/i/1600/depositphotos_309144872-stock-photo-various-color-bright-female-youth.jpg);"  data-scroll-index="7">
          <div class="overlay pt-100 pb-100 ">
            <div class="container">
               <div class="row">
                    <div class="col-lg-6 d-flex align-items-center">
                        <div class="contact-info">

                            <h2 class="contact-title">Have Any Questions?</h2>
                            <p>&nbsp;&nbsp;&nbsp;We welcome your inquiries and feedback. Feel free to reach out to us with any questions, comments, or suggestions you may have. Your input is valuable to us as we strive to improve our services and provide you with the best experience possible. Thank you for your interest in our site.
 </p>
                            <ul class="contact-info">
                                <li>
                                  <div class="info-left">
                                      <i class="fas fa-mobile-alt"></i>
                                  </div>
                                  <div class="info-right">
                                      <h4>+212 643023983</h4>
                                  </div>
                                </li>
                                <li>
                                  <div class="info-left">
                                      <i class="fas fa-at"></i>
                                  </div>
                                  <div class="info-right">
                                      <h4>ilyasammah@gmail.com</h4>
                                  </div>
                                </li>
                                <li>
                                  <div class="info-left">
                                      <i class="fas fa-map-marker-alt"></i>
                                  </div>
                                  <div class="info-right">
                                      <h4>Hay Mohammadi TAROUDANT, MOROCCO</h4>
                                  </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 d-flex align-items-center">
                            <div class="contact-form">
                                        <!--Contact Form-->
                                        <form id="frmContact" name="frmContact" action="" method='POST'><input type='hidden' name='form-name' value='contactForm' />
                                            <div class="row">
                                               <div class="col-md-12">
                                                  <div class="form-group">
                                                     <input type="text" name="name" class="form-control" id="first-name" placeholder="Enter Your Name *" required="required">
                                                  </div>
                                               </div>
                                               <div class="col-md-12">
                                                  <div class="form-group">
                                                     <input type="email" name="email" class="form-control" id="email" placeholder="Enter Your Email *" required="required">
                                                  </div>
                                               </div>

                                               <div class="col-md-12">
                                                  <div class="form-group">
                                                       <textarea rows="4" name="message" class="form-control" id="description" placeholder="Enter Your Message *" required="required"></textarea>
                                                  </div>
                                               </div>
                                                <div class="col-md-12">
                                                    <!--contact button-->
                                                    
                                                    <button type="submit" name="submit" id="send-message" style="clear: both;" class="btn-big btn btn-bg">
                                                    Send Us <i class="fas fa-arrow-right"></i></button>
                                                    
                                                    
                                            
						
                                        </form>
                                    </div>
                    </div>
               </div>
           </div>
              </div>
        </section>
</body>
</html>


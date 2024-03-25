<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>
    <!-- SweetAlert CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">

<!-- SweetAlert JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css" />
    <title>Sign in & Sign up Form</title>
  </head>
  <body>
  <input type="hidden" id="status" value=<%= request.getAttribute("status") %>>
    <div class="container sign-up-mode">
      <div class="forms-container">
        <div class="signin-signup">
          <form action="<%= request.getContextPath() %>/RegisterController" method="get" class="sign-up-form" onsubmit="return validateSignUpForm()">
            <h2 class="title">Sign up</h2>
            
            <div class="input-field">
              <i class="fas fa-user"></i>
               <input type="text" id="username" name="username"  placeholder="Username" required>
            </div>
            
            <div class="input-field">
              <i class="fas fa-envelope"></i>
               <input type="email" id="email" name="email" placeholder="Email" required><br>
            </div> 
            
            <div class="input-field">
              <i class="fas fa-envelope"></i>
               <input type="tel" id="phone" name="phone" placeholder="Phone" required>
            </div>
            
             <div class="input-field">
              <i class="fas fa-envelope"></i>
               <input type="text" id="address" name="address" placeholder="Address" required>
            </div>
            
            <div class="input-field">
              <i class="fas fa-lock"></i>
               <input type="password" id="password" name="password" placeholder="Password" required>
            </div>
            
            <div class="input-field">
              <i class="fas fa-lock"></i>
             <input type="password" id="ConPassword" name="ConPassword" placeholder="Conferme Password" required>
            </div>
            
            <input type="submit" class="btn" value="Sign up" />
            
            <p class="social-text">Or Sign up with social platforms</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
          </form>
          <form method="post" action="<%= request.getContextPath() %>/login" class="sign-in-form" validateSignInForm()">
            <h2 class="title">Sign in</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
                <input type="email" id="email" name="email" placeholder="Email">
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" id="password" name="password" placeholder="Password">
            </div>
            <input type="submit" value="Sign in" class="btn solid" />
            <p class="social-text">Or Sign in with social platforms</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
          </form>
        </div>
      </div>

    <div class="panels-container">
        <div class="panel left-panel">
            <div class="content">
                <h3>New here ?</h3>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
                    ex ratione. Aliquid!
                </p>
                <button class="btn transparent" id="sign-up-btn">
                    Sign up
                </button>
            </div>
            <img src="<%= request.getContextPath() %>/img/log.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
            <div class="content">
                <h3>One of us ?</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
                    laboriosam ad deleniti.
                </p>
                <button class="btn transparent" id="sign-in-btn">
                    Sign in
                </button>
            </div>
            <img src="<%= request.getContextPath() %>/img/register.svg" class="image" alt="" />
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    var status = document.getElementById("status").value;
    console.log("Status:", status); // Check the value of status
    if(status == "Succes") {
        Swal.fire({
            icon: 'success',
            title: 'Oops...',
            text: 'Created compte successfully',
        });
    }
</script>


<script>
    function validateSignInForm() {
        var email = document.getElementById("signInEmail").value;
        var password = document.getElementById("signInPassword").value;

        if (email.trim() === "" || password.trim() === "") {
            showSweetAlertError("All fields must be filled out");
            return false;
        }

        // You can add more complex email validation if needed
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            showSweetAlertError("Invalid email address");
            return false;
        }

        return true;
    }

    function validateSignUpForm() {
        var username = document.getElementById("signUpUsername").value;
        var email = document.getElementById("signUpEmail").value;
        var phone = document.getElementById("signUpPhone").value;
        var address = document.getElementById("signUpAddress").value;
        var password = document.getElementById("signUpPassword").value;
        var confirmPassword = document.getElementById("signUpConPassword").value;

        if (username.trim() === "" || email.trim() === "" || phone.trim() === "" || address.trim() === "" || password.trim() === "" || confirmPassword.trim() === "") {
            showDialog("All fields must be filled out");
            return false;
        }

        if (password !== confirmPassword) {
            showDialog("Passwords do not match");
            return false;
        }

        // You can add more complex email validation if needed
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            showDialog("Invalid email address");
            return false;
        }

        return true;
    }

    
    function showDialog(errorMessage) {
        // Using SweetAlert to display the error message
        swal({
            title: "Error!",
            text: errorMessage,
            icon: "success",
            button: "Close"
        });
    }
        
       
   </script>
        <script src="<%= request.getContextPath() %>/JavaScript/app.js"></script>
        </body>
        </html>

    
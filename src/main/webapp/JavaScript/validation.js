function validateForm() {
    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    var address = document.getElementById("address").value;
    var password = document.getElementById("password").value;
    var ConPassword = document.getElementById("ConPassword").value;
    var errorMessage = "";

    if (username == ""  || email == "" || phone == "" || address == "" || password == "" || ConPassword == "") {
        errorMessage += "All fields must be filled out\n";
    }

    if (password != ConPassword) {
        errorMessage += "Password do not match\n";
    }

    // You can add more complex email validation if needed
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        errorMessage += "Invalid email address\n";
    }

    if (errorMessage !== "") {
        showDialog(errorMessage);
        return false;
    }

    return true;
}

function showDialog(message) {
    // Create overlay
    var overlay = document.createElement("div");
    overlay.className = "overlay";
    document.body.appendChild(overlay);

    // Create dialog box
    var dialogBox = document.createElement("div");
    dialogBox.className = "dialog-box";
    dialogBox.innerHTML = "<p>" + message + "</p>";

    var closeButton = document.createElement("button");
    closeButton.textContent = "Close";
    closeButton.addEventListener("click", function() {
        document.body.removeChild(dialogBox);
        document.body.removeChild(overlay);
    });

    dialogBox.appendChild(closeButton);
    document.body.appendChild(dialogBox);

    // Display overlay and dialog box
    overlay.style.display = "block";
    dialogBox.style.display = "block";
}

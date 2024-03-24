<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model_Beans.databaseConnection" %>
<%@ page import="classdb.productdb" %>
<%@ page import="Model_Beans.cart" %>

<%

if (session.getAttribute("username")==null){
	response.sendRedirect("login.jsp");
}
%>
<%
ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");

List<cart> cartPro = null;
double total = 0;
if (cart_list != null) {
    productdb db = new productdb(databaseConnection.getConnetion());
    total = db.getTotalPrice(cart_list);
    cartPro = db.getCartProcducts(cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping Cart</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/footer.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/cartA.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>
<link rel="shortcut icon" href="<%= request.getContextPath() %>/favicon.svg" type="image/svg+xml">
    <!-- test -->

  
</head>
<body>
<!-- HEADER -->
 <header class="header" data-header>
    <div class="containerr">

        <div class="overlay" data-overlay></div>

        <a href="#" class="logo">
            <img src="<%= request.getContextPath() %>/images/logo.svg" width="160" height="50" alt="Footcap logo">
        </a>

        <button class="nav-open-btn" data-nav-open-btn aria-label="Open Menu">
            <ion-icon name="menu-outline"></ion-icon>
        </button>

        <nav class="navbar" data-navbar>

            <button class="nav-close-btn" data-nav-close-btn aria-label="Close Menu">
                <ion-icon name="close-outline"></ion-icon>
            </button>

            <a href="#" class="logo">
                <img src="<%= request.getContextPath() %>/images/logo.svg" width="190" height="50" alt="Footcap logo">
            </a>

            <ul class="navbar-list">

                <li class="navbar-item">
                    <a href="home.jsp" class="navbar-link">Home</a>
                </li>

            </ul>

            <ul class="nav-action-list">

                

                <li>
                </li>
                <li>
                </li>

                <li>
                    <a href="#" class="nav-action-btn" style="display: inline-block; padding: 8px 15px; margin-right: 10px; background-color: #FF8674; color: #fff; text-decoration: none; border-radius: 5px; transition: background-color 0.3s ease;">
                        <%= session.getAttribute("username") %>
                    </a>
                </li>

            </ul>
            
            <form action="" class="search-form">
                <input type="search" id="search-box" placeholder="search here...">
                <label for="search-box" class="fas fa-search"></label>
            </form>
          
        </nav>
 
    </div>
   
</header>

<!-- CENTRE CART -->


  <!-- CENTRE CART -->

<div class="container center-section">
  <div class="container">
    <div class="checkout">
        <h3>Total Price: DH <%= total %></h3>
        <button href="#" style="margin-right: 40px; align-items: center; " class="btnn btn-salmon mx-2">Checkout</button>
    </div>

    <!-- Cart items -->
    <div class="cart-items">
        <% if (cart_list != null) {
            for (cart c : cartPro) { %>
                <div class="cart-item">
                          <div class="product-image rounded-image">
          <img src="<%= request.getContextPath() %>/<%= c.getImage() %>" alt="<%= c.getName() %>">
                    </div>
                    <div class="product-details">
                        <h4><%= c.getName() %></h4>
                        <p>Category: <%= c.getCategory() %></p>
                        <h5>Price: <%= c.getPrice() %></h5>
                    </div>
                    <div class="product-actions">
    <form action="" method="post" class="form-inline">
        <input type="hidden" name="id" value="<%= c.getId() %>" class="form-input">
        <div class="btn-group">
            <a href="<%= request.getContextPath() %>/incrementDecrementPro?action=dec&id=<%= c.getId() %>" class="btn btn-gray btn-sm"><i class="fas fa-minus"></i></a>
            <input type="text" name="quantity" class="form-control" value="<%= c.getQuantity() %>" readonly>
            <a href="<%= request.getContextPath() %>/incrementDecrementPro?action=inc&id=<%= c.getId() %>" class="btn btn-gray btn-sm"><i class="fas fa-plus"></i></a>
            <button type="submit" class="btnn btn-salmon btn-sm">Buy Now</button>
            <a class="btnn btn-danger btn-sm" href="<%= request.getContextPath() %>/RemoveCart?id=<%= c.getId() %>">Remove</a>
        </div>
    </form>
   </div>
                </div>
        <% }
        } %>
    </div>
  </div>
  </div>
  <!-- SECSSion -->
   <section class="section service">
        <div class="container">

          <ul class="service-list">

            <li class="service-item">
              <div class="service-card">

                <div class="card-icon">
                  <img src="<%= request.getContextPath() %>/images/service-1.png" width="53" height="28" loading="lazy" alt="Service icon">
                </div>

                <div>
                  <h3 class="h4 card-title">Free Shiping</h3>

                  <p class="card-text">
                    All orders over <span>DH150</span>
                  </p>
                </div>

              </div>
            </li>

            <li class="service-item">
              <div class="service-card">

                <div class="card-icon">
                  <img src="<%= request.getContextPath() %>/images/service-2.png" width="43" height="35" loading="lazy" alt="Service icon">
                </div>

                <div>
                  <h3 class="h4 card-title">Quick Payment</h3>

                  <p class="card-text">
                    100% secure payment
                  </p>
                </div>

              </div>
            </li>

            <li class="service-item">
              <div class="service-card">

                <div class="card-icon">
                  <img src="<%= request.getContextPath() %>/images/service-3.png" width="40" height="40" loading="lazy" alt="Service icon">
                </div>

                <div>
                  <h3 class="h4 card-title">Free Returns</h3>

                  <p class="card-text">
                    Money back in 30 days
                  </p>
                </div>

              </div>
            </li>

            <li class="service-item">
              <div class="service-card">

                <div class="card-icon">
                  <img src="<%= request.getContextPath() %>/images/service-4.png" width="40" height="40" loading="lazy" alt="Service icon">
                </div>

                <div>
                  <h3 class="h4 card-title">24/7 Support</h3>

                  <p class="card-text">
                    Get Quick Support
                  </p>
                </div>

              </div>
            </li>

          </ul>

        </div>
      </section>
  
  <!-- FOOTER -->
  
<div class="footer">
<footer id="Contact" class="footer">

    <div class="footer-top section">
      <div class="container">

       
        <div class="footer-link-box">

          <ul class="footer-list">

            <li>
              <p class="footer-list-title">Contact Us</p>
            </li>

            <li>
              <address class="footer-link">
                <ion-icon name="location"></ion-icon>

                <span class="footer-link-text">
                  Taroudant,Hey Mohamdy
                </span>
              </address>
            </li>

            <li>
              <a href="tel:+557343673257" class="footer-link">
                <ion-icon name="call"></ion-icon>

                <span class="footer-link-text">+212689712209</span>
              </a>
            </li>

            <li>
              <a href="mailto:footcap@help.com" class="footer-link">
                <ion-icon name="mail"></ion-icon>

                <span class="footer-link-text">footcap@help.com</span>
              </a>
            </li>

          </ul>

          <ul class="footer-list">

            <li>
              <p class="footer-list-title">Help & information</p>
            </li>

            <li>
              <a href="#" class="footer-link">
                <ion-icon name="chevron-forward-outline"></ion-icon>

                <span class="footer-link-text">Help & Contact us</span>
              </a>
            </li>

            <li>
              <a href="#" class="footer-link">
                <ion-icon name="chevron-forward-outline"></ion-icon>

                <span class="footer-link-text">Returns & Refunds</span>
              </a>
            </li>

            <li>
              <a href="#" class="footer-link">
                <ion-icon name="chevron-forward-outline"></ion-icon>

                <span class="footer-link-text">Online Stores</span>
              </a>
            </li>

            <li>
              <a href="#" class="footer-link">
                <ion-icon name="chevron-forward-outline"></ion-icon>

                <span class="footer-link-text">Terms & Conditions</span>
              </a>
            </li>

            <li>
              <a href="#" class="footer-link">
                <ion-icon name="chevron-forward-outline"></ion-icon>

                <span class="footer-link-text">New Products</span>
              </a>
            </li>

          </ul>

          <div class="footer-list">

            <p class="footer-list-title">Opening Time</p>

            <table class="footer-table">
              <tbody>

                <tr class="table-row">
                  <th class="table-head" scope="row">Mon - Tue:</th>

                  <td class="table-data">8AM - 10PM</td>
                </tr>

                <tr class="table-row">
                  <th class="table-head" scope="row">Wed:</th>

                  <td class="table-data">8AM - 7PM</td>
                </tr>

                <tr class="table-row">
                  <th class="table-head" scope="row">Fri:</th>

                  <td class="table-data">7AM - 12PM</td>
                </tr>

                <tr class="table-row">
                  <th class="table-head" scope="row">Sat:</th>

                  <td class="table-data">9AM - 8PM</td>
                </tr>

                <tr class="table-row">
                  <th class="table-head" scope="row">Sun:</th>

                  <td class="table-data">Closed</td>
                </tr>

              </tbody>
            </table>

          </div>

          <div class="footer-list">

            <p class="footer-list-title">Newsletter</p>

            <p class="newsletter-text">
              Term & Condition  Policy  Map
            </p>

            <form action="" class="newsletter-form">
              <input type="email" name="email" required placeholder="Email Address" class="newsletter-input">

              <button type="submit" class="btn btn-primary">Subscribe</button>
            </form>

          </div>

        </div>

      </div>
    </div>

    <div class="footer-bottom">
      <div class="container">

        <p class="copyright">
          &copy; 2024<a href="#" class="copyright-link">-rekbi -essamah - elhilali</a>. All Rights Reserved
        </p>

      </div>
    </div>

  </footer>
  </div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js"></script>
</body>
</html>

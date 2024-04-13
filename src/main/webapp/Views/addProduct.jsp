<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/styleAddProduct.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
  <div class="container">
    <a href="#" onclick="goBack()"  ><i class="fas fa-arrow-left"></i></a>
    <div class="title">Add Product</div>
    <div class="content">

      <form action="<%= request.getContextPath() %>/AddProduct" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Name</span>
            <input type="text" placeholder="Enter name product" name="name" required>
          </div>
          <div class="input-box">
            <span class="details">Category</span>
            <input type="text" placeholder="Enter category product" name="category" required>
          </div>
          <div class="input-box">
            <span class="details">Price</span>
            <input type="text" placeholder="Enter price product" name="price" required>
          </div>
          <div class="input-box">
            <span class="details">Image</span>
            <input type="file" placeholder="Enter image product" name="image" required>
          </div>

        </div>

        <div class="button">
          <input type="submit" value="Add Product">
        </div>
      </form>
    </div>
  </div>
  <script>
    // JavaScript function to go back
    function goBack() {
        window.history.back() ;
    }
</script>
</body>
</html>
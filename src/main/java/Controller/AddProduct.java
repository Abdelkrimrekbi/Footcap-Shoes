package Controller;

import java.io.IOException;
import java.sql.Connection;

import Connection_JBDC.MyConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Model_Beans.products;
import classdb.productdb;

/**
 * Servlet implementation class AddProduct
 */
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
	    String category = request.getParameter("category");
	    double price = Double.parseDouble(request.getParameter("price"));
	    String image = "images/" + request.getParameter("image");

	    products newProduct = new products();
	    newProduct.setName(name);
	    newProduct.setCategory(category);
	    newProduct.setPrice(price);
	    newProduct.setImage(image);

	    // Create an instance of productdb
	    productdb db = new productdb(MyConnection.getConnection());
	    RequestDispatcher dispatcher =null ;
	    // Insert the product into the database
	    boolean inserted = db.insertProduct(newProduct);
	    if (inserted) {
	    	dispatcher = (RequestDispatcher) request.getRequestDispatcher("/Views/home.jsp");
			dispatcher.forward(request, response);
	       // response.getWriter().println("Product inserted successfully.");
	    } else {
	        response.getWriter().println("Failed to insert product.");
	    }
	}
}
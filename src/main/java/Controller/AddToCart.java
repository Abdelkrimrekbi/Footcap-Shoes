package Controller;

import java.io.IOException;


import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Model_Beans.cart;


public class AddToCart extends HttpServlet {
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		ArrayList<cart> cartList=new ArrayList<>();
		int id=Integer.parseInt(request.getParameter("id"));
		cart cr=new cart();
		cr.setId(id);
		cr.setQuantity(1);  
		
		HttpSession session=request.getSession();  
		ArrayList<cart> cart_list=(ArrayList<cart>) session.getAttribute("cart-list");
		//System.out.println("session");
	
		   
		if(cart_list==null) {    
			cartList.add(cr);
			session.setAttribute("cart-list", cartList);
			response.sendRedirect("Views/home.jsp");
			  
		}
		else {
			cartList=cart_list;
			boolean exist=false;
			for(cart c:cartList) {
				if(c.getId()==id) {
					exist=true;
					response.sendRedirect("Views/home.jsp");
					out.println("<script><alert> product exist </alert>\"</script>");
				}
				
			}   
			if(!exist) {
					cartList.add(cr);
					response.sendRedirect("Views/home.jsp");
				} 
		}      
			
	}

}

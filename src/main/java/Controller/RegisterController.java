package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



import DAO.RegisterDAO;
import Model_Beans.RegisterBean;

/**
 * Servlet implementation class RegisterController
 */

public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try{
			 String username = request.getParameter("username");
			 String email = request.getParameter("email");
			 String address = request.getParameter("address");
			 String phone = request.getParameter("phone");
			 String password = request.getParameter("password");
			 String ConPassword = request.getParameter("ConPassword");
			
			 RegisterBean rb = new RegisterBean();
			 rb.setUsername(username);
			 rb.setAddress(address);
			 rb.setConPassword(ConPassword);
			 rb.setPassword(password);
			 rb.setEmail(email);
			 rb.setPhone(phone);
			 RequestDispatcher dispatcher =null ;
			 RegisterDAO RegDAO = new  RegisterDAO();
			 String str =RegDAO.RegisterUser(rb);
			 if(str.equals("Success")) {
				 request.setAttribute("status","Succes");
				 dispatcher = (RequestDispatcher) request.getRequestDispatcher("/Views/login.jsp");
			     dispatcher.forward(request, response); 
				 
			 }else {
				 response.sendRedirect("Views/llogin.jsp");
			 }
			 
			
		}catch(Exception e) {
			System.out.println("RegisterDAO FILE ... ::"+ e);
			   jakarta.servlet.RequestDispatcher dispatcher = (RequestDispatcher) request.getRequestDispatcher("/Views/error.jsp");
			
		}
	}


	

}

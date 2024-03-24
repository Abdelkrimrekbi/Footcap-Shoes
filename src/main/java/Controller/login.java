package Controller;

import java.io.IOException;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Connection_JBDC.MyConnection;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.RequestDispatcher;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("email") != null) {
			getServletContext().getRequestDispatcher("/Views/home.jsp").forward(req, resp);
		} else {
			getServletContext().getRequestDispatcher("/Views/login.jsp").forward(req, resp);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		RequestDispatcher dispatcher =null ;
		try {
			Connection con = MyConnection.getConnection();
			System.out.println("Database is Connected !");
			PreparedStatement pst = con.prepareStatement("select * from usertables where email = ? and password = ?");
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs =pst.executeQuery();
			if(rs.next()) {
				 HttpSession session = request.getSession();
				 
				  session.setAttribute("username", rs.getString("username"));
				  session.setAttribute("email", rs.getString("email"));
				  session.setAttribute("phone", rs.getString("phone"));
				  session.setAttribute("address", rs.getString("address"));
				 
				dispatcher =  (RequestDispatcher) request.getRequestDispatcher("/Views/home.jsp");
				
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("status","failed");
				request.setAttribute("status","failed");
				dispatcher = (RequestDispatcher) request.getRequestDispatcher("/Views/login.jsp");
				dispatcher.forward(request, response);
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			dispatcher = (RequestDispatcher) request.getRequestDispatcher("/Views/error.jsp");
			e.printStackTrace();
		}
		

	}
	
	}



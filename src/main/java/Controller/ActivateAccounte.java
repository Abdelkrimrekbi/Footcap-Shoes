package Controller;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.RequestDispatcher;

import Connection_JBDC.MyConnection;

/**
 * Servlet implementation class ActivateAccounte
 */
public class ActivateAccounte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivateAccounte() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("key1");
        String password = request.getParameter("key2");
       
        try {
        	 Connection con = MyConnection.getConnection();
             System.out.println("databas Connected ! :"+con);
            PreparedStatement prepareS = con.prepareStatement(
           "select email, password, active from usertables where email=? AND password=? AND active ='0'");
            prepareS.setString(1, email);
            prepareS.setString(2, password);
            ResultSet rs = prepareS.executeQuery();

            if (rs.next()) {
                PreparedStatement prepareS1 = con
                        .prepareStatement("UPDATE usertables SET active ='1' where email=? AND password=?");
                prepareS1.setString(1, email);
                prepareS1.setString(2, password);
                int i = prepareS1.executeUpdate();
                if (i == 0) {
                    response.sendRedirect("Views/home.jsp");
                } else {
                	 response.sendRedirect("Views/login.jsp");
                }
            }

        } catch (Exception e) {
        	e.printStackTrace();
            System.out.println("Activation file ... " + e);
            jakarta.servlet.RequestDispatcher dispatcher = (RequestDispatcher) request.getRequestDispatcher("/Views/error.jsp");
        }

        // Move the processRequest call here if needed
        // processRequest(request, response);
    }

}

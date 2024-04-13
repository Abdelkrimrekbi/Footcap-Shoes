// ActivateAccounte.java
package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import Connection_JBDC.MyConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ActivateAccounte extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String token = request.getParameter("token");
        
        try {
            Connection con = MyConnection.getConnection();
            PreparedStatement prepareS = con.prepareStatement(
                "SELECT email, token_creation_time FROM usertables WHERE email = ? AND token = ? AND active = '0'");
            prepareS.setString(1, email);
            prepareS.setString(2, token);
            ResultSet rs = prepareS.executeQuery();

            if (rs.next()) {
                Timestamp creationTime = rs.getTimestamp("token_creation_time");
                
               
                if (System.currentTimeMillis() - creationTime.getTime() <= 24 * 60 * 60 * 1000) {
                	 PreparedStatement prepareS1 = con.prepareStatement(
                         "UPDATE usertables SET active = '1', token_activation_time = ? WHERE email = ? AND token = ?");
                         prepareS1.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
                         prepareS1.setString(2, email);
                         prepareS1.setString(3, token);
                    int i = prepareS1.executeUpdate();
                    if (i == 1) {
                        response.sendRedirect("Views/home.jsp");
                    } else {
                        response.sendRedirect("Views/login.jsp");
                    }
                } else {
                    response.sendRedirect("Views/token_expired.jsp");
                }
            } else {
                response.sendRedirect("Views/token_invalid.jsp");
            }

        } catch (Exception e) {
            System.out.println("Activation file ... " + e);
            request.getRequestDispatcher("/Views/error.jsp").forward(request, response);
        }
    }
}

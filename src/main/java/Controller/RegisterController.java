package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.RegisterDAO;
import Model_Beans.RegisterBean;

public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
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

            RegisterDAO RegDAO = new RegisterDAO();
            String str = RegDAO.RegisterUser(rb,request);
            if (str.equals("Success")) {
                request.setAttribute("status","Success");
                request.getRequestDispatcher("/Views/login.jsp").forward(request, response);
            } else {
                response.sendRedirect("Views/login.jsp");
            }
        } catch (Exception e) {
            System.out.println("RegisterDAO FILE ... ::"+ e);
            request.getRequestDispatcher("/Views/error.jsp").forward(request, response);
        }
    }
}

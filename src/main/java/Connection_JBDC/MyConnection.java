package Connection_JBDC;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
           
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/footcapproject","root","");  
   
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error creating database connection: " + e.getMessage());
        }
        return con;
    }
}

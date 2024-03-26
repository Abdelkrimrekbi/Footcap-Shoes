package classdb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Connection_JBDC.MyConnection;
import Model_Beans.cart;
import Model_Beans.products;

public class productdb {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public productdb(Connection con) {
		
		this.con = con;
	}
	public List<products> getAllPoroducts(){
		List<products> product=new ArrayList<>();
		   try {
			 query="select * from products";  
			 
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			System.out.println("requite:::::::::::"+rs);
			while(rs.next()) {
				products row =new products();  
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				product.add(row);  
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return product;
	}
	public List<cart> getCartProcducts(ArrayList<cart> cartList) throws SQLException{
		List<cart> products= new ArrayList<>();
		if(cartList.size()>0) {
			for(cart items:cartList) {
			query="select * from products where id=?";
			pst=this.con.prepareStatement(query);
			pst.setInt(1,items.getId());
			rs=pst.executeQuery();
			while(rs.next()) {
				cart row =new cart();  
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price")* items.getQuantity());;
				row.setQuantity(items.getQuantity());
				row.setImage(rs.getString("image"));
				products.add(row);  
			}
			
			}
		}  
		
		return products;
		
	}
	
	public double getTotalPrice(ArrayList<cart> cartList) {
		double sum=0;
		try {
			if(cartList.size()>0) {
				for(cart items:cartList) {
					query="select price from products where id=?";
					pst=this.con.prepareStatement(query);
					pst.setInt(1,items.getId());
					rs=pst.executeQuery();
					while(rs.next()) {
						sum+=rs.getDouble("price")*items.getQuantity();
					}
				}
			}  
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return sum;
	}
	public boolean insertProduct(products newProduct) {
	    try {
	        String query = "INSERT INTO products (name, category, price, image) VALUES (?, ?, ?, ?)";
	        PreparedStatement pst = this.con.prepareStatement(query);
	        pst.setString(1, newProduct.getName());
	        pst.setString(2, newProduct.getCategory());
	        pst.setDouble(3, newProduct.getPrice());
	        pst.setString(4, newProduct.getImage());

	        int rowsAffected = pst.executeUpdate();
	        return rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}

package review_restaurant;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Review_restaurantDAO {
	private Connection conn;
	private ResultSet rs;
	
	public Review_restaurantDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/triview";
			String dbID = "root";
			String dbPassword = "tpahfdl3310";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
						
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ""; 
	}
	
	public int getNext() {
		String SQL = "SELECT rr_number FROM triview ORDER BY rr_number DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; 
						
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public int write(String rr_username, String rp_nationality, String rp_agerange, String rp_comment, String rp_receipt ) {
		String SQL =  "INSERT INTO triview VALUES(?,  ?,  ?,  ?,  ?,  ?,  ?,  ?,  ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1,  getNext());
			pstmt.setInt(2,  getNext());
			pstmt.setString(3,  rr_username);
			pstmt.setString(4,  rp_nationality);
			pstmt.setString(5,  rp_agerange);
			pstmt.setString(6,  rp_comment);
			pstmt.setString(7,  getDate());
			pstmt.setString(8, rp_receipt);
			pstmt.setInt(9, getNext());
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public ArrayList<Review_restaurant> getList(int pageNumber)
	{
		String SQL = "SELECT * FROM Triview WHERE rr_number < ? AND rp_available = 1 ORDER BY rr_number DESC LIMIT 10";
		
		ArrayList<Review_restaurant> list = new ArrayList<Review_restaurant>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review_restaurant review_restaurant = new Review_restaurant();
				review_restaurant.setRr_number(rs.getInt(1));
				review_restaurant.setR_number(rs.getInt(2));
				review_restaurant.setRr_username(rs.getString(3));
				review_restaurant.setRp_nationality(rs.getString(4));
				review_restaurant.setRp_agerange(rs.getInt(5));
				review_restaurant.setRp_comment(rs.getString(6));
				review_restaurant.setRp_createdate(rs.getString(7));
				review_restaurant.setRp_receipt(rs.getString(8));
				review_restaurant.setRp_available(rs.getInt(9));
				list.add(review_restaurant);
			}
						
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber)
	{
		String SQL = "SELECT * FROM Triview WHERE rr_number < ? AND rp_available = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber -1) * 10);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public Review_restaurant getreview_restaurant(int rp_number) {
		String SQL = "SELECT * FROM Triview WHERE rp_number = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  rp_number);
			rs= pstmt.executeQuery();
			if(rs.next())
			{
				Review_restaurant review_restaurant = new Review_restaurant();
				review_restaurant.setRr_number(rs.getInt(1));
				review_restaurant.setR_number(rs.getInt(2));
				review_restaurant.setRr_username(rs.getString(3));
				review_restaurant.setRp_nationality(rs.getString(4));
				review_restaurant.setRp_agerange(rs.getInt(5));
				review_restaurant.setRp_comment(rs.getString(6));
				review_restaurant.setRp_createdate(rs.getString(7));
				review_restaurant.setRp_receipt(rs.getString(8));
				review_restaurant.setRp_available(rs.getInt(9));
				return review_restaurant;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null; // 해당글 존재 x
	}
	
	public int update(int rp_number, String rp_comment) {
		String SQL = "UPDATE Triview SET rp_comment = ? WHERE rp_number = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1,  rp_comment);
			pstmt.setInt(2,  rp_number);
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public int delete(int rp_number) {
		String SQL = "UPDATE Triview SET rp_available = 0 WHERE rp_number = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  rp_number);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
}
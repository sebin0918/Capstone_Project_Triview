package review_place;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Review_placeDAO {
	private Connection conn;
	private ResultSet rs;
	
	public Review_placeDAO() {
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
		String SQL = "SELECT rp_number FROM triview ORDER BY rp_number DESC";
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
	
	public int write(String rp_username, String rp_nationality, String rp_agerange, String rp_comment ) {
		String SQL =  "INSERT INTO triview VALUES(?,  ?,  ?,  ?,  ?,  ?,  ?,  ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1,  getNext());
			pstmt.setInt(2,  getNext());
			pstmt.setString(3,  rp_username);
			pstmt.setString(4,  rp_nationality);
			pstmt.setString(5,  rp_agerange);
			pstmt.setString(6,  rp_comment);
			pstmt.setString(7,  getDate());
			pstmt.setInt(8, getNext());
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public ArrayList<Review_place> getList(int pageNumber)
	{
		String SQL = "SELECT * FROM triview WHERE rp_number < ? AND rp_available = 1 ORDER BY rp_number DESC LIMIT 10";
		
		ArrayList<Review_place> list = new ArrayList<Review_place>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review_place review_place = new Review_place();
				review_place.setRp_number(rs.getInt(1));
				review_place.setP_number(rs.getInt(2));
				review_place.setRp_username(rs.getString(3));
				review_place.setRp_nationality(rs.getString(4));
				review_place.setRp_agerange(rs.getString(5));
				review_place.setRp_comment(rs.getString(6));
				review_place.setRp_createdate(rs.getString(7));
				review_place.setRp_available(rs.getInt(8));
				list.add(review_place);
			}
						
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber)
	{
		String SQL = "SELECT * FROM triview WHERE rp_number < ? AND rp_Available = 1";
		
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
	
	public Review_place getreview_place(int rp_number) {
		String SQL = "SELECT * FROM triview WHERE rp_number = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  rp_number);
			rs= pstmt.executeQuery();
			if(rs.next())
			{
				Review_place review_place = new Review_place();
				review_place.setRp_number(rs.getInt(1));
				review_place.setP_number(rs.getInt(2));
				review_place.setRp_username(rs.getString(3));
				review_place.setRp_nationality(rs.getString(4));
				review_place.setRp_agerange(rs.getString(5));
				review_place.setRp_comment(rs.getString(6));
				review_place.setRp_createdate(rs.getString(7));
				review_place.setRp_available(rs.getInt(8));
				return review_place;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null; // 해당글 존재 x
	}
	
	public int update(int rp_number, String rp_comment) {
		String SQL = "UPDATE triview SET rp_comment = ? WHERE rp_number = ?";
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
		String SQL = "UPDATE triview SET rp_available = 0 WHERE rp_number = ?";
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
package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {
    
    private Connection conn;            // DB에 접근하는 객체
    private PreparedStatement pstmt;    // 
    private ResultSet rs;                // DB data를 담을 수 있는 객체  (Ctrl + shift + 'o') -> auto import
    
    public UserDAO(){ 
        try {
            String dbURL = "jdbc:mysql://localhost:3306/triview";
            String dbID = "root";
            String dbPassword = "tpahfdl3310";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    public int login(String u_id, String u_password) {
        String SQL = "SELECT u_password FROM user WHERE u_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, u_id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(u_password))
                    return 1;    // 로그인 성공
                else
                    return 0; // 비밀번호 불일치
            }
            return -1; // ID가 없음
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // DB 오류
        
    }
    public int join(User user) {
        String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getU_name());
            pstmt.setString(2, user.getU_id());
            pstmt.setString(3, user.getU_password());
            pstmt.setString(4, user.getU_nationality());
            pstmt.setString(5, user.getU_race());
            pstmt.setString(6, user.getU_address());
            pstmt.setDate(7, getDate());
            
            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
	private Date getDate() {
		// TODO Auto-generated method stub
		return null;
	}
	
    

 
}
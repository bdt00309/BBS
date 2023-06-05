package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbDrv = "oracle.jdbc.driver.OracleDriver";
			String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String dbUsr = "bbs";
			String dbPwd = "1234";	
			
			Class.forName(dbDrv);
			conn = DriverManager.getConnection(dbUrl, dbUsr, dbPwd);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} 
	}
	
	public int login(String userId, String userPasswd) {
		String sql = "select userPasswd from member where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPasswd)) {
					return 1; // 로그인 성공
				} else {
					return 0;
				}
			}
			return -1; // 아이디 없음
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
		
	}
	
	public int join(User user) {
		String sql = "insert into member (userId, userpasswd, username, usergender, useremail) values (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPasswd());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  // db 오류
	}
	
	
	
}


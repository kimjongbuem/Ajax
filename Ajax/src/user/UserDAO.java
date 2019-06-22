package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
	private ResultSet rs;
	private PreparedStatement pstmt;
	private Connection conn;
	
	public UserDAO() {
		String dbID = "root"; String dbPassword = "4010kjbv";
		String dbURL = "jdbc:mysql://localhost:3307/AJAX?characterEncoding=UTF-8&serverTimezone=UTC";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<User> search(String name){
		String SQL = "select* from where userName LIKE ?";// 이름의 하나만 포함되도 데이터에 출력이되게.
		ArrayList<User> userList = new ArrayList<User>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setUserName(rs.getString(1));
				user.setAge(rs.getInt(2));
				user.setUserGender(rs.getString(3));
				user.setUserEmail(rs.getString(4));
				userList.add(user);
			}
		}catch(Exception e) {
			System.out.println("데이터베이스 검색오류");
		}
		return userList;
	}
}

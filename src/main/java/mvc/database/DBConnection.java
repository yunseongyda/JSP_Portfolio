package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		Connection conn = null;
		String url = "jdbc:oracle:thin:@192.168.123.101:1521:xe";
		// String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
		String user = "C##dbexam";
		String password = "m1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//Class.forName("com.mysql.jdbc.Driver");
		System.out.println("드라이버 등록 성공");
		
		// Connection 객체에 연결 결과 할당
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("접속 성공하응");
		
		// conn이 null인지 확인 (디버깅용)
		if (conn != null) System.out.println("DB 연결 확인 성공");
		return conn;
	}
}

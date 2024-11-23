package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mvc.database.DBConnection;

public class BoardDAO {
	private static BoardDAO instance;
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		if(instance == null) instance = new BoardDAO();
		return instance;
	}
	
	// 게시판 하단의 페이징과 검색기능이 구현되면서 DB에서 원하는 조건에 맞는 레코드 개수를 얻어오는 함수
	public int getListCount(String items, String text) {
		// items: 컬럼명, text: 검색 문자열
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0; // 선택된 총 게시글의 개수
		
		String sql;
		
		if (items == null && text == null) // 검색을 안 했을 때
			sql = "select count(*) from board";
		else
			sql = "select count(*) from board where"+items+"like '%"+text+"%'";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x= rs.getInt(x);
		} catch(Exception e) {
			System.out.println("getListCount() error: "+e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return x; // 선택된 총 게시글의 개수 리턴
	}
}
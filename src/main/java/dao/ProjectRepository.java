package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Project;
import mvc.database.DBConnection;

public class ProjectRepository {
	/*private ArrayList<Product> listOfProducts = new ArrayList<Product>();	//상품 목록
*/	// 싱글톤 객체 생성
	private static ProjectRepository instance = new ProjectRepository();
	public static ProjectRepository getInstance() {
		return instance;
	}
	
	public ProjectRepository() {
		
	}
	
	/*public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}*/
	
	// 상품의 아이디를 이용해서 제품에 대한 정보를 얻어오는 메소드
	/*public Product getProductById(String productId) {
		Product productById = null;
		
		for (int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) { // product에 뭔가가 있고 productId랑 get해서 받아온 거랑 같은지 
				productById = product;
				break;
			}
		}
		return productById;
	}*/
	// 하나의 제품에 대한 다양한 정보를 제공
	/*public void addProduct(Product product) {
		listOfProducts.add(product);
	}*/
	
	
	public Project getPortfolio(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		Project project = new Project();
		try {
			conn = DBConnection.getConnection();
			if (id == null || id.isEmpty()) sql = "select * from portfolio";
			else sql = "select * from portfolio where p_id = '"+ id +"'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				project.setP_id(rs.getString("p_id"));
				project.setP_name(rs.getString("p_name"));
				project.setP_description(rs.getString("p_description"));
				project.setP_img_name(rs.getString("p_img_name"));
				project.setP_like_count(rs.getInt("p_like_counts"));
				project.setP_type(rs.getString("p_type"));
				project.setP_language_type(rs.getString("p_language_type"));
			}
		}
		catch(Exception e) {
			System.out.println("getListCount() error: "+e);
		}
		finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return project;
	}
	
	public List<Project> getAllProject(String constraint){
		List<Project> projects = new ArrayList<Project>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		try {
			conn = DBConnection.getConnection();
			if (constraint == null || constraint.isEmpty()) sql = "select * from portfolio";
			else sql = "select * from portfolio where p_name like '%"+constraint+"%' or p_description like '%"+constraint+"%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Project project = new Project();
				project.setP_id(rs.getString("p_id"));
				project.setP_name(rs.getString("p_name"));
				project.setP_description(rs.getString("p_description"));
				project.setP_img_name(rs.getString("p_img_name"));
				project.setP_like_count(rs.getInt("p_like_counts"));
				project.setP_type(rs.getString("p_type"));
				project.setP_language_type(rs.getString("p_language_type"));
				projects.add(project);
			}
		}
		catch(Exception e) {
			System.out.println("getListCount() error: "+e);
		}
		finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return projects;
	}
}

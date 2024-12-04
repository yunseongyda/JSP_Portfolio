package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	
	public List<Project> getAllProject(String constraint){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		try {
			conn = DBConnection.getConnection();
			
		}
		catch(Exception e) {
			
		}
		finally {
			
		}
	}
}

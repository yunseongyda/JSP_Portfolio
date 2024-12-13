package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();	//상품 목록
	// 싱글톤 객체 생성
	private static ProductRepository instance = new ProductRepository();
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		/*
		Product phone1 = new Product("P001", "삼성Phone 8v");
		phone1.setDescription("폰이다");
		phone1.setFileName("nmixx_O.O01.jpg");
		
		Product phone2 = new Product("P002", "삼성Phone 2hyogayv");
		phone2.setDescription("폰이 아니다");
		phone2.setFileName("nmixx_Sonar01.jpg");
		
		Product phone3 = new Product("P003", "삼성Phone 1v");
		phone3.setDescription("기보에 비질");
		phone3.setFileName("nmixx_bae01.jpg");
		
		// 상품목록을 리스트에 추가
		listOfProducts.add(phone1);
		listOfProducts.add(phone2);
		listOfProducts.add(phone3);
		*/
	}
	
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	// 상품의 아이디를 이용해서 제품에 대한 정보를 얻어오는 메소드
	public Product getProductById(String productId) {
		Product productById = null;
		
		for (int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) { // product에 뭔가가 있고 productId랑 get해서 받아온 거랑 같은지 
				productById = product;
				break;
			}
		}
		return productById;
	}
	// 하나의 제품에 대한 다양한 정보를 제공
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}

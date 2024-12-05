package dto;

import java.io.Serializable;

public class Product implements Serializable{
	private String productId;
	private String pname;
	private String description;
	private String fileName; // 이미지 파일명
	private int quantity; // 좋아요를 누른 횟수
	
	
	public Product() {
		super();
	}

	public Product(String productId, String pname) {
		super();
		this.productId = productId;
		this.pname = pname;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}

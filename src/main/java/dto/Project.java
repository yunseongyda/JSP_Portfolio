package dto;

import java.io.Serializable;

public class Project implements Serializable{
	private String p_id;
	private String p_name;
	private String p_description;
	private String p_img_name; // 이미지 파일명
	private int p_like_count; // 좋아요를 누른 횟수
	private String p_type;
	private String p_language_type;
	
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_description() {
		return p_description;
	}
	public void setP_description(String p_description) {
		this.p_description = p_description;
	}
	public String getP_img_name() {
		return p_img_name;
	}
	public void setP_img_name(String p_img_name) {
		this.p_img_name = p_img_name;
	}
	public int getP_like_count() {
		return p_like_count;
	}
	public void setP_like_count(int p_like_count) {
		this.p_like_count = p_like_count;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_language_type() {
		return p_language_type;
	}
	public void setP_language_type(String p_language_type) {
		this.p_language_type = p_language_type;
	}
}

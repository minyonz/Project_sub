package com.dp.ggomjirak.vo;

public class CateStrVo {

	private String user_id;
	private String cate_no1;
	private String cate_no2;
	private String cate_no3;
	public CateStrVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CateStrVo(String user_id, String cate_no1, String cate_no2, String cate_no3) {
		super();
		this.user_id = user_id;
		this.cate_no1 = cate_no1;
		this.cate_no2 = cate_no2;
		this.cate_no3 = cate_no3;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCate_no1() {
		return cate_no1;
	}
	public void setCate_no1(String cate_no1) {
		this.cate_no1 = cate_no1;
	}
	public String getCate_no2() {
		return cate_no2;
	}
	public void setCate_no2(String cate_no2) {
		this.cate_no2 = cate_no2;
	}
	public String getCate_no3() {
		return cate_no3;
	}
	public void setCate_no3(String cate_no3) {
		this.cate_no3 = cate_no3;
	}
	@Override
	public String toString() {
		return "CateVo [user_id=" + user_id + ", cate_no1=" + cate_no1 + ", cate_no2=" + cate_no2 + ", cate_no3="
				+ cate_no3 + "]";
	}
	
	
	}

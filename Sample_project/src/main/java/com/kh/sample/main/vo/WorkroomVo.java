package com.kh.sample.main.vo;

public class WorkroomVo {
	private String user_id;
	private String wr_name;
	private String wr_intro;
	private String cate_no1;
	private String cate_no2;
	private String cate_no3;
	
	public WorkroomVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WorkroomVo(String user_id, String wr_name, String wr_intro, String cate_no1, String cate_no2,
			String cate_no3) {
		super();
		this.user_id = user_id;
		this.wr_name = wr_name;
		this.wr_intro = wr_intro;
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
	public String getWr_name() {
		return wr_name;
	}
	public void setWr_name(String wr_name) {
		this.wr_name = wr_name;
	}
	public String getWr_intro() {
		return wr_intro;
	}
	public void setWr_intro(String wr_intro) {
		this.wr_intro = wr_intro;
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
		return "WorkroomVo [user_id=" + user_id + ", wr_name=" + wr_name + ", wr_intro=" + wr_intro + ", cate_no1="
				+ cate_no1 + ", cate_no2=" + cate_no2 + ", cate_no3=" + cate_no3 + "]";
	}
	
}

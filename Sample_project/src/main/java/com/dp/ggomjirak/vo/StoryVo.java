package com.dp.ggomjirak.vo;

import java.sql.Timestamp;

public class StoryVo {
	private int st_no;
	private String user_id;
	private String st_content;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private String st_img;
	private int st_like_count;
	private int st_c_count;
	
	public StoryVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoryVo(int st_no, String user_id, String st_content, Timestamp reg_date, Timestamp mod_date, String st_img,
			int st_like_count, int st_c_count) {
		super();
		this.st_no = st_no;
		this.user_id = user_id;
		this.st_content = st_content;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.st_img = st_img;
		this.st_like_count = st_like_count;
		this.st_c_count = st_c_count;
	}

	public int getSt_no() {
		return st_no;
	}

	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSt_content() {
		return st_content;
	}

	public void setSt_content(String st_content) {
		this.st_content = st_content;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public Timestamp getMod_date() {
		return mod_date;
	}

	public void setMod_date(Timestamp mod_date) {
		this.mod_date = mod_date;
	}

	public String getSt_img() {
		return st_img;
	}

	public void setSt_img(String st_img) {
		this.st_img = st_img;
	}

	public int getSt_like_count() {
		return st_like_count;
	}

	public void setSt_like_count(int st_like_count) {
		this.st_like_count = st_like_count;
	}

	public int getSt_c_count() {
		return st_c_count;
	}

	public void setSt_c_count(int st_c_count) {
		this.st_c_count = st_c_count;
	}

	@Override
	public String toString() {
		return "StoryVo [st_no=" + st_no + ", user_id=" + user_id + ", st_content=" + st_content + ", reg_date="
				+ reg_date + ", mod_date=" + mod_date + ", st_img=" + st_img + ", st_like_count=" + st_like_count
				+ ", st_c_count=" + st_c_count + "]";
	}

}

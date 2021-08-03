package com.dp.ggomjirak.vo;

import java.sql.Timestamp;

public class StoryCommentVo {
	private int st_c_no;
	private String user_id;
	private int st_no;
	private String st_c_content;
	private int st_c_parent_no;
	private int st_c_depth;
	private int st_c_order;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private String is_del;
	
	public StoryCommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoryCommentVo(int st_c_no, String user_id, int st_no, String st_c_content, int st_c_parent_no,
			int st_c_depth, int st_c_order, Timestamp reg_date, Timestamp mod_date, String is_del) {
		super();
		this.st_c_no = st_c_no;
		this.user_id = user_id;
		this.st_no = st_no;
		this.st_c_content = st_c_content;
		this.st_c_parent_no = st_c_parent_no;
		this.st_c_depth = st_c_depth;
		this.st_c_order = st_c_order;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.is_del = is_del;
	}
	public int getSt_c_no() {
		return st_c_no;
	}
	public void setSt_c_no(int st_c_no) {
		this.st_c_no = st_c_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getSt_no() {
		return st_no;
	}
	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}
	public String getSt_c_content() {
		return st_c_content;
	}
	public void setSt_c_content(String st_c_content) {
		this.st_c_content = st_c_content;
	}
	public int getSt_c_parent_no() {
		return st_c_parent_no;
	}
	public void setSt_c_parent_no(int st_c_parent_no) {
		this.st_c_parent_no = st_c_parent_no;
	}
	public int getSt_c_depth() {
		return st_c_depth;
	}
	public void setSt_c_depth(int st_c_depth) {
		this.st_c_depth = st_c_depth;
	}
	public int getSt_c_order() {
		return st_c_order;
	}
	public void setSt_c_order(int st_c_order) {
		this.st_c_order = st_c_order;
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
	public String getIs_del() {
		return is_del;
	}
	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}
	@Override
	public String toString() {
		return "StoryCommentVo [st_c_no=" + st_c_no + ", user_id=" + user_id + ", st_no=" + st_no + ", st_c_content="
				+ st_c_content + ", st_c_parent_no=" + st_c_parent_no + ", st_c_depth=" + st_c_depth + ", st_c_order="
				+ st_c_order + ", reg_date=" + reg_date + ", mod_date=" + mod_date + ", is_del=" + is_del + "]";
	}
	
}

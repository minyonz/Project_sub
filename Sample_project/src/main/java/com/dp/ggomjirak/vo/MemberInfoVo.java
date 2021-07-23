package com.dp.ggomjirak.vo;

import java.sql.Timestamp;

public class MemberInfoVo {

	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String user_tel;
	private Timestamp reg_date;
	private String is_del;
	private Timestamp del_date;
	public MemberInfoVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberInfoVo(String user_id, String user_pw, String user_name, String user_email, String user_tel,
			Timestamp reg_date, String is_del, Timestamp del_date) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_tel = user_tel;
		this.reg_date = reg_date;
		this.is_del = is_del;
		this.del_date = del_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getIs_del() {
		return is_del;
	}
	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}
	public Timestamp getDel_date() {
		return del_date;
	}
	public void setDel_date(Timestamp del_date) {
		this.del_date = del_date;
	}
	@Override
	public String toString() {
		return "MemberInfoVo [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name
				+ ", user_email=" + user_email + ", user_tel=" + user_tel + ", reg_date=" + reg_date + ", is_del="
				+ is_del + ", del_date=" + del_date + "]";
	}
	
	
}

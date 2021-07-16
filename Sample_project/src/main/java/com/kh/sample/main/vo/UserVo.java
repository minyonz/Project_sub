package com.kh.sample.main.vo;

public class UserVo {
	String user_id;
	String user_pw;
	
	public UserVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserVo(String user_id, String user_pw) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
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
	@Override
	public String toString() {
		return "UserVo [user_id=" + user_id + ", user_pw=" + user_pw + "]";
	}
	
}


package com.dp.ggomjirak.vo;

import java.sql.Timestamp;
import java.text.DateFormat;

public class LoginVo {

	// 로그인한 사용자의 정보를 담아두는 곳
	// 세션에 아아디만 따로 담아서 사용하는 방법을 몰라서 추가함... 
	private String user_id;
	private DateFormat login_time;
	
	public LoginVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoginVo(String user_id, DateFormat login_time) {
		super();
		this.user_id = user_id;
		this.login_time = login_time;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public DateFormat getLogin_time() {
		return login_time;
	}

	public void setLogin_time(DateFormat login_time) {
		this.login_time = login_time;
	}

	@Override
	public String toString() {
		return "LoginVo [user_id=" + user_id + ", login_time=" + login_time + "]";
	}

	
	
}

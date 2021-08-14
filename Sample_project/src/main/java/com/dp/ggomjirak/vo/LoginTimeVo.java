package com.dp.ggomjirak.vo;

public class LoginTimeVo {

	private String user_id;
	private String login_time;
	
	private int rnum;
	
	
	public LoginTimeVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoginTimeVo(String user_id, String login_time, int rnum) {
		super();
		this.user_id = user_id;
		this.login_time = login_time;
		this.rnum = rnum;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getLogin_time() {
		return login_time;
	}

	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "LoginTimeVo [user_id=" + user_id + ", login_time=" + login_time + ", rnum=" + rnum + "]";
	}
	
	
	
}

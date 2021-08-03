package com.dp.ggomjirak.vo;

import java.sql.Timestamp;

public class MemberDetailVo {

	private String user_id;
	private String user_nick;
	private int cate_no1;
	private int cate_no2;
	private int cate_no3;
	private String cate_etc;
	private int follower_cnt;
	private int following_cnt;
	private String user_img;
	private int user_grade;
	private Timestamp reg_date;
	public MemberDetailVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberDetailVo(String user_id, String user_nick, int cate_no1, int cate_no2, int cate_no3, String cate_etc,
			int follower_cnt, int following_cnt, String user_img, int user_grade, Timestamp reg_date) {
		super();
		this.user_id = user_id;
		this.user_nick = user_nick;
		this.cate_no1 = cate_no1;
		this.cate_no2 = cate_no2;
		this.cate_no3 = cate_no3;
		this.cate_etc = cate_etc;
		this.follower_cnt = follower_cnt;
		this.following_cnt = following_cnt;
		this.user_img = user_img;
		this.user_grade = user_grade;
		this.reg_date = reg_date;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public int getCate_no1() {
		return cate_no1;
	}
	public void setCate_no1(int cate_no1) {
		this.cate_no1 = cate_no1;
	}
	public int getCate_no2() {
		return cate_no2;
	}
	public void setCate_no2(int cate_no2) {
		this.cate_no2 = cate_no2;
	}
	public int getCate_no3() {
		return cate_no3;
	}
	public void setCate_no3(int cate_no3) {
		this.cate_no3 = cate_no3;
	}
	public String getCate_etc() {
		return cate_etc;
	}
	public void setCate_etc(String cate_etc) {
		this.cate_etc = cate_etc;
	}
	public int getFollower_cnt() {
		return follower_cnt;
	}
	public void setFollower_cnt(int follower_cnt) {
		this.follower_cnt = follower_cnt;
	}
	public int getFollowing_cnt() {
		return following_cnt;
	}
	public void setFollowing_cnt(int following_cnt) {
		this.following_cnt = following_cnt;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public int getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(int user_grade) {
		this.user_grade = user_grade;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "MemberDetailVo [user_id=" + user_id + ", user_nick=" + user_nick + ", cate_no1=" + cate_no1
				+ ", cate_no2=" + cate_no2 + ", cate_no3=" + cate_no3 + ", cate_etc=" + cate_etc + ", follower_cnt="
				+ follower_cnt + ", following_cnt=" + following_cnt + ", user_img=" + user_img + ", user_grade="
				+ user_grade + ", reg_date=" + reg_date + "]";
	}
	
	
}

package com.dp.ggomjirak.vo;

public class MemberActivVo {

	private String user_id;
	private int content_cnt;
	private int comment_cnt;
	private int ask_cnt;
	private int like_all_cnt;
	public MemberActivVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberActivVo(String user_id, int content_cnt, int comment_cnt, int ask_cnt, int like_all_cnt) {
		super();
		this.user_id = user_id;
		this.content_cnt = content_cnt;
		this.comment_cnt = comment_cnt;
		this.ask_cnt = ask_cnt;
		this.like_all_cnt = like_all_cnt;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getContent_cnt() {
		return content_cnt;
	}
	public void setContent_cnt(int content_cnt) {
		this.content_cnt = content_cnt;
	}
	public int getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	public int getAsk_cnt() {
		return ask_cnt;
	}
	public void setAsk_cnt(int ask_cnt) {
		this.ask_cnt = ask_cnt;
	}
	public int getLike_all_cnt() {
		return like_all_cnt;
	}
	public void setLike_all_cnt(int like_all_cnt) {
		this.like_all_cnt = like_all_cnt;
	}
	@Override
	public String toString() {
		return "MemberActivVo [user_id=" + user_id + ", content_cnt=" + content_cnt + ", comment_cnt=" + comment_cnt
				+ ", ask_cnt=" + ask_cnt + ", like_all_cnt=" + like_all_cnt + "]";
	}
	
	
}

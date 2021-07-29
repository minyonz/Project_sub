package com.dp.ggomjirak.vo;

import java.sql.Timestamp;

public class FollowVo {
	private String following;
	private String follower;
	private Timestamp follow_date;
	// 팔로잉, 팔로우 목록용
	private String user_nick;
	private String user_img;
	
	public FollowVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FollowVo(String following, String follower, Timestamp follow_date, String user_nick, String user_img) {
		super();
		this.following = following;
		this.follower = follower;
		this.follow_date = follow_date;
		this.user_nick = user_nick;
		this.user_img = user_img;
	}

	public String getFollowing() {
		return following;
	}

	public void setFollowing(String following) {
		this.following = following;
	}

	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}

	public Timestamp getFollow_date() {
		return follow_date;
	}

	public void setFollow_date(Timestamp follow_date) {
		this.follow_date = follow_date;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	@Override
	public String toString() {
		return "FollowVo [following=" + following + ", follower=" + follower + ", follow_date=" + follow_date
				+ ", user_nick=" + user_nick + ", user_img=" + user_img + "]";
	}
	
}

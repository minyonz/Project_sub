package com.dp.ggomjirak.vo;

import java.sql.Timestamp;

public class FollowVo {
	private String following;
	private String follower;
	private Timestamp follow_date;
	
	public FollowVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FollowVo(String following, String follower, Timestamp follow_date) {
		super();
		this.following = following;
		this.follower = follower;
		this.follow_date = follow_date;
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

	@Override
	public String toString() {
		return "FollowVo [following=" + following + ", follower=" + follower + ", follow_date=" + follow_date + "]";
	}
	
}

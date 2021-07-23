package com.dp.ggomjirak.my.dao;

import com.dp.ggomjirak.vo.FollowVo;

public interface FollowDao {
	public void insertFollow(FollowVo followVo);
	public void deleteFollow(FollowVo followVo);
	// 팔로우 여부
	public int checkFollow(FollowVo followVo);
	// 팔로우시 팔로워 수 증가(팔로우 당하는 사람의 팔로워 수)
	public void updateFollower(String user_id, int count);
	// 팔로우시 팔로잉 수 증가(팔로우 하는 사람의 팔로잉 수)
	
	// 한 사람의 팔로우 팔로잉 수 가져오기
	public int countFollower(String user_id);
}

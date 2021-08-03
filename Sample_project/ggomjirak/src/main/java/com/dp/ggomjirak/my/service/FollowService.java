package com.dp.ggomjirak.my.service;

import com.dp.ggomjirak.vo.FollowVo;

public interface FollowService {
	public boolean follow(FollowVo followVo);
//	public boolean unFollow(FollowVo followVo);
	public int checkFollow(FollowVo followVo);
	public int countFollower(String user_id);
}

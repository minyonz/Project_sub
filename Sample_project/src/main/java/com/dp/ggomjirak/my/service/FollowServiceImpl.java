package com.dp.ggomjirak.my.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dp.ggomjirak.my.dao.FollowDao;
import com.dp.ggomjirak.vo.FollowVo;

@Service
public class FollowServiceImpl implements FollowService {

	@Inject
	FollowDao followDao;

	@Override
	public int checkFollow(FollowVo followVo) {
		int count = followDao.checkFollow(followVo);
		return count;
	}

	@Transactional
	@Override
	public boolean follow(FollowVo followVo) {
		int count = followDao.checkFollow(followVo);
		// 팔로우, 언팔로우
		if (count <= 0) {
			followDao.insertFollow(followVo);
			// 팔로워 + 1
			followDao.updateFollower(followVo.getFollowing(), 1);
			// 팔로잉 + 1
			followDao.updateFollowing(followVo.getFollower(), 1);
			return true;
		} else if (count > 0) {
			followDao.deleteFollow(followVo);
			followDao.updateFollower(followVo.getFollowing(), -1);
			followDao.updateFollowing(followVo.getFollower(), -1);
		}
		return false;
	}
	
	@Override
	public int countFollower(String user_id) {
		int countFollow = followDao.countFollower(user_id);
		return countFollow;
	}

}

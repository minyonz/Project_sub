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
		if (count <= 0) {
			followDao.insertFollow(followVo);
			followDao.updateFollower(followVo.getFollowing(), 1);
			return true;
		}
		return false;
	}

	@Transactional
	@Override
	public boolean unFollow(FollowVo followVo) {
		int count = followDao.checkFollow(followVo);
		if (count > 0) {
			followDao.deleteFollow(followVo);
			followDao.updateFollower(followVo.getFollowing(), -1);
			return true;
		}
		return false;
	}

	@Override
	public int countFollower(String user_id) {
		int countFollow = followDao.countFollower(user_id);
		return countFollow;
	}

}

package com.dp.ggomjirak.my.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.FollowVo;

@Repository
public class FollowDaoImpl implements FollowDao{

	private static final String NAMESPACE = "com.dp.ggomjirak.follow.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertFollow(FollowVo followVo) {
		sqlSession.insert(NAMESPACE + "insertFollow", followVo);
	}

	@Override
	public void deleteFollow(FollowVo followVo) {
		sqlSession.delete(NAMESPACE + "deleteFollow", followVo);
	}

	@Override
	public int checkFollow(FollowVo followVo) {
		int count = sqlSession.selectOne(NAMESPACE + "checkFollow", followVo);
		return count;
	}

	@Override
	public void updateFollower(String user_id, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("count", count);
		sqlSession.update(NAMESPACE + "updateFollower", map);
	}
	
	@Override
	public void updateFollowing(String user_id, int count) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("count", count);
		sqlSession.update(NAMESPACE + "updateFollowing", map);
		
	}

	@Override
	public int countFollower(String user_id) {
		int count = sqlSession.selectOne(NAMESPACE + "countFollower", user_id);
		System.out.println("daoCount:" + count);
		return count;
	}

}

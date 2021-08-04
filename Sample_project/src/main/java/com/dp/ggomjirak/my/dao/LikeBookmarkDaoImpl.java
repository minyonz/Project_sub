package com.dp.ggomjirak.my.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LikeBookmarkDaoImpl implements LikeBookmarkDao {

	private static final String NAMESPACE = "com.dp.ggomjirak.likeBookmark.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void updateLikeCount(int hobby_no, int count) {
		Map<String, Integer> map = new HashMap<>();
		map.put("hobby_no", hobby_no);
		map.put("count", count);
		sqlSession.update(NAMESPACE + "updateLikeCount", map);
	}

	@Override
	public void insertLike(int hobby_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("hobby_no", hobby_no);
		map.put("user_id", user_id);
		sqlSession.insert(NAMESPACE + "insertLike", map);
	}

	@Override
	public void deleteLike(int hobby_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("hobby_no", hobby_no);
		map.put("user_id", user_id);
		sqlSession.delete(NAMESPACE + "deleteLike", map);
	}

	@Override
	public int likeCheck(int hobby_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("hobby_no", hobby_no);
		map.put("user_id", user_id);
		int count = sqlSession.selectOne(NAMESPACE + "likeCheck", map);
		return count;
	}

	@Override
	public int likeAll(int hobby_no) {
		int count = sqlSession.selectOne(NAMESPACE + "likeAll", hobby_no);
		System.out.println("dao count:" + count);
		return count;
	}

	@Override
	public void insertBookmark(int hobby_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("hobby_no", hobby_no);
		map.put("user_id", user_id);
		sqlSession.insert(NAMESPACE + "insertBookmark", map);
	}

	@Override
	public void deleteBookmark(int hobby_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("hobby_no", hobby_no);
		map.put("user_id", user_id);
		sqlSession.delete(NAMESPACE + "deleteBookmark", map);
	}

	@Override
	public int bookmarkCheck(int hobby_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("hobby_no", hobby_no);
		map.put("user_id", user_id);
		int count = sqlSession.selectOne(NAMESPACE + "bookmarkCheck", map);
		return count;
	}

}

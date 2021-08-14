package com.dp.ggomjirak.my.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MadeByMeVo;

@Repository
public class MadeByMeDaoImpl implements MadeByMeDao {

	private static final String NAMESPACE = "com.dp.ggomjirak.madebyme.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertMbm(MadeByMeVo madebymeVo) {
		sqlSession.insert(NAMESPACE + "insertMbm", madebymeVo);
	}

	@Override
	public HobbyVo selectHobby(int hobby_no) {
		HobbyVo hobbyVo = sqlSession.selectOne(NAMESPACE + "selectHobby", hobby_no);
		return hobbyVo;
	}
	
	@Override
	public List<MadeByMeVo> listMbm(int hobby_no) {
		List<MadeByMeVo> list = sqlSession.selectList(NAMESPACE + "listMbm", hobby_no);
		return list;
	}


	@Override
	public void updateViewCnt(int mbm_no) {
		sqlSession.update(NAMESPACE + "updateViewCnt", mbm_no);
	}

	@Override
	public MadeByMeVo selectMbm(int mbm_no, int hobby_no) {
		Map<String, Integer> map = new HashMap<>();
		map.put("mbm_no", mbm_no);
		map.put("hobby_no", hobby_no);
		MadeByMeVo madebymeVo = sqlSession.selectOne(NAMESPACE + "selectMbm", map);
		return madebymeVo;
	}

	@Override
	public void updateMbm(MadeByMeVo madebymeVo) {
		sqlSession.update(NAMESPACE + "updateMbm", madebymeVo);
	}

	@Override
	public void updateLikeCount(int mbm_no, int count) {
		Map<String, Integer> map = new HashMap<>();
		map.put("mbm_no", mbm_no);
		map.put("count", count);
		sqlSession.update(NAMESPACE + "updateLikeCount", map);
	}

	@Override
	public void insertLike(int mbm_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("mbm_no", mbm_no);
		map.put("user_id", user_id);
		sqlSession.insert(NAMESPACE + "insertLike", map);
	}

	@Override
	public void deleteLike(int mbm_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("mbm_no", mbm_no);
		map.put("user_id", user_id);
		sqlSession.delete(NAMESPACE + "deleteLike", map);
	}

	@Override
	public int likeCheck(int mbm_no, String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("mbm_no", mbm_no);
		map.put("user_id", user_id);
		int count = sqlSession.selectOne(NAMESPACE + "likeCheck", map);
		return count;
	}

	@Override
	public int likeAll(int mbm_no) {
		int count = sqlSession.selectOne(NAMESPACE + "likeAll", mbm_no);
		return count;
	}

	@Override
	public void deleteMbm(int mbm_no, int hobby_no) {
		Map<String, Integer> map = new HashMap<>();
		map.put("mbm_no", mbm_no);
		map.put("hobby_no", hobby_no);
		sqlSession.update(NAMESPACE + "deleteMbm", map);
	}

}

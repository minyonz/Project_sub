package com.dp.ggomjirak.yj.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.CostVo;
import com.dp.ggomjirak.vo.LevelVo;
import com.dp.ggomjirak.vo.TimeVo;

@Repository("yj.CateDaoImpl")
public class CateDaoImpl implements CateDao {
	private static final String NAMESPACE = "com.dp.ggomjirak.cate.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<CateVo> getCateList() {
		return sqlSession.selectList(NAMESPACE + "getCateList");
	}

	@Override
	public List<TimeVo> getTimeList() {
		return sqlSession.selectList(NAMESPACE + "getTimeList");
	}

	@Override
	public List<LevelVo> getLevelList() {
		return sqlSession.selectList(NAMESPACE + "getLevelList");
	}

	@Override
	public List<CostVo> getCostList() {
		return sqlSession.selectList(NAMESPACE + "getCostList");
	}

}

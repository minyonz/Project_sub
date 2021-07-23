package com.dp.ggomjirak.kty.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.CateVo;

@Repository
public class CateDaoImpl implements CateDao {

	private static final String NAMESPACE = "com.dp.ggomjirak.cate.";

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<CateVo> listAll() {
		List<CateVo> list = sqlSession.selectList(NAMESPACE + "getCateList1");
		return list;
	}

	@Override
	public List<CateVo> listPart(int parent_cate_no) {
		List<CateVo> list = sqlSession.selectList(NAMESPACE + "getCateList2", parent_cate_no);
		return list;
	}

}

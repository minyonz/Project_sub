package com.dp.ggomjirak.yj.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MaterialSearch;
import com.dp.ggomjirak.vo.MaterialVo;

@Repository
public class MaterialDaoImpl implements MaterialDao {
	
	private static final String NAMESPACE = "com.dp.ggomjirak.material.";
	
	@Inject
	SqlSession sqlSession;
	

	@Override
	public MaterialVo getMaterialVo(String material_name) {
		MaterialVo materialVo = sqlSession.selectOne(NAMESPACE + "getMaterialVo", material_name);
		return materialVo;
	}


	@Override
	public void insertMaterial(String materialName) {
		sqlSession.insert(NAMESPACE + "insertMaterial", materialName);
	}


	@Override
	public int getMaterialNo(String materialName) {
		return sqlSession.selectOne(NAMESPACE + "getMaterialNo", materialName);
	}

//	 __________준비물로 목록조회 ___________

	@Override
	public List<HobbyVo> selectHMList(MaterialSearch materialSearch) {
		return sqlSession.selectList(NAMESPACE + "selectHMList", materialSearch);
	}
//


	@Override
	public MaterialVo getMaterialVoByNo(int material_no) {
		return sqlSession.selectOne(NAMESPACE + "getMaterialVoByNo", material_no);
	}


	@Override
	public int getCountHMList(MaterialSearch materialSearch) {
		return sqlSession.selectOne(NAMESPACE + "getCountHMList", materialSearch);
	}





}

package com.dp.ggomjirak.yj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.CompleteImgVo;
import com.dp.ggomjirak.vo.HobbyMaterialVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MakeStepVo;
import com.dp.ggomjirak.vo.MaterialVo;

@Repository
public class HobbyDaoImpl implements HobbyDao {
	
	private static final String NAMESPACE = "com.dp.ggomjirak.hobby.";
	
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public int insertHobby(HobbyVo hobbyVo) {
		sqlSession.insert(NAMESPACE + "insertHobby", hobbyVo);
		return hobbyVo.getHobby_no();
	}

	@Override
	public HobbyVo selectHobby(int hobby_no) {
		return sqlSession.selectOne(NAMESPACE + "selectHobby", hobby_no);
	}

	@Override
	public int insertMakeStepVo(List<MakeStepVo> makeSteps) {
		return sqlSession.insert(NAMESPACE + "insertMakeStep", makeSteps);
		
	}


	@Override
	public int insertHobbyMaterial(List<HobbyMaterialVo> hobbyMaterials) {
		return sqlSession.insert(NAMESPACE + "insertHobbyMaterial", hobbyMaterials);
		
	}

	
	@Override
	public int insertCompleteImg(List<CompleteImgVo> completeImgs) {
		return sqlSession.insert(NAMESPACE + "insertCompleteImg", completeImgs);
		
	}


	@Override
	public List<HobbyMaterialVo> selectHobbyMaterialList(int hobby_no) {
		return sqlSession.selectList(NAMESPACE + "selectHobbyMaterialList", hobby_no);
	}


	@Override
	public List<MakeStepVo> selectMakeStepList(int hobby_no) {
		return sqlSession.selectList(NAMESPACE + "selectMakeStepList", hobby_no);
	}

	@Override
	public List<CompleteImgVo> selectCompleteImgListNotNull(int hobby_no) {
		return sqlSession.selectList(NAMESPACE + "selectCompleteImgListNotNull", hobby_no);
	}

	@Override
	public List<CompleteImgVo> selectCompleteImgListAll(int hobby_no) {
		return sqlSession.selectList(NAMESPACE + "selectCompleteImgListAll", hobby_no);
	}

	@Override
	public String selectCompleteImgName(CompleteImgVo completeImgVo) {
		return sqlSession.selectOne(NAMESPACE + "selectCompleteImgName", completeImgVo);
		
	}

	@Override
	public String selectMainImg(int hobby_no) {
		return sqlSession.selectOne(NAMESPACE + "selectMainImg", hobby_no);
	}


	@Override
	public int updateHobbyMaterial(List<HobbyMaterialVo> hobbyMaterials) {
		return sqlSession.update(NAMESPACE + "updateHobbyMaterial", hobbyMaterials);
	}

	@Override
	public int updateMakeStep(List<MakeStepVo> makeSteps) {
		return sqlSession.update(NAMESPACE + "updateMakeStep", makeSteps);
	}

	@Override
	public int deleteHobbyMaterial(List<HobbyMaterialVo> hobbyMaterials) {
		return sqlSession.update(NAMESPACE + "deleteHobbyMaterial", hobbyMaterials);
	}

	@Override
	public int deleteMakeStep(List<MakeStepVo> makeSteps) {
		return sqlSession.update(NAMESPACE + "deleteMakeStep", makeSteps);
	}

	@Override
	public int updateCompleteImg(List<CompleteImgVo> completeImgs) {
		return sqlSession.update(NAMESPACE + "updateCompleteImg", completeImgs);
	}

	@Override
	public int updateHobby(HobbyVo hobbyVo) {
		return sqlSession.update(NAMESPACE + "updateHobby", hobbyVo);
		
	}

	@Override
	public int deleteHobby(int hobby_no) {
		return sqlSession.update(NAMESPACE + "deleteHobby", hobby_no);
	}

	@Override
	public int updateViewCnt(int hobby_no) {
		return sqlSession.update(NAMESPACE + "updateViewCnt", hobby_no);
	}

	@Override
	public int updateCmtCnt(int hobby_no, int count) {
		Map<String, Integer> map = new HashMap<>();
		map.put("hobby_no", hobby_no);
		map.put("count", count);
		return sqlSession.update(NAMESPACE + "updateCmtCnt", map);
	}
	
	
	


}

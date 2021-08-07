package com.dp.ggomjirak.yj.service;

import java.util.List;

import com.dp.ggomjirak.vo.CompleteImgVo;
import com.dp.ggomjirak.vo.HobbyMaterialVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MakeStepVo;

public interface HobbyService {
	
	/** 글작성
	 * @param hobbyVo
	 */
	public boolean insertHobbyArticle (HobbyVo hobbyVo); 
	
	public HobbyVo selectHobbyArticle (int hobby_no, boolean isUpdate);
	
	public String selectCompleteImgName (CompleteImgVo completeImgVo);
	public String selectMainImg(int hobby_no);
//	public String selectMakeStepImg(MakeStepVo makeStepVo);
	
	//* 수정작업
	public boolean updateHobbyArticle(HobbyVo hobbyVo);
	
	//*삭제 작업
	public int deleteHobbyArticle(int hobby_no);
	
	
//	 __________준비물로 목록조회 ___________
	//전체조회
//	public List<HobbyVo> selectAll(int material_no);
//	//최신순
//	public List<HobbyVo> selectNew(int material_no);
//	//좋아요순
//	public List<HobbyVo> selectLike(int material_no);
//	//조회수순
//	public List<HobbyVo> selectView(int material_no);
//	//시간순
//	public List<HobbyVo> selectTime(int material_no);
//	//난이도순
//	public List<HobbyVo> selectLevel(int material_no);
//	//비용순
//	public List<HobbyVo> selectCost(int material_no);
}

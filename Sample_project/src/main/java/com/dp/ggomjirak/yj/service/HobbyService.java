package com.dp.ggomjirak.yj.service;

import java.util.List;

import com.dp.ggomjirak.vo.CompleteImgVo;
import com.dp.ggomjirak.vo.HobbyMaterialVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MakeStepVo;
import com.dp.ggomjirak.vo.MaterialSearch;
import com.dp.ggomjirak.vo.ReviewPaging;

public interface HobbyService {
	
	/** 글작성
	 * @param hobbyVo
	 */
	public boolean insertHobbyArticle (HobbyVo hobbyVo); 
	
	public HobbyVo selectHobbyArticle (int hobby_no, ReviewPaging rp, boolean isUpdate);
	
	public String selectCompleteImgName (CompleteImgVo completeImgVo);
	public String selectMainImg(int hobby_no);
//	public String selectMakeStepImg(MakeStepVo makeStepVo);
	
	//* 수정작업
	public boolean updateHobbyArticle(HobbyVo hobbyVo);
	
	//*삭제 작업
	public int deleteHobbyArticle(int hobby_no);
	
	
//	 __________준비물로 목록조회 ___________
	public List<HobbyVo> selectHMList(MaterialSearch materialSearch);
}

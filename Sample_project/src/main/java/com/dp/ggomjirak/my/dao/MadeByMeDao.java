package com.dp.ggomjirak.my.dao;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MadeByMeVo;

public interface MadeByMeDao {
	public void insertMbm(MadeByMeVo madebymeVo);
	// 수정
	public void updateMbm(MadeByMeVo madebymeVo);
	public void deleteMbm(int mbm_no, int hobby_no);
	public HobbyVo selectHobby(int hobby_no);
	// 리스트 부르기
	public List<MadeByMeVo> listMbm(int hobby_no);
	// 상세 불러오기
	public MadeByMeVo selectMbm(int mbm_no, int hobby_no);	
	// 조회수 증가
	public void updateViewCnt(int mbm_no);
	// 좋아요
	public void updateLikeCount(int mbm_no, int count);
	public void insertLike(int mbm_no, String user_id);
	public void deleteLike(int mbm_no, String user_id);
	public int likeCheck(int mbm_no, String user_id);
	public int likeAll(int mbm_no);
}

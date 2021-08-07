package com.dp.ggomjirak.my.service;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MadeByMeVo;

public interface MadeByMeService {
	public void mbmWrite(MadeByMeVo madebymeVo);
	public HobbyVo selectHobby(int hobby_no);
	public MadeByMeVo selectMbm(int mbm_no, int hobby_no);
	public void updateMbm(MadeByMeVo madebymeVo);
	public void deleteMbm(int mbm_no, int hobby_no);
	public List<MadeByMeVo> listMbm(int hobby_no);
	// 좋아요
	public boolean like(int mbm_no, String user_id);
	public int likeAll(int mbm_no);
	public int likeCheck(int mbm_no, String user_id);
}

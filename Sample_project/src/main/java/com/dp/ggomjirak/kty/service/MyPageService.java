package com.dp.ggomjirak.kty.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.MemberVo;

@Service
public interface MyPageService {
	
	public MemberVo login(String user_id, String user_pw);
	public boolean checkDupId(String user_id);
	public void insertMember(MemberVo memberVo);
	public List<CateVo> listHobbyCate1();
	public List<CateVo> listHobbyCate2(int parent_cate_no);
	public MemberVo info(String user_id);
	public void modifyRun(MemberVo memberVo);
}

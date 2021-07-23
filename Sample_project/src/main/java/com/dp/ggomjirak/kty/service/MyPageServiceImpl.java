package com.dp.ggomjirak.kty.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.kty.dao.MemberDao;
import com.dp.ggomjirak.kty.dao.CateDao;
import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.MemberVo;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	private MemberDao memberDao;
	
	@Inject
	private CateDao cateDao;
	
	@Override
	public MemberVo login(String user_id, String user_pw) {
		MemberVo memberVo = memberDao.login(user_id, user_pw);
		return memberVo;
	}

	@Override
	public boolean checkDupId(String user_id) {
		return memberDao.checkDupId(user_id);
	}

	@Override
	public void insertMember(MemberVo memberVo) {
		memberDao.insertMember(memberVo);
	}

	@Override
	public List<CateVo> listHobbyCate1() {
		List<CateVo> list = cateDao.listAll();
		return list;
	}

	@Override
	public List<CateVo> listHobbyCate2(int parent_cate_no) {
		List<CateVo> list = cateDao.listPart(parent_cate_no);
		return list;
	}

	@Override
	public MemberVo info(String user_id) {
		MemberVo memberVo = memberDao.info(user_id);
		return memberVo;
	}

	@Override
	public void modifyRun(MemberVo memberVo) {
		memberDao.updateArticle(memberVo);
	}
	
}

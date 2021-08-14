package com.dp.ggomjirak.kty.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dp.ggomjirak.jh.dao.MainDao;
import com.dp.ggomjirak.kty.dao.MemberDao;

import com.dp.ggomjirak.vo.CateVo;

import com.dp.ggomjirak.vo.MemberVo;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	private MemberDao memberDao;
	
	@Inject
	private MainDao mainDao;

	@Transactional
	@Override
	public MemberVo login(String user_id, String user_pw) {
		MemberVo memberVo = memberDao.login(user_id, user_pw);
		mainDao.insertLoginTime(user_id);
		return memberVo;
	}

	@Override
	public boolean checkDupId(String user_id) {
		return memberDao.checkDupId(user_id);
	}
	
	@Override
	public boolean checkDupNick(String user_nick) {
		return memberDao.checkDupNick(user_nick);
	}

	@Transactional
	@Override
	public void insertMember(MemberVo memberVo) {
		memberDao.insertMember(memberVo);
		mainDao.insertMemberActiv(memberVo.getUser_id());
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

	@Override
	public boolean checkDupNickProfile(String user_id, String user_nick) {
		return memberDao.checkDupNickProfile(user_id, user_nick);
	}
	
	@Override
	public void modifyProfileRun(MemberVo memberVo) {
		memberDao.updateProfileArticle(memberVo);
		memberDao.updateAttach(memberVo);
	}

	@Override
	public void alarmSetUpRun(MemberVo memberVo) {
		memberDao.updateSetupArticle(memberVo);
	}
	
	@Override
	public List<CateVo> selectCate() {
		List<CateVo> list = memberDao.selectCate();
		return list;
	}

	@Override
	public List<CateVo> cateBigSort() {
		List<CateVo> list = memberDao.cateBigSort();
		return list;
	}

	@Override
	public List<CateVo> cateSmallSort() {
		List<CateVo> list = memberDao.cateSmallSort();
		return list;
	}
}
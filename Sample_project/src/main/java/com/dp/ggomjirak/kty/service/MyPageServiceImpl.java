package com.dp.ggomjirak.kty.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.kty.dao.MemberDao;
import com.dp.ggomjirak.vo.MemberVo;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	private MemberDao memberDao;
	
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
	public MemberVo info(String user_id) {
		System.out.println("MyPageServiceImpl MemberVo info 들어옴");
		MemberVo memberVo = memberDao.info(user_id);
		return memberVo;
	}

	@Override
	public void modifyRun(MemberVo memberVo) {
		memberDao.updateArticle(memberVo);
	}

	@Override
	public boolean checkDupNick(String user_nick) {
		return memberDao.checkDupNick(user_nick);
	}

	@Override
	public void modifyProfileRun(MemberVo memberVo) {
		memberDao.updateProfileArticle(memberVo);
		
	}

	@Override
	public void alarmSetUpRun(MemberVo memberVo) {
		memberDao.updateSetupArticle(memberVo);
		
	}
	
}

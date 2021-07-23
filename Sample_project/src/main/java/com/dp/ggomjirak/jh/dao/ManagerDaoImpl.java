package com.dp.ggomjirak.jh.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.CateStrVo;
import com.dp.ggomjirak.vo.EventVo;
import com.dp.ggomjirak.vo.ManagerVo;
import com.dp.ggomjirak.vo.MemberActivVo;
import com.dp.ggomjirak.vo.MemberDetailVo;
import com.dp.ggomjirak.vo.MemberInfoVo;
import com.dp.ggomjirak.vo.MemberVo;

@Repository
public class ManagerDaoImpl implements ManagerDao {

private static final String NAMESPACE = "com.dp.ggomjirak.manager.";
	
	@Inject
	SqlSession sqlSession;


	@Override
	public List<MemberVo> showMemberList() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "showMemberList");
		return list;
	}

	@Override
	public List<MemberVo> showMemberListLeave() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "showMemberListLeave");
		return list;
	}

	@Override
	public List<ManagerVo> showManagerList() {
		List<ManagerVo> list = sqlSession.selectList(NAMESPACE + "showManagerList");
		return list;
	}

	@Override
	public MemberVo selectMemberById(String user_id) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "selectMemberById", user_id);
		return memberVo;
	}
	

	@Override
	public CateStrVo selectCateStr(String user_id) {
		CateStrVo cateVo = sqlSession.selectOne(NAMESPACE + "selectCateStr", user_id);
		return cateVo;
	}

	@Override
	public String selectGradeById(String user_id) {
		String grade = sqlSession.selectOne(NAMESPACE + "selectGradeById", user_id);
		return grade;
	}
	
	@Override
	public MemberActivVo selectMemberActivById(String user_id) {
		MemberActivVo activVo = sqlSession.selectOne(NAMESPACE + "selectMemberActivById", user_id);
		return activVo;
	}

	@Override
	public String selectMemberIntroById(String user_id) {
		String intro = sqlSession.selectOne(NAMESPACE + "selectMemberIntroById", user_id);
		return intro;
	}
	
	

	@Override
	public void updateMemberInfo(MemberVo memberVo) {
		sqlSession.update(NAMESPACE + "updateMemberInfo", memberVo);
	}
	
	@Override
	public void updateMemberDetail(MemberVo memberVo) {
		sqlSession.update(NAMESPACE + "updateMemberDetail", memberVo);
	}

	
	
	
	@Override
	public List<EventVo> showEventListAll() {
		List<EventVo> list = sqlSession.selectList(NAMESPACE + "showEventListAll");
		return list;
	}
	
	@Override
	public List<EventVo> showEventList() {
		List<EventVo> list = sqlSession.selectList(NAMESPACE + "showEventList");
		return list;
	}

	@Override
	public List<EventVo> showEventListEnd() {
		List<EventVo> list = sqlSession.selectList(NAMESPACE + "showEventListEnd");
		return list;
	}

	@Override
	public List<EventVo> showEventListDelete() {
		List<EventVo> list = sqlSession.selectList(NAMESPACE + "showEventListDelete");
		return list;
	}

	@Override
	public EventVo selectByEno(int e_no) {
		EventVo eventVo = sqlSession.selectOne(NAMESPACE + "selectByEno", e_no);
		return eventVo;
	}

	@Override
	public void insertEvent(EventVo eventVo) {
		sqlSession.insert(NAMESPACE + "insertEvent", eventVo);
		
	}

	@Override
	public void updateEvent(EventVo eventVo) {
		sqlSession.update(NAMESPACE + "updateEvent", eventVo);
		
	}

	@Override
	public void deleteEvent(int e_no) {
		sqlSession.update(NAMESPACE + "deleteEvent", e_no);
		
	}










}

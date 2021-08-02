package com.dp.ggomjirak.jh.service;

import java.util.List;

import com.dp.ggomjirak.vo.CateStrVo;
import com.dp.ggomjirak.vo.EventVo;
import com.dp.ggomjirak.vo.ManagerVo;
import com.dp.ggomjirak.vo.MemberActivVo;
import com.dp.ggomjirak.vo.MemberDetailVo;
import com.dp.ggomjirak.vo.MemberInfoVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.QnAVo;
import com.dp.ggomjirak.vo.WorkroomVo;

public interface ManagerService {

	public List<MemberVo> showMemberList(PagingDto pagingDto);
	public List<MemberVo> showMemberListLeave(PagingDto pagingDto);
	public int getCountMemberList(PagingDto pagingDto);
	public int getCountMemberListLeave(PagingDto pagingDto);
	
	public MemberVo selectMemberById(String user_id);
	public CateStrVo selectCateStr(String user_id);
	public String selectGradeById(String user_id);
	public MemberActivVo selectMemberActivById(String user_id);
	public String selectMemberIntroById(String user_id);
	
	
	public void updateMember(MemberVo memberVo, WorkroomVo workroomVo);
	
	public void deleteMember(String user_id);
	public void cancleDeleteMember(String user_id);
	
	public List<ManagerVo> showManagerList(PagingDto pagingDto);
	public void insertManager(ManagerVo managerVo);
	public void deleteManager(String user_id);
	
	public int getCountManager(PagingDto pagingDto);
	
	public List<EventVo> showEventListAll(PagingDto pagingDto);
	public List<EventVo> showEventList(PagingDto pagingDto);
	public List<EventVo> showEventListEnd(PagingDto pagingDto);
	public List<EventVo> showEventListDelete(PagingDto pagingDto);
	
	public int getCountEventAll(PagingDto pagingDto);
	public int getCountEvent(PagingDto pagingDto);
	public int getCountEventEnd(PagingDto pagingDto);
	public int getCountEventDelete(PagingDto pagingDto);
	
	public EventVo selectByEno(int e_no);
	public void insertEvent(EventVo eventVo);
	public void updateEvent(EventVo eventVo);
	public void deleteEvent(int e_no);
	
	// 문의
	public List<QnAVo> selectQnAList(PagingDto pagingDto);
	public int getCountQnA(PagingDto pagingDto);
	public QnAVo selectQnaByNo (int qna_no);
	
	// 메인
	public List<MemberVo> selectPopularMemberList();
	public int getMemberCount();
}

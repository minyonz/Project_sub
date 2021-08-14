package com.dp.ggomjirak.jh.dao;

import java.util.List;

import com.dp.ggomjirak.vo.CateStrVo;
import com.dp.ggomjirak.vo.LoginTimeVo;
import com.dp.ggomjirak.vo.ManagerVo;
import com.dp.ggomjirak.vo.MemberActivVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.WorkroomVo;

public interface ManagerDao {

	public List<MemberVo> showMemberList(PagingDto pagingDto);
	public List<MemberVo> showMemberListLeave(PagingDto pagingDto);
	
	public int getCountMemberList(PagingDto pagingDto);
	public int getCountMemberListLeave(PagingDto pagingDto);
	
	public MemberVo selectMemberById(String user_id);
	public CateStrVo selectCateStr(String user_id);
	public String selectGradeById(String user_id);
	public MemberActivVo selectMemberActivById(String user_id);
	public String selectMemberIntroById(String user_id);
	public LoginTimeVo selectLoginTime(String user_id);
	public int getCountLoginTime(String user_id);
	public int getContentCnt(String user_id);
	public int getQnACnt(String user_id);
	
	
	public void updateMemberInfo(MemberVo memberVo);
	public void updateMemberDetail(MemberVo memberVo);
	public void updateMemberWorkroom(WorkroomVo workroomVo);
	
	public void deleteMember(String user_id);
	public void cancleDeleteMember(String user_id);
	
	public List<ManagerVo> showManagerList(PagingDto pagingDto);
	public void insertManager(ManagerVo managerVo);
	public void deleteManager(String user_id);
	
	public int getCountManager(PagingDto pagingDto);
	
	public void updateContentCnt(String user_id, int count);
	public void updateAskCnt(String user_id, int count);
	
	
	// 메인
	public List<MemberVo> selectPopularMemberList();
	public int getMemberCount();
	public List<Integer> getAllUserGrade();
	public List<Integer> getAllLoginTime();
	
}

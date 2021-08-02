package com.dp.ggomjirak.jh.dao;

import java.util.List;

import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;

public interface MainDao {

	public List<CateVo> selectCate();
	
	
	public List<HobbyVo> getSuggestHobby(String user_id);
	public List<HobbyVo> getPopularHobbyList();
	public List<HobbyVo> getMonthHobbyList();
	public String selectUserGrade(int user_grade);
	public List<MemberVo> getPopularMemberList1();
	public List<MemberVo> getPopularMemberList2();
	public List<MemberVo> getPopularMemberList3();
	public List<MemberVo> getPopularMemberList4();
	// 키워드 검색
	public List<HobbyVo> searchHobby(PagingDto pagingDto);
	public List<MemberVo> searchMember(PagingDto pagingDto);
	public int getCountHobbySearch(PagingDto pagingDto);
	public int getCountMemberSearch(PagingDto pagingDto);
	
	public List<CateVo> cateBigSort();
	public List<CateVo> cateSmallSort();
	public List<HobbyVo> hobbyListPopular(PagingDto pagingDto);
	public int getCountHobbyList(PagingDto pagingDto);
	public List<HobbyVo> searchHobbyCate(PagingDto pagingDto);
	public int getCountHobbyCate(PagingDto pagingDto);
}

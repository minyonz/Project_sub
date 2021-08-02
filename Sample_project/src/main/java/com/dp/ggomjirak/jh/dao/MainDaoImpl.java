package com.dp.ggomjirak.jh.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;

@Repository
public class MainDaoImpl implements MainDao {
	
	private static final String NAMESPACE = "com.dp.ggomjirak.main.";
	
	@Inject
	SqlSession sqlSession;

	

	@Override
	public List<HobbyVo> getSuggestHobby(String user_id) {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "getSuggestHobby", user_id);
		return list;
	}

	@Override
	public List<CateVo> selectCate() {
		List<CateVo> list = sqlSession.selectList(NAMESPACE + "selectCate");
		return list;
	}
	
	@Override
	public List<HobbyVo> getPopularHobbyList() {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "getPopularHobbyList");
		return list;
	}

	@Override
	public List<HobbyVo> getMonthHobbyList() {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "getMonthHobbyList");
		return list;
	}

	@Override
	public List<MemberVo> getPopularMemberList1() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "getPopularMemberList1");
		return list;
	}
	
	@Override
	public List<MemberVo> getPopularMemberList2() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "getPopularMemberList2");
		return list;
	}
	
	@Override
	public List<MemberVo> getPopularMemberList3() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "getPopularMemberList3");
		return list;
	}
	
	@Override
	public List<MemberVo> getPopularMemberList4() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "getPopularMemberList4");
		return list;
	}

	@Override
	public String selectUserGrade(int user_grade) {
		String strGrade = sqlSession.selectOne(NAMESPACE + "selectUserGrade", user_grade);
		return strGrade;
	}

	@Override
	public List<HobbyVo> searchHobby(PagingDto pagingDto) {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "searchHobby", pagingDto);
		return list;
	}

	@Override
	public List<MemberVo> searchMember(PagingDto pagingDto) {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "searchMember", pagingDto);
		return list;
	}

	@Override
	public int getCountHobbySearch(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountHobbySearch", pagingDto);
		return count;
	}

	@Override
	public int getCountMemberSearch(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountMemberSearch", pagingDto);
		return count;
	}


	@Override
	public List<CateVo> cateBigSort() {
		List<CateVo> list = sqlSession.selectList(NAMESPACE + "cateBigSort");
		return list;
	}

	@Override
	public List<CateVo> cateSmallSort() {
		List<CateVo> list = sqlSession.selectList(NAMESPACE + "cateSmallSort");
		return list;
	}

	@Override
	public List<HobbyVo> hobbyListPopular(PagingDto pagingDto) {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "hobbyListPopular", pagingDto);
		return list;
	}

	@Override
	public int getCountHobbyList(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountHobbyList", pagingDto);
		return count;
	}

	@Override
	public List<HobbyVo> searchHobbyCate(PagingDto pagingDto) {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "searchHobbyCate", pagingDto);
		return list;
	}

	@Override
	public int getCountHobbyCate(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountHobbyCate", pagingDto);
		return count;
	}







}

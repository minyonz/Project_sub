package com.dp.ggomjirak.jh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.jh.dao.MainDao;
import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MadeByMeVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;

@Service
public class MainServiceImpl implements MainService {
	
	@Inject
	private MainDao mainDao;

	
	@Override
	public List<CateVo> selectCate() {
		List<CateVo> list = mainDao.selectCate();
		return list;
	}

	@Override
	public List<HobbyVo> getSuggestHobby(String user_id) {
		List<HobbyVo> list = mainDao.getSuggestHobby(user_id);
		return list;
	}
	
	@Override
	public List<HobbyVo> getPopularHobbyList() {
		List<HobbyVo> list = mainDao.getPopularHobbyList();
		return list;
	}

	@Override
	public List<HobbyVo> getMonthHobbyList() {
		List<HobbyVo> list = mainDao.getMonthHobbyList();
		return list;
	}

	@Override
	public List<MadeByMeVo> getBestMadeList() {
		List<MadeByMeVo> list = mainDao.getBestMadeList();
		return list;
	}

	@Override
	public String selectUserGrade(int user_grade) {
		String strGrade = mainDao.selectUserGrade(user_grade);
		return strGrade;
	}

	@Override
	public List<MemberVo> getPopularMemberList1() {
		List<MemberVo> list = mainDao.getPopularMemberList1();
		return list;
	}

	@Override
	public List<MemberVo> getPopularMemberList2() {
		List<MemberVo> list = mainDao.getPopularMemberList2();
		return list;
	}

	@Override
	public List<MemberVo> getPopularMemberList3() {
		List<MemberVo> list = mainDao.getPopularMemberList3();
		return list;
	}

	@Override
	public List<MemberVo> getPopularMemberList4() {
		List<MemberVo> list = mainDao.getPopularMemberList4();
		return list;
	}

	@Override
	public List<HobbyVo> searchHobby(PagingDto pagingDto) {
		List<HobbyVo> list = mainDao.searchHobby(pagingDto);
		return list;
	}

	@Override
	public List<MemberVo> searchMember(PagingDto pagingDto) {
		List<MemberVo> list = mainDao.searchMember(pagingDto);
		return list;
	}

	@Override
	public List<MadeByMeVo> searchMade(PagingDto pagingDto) {
		List<MadeByMeVo> list = mainDao.searchMade(pagingDto);
		return list;
	}

	@Override
	public int getCountHobbySearch(PagingDto pagingDto) {
		int count = mainDao.getCountHobbySearch(pagingDto);
		return count;
	}

	@Override
	public int getCountMemberSearch(PagingDto pagingDto) {
		int count = mainDao.getCountMemberSearch(pagingDto);
		return count;
	}

	@Override
	public int getCountMadeSearch(PagingDto pagingDto) {
		int count = mainDao.getCountMadeSearch(pagingDto);
		return count;
	}
	

	@Override
	public List<CateVo> cateBigSort() {
		List<CateVo> list = mainDao.cateBigSort();
		return list;
	}

	@Override
	public List<CateVo> cateSmallSort() {
		List<CateVo> list = mainDao.cateSmallSort();
		return list;
	}

	@Override
	public List<HobbyVo> hobbyListPopular(PagingDto pagingDto) {
		List<HobbyVo> list = mainDao.hobbyListPopular(pagingDto);
		return list;
	}

	@Override
	public int getCountHobbyList(PagingDto pagingDto) {
		int count = mainDao.getCountHobbyList(pagingDto);
		return count;
	}

	@Override
	public List<HobbyVo> searchHobbyCate(PagingDto pagingDto) {
		List<HobbyVo> list = mainDao.searchHobbyCate(pagingDto);
		return list;
	}

	@Override
	public int getCountHobbyCate(PagingDto pagingDto) {
		int count = mainDao.getCountHobbyCate(pagingDto);
		return count;
	}





	


}

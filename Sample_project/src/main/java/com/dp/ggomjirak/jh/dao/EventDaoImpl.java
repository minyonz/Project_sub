package com.dp.ggomjirak.jh.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.EventVo;
import com.dp.ggomjirak.vo.PagingDto;

@Repository
public class EventDaoImpl implements EventDao {
	
	private static final String NAMESPACE = "com.dp.ggomjirak.event.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<EventVo> getEventBannerList() {
		List<EventVo> list = sqlSession.selectList(NAMESPACE + "getEventBannerList");
		return list;
	}

	@Override
	public int getCountBanner(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountBanner", pagingDto);
		return count;
	}

	@Override
	public List<EventVo> showEventListAll(PagingDto pagingDto) {
		List<EventVo> list = sqlSession.selectList(NAMESPACE + "showEventListAll", pagingDto);
		return list;
	}
	
	@Override
	public List<EventVo> showEventList(PagingDto pagingDto) {
		List<EventVo> list = sqlSession.selectList(NAMESPACE + "showEventList", pagingDto);
		return list;
	}

	@Override
	public List<EventVo> showEventListEnd(PagingDto pagingDto) {
		List<EventVo> list = sqlSession.selectList(NAMESPACE + "showEventListEnd", pagingDto);
		return list;
	}

	@Override
	public List<EventVo> showEventListDelete(PagingDto pagingDto) {
		List<EventVo> list = sqlSession.selectList(NAMESPACE + "showEventListDelete", pagingDto);
		return list;
	}

	@Override
	public int getCountEventAll(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountEventAll", pagingDto);
		return count;
	}

	@Override
	public int getCountEvent(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountEvent", pagingDto);
		return count;
	}

	@Override
	public int getCountEventEnd(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountEventEnd", pagingDto);
		return count;
	}

	@Override
	public int getCountEventDelete(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountEventDelete", pagingDto);
		return count;
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
	

	@Override
	public List<EventVo> mainEventBannerList(PagingDto pagingDto) {
		List<EventVo> list = sqlSession.selectList(NAMESPACE + "mainEventBannerList", pagingDto);
		return list;
	}

	@Override
	public int getCountMainEventBanner(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountMainEventBanner", pagingDto);
		return count;
	}

	@Override
	public void insertMainEvent(int e_no) {
		sqlSession.insert(NAMESPACE + "insertMainEvent", e_no);
		
	}

	@Override
	public void deleteMainEvent(int e_no) {
		sqlSession.delete(NAMESPACE + "deleteMainEvent", e_no);
		
	}

	
	

}

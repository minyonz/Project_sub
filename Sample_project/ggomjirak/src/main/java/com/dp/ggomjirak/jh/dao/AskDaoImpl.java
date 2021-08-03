package com.dp.ggomjirak.jh.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.QnAVo;

@Repository
public class AskDaoImpl implements AskDao {
	
private static final String NAMESPACE = "com.dp.ggomjirak.ask.";
	
	@Inject
	SqlSession sqlSession;

	// 문의
	@Override
	public List<QnAVo> selectQnAList(PagingDto pagingDto) {
		List<QnAVo> list = sqlSession.selectList(NAMESPACE + "selectQnAList", pagingDto);
		return list;
	}

	@Override
	public int getCountQnA(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountQnA", pagingDto);
		return count;
	}
	
	@Override
	public int getCountQnAMain() {
		int count = sqlSession.selectOne(NAMESPACE + "getCountQnAMain");
		return count;
	}

	@Override
	public QnAVo selectQnaByNo(int qna_no) {
		QnAVo qnaVo = sqlSession.selectOne(NAMESPACE + "selectQnaByNo", qna_no);
		return qnaVo;
	}

	@Override
	public int getNextVal() {
		int nextval = sqlSession.selectOne(NAMESPACE + "getNextVal");
		return nextval;
	}

	@Override
	public void insertAnswer(QnAVo qnaVo) {
		sqlSession.insert(NAMESPACE + "insertAnswer", qnaVo);
		
	}

	@Override
	public void updateAno(QnAVo qnaVo) {
		sqlSession.update(NAMESPACE + "updateAno", qnaVo);
		
	}

}

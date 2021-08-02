package com.dp.ggomjirak.kty.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.QnAVo;

@Repository
public class CsCenterDaoImpl implements CsCenterDao {

	private static final String NAMESPACE = "com.dp.ggomjirak.cscenter.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<QnAVo> listAll(String userID) {
		List<QnAVo> list = sqlSession.selectList(NAMESPACE + "userlistAll", userID); 
		return list;
	}

	@Override
	public int getNextVal() {
		int nextval = sqlSession.selectOne(NAMESPACE + "getNextVal");
		return nextval;
	}

	@Override
	public void insertArticle(QnAVo qnAVo) {
		sqlSession.insert(NAMESPACE + "insertArticle", qnAVo);
	}

	@Override
	public QnAVo selectByBno(int qna_no) {
		QnAVo qnAVo = sqlSession.selectOne(NAMESPACE + "selectByQnAno", qna_no); 	
		return qnAVo;
	}

	@Override
	public void updateArticle(QnAVo qnAVo) {
		sqlSession.update(NAMESPACE + "updateArticle", qnAVo);
	
	}

	@Override
	public void deleteArticle(int qna_no) {
		sqlSession.update(NAMESPACE + "deleteArticle", qna_no);
	}

}

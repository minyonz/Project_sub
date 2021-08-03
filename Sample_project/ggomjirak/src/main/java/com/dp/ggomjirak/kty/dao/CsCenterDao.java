package com.dp.ggomjirak.kty.dao;

import java.util.List;

import com.dp.ggomjirak.vo.QnAVo;

public interface CsCenterDao {
	// 글목록
	public List<QnAVo> listAll(String userID);
	// nextval 받기
	public int getNextVal();
	// 글쓰기
	public void insertArticle(QnAVo qnAVo);
	// 첨부파일 쓰기
	//public void insertAttach(QnAVo qnAVo);
	public QnAVo selectByBno(int qna_no);
	// 글 내용 수정
	public void updateArticle(QnAVo qnAVo);
	// 글 내용 삭제
	public void deleteArticle(int qna_no);
	
}

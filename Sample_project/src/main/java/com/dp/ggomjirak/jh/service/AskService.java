package com.dp.ggomjirak.jh.service;

import java.util.List;

import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.QnAVo;

public interface AskService {
	
	// 문의
	public List<QnAVo> selectQnAList(PagingDto pagingDto);
	public int getCountQnA(PagingDto pagingDto);
	public int getCountQnAMain();
	public QnAVo selectQnaByNo (int qna_no);
	public void insertAnswer(QnAVo qnaVo);
}

package com.dp.ggomjirak.yj.service;

import java.util.List;

import com.dp.ggomjirak.vo.CommentVo;

public interface CommentService {
	//댓글 삽입
	public void insertComment(CommentVo commentVo);
	
	//대댓글 삽입
	public void insertRecomment(CommentVo commentVo);
	
	//댓글 목록 조회
	public List<CommentVo> selectCommentList(int h_no);
	
	//댓글 수정
	public void updateComment(CommentVo commentVo);
	
	//댓글 삭제 
	public int deleteComment(CommentVo commentVo);
}

package com.dp.ggomjirak.my.dao;

import java.util.List;

import com.dp.ggomjirak.vo.StoryCommentVo;

public interface StoryCommentDao {
	// 댓글작성
	public void insertComment(StoryCommentVo storyCommentVo);
	// 댓글 목록
	public List<StoryCommentVo> listComment(int st_no);
	// 댓글 수정
	public void updateComment(int st_c_no, String st_c_content);
	// 댓글 삭제
	public void deleteComment(int st_c_no);
	// 댓글 총 갯수
	public int commentCount(int st_no); 
}
